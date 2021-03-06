EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:SJ1-3524NG
LIBS:ch340g
LIBS:bullion-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L SJ1-3524NG U1
U 1 1 587AC1D8
P 2050 1400
F 0 "U1" H 2050 1400 50  0001 L CNN
F 1 "SJ1-3524NG" H 2050 1400 50  0001 L CNN
F 2 "SJ1-3524NG:PIN-4" H 2050 1400 50  0001 L CNN
F 3 "SJ1-3524NG" H 2050 1400 50  0001 L CNN
F 4 "audio jack, 3.5 mm, rt, stereo, through hole, 1 switch, isolated ground" H 2050 1400 50  0001 L CNN "Description"
F 5 "None" H 2050 1400 50  0001 L CNN "Package"
F 6 "0.59 USD" H 2050 1400 50  0001 L CNN "Price"
F 7 "Good" H 2050 1400 50  0001 L CNN "Availability"
F 8 "CUI" H 2050 1400 50  0001 L CNN "MF"
	1    2050 1400
	0    1    1    0   
$EndComp
Text GLabel 2250 3050 3    60   Output ~ 0
MM_TXD
$Comp
L ATMEGA328P-A IC1
U 1 1 587AC4E0
P 6150 2850
F 0 "IC1" H 6200 1293 50  0000 C CNN
F 1 "ATMEGA328P-A" H 6200 1384 50  0000 C CNN
F 2 "Housings_QFP:TQFP-32_7x7mm_Pitch0.8mm" H 6200 1475 50  0000 C CIN
F 3 "" H 6150 2850 50  0000 C CNN
	1    6150 2850
	-1   0    0    1   
$EndComp
Text GLabel 4900 2150 0    60   Input ~ 0
MM_TXD
$Comp
L GND #PWR01
U 1 1 587AC559
P 7050 1950
F 0 "#PWR01" H 7050 1700 50  0001 C CNN
F 1 "GND" H 7055 1777 50  0000 C CNN
F 2 "" H 7050 1950 50  0000 C CNN
F 3 "" H 7050 1950 50  0000 C CNN
	1    7050 1950
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR02
U 1 1 587AC570
P 7050 4100
F 0 "#PWR02" H 7050 3950 50  0001 C CNN
F 1 "+5V" H 7065 4273 50  0000 C CNN
F 2 "" H 7050 4100 50  0000 C CNN
F 3 "" H 7050 4100 50  0000 C CNN
	1    7050 4100
	-1   0    0    1   
$EndComp
$Comp
L C C7
U 1 1 587AC623
P 7200 3850
F 0 "C7" V 6948 3850 50  0000 C CNN
F 1 "0.1u" V 7039 3850 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7238 3700 50  0001 C CNN
F 3 "" H 7200 3850 50  0000 C CNN
	1    7200 3850
	0    1    1    0   
$EndComp
$Comp
L C C8
U 1 1 587AC63F
P 7200 4050
F 0 "C8" V 6948 4050 50  0000 C CNN
F 1 "0.1u" V 7039 4050 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7238 3900 50  0001 C CNN
F 3 "" H 7200 4050 50  0000 C CNN
	1    7200 4050
	0    1    1    0   
$EndComp
$Comp
L GND #PWR03
U 1 1 587AC67A
P 7350 4100
F 0 "#PWR03" H 7350 3850 50  0001 C CNN
F 1 "GND" H 7355 3927 50  0000 C CNN
F 2 "" H 7350 4100 50  0000 C CNN
F 3 "" H 7350 4100 50  0000 C CNN
	1    7350 4100
	1    0    0    -1  
$EndComp
$Comp
L USB_OTG P1
U 1 1 587AC840
P 2450 5100
F 0 "P1" V 2573 5288 50  0000 L CNN
F 1 "USB_OTG" V 2482 5288 50  0000 L CNN
F 2 "bullion:MICRO-B_USB" V 2400 5000 50  0001 C CNN
F 3 "" V 2400 5000 50  0000 C CNN
	1    2450 5100
	0    -1   -1   0   
