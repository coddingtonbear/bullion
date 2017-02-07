#include <Arduino.h>
#include <SoftwareSerial.h>

enum SerialOutputType {
    NONE,
    RAW,
    VALUE,
    DISPLAYED
};

void setup();
void flashStatusLed();
void updateStatusLed();
void writeMultimeterBytes();
void updatePreparedvalues();
void loop();
