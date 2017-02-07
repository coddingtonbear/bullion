#include "main.h"
#include "fs9721.h"

#define STATUS_LED 5
#define MM_RX 2
#define MM_TX 3

#define LED_LIGHT_TIME 10000

SoftwareSerial mm = SoftwareSerial(MM_RX, MM_TX, true);
FS9721 fs9721 = FS9721(&mm);

bool ledLit = false;
unsigned long ledLitUntil = 0;

SerialOutputType outputMode = RAW;
bool outputUnits = false;
String command = "";

byte currentValue[4];
byte currentDisplayedValue[4];
byte currentFlags[4];

byte spiCommand = 0;
byte* spiDataOut;
uint8_t spiDataPos = 0;
uint8_t spiDataLength = 0;


void setup() {
    mm.begin(2400);
    Serial.begin(2400);
    command.reserve(64);

    pinMode(SS, INPUT_PULLUP);
    pinMode(MISO, OUTPUT);
    SPCR0 |= _BV(SPE);
    SPCR0 |= _BV(SPIE);
}

ISR (SPI0_STC_vect)
{
    byte c = SPDR0;

    switch (spiCommand) {
        case 0x00: {
            spiCommand = c;
            spiDataPos = 1;

            switch (spiCommand) {
                case 0x01: {
                    spiDataOut = &currentValue[0];
                    break;
                }
                case 0x02: {
                    spiDataOut = &currentDisplayedValue[0];
                    break;
                }
                case 0x10: {
                    spiDataOut = &currentFlags[0];
                    break;
                }
                default: {
                    // Just to make sure that a value is set;
                    spiDataOut = &currentFlags[0];
                    spiCommand = 0;
                }
            }

            SPDR0 = spiDataOut[0];
            break;
        }
        default: {
            SPDR0 = spiDataOut[spiDataPos];
            spiDataPos++;
        }
    }
}

void flashStatusLed() {
    digitalWrite(STATUS_LED, HIGH);
    ledLitUntil = micros() + LED_LIGHT_TIME;
}

void updateStatusLed() {
    if(micros() > ledLitUntil) {
        digitalWrite(STATUS_LED, LOW);
    }
}

void readSerialData() {
    char byte = Serial.read();

    if(byte == '\n') {
        uint8_t idx = command.indexOf('=');
        if(idx == -1) {
            command = "";
            command.reserve(64);
            return;
        }
        String cmd = command.substring(0, idx);
        String value = command.substring(idx + 1);
        value.trim();
        cmd.trim();

        bool errorValue = false;
        bool errorCommand = false;
        command = "";
        command.reserve(64);

        Serial.print(cmd);
        Serial.print('=');
        Serial.println(value);

        if (cmd.compareTo("output") == 0) {
            if(value == "raw") {
                outputMode = RAW;
            } else if(value.compareTo("none") == 0) {
                outputMode = NONE;
            } else if(value.compareTo("value") == 0) {
                outputMode = VALUE;
            } else if(value.compareTo("displayed") == 0) {
                outputMode = DISPLAYED;
            } else {
                errorValue = true;
            }
        } else if(cmd.compareTo("units") == 0) {
            if(value == "1") {
                outputUnits = true;
            } else if(value == "0") {
                outputUnits = false;
            } else {
                errorValue = true;
            }
        } else {
            errorCommand = true;
        }
        if (errorCommand) {
            Serial.println("ERROR: INVALID COMMAND");
        } else if(errorValue) {
            Serial.println("ERROR: INVALID VALUE");
        } else {
            Serial.println("OK");
        }

    } else {
        command = command + byte;
    }
}

void writeMultimeterBytes() {
    switch(outputMode) {
    case RAW:
    {
        int bytes[14];
        fs9721.getBytes(bytes);
        for(uint8_t pos = 0; pos < 14; pos++) {
            Serial.write(bytes[pos]);
        }
        break;
    }
    case VALUE:
    {
        float value = fs9721.getValue();
        Serial.print(value, 10);
        if(outputUnits) {
            Serial.print(" ");
            Serial.println(fs9721.getUnit());
        } else {
            Serial.println("");
        }
        break;
    }
    case DISPLAYED:
    {
        float displayedValue = fs9721.getDisplayedValue();
        Serial.print(displayedValue, 4);
        if(outputUnits) {
            Serial.print(" ");
            Serial.println(fs9721.getDisplayedUnit());
        } else {
            Serial.println("");
        }
        break;
    }
    default:
        break;
    }
}

void updatePreparedValues() {
    union {
        float measurement;
        unsigned char bytes[4];
    } thing;

    thing.measurement = fs9721.getValue();
    for(int i = 0; i < 4; i++) {
        currentValue[i] = thing.bytes[i];
    }

    thing.measurement = fs9721.getDisplayedValue();
    for(int i = 0; i < 4; i++) {
        currentDisplayedValue[i] = thing.bytes[i];
    }

    fs9721_info* flags = fs9721.getFlags();
    for(int i = 0; i < 4; i++) {
        uint8_t flag = 0;
        switch(i) {
            case 0: {
                flag |= flags->is_sign << 6;
                flag |= flags->is_bat << 5;
                flag |= flags->is_hold << 4;
                flag |= flags->is_rel << 3;
                flag |= flags->is_beep << 2;
                flag |= flags->is_sign << 1;
                flag |= flags->is_rs232 << 0;
                break;
            }
            case 1: {
                flag |= flags->is_auto << 7;
                flag |= flags->is_mega << 4;
                flag |= flags->is_kilo << 3;
                flag |= flags->is_milli << 2;
                flag |= flags->is_nano << 1;
                flag |= flags->is_micro << 0;
                break;
            }
            case 2: {
                flag |= flags->is_c2c1_00 << 7;
                flag |= flags->is_c2c1_01 << 6;
                flag |= flags->is_c2c1_10 << 5;
                flag |= flags->is_c2c1_11 << 4;
                flag |= flags->is_diode << 2;
                flag |= flags->is_dc << 1;
                flag |= flags->is_ac << 0;
                break;
            }
            case 3: {
                flag |= flags->is_percent << 5;
                flag |= flags->is_hz << 4;
                flag |= flags->is_volt << 3;
                flag |= flags->is_ampere << 2;
                flag |= flags->is_farad << 1;
                flag |= flags->is_ohm << 0;
                break;
            }
        }
        currentFlags[i] = flag;
    }
}

void loop() {
    while(mm.available()) {
        if(fs9721.update()) {
            flashStatusLed();
            writeMultimeterBytes();
            updatePreparedValues();
        }
    }
    while(Serial.available()) {
        readSerialData();
    }
    updateStatusLed();

    if(spiCommand && digitalRead(SS)) {
        spiCommand = 0;
    }
}
