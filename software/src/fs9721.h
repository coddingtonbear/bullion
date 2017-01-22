#include <Arduino.h>


// Struct format borrowed from libsigrok
struct fs9721_info {
	bool is_ac, is_dc, is_auto, is_rs232, is_micro, is_nano, is_kilo;
	bool is_diode, is_milli, is_percent, is_mega, is_beep, is_farad;
	bool is_ohm, is_rel, is_hold, is_ampere, is_volt, is_hz, is_bat;
	bool is_c2c1_11, is_c2c1_10, is_c2c1_01, is_c2c1_00, is_sign;
};


class FS9721
{
    public:
        FS9721(Stream*);
        bool update();
        void getBytes(int*);
        float getDisplayedValue();
        String getDisplayedUnit();
        float getValue();
        String getUnit();
        fs9721_info* getFlags();
    private:
        int parseDigit(uint8_t);
        void updateMeasurementInfo();
        float handleMagnitude(float);

        Stream* stream;

        fs9721_info* info;
        uint8_t currentByte = 0;
        int currentBytes[14];
        int completeBytes[14];
};

