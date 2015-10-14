# init-headphone
Manage the headphone amplifier found in some Clevo laptops.
Can initialize the device if headphones are not working after suspend.

**There are packages for [Arch Linux](https://aur.archlinux.org/packages/init-headphone/), [Fedora](https://github.com/letitz/init-headphone/releases) and [Ubuntu](https://github.com/Unrud/init-headphone-ubuntu/releases)**

## Supported models
```x is used as wildcard```
* N1xxSD
* P37xSM-A
* P65xSE
* P770ZM
* W130SV
* W230SD
* W230SS
* W25CSx
* W330AU
* W330SU2
* W355SDQ
* W3xxSS
* W510TU
* W510TU-L
* W5xxSU2
* W650SF
* W670SFQ
* W6xxSB
* W840AU
* W942SV
* W942SW
* W945SUW
* W94xTU
* W94xTU-L
* W95xTU
* W970KLQ
* W970SUW
* W970SUY
* W970TUQ
* W9xxAUx
* W9xxKL
* W9xxKU
* W9xxSU1
* W9xxSU2
* WA50SBQ
* WA50SFQ
* WA50SJQ

## Usage
```
$ init-headphone --help
usage: init-headphone [-h] [-v] [-f] [command]

Manage the headphone amplifier found in some Clevo laptops
(see the list of supported models below)

positional arguments:
  command        see the list of available commands below, init is the default
                 if the argument is omitted

optional arguments:
  -h, --help     show this help message and exit
  -v, --verbose  increase output verbosity
  -f, --force    skip model check

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

supported models:
  N1xxSD, P37xSM-A, P65xSE, P770ZM, W130SV, W230SD, W230SS, W25CSx, W330AU, 
  W330SU2, W355SDQ, W3xxSS, W510TU, W510TU-L, W5xxSU2, W650SF, W670SFQ, W6xxSB, 
  W840AU, W942SV, W942SW, W945SUW, W94xTU, W94xTU-L, W95xTU, W970KLQ, W970SUW, 
  W970SUY, W970TUQ, W9xxAUx, W9xxKL, W9xxKU, W9xxSU1, W9xxSU2, WA50SBQ, 
  WA50SFQ, WA50SJQ
```
