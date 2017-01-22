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


void setup() {
    mm.begin(2400);
    Serial.begin(2400);
    command.reserve(64);
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
    case RAW: {
        int bytes[14];
        fs9721.getBytes(bytes);
        for(uint8_t pos = 0; pos < 14; pos++) {
            Serial.write(bytes[pos]);
        }
        break;
    }
    case VALUE: {
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
    case DISPLAYED: {
        float value = fs9721.getDisplayedValue();
        Serial.print(value, 4);
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

void loop() {
    while(mm.available()) {
        if(fs9721.update()) {
            flashStatusLed();
            writeMultimeterBytes();
        }
    }
    while(Serial.available()) {
        readSerialData();
    }
    updateStatusLed();
}