$EndComp
$Comp
L CH340G U2
U 1 1 587AC8E1
P 4000 5700
F 0 "U2" H 4000 6587 60  0000 C CNN
F 1 "CH340G" H 4000 6481 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 3950 6800 60  0001 C CNN
F 3 "" H 3950 6800 60  0000 C CNN
	1    4000 5700
	1    0    0    -1  
$EndComp
$Comp
L Crystal Y1
U 1 1 587ACA44
P 4750 3300
F 0 "Y1" V 4704 3431 50  0000 L CNN
F 1 "Crystal" V 4795 3431 50  0000 L CNN
F 2 "Crystals:Crystal_HC49-SD_SMD" H 4750 3300 50  0001 C CNN
F 3 "" H 4750 3300 50  0000 C CNN
	1    4750 3300
	0    1    1    0   
$EndComp
$Comp
L C C3
U 1 1 587ACAAA
P 4450 3150
F 0 "C3" V 4198 3150 50  0000 C CNN
F 1 "22p" V 4289 3150 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4488 3000 50  0001 C CNN
F 3 "" H 4450 3150 50  0000 C CNN
	1    4450 3150
	0    1    1    0   
$EndComp
$Comp
L C C4
U 1 1 587ACAFF
P 4450 3450
F 0 "C4" V 4198 3450 50  0000 C CNN
F 1 "22p" V 4289 3450 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4488 3300 50  0001 C CNN
F 3 "" H 4450 3450 50  0000 C CNN
	1    4450 3450
	0    1    1    0   
$EndComp
$Comp
L GND #PWR04
U 1 1 587ACBAA
P 4300 3550
F 0 "#PWR04" H 4300 3300 50  0001 C CNN
F 1 "GND" H 4305 3377 50  0000 C CNN
F 2 "" H 4300 3550 50  0000 C CNN
F 3 "" H 4300 3550 50  0000 C CNN
	1    4300 3550
	1    0    0    -1  
$EndComp
Text GLabel 3000 5500 0    60   Input ~ 0
CLKOUT
Text GLabel 5100 4100 3    60   Output ~ 0
CLKOUT
$Comp
L GND #PWR05
U 1 1 587ACED1
P 2850 4900
F 0 "#PWR05" H 2850 4650 50  0001 C CNN
F 1 "GND" V 2855 4772 50  0000 R CNN
F 2 "" H 2850 4900 50  0000 C CNN
F 3 "" H 2850 4900 50  0000 C CNN
	1    2850 4900
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR06
U 1 1 587ACF79
P 3000 5800
F 0 "#PWR06" H 3000 5550 50  0001 C CNN
F 1 "GND" H 3005 5627 50  0000 C CNN
F 2 "" H 3000 5800 50  0000 C CNN
F 3 "" H 3000 5800 50  0000 C CNN
	1    3000 5800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 587ACFAC
P 4550 6200
F 0 "#PWR07" H 4550 5950 50  0001 C CNN
F 1 "GND" H 4555 6027 50  0000 C CNN
F 2 "" H 4550 6200 50  0000 C CNN
F 3 "" H 4550 6200 50  0000 C CNN
	1    4550 6200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 587ACFD5
P 5100 5100
F 0 "#PWR08" H 5100 4850 50  0001 C CNN
F 1 "GND" H 5105 4927 50  0000 C CNN
F 2 "" H 5100 5100 50  0000 C CNN
F 3 "" H 5100 5100 50  0000 C CNN
	1    5100 5100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR09
U 1 1 587AD000
P 4600 5100
F 0 "#PWR09" H 4600 4950 50  0001 C CNN
F 1 "+5V" H 4615 5273 50  0000 C CNN
F 2 "" H 4600 5100 50  0000 C CNN
F 3 "" H 4600 5100 50  0000 C CNN
	1    4600 5100
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 587AD097
P 4850 5100
F 0 "C5" V 4598 5100 50  0000 C CNN
F 1 "0.1u" V 4689 5100 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4888 4950 50  0001 C CNN
F 3 "" H 4850 5100 50  0000 C CNN
	1    4850 5100
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 587AD141
P 3250 5800
F 0 "C1" V 2998 5800 50  0000 C CNN
F 1 "0.1u" V 3089 5800 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3288 5650 50  0001 C CNN
F 3 "" H 3250 5800 50  0000 C CNN
	1    3250 5800
	0    1    1    0   
