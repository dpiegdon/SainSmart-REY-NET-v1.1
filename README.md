
This Repository contains reverse engineering efforts for the
SainSmart REY-NET v1.1 16-relay controller board.
It can be bought (including relays) for roughly 33€ on diverse sites on the net.

Hardware
========

The board contains

* U1: Nuvoton M0516LDN, ARM Cortex M0 With 64K ROM and 4K RAM, in LQFP48 package.

	Datasheet can be loaded from: `http://www.nuvoton.com/resource-files/DS_M051%28DN_DE%29_Series_EN_Rev1.03.pdf`
	Technical Reference Guide: `https://www.nuvoton.com/resource-files/TRM_M051(BN_DN_DE)_Series_EN_Rev1.00.pdf`

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


Connectors:

* J2 is a SWD connector. pinout:

```
	CON	SIGNAL		LQFP48 pin
	1	NC ?
	2	SWD		31
	3	SCL		30
	4	RST		4
	5	GND

	0000.0000	0000.ffff	FLASH
	2000.0000	2000.0fff	RAM
	6000.0000	6001.ffff	EBI: external memory space (access to Wiznet W5100)
	5001.0000	5001.03ff	EBI: control registers
```


standard SWDIO tools like the BlackMagicProbe work.
FLASH and RAM are not protected and can be dumped via gdb:

```
	(gdb) dump binary memory flash.bin 0 0x10000
	(gdb) dump binary memory ram.bin 0x20000000 0x20001000
```

The flash dump can be disassembled using:

```
	arm-none-eabi-objdump -D -z -b binary -marm -Mforce-thumb flash.bin
```

An annotated output is in flash.asm


