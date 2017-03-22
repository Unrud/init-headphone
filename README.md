# init-headphone
Manage the headphone amplifier found in some Clevo laptops.
Can initialize the device if headphones are not working after suspend.

**There are packages for
[Arch Linux](https://aur.archlinux.org/packages/init-headphone/),
[Fedora](https://github.com/letitz/init-headphone/releases) and
[Ubuntu](https://github.com/Unrud/init-headphone-ubuntu/releases)**

## Installation

To install just run:

    ./autogen.sh
    ./configure
    make
    make install

If **systemd** is available, a unit file that starts the program automatically
gets installed. To enable it run:

    systemctl enable init-headphone

If you are not using **systemd**, take a look at the *etc/* folder. It
includes example configuration for **pm-utils** and **upstart** to start the
program automatically.

On older Linux versions you might have to add the kernel parameter
``acpi_enforce_resources=lax`` to make the i2c driver work.

## Usage
```
init-headphone --help
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

## Troubleshoot

  * Run **init-headphone** with the ``--verbose`` argument.
  * Use ``dmesg | grep i801`` to check for problems with the SMBus driver.
  * List all i2c busses with ``i2cdetect -l`` to find the full name of the bus
    **SMBus I801 adapter...**. Use that name as a argument for **i2cdetect**
    like ``i2cdetect "SMBus I801 adapter at f040"``. This should show the
    headphone amplifier at address 0x73.

## Information about the Windows driver

The Windows driver consists of a kernel space component **SvThANSP.sys** and a
user space component **hp.dll**.
The kernel driver is simple and only supports a few commands that allow access
to I/O ports.
**hp.dll** uses [DeviceIoControl](https://msdn.microsoft.com/en-us/library/windows/desktop/aa363216%28v=vs.85%29.aspx)
to communicates via the device file ``\\.\SvANSPDo`` with the driver.
It talks directly to the SMBus controller.

**hp.dll** exports the functions ``InitHeadphone()``, ``Set_Mute(bool)`` and
``Set_effect(int)`` to control the headphone amplifier which is connected to
the SMBus.

If you are interested in analyzing or running the Windows driver on Linux
(with [Wine](https://winehq.org)) take a look at: https://github.com/Unrud/init-headphone-tools

### Supported ``dwIoControlCode``s for [DeviceIoControl](https://msdn.microsoft.com/en-us/library/windows/desktop/aa363216%28v=vs.85%29.aspx)

#### 0x9C402494: Enumerate PCI device

``lpInBuffer`` amd ``lpOutBuffer`` look something like:

```c
struct {
    int bus,
    int device,
    int func,
    int pcireg,
    int result,
    int unused
}
```

The driver reads a word from the register ``pcireg`` of the with
``bus``, ``device`` and ``func`` specified PCI device.
The result is returned in ``result``. If the register doesn't exist, the
returned result is 0xffff. It's used to find the SMBus controller by
**hp.dll**.

#### 0x9C4024D0: Read byte

``lpInBuffer`` amd ``lpOutBuffer`` look something like:

```c
struct {
    int address,
    int data_read,
    int data_write
}
```

The driver reads one byte from ``address``. The result is returned in
``data_read``.

#### 0x9C4024C4: Write byte

``lpInBuffer`` amd ``lpOutBuffer`` are the same as above.

The driver writes one byte ``data_write`` to ``address``.

### SMBus controller

A detailed description of the controller is available in the
[chipset datasheet](https://www-ssl.intel.com/content/dam/www/public/us/en/documents/datasheets/8-series-chipset-pch-datasheet.pdf).

The important registers are:

  * **Transmit Slave Address Register**: Bit 0 indicates direction, the other
    7 Bits are the device address (Offset: 0x4)
  * **Host Command Register**: Command (Offset: 0x3)
  * **Host Data 0 Register**: Data (Offset: 0x5)

## Supported models
This list is subject to change. If the headphone jack is not working after
suspend, the model is probably supported.

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