$EndComp
Text GLabel 4600 5400 2    60   Output ~ 0
RXD
Text GLabel 4900 2250 0    60   Output ~ 0
TXD
Text GLabel 4900 2350 0    60   Input ~ 0
RXD
Text GLabel 4600 5300 2    60   Input ~ 0
TXD
$Comp
L +5V #PWR010
U 1 1 587ADA68
P 3950 2500
F 0 "#PWR010" H 3950 2350 50  0001 C CNN
F 1 "+5V" H 3965 2673 50  0000 C CNN
F 2 "" H 3950 2500 50  0000 C CNN
F 3 "" H 3950 2500 50  0000 C CNN
	1    3950 2500
	1    0    0    -1  
$EndComp
$Comp
L R_Small R1
U 1 1 587ADB0C
P 4150 2500
F 0 "R1" V 3954 2500 50  0000 C CNN
F 1 "10k" V 4045 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 4150 2500 50  0001 C CNN
F 3 "" H 4150 2500 50  0000 C CNN
	1    4150 2500
	0    1    1    0   
$EndComp
Text GLabel 4000 2950 3    60   Input ~ 0
DTR
Text GLabel 4600 5800 2    60   Output ~ 0
DTR
$Comp
L C C2
U 1 1 587ADD79
P 4150 2800
F 0 "C2" V 3898 2800 50  0000 C CNN
F 1 "0.1u" V 3989 2800 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4188 2650 50  0001 C CNN
F 3 "" H 4150 2800 50  0000 C CNN
	1    4150 2800
	0    1    1    0   
$EndComp
$Comp
L CONN_01X07 P2
U 1 1 587AFEEA
P 3400 4200
F 0 "P2" H 3319 3675 50  0000 C CNN
F 1 "CONN_01X07" H 3319 3766 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07_Pitch2.54mm" H 3400 4200 50  0001 C CNN
F 3 "" H 3400 4200 50  0000 C CNN
	1    3400 4200
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR011
U 1 1 587B0005
P 3600 4400
F 0 "#PWR011" H 3600 4250 50  0001 C CNN
F 1 "+5V" V 3615 4528 50  0000 L CNN
F 2 "" H 3600 4400 50  0000 C CNN
F 3 "" H 3600 4400 50  0000 C CNN
	1    3600 4400
	0    1    1    0   
$EndComp
$Comp
L GND #PWR012
U 1 1 587B004B
P 3600 4500
F 0 "#PWR012" H 3600 4250 50  0001 C CNN
F 1 "GND" V 3605 4372 50  0000 R CNN
F 2 "" H 3600 4500 50  0000 C CNN
F 3 "" H 3600 4500 50  0000 C CNN
	1    3600 4500
	0    -1   -1   0   
$EndComp
$Comp
L CP C6
U 1 1 587F9337
P 8500 3400
F 0 "C6" V 8245 3400 50  0000 C CNN
F 1 "47u" V 8336 3400 50  0000 C CNN
F 2 "Capacitors_THT:CP_Radial_D7.5mm_P2.50mm" H 8538 3250 50  0001 C CNN
F 3 "" H 8500 3400 50  0000 C CNN
	1    8500 3400
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR013
U 1 1 587F9467
P 8250 3400
F 0 "#PWR013" H 8250 3250 50  0001 C CNN
F 1 "+5V" H 8265 3573 50  0000 C CNN
F 2 "" H 8250 3400 50  0000 C CNN
F 3 "" H 8250 3400 50  0000 C CNN
	1    8250 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 587F94A5
