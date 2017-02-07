#include "fs9721.h"

FS9721::FS9721(Stream* dataStream):
    stream(dataStream)
{
    info = new fs9721_info();
    for(uint8_t i = 0; i < 14; i++) {
        currentBytes[i] = 0;
        completeBytes[i] = 0;
    }
}

void FS9721::getBytes(int* ptr) {
    for(int i = 0; i < 14; i++) {
        ptr[i] = completeBytes[i];
    }
}

bool FS9721::update() {
    int byte = stream->read();
    uint8_t pos = byte / 16;

    if (byte == -1) {
        return false;
    }
    if (pos == 0 || pos == 15) {
        return false;
    } else {
        if (pos - 1 == currentByte) {
            currentBytes[pos - 1] = byte;
            currentByte++;
        }
    }

    if(currentByte >= 14) {
        for(uint8_t pos = 0; pos < 14; pos++) {
            completeBytes[pos] = currentBytes[pos];
        }
        updateMeasurementInfo();
        currentByte = 0;
        return true;
    } else {
        return false;
    }
}


float FS9721::getDisplayedValue() {
    // Borrowed from 
    // https://github.com/miek/libsigrok/blob/master/src/dmm/fs9721.c

    int i, sign, intval = 0, digits[4];
    uint8_t digit_bytes[4];
    float floatval;

    /* Byte 1: LCD SEG2 */
    sign = ((completeBytes[1] & (1 << 3)) != 0) ? -1 : 1;

    /*
     * Bytes 1-8: Value (4 decimal digits, sign, decimal point)
     *
     * Over limit: "0L" (LCD), 0x00 0x7d 0x68 0x00 (digit bytes).
     */

    /* Merge the two nibbles for a digit into one byte. */
    for (i = 0; i < 4; i++) {
        digit_bytes[i] = ((completeBytes[1 + (i * 2)] & 0x0f) << 4);
        digit_bytes[i] |= (completeBytes[1 + (i * 2) + 1] & 0x0f);

        /* Bit 7 in the byte is not part of the digit. */
        digit_bytes[i] &= ~(1 << 7);
    }

    /* Check for "OL". */
    if (digit_bytes[0] == 0x00 && digit_bytes[1] == 0x7d &&
        digit_bytes[2] == 0x68 && digit_bytes[3] == 0x00) {
        return INFINITY;
    }

    /* Parse the digits. */
    for (i = 0; i < 4; i++)
        digits[i] = parseDigit(digit_bytes[i]);

    /* Merge all digits into an integer value. */
    for (i = 0; i < 4; i++) {
        intval *= 10;
        intval += digits[i];
    }

    floatval = (float)intval;

    /* Decimal point position. */
    if ((completeBytes[3] & (1 << 3)) != 0) {
        floatval /= 1000;
    } else if ((completeBytes[5] & (1 << 3)) != 0) {
        floatval /= 100;
    } else if ((completeBytes[7] & (1 << 3)) != 0) {
        floatval /= 10;
    } else {
    }

    /* Apply sign. */
    floatval *= sign;

    return floatval;
}

float FS9721::getValue() {
    float displayed = getDisplayedValue();
    return handleMagnitude(displayed);
}

fs9721_info* FS9721::getFlags() {
    return info;
}

String FS9721::getDisplayedUnit() {
    String unit = getUnit();
    unit.reserve(10);

    if(info->is_micro) {
        unit = "u" + unit;
    } else if(info->is_nano) {
        unit = "n" + unit;
    } else if(info->is_kilo) {
        unit = "k" + unit;
    } else if(info->is_milli) {
        unit = "m" + unit;
    } else if(info->is_mega) {
        unit = "M" + unit;
    }

    return unit;
}

