
This Repository contains reverse engineering efforts for the
SainSmart REY-NET v1.1 16-relay controller board.
It can be bought (including relays) for roughly 33€ on diverse sites on the net.

Hardware
========

The board contains

* U1: Nuvoton M0516LDN, ARM Cortex M0 With 64K ROM and 4K RAM, in LQFP48 package.

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

	The EEPROM is connected to I2C 0, with Address 0b101000.
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

Connectors
==========

* J1 (marked on bottom layer) contains the Ethernet lines as well as a 3.3V UART (connected to pins 46 and 47 of the ARM Cortex, thus UART1)

* J2 is a SWD connector

	Standard SWD tools like the BlackMagicProbe work.
	An annotated output of the dumped flash is in flash.asm

```
	Pinout:
	CON	SIGNAL		LQFP48 pin
	1	NC ?
	2	SWDIO		31
	3	SWCLK		30
	4	RST		4
	5	GND

	# FLASH and RAM are not protected and can be dumped via gdb:
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
		Relay1		| 3 | 4 |	Relay2
				|---|---|
		Relay3		| 5 | 6 |	Relay4
				|---|---|
		...		| 7 | 8 |	...
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
