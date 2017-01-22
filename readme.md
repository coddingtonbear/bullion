# USB & SPI Interface for FS9721-based Multimeter

Do you have a cheap Chinese multimeter using the FS9721 chipset and
want to add an easy-to-use USB interface to it?  Or, do you have an
arduino project in mind where you might want to collect measurements
from your multimeter?  This project can help you do both of those things.

## Compatible Multimeters

Any multimeter using the FS9721 chipset is compatible, but you may have
to adapt the hardware design herein if your multimeter does not have a
3.5mm stereo jack labeled "RS232".

Known-compatible multimeters include:

* **RECOMMENDED** [TekPower TP4000ZC](https://www.amazon.com/Tekpower-TP4000ZC-Interfaced-Multimeter-Computer/dp/B000OPDFLM)
    * Also available as the Digitek DT-4000ZC.
    * Includes a 3.5mm RS232 port.
* [Mastech V&A 18B](https://www.amazon.com/Manual-Ranging-Digital-Multimeter-Interface/dp/B000LQONYM)
    * Does have an external RS232 port, but it is not compatible with the
      hardware files you'll find herein.  You will have to improvise.
* [UNI-T UT60E](https://www.amazon.com/UNI-T-UT60E-Precise-Light-Weight/dp/B0152OJAWC)
    * Does have an external RS232 port, but it is not compatible with the
      hardware files you'll find herein.  You will have to improvise.

## Interfaces

### USB

* Baud Rate: 2400

When connected to your PC, the device will appear as an additional serial
port (may require installation of a driver for the CH340G USB UART
chip).

By default, the raw output from the Multimeter will be displayed
as new multimeter data is received in a way identical to that of what the
built-in serial port would output were you to connect it directly to your
computer, but you can select a variety of output formats using the below
commands.

#### Commands

Commands are sent in the format `COMMAND=VALUE` followed by a single
newline character.

* Command ``output``:
    * Value ``raw`` (*default*): Display raw bytes received from multimeter.
    * Value ``value``: Display actual value scaled to base unit.
    * Value ``displayed``: Display displayed value.  Note that this is
      not scaled to the base unit.  Use the ``unit`` command below to
      determine magnitude.
    * Value ``none``: Disable output.
* Command ``units``:
    * Value ``0`` (*default*): Do not print unit.
    * Value ``1``: Print unit.  If the value is not scaled to the base
      unit, this may include an SI magnitude prefix ('u', 'n, 'm', 'k', 'M').

**Note**: *Command output is not displayed until you press <ENTER>*

For example; to display units in the format they are displayed on the screen,
you could send the following two commands:

```
output=displayed
units=1
```

and you would, assuming you were measuring a voltage source, receive responses like:

```
1.244 mV
1.239 mV
```

But, if you wanted to output values scaled to their base unit so programs
consuming these values wouldn't need to worry about the SI magnitude, you
could instead send the following commands:

```
output=value
units=1
```

and you'd receive the following values:

```
0.001244 V
0.001239 V
```

You could even turn off unit display if you were not concerned about
identifying what mode the multimeter was in while the returned measurement
was taking place (note, though, that `units=0` is the default state, so
you need not send that command if you have not already enabled unit display):

```
output=value
units=0
```

and then you'd receive very easy-to-parse values:

```
0.001244
0.001239
```

### SPI

* TBA
