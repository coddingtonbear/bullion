#include "main.h"


SoftwareSerial mm = SoftwareSerial(2, 3);

uint8_t currentByte = 0;
uint8_t currentBytes[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
uint8_t completeBytes[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

void setup() {
  // put your setup code here, to run once:
  mm.begin(2400);
  Serial.begin(9600);
  Serial.println("Ready");
}

void readMultimeterData() {
    uint8_t byte = mm.read();

    Serial.print(byte, BIN);
    Serial.print(": ");
    uint8_t pos = byte / 16;
    Serial.println(pos);

    if (byte == -1) {
        return;
    }
    if (pos == 0 || pos == 15) {
        return;
    } else {
        if (pos - 1 == currentByte) {
            currentBytes[pos - 1] = byte;
            currentByte++;
        }
    }

    if(currentByte >= 14) {
        currentByte = 0;

        for(uint8_t pos = 0; pos < 14; pos++) {
            completeBytes[pos] = currentBytes[pos];
            Serial.println("Measurement completed");
        }
    }
}

void loop() {
  // put your main code here, to run repeatedly:
  while(mm.available()) {
    Serial.println(mm.read(), BIN);
    //readMultimeterData();
  }
  Serial.print('.');
  delay(1000);
}
