
This Repository contains reverse engineering efforts for the
SainSmart REY-NET v1.1 16-relay controller board (with a blue PCB).
It can be bought (including relays) for roughly 30-40€ on diverse
sites on the net; without relays prices are around 20 - 35€.

It seems to belong to the "imatic" brand. There are clones with
white PCBs that can be found under the name of "imatic 16 channel relay"
(labeled "FC-188" on white PCB).

It is probably NOT compatible to SainSmarts version with black PCB;
that one has a different ethernet chip and thus probably a different
firmware. (There the ethernet chip seems to be a ENC28J60 by Microchip.)

Hardware
========

Overall current consumption is rather high: 150-200mA are used up from the
5V rail.

The board contains

* U1: Nuvoton M0516 or M0517, ARM Cortex M0 with
64K ROM and 4K RAM, in LQFP48 package.

	Datasheet can be loaded from: `http://www.nuvoton.com/resource-files/DS_M051%28DN_DE%29_Series_EN_Rev1.03.pdf`
	Technical Reference Guide: `https://www.nuvoton.com/resource-files/TRM_M051(BN_DN_DE)_Series_EN_Rev1.00.pdf`
	CMSIS SDK: `http://www.nuvoton.com/hq/resource-download.jsp?tp_GUID=SW0120140225231434`

* U5: Wiznet W9100 Ethernet Controller (via SPI)

	Datasheet can be loaded from: `http://www.wiznet.io/wp-content/uploads/wiznethome/Chip/W5100/Document/W5100_Datasheet_v1.2.7.pdf`

	The Wiznet W5100 ethernet controller is connected via SPI0,
	MOSI is pin 1 on the Cortex M0,
	MISO pin 2,
	CLK pin 3,
	CS pin 47.
	Wiznet /INT signal is connected to Pin 8 (P3.2, EINT0)

	The Wiznet can be used to listen on a specified TCP port,
	which seems to be done here. So all lowlevel ethernet/IP/TCP
	protocol is done in the Wiznet, which explains that the
	firmware of the ARM is so small.


* U6: Atmel AT24C256C 32KByte EEPROM (via i2c)

	Datasheet can be loaded from: `http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8568-SEEPROM-AT24C256C-Datasheet.pdf`

	The EEPROM is connected to I2C 0, with Address 0b101000 (0x50 without, 0xa0 with r/w flag)
	During startup, the EEPROM is read twice:

	First at offset 0x0000, two bytes are read:

	W:50: 00 00  ;  R:50: 85 C0

	Then, shortly afterwards, again from offset 0x0000:

	W:50: 00 00  ;  R:50: 85 C0 A8 01 04 0B B8 30 FF
	
	Obviously, the EEPROM contains the IP/TCP-Port configuration:

```
	85 c0 a8 01 04 0b b8 30 ff
	   |---------| |---| ||	\\_End-Of-Command marker?
	   IP Addr     Port  Checksum over previous 6 bytes?
```

	Everything else in the EEPROM seems to be ignored.

	I am unsure why there are two transfers.
	The EEPROM does not seem to signal any errors:
	No clockstretching and no ACKs are seen for the responses.

	Sadly, the MAC address does not seem to be fetched from the
	EEPROM. Thus, to use multiple cards on one ethernet,
	the firmware might need to be patched...

![front of PCB](https://github.com/dpiegdon/SainSmart-REY-NET-v1.1/blob/master/pcb_front.jpg?raw=true)

Connectors
==========

* J1 (marked on bottom layer) contains the Ethernet lines as well as
a 3.3V UART (connected to pins 46 and 47 of the ARM Cortex, thus UART1)

* J2 is a SWD connector

	Standard SWD tools like the BlackMagicProbe work.
	It seems that *some* boards have the controller locked down,
	so dumping the firmware is not possible with this approach.
	An annotated output of the dumped flash is in flash.asm

```
	Pinout:
	CON	SIGNAL		LQFP48 pin
	1	NC ?
	2	SWDIO		31
	3	SWCLK		30
	4	RST		4
	5	GND				(Labeled "G" on PCB)

	# FLASH and RAM on some devices are not protected and can be
	# dumped via gdb. Some devices (like the FC-188 in the image)
	# are protected though.
	(gdb) dump binary memory flash.bin 0 0x10000
	(gdb) dump binary memory ram.bin 0x20000000 0x20001000

	# The flash dump can be disassembled using:
	arm-none-eabi-objdump -D -z -b binary -marm -Mforce-thumb flash.bin
```

* J3 has GPIOs to control the connected relays

```
	Pinout:
	All relay pins are ACTIVE LOW.

				/---\---|
		VCC 5V		| 1 | 2 |	VCC 5V
				\---/---|
		Relay1		| 3 | 4 |	Relay
				|---|---|
				| 9 |10 |
				|---|---|
				|11 |12 |
				|---|---|
				|13 |14 |
				|---|---|
				|15 |16 |
				|---|---|
		Relay15		|17 |18 |	Relay16
				|---|---|
		GND		|19 |20 |	GND
				|---|---|

```

Fixing IP and MAC addresses
===========================

The serial and ethernet protocol and the EEPROM have not been reverseengineered
very deeply so far. So I am not yet sure if there is a way to change the IP
and MAC via one of these interfaces persistently.

But there is a manual option:
patching the Firmware, specifically at 0x0b7c .. 0x0bbc, one can hardcode
a different MAC address and IP address. That way one can have multiple devices
on one ethernet.

This approach has been tested and works fine. A sample firmware `192.168.1.5.bin`
can be found in the subdirectory `variants/`. It replaces the original default MAC
`0c:29:ab:7c:00:01` with `0c:29:ab:7c:00:02` and the original default IP
`192.168.1.4` with `192.168.1.5`.

Reflashing changed firmware
---------------------------

OpenOCD and other tools can be used to re-flash the modified firmware.
Currently, this is not possible with a BlackMagicProbe, as the BMP does
not support flashing binary files files.

Take care to provide a proper powersupply. The 5V rail should be able
to supply 200mA.

Also take care to connect 5 pins: 3V3, GND, NRST, SWCLK and SWDIO.
3V3 can be taken from J1.

Use the supplied `openocd.cfg` file. E.g. if you have an
Olimex ARM-USB-OCD-H, use:

```
	openocd -f interface/ftdi/olimex-arm-usb-ocd-h.cfg -f interface/ftdi/olimex-arm-jtag-swd.cfg -f openocd.cfg
```

Or replace the first two includes with your debugger of choice.
Once openocd indicated it has a proper connection, you can write
the firmware to the device.

If you get errors (about double faults), it may very well be that your
device is PROTECTED. You will have to trigger a mass erase on the chip
to upload another firmware. That might not work when supplying the ARM
via the 5V. Mass-erasing seems to only work when supplying enough current
on the 3.3V rail. Also I am not sure if this is possible with OpenOCD.
I used a different, proprietary tool for that.

Once OpenOCD can connect, you can flash the wanted firmware:

```
	telnet localhost 4444
	Trying 127.0.0.1...
	Connected to localhost.
	Escape character is '^]'.
	Open On-Chip Debugger
	> halt
	target halted due to debug-request, current mode: Handler HardFault
	xPSR: 0x61000003 pc: 0x0000019a msp: 0x20000af8
	> flash write_image full/path/to/variants/192.168.1.5.bin
	Device ID: 0x10005a00
	Device Name: M0516LBN
	bank base = 0x00000000, size = 0x00010000
	Nuvoton NuMicro: Flash Write ...
	wrote 65536 bytes from file full/path/to/variants/192.168.1.5.bin in 15.245326s (4.198 KiB/s)
	> exit
```

