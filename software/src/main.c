#include <SoftwareSerial.h>


SoftwareSerial mm = SoftwareSerial(3, 2);

void setup() {
  // put your setup code here, to run once:
  mm.begin(2400);
  Serial.begin(9600);
  Serial.println("Ready");
}

void loop() {
  // put your main code here, to run repeatedly:
  if(mm.available()) {
    Serial.write(mm.read());
  }
}