P 8750 3400
F 0 "#PWR014" H 8750 3150 50  0001 C CNN
F 1 "GND" H 8755 3227 50  0000 C CNN
F 2 "" H 8750 3400 50  0000 C CNN
F 3 "" H 8750 3400 50  0000 C CNN
	1    8750 3400
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR015
U 1 1 5882A043
P 1350 2250
F 0 "#PWR015" H 1350 2100 50  0001 C CNN
F 1 "+5V" H 1365 2423 50  0000 C CNN
F 2 "" H 1350 2250 50  0000 C CNN
F 3 "" H 1350 2250 50  0000 C CNN
	1    1350 2250
	1    0    0    -1  
$EndComp
$Comp
L R_Small R2
U 1 1 5882A265
P 2000 3000
F 0 "R2" V 1804 3000 50  0000 C CNN
F 1 "2.2k" V 1895 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 2000 3000 50  0001 C CNN
F 3 "" H 2000 3000 50  0000 C CNN
	1    2000 3000
	0    1    1    0   
$EndComp
$Comp
L GND #PWR016
U 1 1 5882A2D3
P 1800 3000
F 0 "#PWR016" H 1800 2750 50  0001 C CNN
F 1 "GND" H 1805 2827 50  0000 C CNN
F 2 "" H 1800 3000 50  0000 C CNN
F 3 "" H 1800 3000 50  0000 C CNN
	1    1800 3000
	1    0    0    -1  
$EndComp
$Comp
L R_Small R3
U 1 1 5882B0C1
P 2600 2450
F 0 "R3" H 2541 2404 50  0000 R CNN
F 1 "220" H 2541 2495 50  0000 R CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 2600 2450 50  0001 C CNN
F 3 "" H 2600 2450 50  0000 C CNN
	1    2600 2450
	-1   0    0    1   
$EndComp
$Comp
L R_Small R5
U 1 1 5882B43B
P 8400 3950
F 0 "R5" V 8204 3950 50  0000 C CNN
F 1 "4.7k" V 8295 3950 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 8400 3950 50  0001 C CNN
F 3 "" H 8400 3950 50  0000 C CNN
	1    8400 3950
	0    1    1    0   
$EndComp
$Comp
L LED D3
U 1 1 5882B4A7
P 8750 3950
F 0 "D3" H 8742 3695 50  0000 C CNN
F 1 "RED" H 8742 3786 50  0000 C CNN
F 2 "LEDs:LED_0805" H 8750 3950 50  0001 C CNN
F 3 "" H 8750 3950 50  0000 C CNN
	1    8750 3950
	-1   0    0    1   
$EndComp
$Comp
L R_Small R4
U 1 1 5882B8F7
P 4900 1850
F 0 "R4" V 4704 1850 50  0000 C CNN
F 1 "82" V 4795 1850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 4900 1850 50  0001 C CNN
F 3 "" H 4900 1850 50  0000 C CNN
	1    4900 1850
	0    1    1    0   
$EndComp
$Comp
L LED D2
U 1 1 5882B976
P 4550 1850
F 0 "D2" H 4541 2066 50  0000 C CNN
F 1 "BLUE" H 4541 1975 50  0000 C CNN
F 2 "LEDs:LED_0805" H 4550 1850 50  0001 C CNN
F 3 "" H 4550 1850 50  0000 C CNN
	1    4550 1850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 5882BA0C
P 4150 1850
F 0 "#PWR017" H 4150 1600 50  0001 C CNN
F 1 "GND" H 4155 1677 50  0000 C CNN
F 2 "" H 4150 1850 50  0000 C CNN
F 3 "" H 4150 1850 50  0000 C CNN
	1    4150 1850
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR018
U 1 1 587AD03A
P 2850 5300
F 0 "#PWR018" H 2850 5150 50  0001 C CNN
F 1 "+5V" V 2865 5428 50  0000 L CNN
F 2 "" H 2850 5300 50  0000 C CNN
F 3 "" H 2850 5300 50  0000 C CNN
	1    2850 5300
	0    1    1    0   
$EndComp
Connection ~ 7050 3950
Wire Wire Line
	7050 1650 7050 1950
Connection ~ 7050 1850
Connection ~ 7050 1750
Connection ~ 7050 3850
Connection ~ 7050 3650
Connection ~ 7350 4050
Connection ~ 7350 3850
Connection ~ 7050 4050
Wire Wire Line
	4600 3150 5150 3150
