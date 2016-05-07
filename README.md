# init-headphone
Manage the headphone amplifier found in some Clevo laptops.
Can initialize the device if headphones are not working after suspend.

**There are packages for [Arch Linux](https://aur.archlinux.org/packages/init-headphone/), [Fedora](https://github.com/letitz/init-headphone/releases) and [Ubuntu](https://github.com/Unrud/init-headphone-ubuntu/releases)**

## Usage
```
$ init-headphone --help
usage: init-headphone [-h] [--version] [-v] [command]

Manage the headphone amplifier found in some Clevo laptops

positional arguments:
  command        see the list of available commands below, init is the default
                 if the argument is omitted

optional arguments:
  -h, --help     show this help message and exit
  --version      show program's version number and exit
  -v, --verbose  increase output verbosity

available commands:
  init           initialize amplifier (with effect1)
  effect0        no change
  effect1        bass boost
  effect2
  effect3
  effect4        boost everything
  effect5
  effect6
  mute           turn output off
  unmute         turn output on
  recovery
```

## Supported models
This list is subject to change. If the headphone jack is not working after suspend, the model is probably supported.

```x is used as wildcard```
* N151SD/N155SD/N170SD/N150SC/N151SC/N155SC
* P15xSM-A/P17xSM-A Series
* P370SM-A/P375SM-A/P377SM-A Series
* P65xSE
* W130SV
* W230SD
* W230SS
* W25CSV/W25CSW
* W330AU
* W330SU2
* W355SDQ
* W35xSSQ/W37xSS Series
* W510TU
* W510TU-L
* W51xLU/-C
* W5xxSU2
* W650SB/W655SB/W670SBQ/W670SBQ1 Series
* W65xSF Series
* W65xSJ Series
* W67xSFQ Series
* W67xSJQ Series
* W840AU
* W940AU/W941AU-T/W945AU/W950AU/W955AU Series
* W940TU/W945TU Series
* W942SV/W942SV1
* W942SW/W942SW1
* W945SUW
* W94xKU/W95xKU
* W94xLU/-C/W95xLU/-C/W970LU
* W94xSU1
* W94xSU2/W95xSU2/W945SUY
* W94xTU-L
* W95xKL Series
* W95xTU Series
* W970KLQ
* W970SUY
* W970TUQ
* WA50SBQ
* WA50SFQ Series
* WA50SJQ Series