String FS9721::getUnit() {
    if(info->is_percent) {
        return "%";
    } else if(info->is_farad) {
        return "F";
    } else if(info->is_ohm) {
        return "Ohm";
    } else if(info->is_ampere) {
        return "A";
    } else if(info->is_volt) {
        if(info->is_ac) {
            return "VAC";
        } else if(info->is_dc) {
            return "VDC";
        } else {
            return "V";
        }
    } else if(info->is_hz) {
        return "Hz";
    }
    return "";
}

int FS9721::parseDigit(uint8_t b)
{
    // Borrowed from 
    // https://github.com/miek/libsigrok/blob/master/src/dmm/fs9721.c

	switch (b) {
	case 0x7d:
		return 0;
	case 0x05:
		return 1;
	case 0x5b:
		return 2;
	case 0x1f:
		return 3;
	case 0x27:
		return 4;
	case 0x3e:
		return 5;
	case 0x7e:
		return 6;
	case 0x15:
		return 7;
	case 0x7f:
		return 8;
	case 0x3f:
		return 9;
	default:
		return -1;
	}
}

void FS9721::updateMeasurementInfo()
{
    // Borrowed from 
    // https://github.com/miek/libsigrok/blob/master/src/dmm/fs9721.c

	/* Byte 0: LCD SEG1 */
	info->is_ac         = (completeBytes[0] & (1 << 3)) != 0;
	info->is_dc         = (completeBytes[0] & (1 << 2)) != 0;
	info->is_auto       = (completeBytes[0] & (1 << 1)) != 0;
	info->is_rs232      = (completeBytes[0] & (1 << 0)) != 0;

	/* Byte 1: LCD SEG2 */
	info->is_sign       = (completeBytes[1] & (1 << 3)) != 0;

	/* Byte 9: LCD SEG10 */
	info->is_micro      = (completeBytes[9] & (1 << 3)) != 0;
	info->is_nano       = (completeBytes[9] & (1 << 2)) != 0;
	info->is_kilo       = (completeBytes[9] & (1 << 1)) != 0;
	info->is_diode      = (completeBytes[9] & (1 << 0)) != 0;

	/* Byte 10: LCD SEG11 */
	info->is_milli      = (completeBytes[10] & (1 << 3)) != 0;
	info->is_percent    = (completeBytes[10] & (1 << 2)) != 0;
	info->is_mega       = (completeBytes[10] & (1 << 1)) != 0;
	info->is_beep       = (completeBytes[10] & (1 << 0)) != 0;

	/* Byte 11: LCD SEG12 */
	info->is_farad      = (completeBytes[11] & (1 << 3)) != 0;
	info->is_ohm        = (completeBytes[11] & (1 << 2)) != 0;
	info->is_rel        = (completeBytes[11] & (1 << 1)) != 0;
	info->is_hold       = (completeBytes[11] & (1 << 0)) != 0;

	/* Byte 12: LCD SEG13 */
	info->is_ampere     = (completeBytes[12] & (1 << 3)) != 0;
	info->is_volt       = (completeBytes[12] & (1 << 2)) != 0;
	info->is_hz         = (completeBytes[12] & (1 << 1)) != 0;
	info->is_bat        = (completeBytes[12] & (1 << 0)) != 0;

	/* Byte 13: LCD SEG14 */
	info->is_c2c1_11    = (completeBytes[13] & (1 << 3)) != 0;
	info->is_c2c1_10    = (completeBytes[13] & (1 << 2)) != 0;
	info->is_c2c1_01    = (completeBytes[13] & (1 << 1)) != 0;
	info->is_c2c1_00    = (completeBytes[13] & (1 << 0)) != 0;
}

float FS9721::handleMagnitude(float floatval) {
	/* Factors */
	if (info->is_nano) {
		floatval /= 1000000000;
    }
	if (info->is_micro) {
		floatval /= 1000000;
    }
	if (info->is_milli) {
		floatval /= 1000;
    }
	if (info->is_kilo) {
		floatval *= 1000;
    }
	if (info->is_mega) {
		floatval *= 1000000;
    }

    return floatval;
}