Wire Wire Line
	5150 3150 5150 3250
Connection ~ 4750 3150
Wire Wire Line
	4600 3450 5000 3450
Wire Wire Line
	5000 3450 5000 3350
Wire Wire Line
	5000 3350 5150 3350
Connection ~ 4750 3450
Wire Wire Line
	4300 3150 4300 3550
Connection ~ 4300 3450
Wire Wire Line
	2750 5100 3500 5100
Wire Wire Line
	2750 5200 3500 5200
Wire Wire Line
	3000 5500 3150 5500
Wire Wire Line
	3150 5500 3150 5400
Wire Wire Line
	3150 5400 3500 5400
Wire Wire Line
	4500 5100 4700 5100
Connection ~ 4600 5100
Wire Wire Line
	5100 5100 5000 5100
Wire Wire Line
	4550 6200 4500 6200
Wire Wire Line
	3000 5800 3100 5800
Wire Wire Line
	3400 5800 3500 5800
Wire Wire Line
	2850 5300 2750 5300
Wire Wire Line
	2750 4900 2850 4900
Wire Wire Line
	4500 5300 4600 5300
Wire Wire Line
	4600 5400 4500 5400
Wire Wire Line
	4900 2250 5150 2250
Wire Wire Line
	5150 2350 4900 2350
Wire Wire Line
	3950 2500 4050 2500
Wire Wire Line
	4250 2500 5150 2500
Wire Wire Line
	4500 5800 4600 5800
Wire Wire Line
	4000 2950 4000 2800
Wire Wire Line
	4300 2500 4300 3000
Connection ~ 4300 2500
Wire Wire Line
	7050 3650 7050 4100
Wire Wire Line
	7350 3850 7350 4100
Wire Wire Line
	4150 3000 4150 3900
Wire Wire Line
	4300 3000 4150 3000
Connection ~ 4300 2800
Wire Wire Line
	4400 3550 5050 3550
Wire Wire Line
	5050 3550 5050 3450
Wire Wire Line
	5050 3450 5150 3450
Wire Wire Line
	5150 3550 5100 3550
Wire Wire Line
	5100 3550 5100 3600
Wire Wire Line
	5100 3600 4450 3600
Wire Wire Line
	5100 4100 5100 3950
Wire Wire Line
	5100 3950 5150 3950
Wire Wire Line
	4150 3900 3600 3900
Wire Wire Line
	4400 3550 4400 4000
Wire Wire Line
	4400 4000 3600 4000
Wire Wire Line
	3600 4100 4450 4100
Wire Wire Line
	4450 4100 4450 3600
Wire Wire Line
	3600 4200 4500 4200
Wire Wire Line
	4500 4200 4500 3650
Wire Wire Line
	4500 3650 5150 3650
Wire Wire Line
	3600 4300 4550 4300
Wire Wire Line
	4550 4300 4550 3750
Wire Wire Line
	4550 3750 5150 3750
Wire Wire Line
	4900 2150 5150 2150
Wire Wire Line
	8250 3400 8350 3400
Wire Wire Line
	8650 3400 9000 3400
Wire Wire Line
	1600 2250 1600 2100
Wire Wire Line
	2250 3050 2250 3000
Wire Wire Line
	2100 3000 2600 3000
Wire Wire Line
	1800 3000 1900 3000
Connection ~ 2250 3000
Wire Wire Line
	2600 2100 2600 2350
Wire Wire Line
	1600 2250 1350 2250
Wire Wire Line
	2600 3000 2600 2550
Wire Wire Line
	8250 3400 8250 3950
Wire Wire Line
	8250 3950 8300 3950
Wire Wire Line
	8500 3950 8600 3950
Wire Wire Line
	8900 3950 9000 3950
Wire Wire Line
	9000 3950 9000 3400
Connection ~ 8750 3400
Wire Wire Line
	5000 1850 5150 1850
Wire Wire Line
	4700 1850 4800 1850
Wire Wire Line
	4150 1850 4400 1850
$EndSCHEMATC
