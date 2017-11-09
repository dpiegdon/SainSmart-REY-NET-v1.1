
flash.bin:     file format binary


Disassembly of section .data:

00000000 <.data>:
       0:	20000b30      	;#IRQ	RESET value for SP
       4:	00000179      	;NUM	NVIC  1: ResetHandler
       8:	00000199      	;in	NVIC  2: BadNMIHandler       (terminal)
       c:	0000019b      	;Int	NVIC  3: BadHardFaultHandler (terminal)
      10:	00000000      	;Reg.	NVIC  4:                     (reserved)
      14:	00000000      	;	NVIC  5:                     (reserved)
      18:	00000000      	;	NVIC  6:                     (reserved)
      1c:	00000000      	;	NVIC  7:                     (reserved)
      20:	00000000      	;	NVIC  8:                     (reserved)
      24:	00000000      	;	NVIC  9:                     (reserved)
      28:	00000000      	;	NVIC 10:                     (reserved)
      2c:	0000019d      	;	NVIC 11: BadSVCallHandler    (terminal)
      30:	00000000      	;	NVIC 12:                     (reserved)
      34:	00000000      	;	NVIC 13:                     (reserved)
      38:	0000019f      	;	NVIC 14: BadPendSVHandler    (terminal)
      3c:	000001a1      	;	NVIC 15: BadSysTickHandler   (terminal)
      40:	000001a3      	;#0	NVIC 16: BadIRQHandler       (BOD_INT, BrownOut, terminal)
      44:	000001a3      	;#1	NVIC 17: BadIRQHandler       (WDT_INT, Watchdog, terminal)
      48:	000007e1      	;#2	NVIC 18: EINT0_WiznetHandler (EINT0, External signal interrupt from P3.2 pin) [pin 8 for LQFP48, connected to /INT or WIZNET]
      4c:	00000811      	;#3	NVIC 19: EINT1Handler        (EINT1, External signal interrupt from P3.3 pin) [pin 9 for LQFP48]
      50:	000001a3      	;#4	NVIC 20: BadIRQHandler       (GP01_INT, External signal interrupt from P0/P1, terminal)
      54:	000001a3      	;#5	NVIC 21: BadIRQHandler       (GP234_INT, External signal interrupt from P2/P3/P4, terminal)
      58:	000001a3      	;#6	NVIC 22: BadIRQHandler       (PWMA_INT, PWM interrupt, terminal)
      5c:	000001a3      	;#7	NVIC 23: BadIRQHandler       (PWMB_INT, PWM interrupt, terminal)
      60:	0000235d      	;#8	NVIC 24: TIM0Handler         (TIM0_INT, Timer 0 interrupt)
      64:	00002421      	;#9	NVIC 25: TIM1Handler         (TIM1_INT, Timer 1 interrupt)
      68:	000024dd      	;#10	NVIC 26: TIM2Handler         (TIM2_INT, Timer 2 interrupt)
      6c:	000025cd      	;#11	NVIC 27: TIM3Handler         (TIM3_INT, Timer 3 interrupt)
      70:	000001a3      	;#12	NVIC 28: BadIRQHandler       (UART0_INT, UART0 interrupt, terminal)
      74:	00002735      	;#13	NVIC 29: UART1Handler        (UART1_INT, UART1 interrupt)
      78:	000001a3      	;#14	NVIC 30: BadIRQHandler       (SPI0_INT terminal)
      7c:	000001a3      	;#15	NVIC 31: BadIRQHandler       (SPI1_INT, terminal)
      80:	000001a3      	;#16	NVIC 32: BadIRQHandler       (reserved, terminal)
      84:	000001a3      	;#17	NVIC 33: BadIRQHandler       (reserved, terminal)
      88:	000001a3      	;#18	NVIC 34: BadIRQHandler       (I2C0_INT, terminal)
      8c:	000001a3      	;#19	NVIC 35: BadIRQHandler       (I2C1_INT, terminal)
      90:	000001a3      	;#20	NVIC 36: BadIRQHandler       (reserved, terminal)
      94:	000001a3      	;#21	NVIC 37: BadIRQHandler       (reserved, terminal)
      98:	000001a3      	;#22	NVIC 38: BadIRQHandler       (reserved, terminal)
      9c:	000001a3      	;#23	NVIC 39: BadIRQHandler       (reserved, terminal)
      a0:	000001a3      	;#24	NVIC 40: BadIRQHandler       (reserved, terminal)
      a4:	000001a3      	;#25	NVIC 41: BadIRQHandler       (ACMP01_INT, terminal)
      a8:	000001a3      	;#26	NVIC 42: BadIRQHandler       (ACMP23_INT, terminal)
      ac:	000001a3      	;#27	NVIC 43: BadIRQHandler       (reserved, terminal)
      b0:	000001a3      	;#28	NVIC 44: BadIRQHandler       (PWRWU_INT, Clock controller interrupt for chip wakeup from PDown state, terminal)
      b4:	000001a3      	;#29	NVIC 45: BadIRQHandler       (ADC_INT, terminal)
      b8:	000001a3      	;#30	NVIC 46: BadIRQHandler       (reserved, terminal)
      bc:	000001a3      	;#31	NVIC 47: BadIRQHandler       (reserved, terminal)

StartUpCode
      c0:	f000 f802 	bl	0xc8
      c4:	f000 f848 	bl	0x158
      c8:	a00c      	add	r0, pc, #48	; (adr r0, 0xfc)
      ca:	c830      	ldmia	r0!, {r4, r5}
      cc:	3808      	subs	r0, #8
      ce:	1824      	adds	r4, r4, r0
      d0:	182d      	adds	r5, r5, r0
      d2:	46a2      	mov	sl, r4
      d4:	1e67      	subs	r7, r4, #1
      d6:	46ab      	mov	fp, r5
      d8:	4654      	mov	r4, sl
      da:	465d      	mov	r5, fp
      dc:	42ac      	cmp	r4, r5
      de:	d101      	bne.n	0xe4
      e0:	f000 f83a 	bl	0x158				; StartMain
      e4:	467e      	mov	r6, pc
      e6:	3e0f      	subs	r6, #15
      e8:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
      ea:	46b6      	mov	lr, r6
      ec:	2601      	movs	r6, #1
      ee:	4233      	tst	r3, r6
      f0:	d000      	beq.n	0xf4
      f2:	1afb      	subs	r3, r7, r3
      f4:	46a2      	mov	sl, r4
      f6:	46ab      	mov	fp, r5
      f8:	4333      	orrs	r3, r6
      fa:	4718      	bx	r3
      fc:	33ec      	adds	r3, #236	; 0xec
      fe:	0000      	movs	r0, r0
     100:	340c      	adds	r4, #12
     102:	0000      	movs	r0, r0
     104:	3a10      	subs	r2, #16
     106:	d302      	bcc.n	0x10e
     108:	c878      	ldmia	r0!, {r3, r4, r5, r6}
     10a:	c178      	stmia	r1!, {r3, r4, r5, r6}
     10c:	d8fa      	bhi.n	0x104
     10e:	0752      	lsls	r2, r2, #29
     110:	d301      	bcc.n	0x116
     112:	c830      	ldmia	r0!, {r4, r5}
     114:	c130      	stmia	r1!, {r4, r5}
     116:	d501      	bpl.n	0x11c
     118:	6804      	ldr	r4, [r0, #0]
     11a:	600c      	str	r4, [r1, #0]
     11c:	4770      	bx	lr
     11e:	0000      	movs	r0, r0
     120:	2300      	movs	r3, #0
     122:	2400      	movs	r4, #0
     124:	2500      	movs	r5, #0
     126:	2600      	movs	r6, #0
     128:	3a10      	subs	r2, #16
     12a:	d301      	bcc.n	0x130
     12c:	c178      	stmia	r1!, {r3, r4, r5, r6}
     12e:	d8fb      	bhi.n	0x128
     130:	0752      	lsls	r2, r2, #29
     132:	d300      	bcc.n	0x136
     134:	c130      	stmia	r1!, {r4, r5}
     136:	d500      	bpl.n	0x13a
     138:	600b      	str	r3, [r1, #0]
     13a:	4770      	bx	lr
     13c:	b510      	push	{r4, lr}
     13e:	2978      	cmp	r1, #120	; 0x78
     140:	d102      	bne.n	0x148
     142:	f000 f855 	bl	0x1f0
     146:	bd10      	pop	{r4, pc}

     148:	2000      	movs	r0, #0
     14a:	bd10      	pop	{r4, pc}

InitNothing:
     14c:	b51f      	push	{r0, r1, r2, r3, r4, lr}
     14e:	46c0      	nop			; (mov r8, r8)
     150:	46c0      	nop			; (mov r8, r8)
     152:	bd1f      	pop	{r0, r1, r2, r3, r4, pc}
ExitNothing:
     154:	b510      	push	{r4, lr}
     156:	bd10      	pop	{r4, pc}
StartMain:
     158:	f000 f984 	bl	0x464
     15c:	4611      	mov	r1, r2
     15e:	f7ff fff5 	bl	0x14c				; InitNothing
     162:	f002 ffbf 	bl	0x30e4				; Main
     166:	f000 f99c 	bl	0x4a2				; Exit
ExitAfterMain:
     16a:	b403      	push	{r0, r1}
     16c:	f7ff fff2 	bl	0x154				; ExitNothing
FirmwareFallThrough:
     170:	bc03      	pop	{r0, r1}
     172:	f000 f9a1 	bl	0x4b8		;		; TrapIntoDebugMode

     176:	0000      	;	padding

ResetHandler:
     178:	480d      	ldr	r0, [pc, #52]	; (0x1b0)	; load base offset of Global Control registers (GCR)
     17a:	6901      	ldr	r1, [r0, #16]			; load GCR+0x10 ? reserved register ?
     17c:	293f      	cmp	r1, #63	; 0x3f
     17e:	d109      	bne.n	0x194
     180:	490c      	ldr	r1, [pc, #48]	; (0x1b4)
     182:	6001      	str	r1, [r0, #0]
     184:	490c      	ldr	r1, [pc, #48]	; (0x1b8)
     186:	6001      	str	r1, [r0, #0]
     188:	490c      	ldr	r1, [pc, #48]	; (0x1bc)
     18a:	6001      	str	r1, [r0, #0]
     18c:	490c      	ldr	r1, [pc, #48]	; (0x1c0)
     18e:	6101      	str	r1, [r0, #16]
     190:	2100      	movs	r1, #0
     192:	6001      	str	r1, [r0, #0]
     194:	480b      	ldr	r0, [pc, #44]	; (0x1c4)
     196:	4700      	bx	r0				; Jump to StartUpCode

BadNMIHandler:
     198:	e7fe      	b.n	0x198
BadHardFaultHandler:
     19a:	e7fe      	b.n	0x19a
BadSVCallHandler:
     19c:	e7fe      	b.n	0x19c
BadPendSVHandler:
     19e:	e7fe      	b.n	0x19e
BadSysTickHandler:
     1a0:	e7fe      	b.n	0x1a0
BadIRQHandler:
     1a2:	e7fe      	b.n	0x1a2

     1a4:	4808      	ldr	r0, [pc, #32]	; (0x1c8)
     1a6:	4909      	ldr	r1, [pc, #36]	; (0x1cc)
     1a8:	4a07      	ldr	r2, [pc, #28]	; (0x1c8)
     1aa:	4b09      	ldr	r3, [pc, #36]	; (0x1d0)
     1ac:	4770      	bx	lr
     1ae:	0000      	;	padding
     1b0:	50000100      	;	System Global Control Registers
     1b4:	00000059      	;
     1b8:	00000016      	;
     1bc:	00000088      	;
     1c0:	00000020      	;
     1c4:	000000c1      	;	PTR to StartUpCode
     1c8:	20000730      	;
     1cc:	20000b30      	;
     1d0:	20000730      	;

UART0_printf(format, ...) ???
     1d4:	b40f      	push	{r0, r1, r2, r3}
     1d6:	4905      	ldr	r1, [pc, #20]	; (0x1ec)	; r1 := scratchpad
     1d8:	b510      	push	{r4, lr}
     1da:	aa03      	add	r2, sp, #12
     1dc:	9802      	ldr	r0, [sp, #8]
     1de:	f000 f915 	bl	0x40c				; UART0_vprintf(format, scratchpad, ap)
     1e2:	bc10      	pop	{r4}
     1e4:	bc08      	pop	{r3}
     1e6:	b004      	add	sp, #16
     1e8:	4718      	bx	r3

     1ea:	0000      	;	padding
     1ec:	20000000      	;	char scratchpad[8];

     1f0:	b570      	push	{r4, r5, r6, lr}
     1f2:	4604      	mov	r4, r0
     1f4:	460d      	mov	r5, r1
     1f6:	4621      	mov	r1, r4
     1f8:	6810      	ldr	r0, [r2, #0]
     1fa:	46c0      	nop			; (mov r8, r8)
     1fc:	46c0      	nop			; (mov r8, r8)
     1fe:	8821      	ldrh	r1, [r4, #0]
     200:	0509      	lsls	r1, r1, #20
     202:	d502      	bpl.n	0x20a
     204:	4a0f      	ldr	r2, [pc, #60]	; (0x244)
     206:	447a      	add	r2, pc
     208:	e002      	b.n	0x210
     20a:	4a0e      	ldr	r2, [pc, #56]	; (0x244)
     20c:	447a      	add	r2, pc
     20e:	320e      	adds	r2, #14
     210:	4623      	mov	r3, r4
     212:	2100      	movs	r1, #0
     214:	3324      	adds	r3, #36	; 0x24
     216:	e005      	b.n	0x224
     218:	0706      	lsls	r6, r0, #28
     21a:	0f36      	lsrs	r6, r6, #28
     21c:	5d96      	ldrb	r6, [r2, r6]
     21e:	545e      	strb	r6, [r3, r1]
     220:	1c49      	adds	r1, r1, #1
     222:	0900      	lsrs	r0, r0, #4
     224:	2800      	cmp	r0, #0
     226:	d1f7      	bne.n	0x218
     228:	7820      	ldrb	r0, [r4, #0]
     22a:	2300      	movs	r3, #0
     22c:	0700      	lsls	r0, r0, #28
     22e:	d505      	bpl.n	0x23c
     230:	2d70      	cmp	r5, #112	; 0x70
     232:	d003      	beq.n	0x23c
     234:	2900      	cmp	r1, #0
     236:	d001      	beq.n	0x23c
     238:	3211      	adds	r2, #17
     23a:	2302      	movs	r3, #2
     23c:	4620      	mov	r0, r4
     23e:	f000 f88d 	bl	0x35c
     242:	bd70      	pop	{r4, r5, r6, pc}

     244:	000032b4      	;

     248:	b5f3      	push	{r0, r1, r4, r5, r6, r7, lr}
     24a:	4604      	mov	r4, r0
     24c:	2000      	movs	r0, #0
     24e:	b081      	sub	sp, #4
     250:	6220      	str	r0, [r4, #32]
     252:	4620      	mov	r0, r4
     254:	68e1      	ldr	r1, [r4, #12]
     256:	4788      	blx	r1
     258:	2800      	cmp	r0, #0
     25a:	d07a      	beq.n	0x352
     25c:	2825      	cmp	r0, #37	; 0x25
     25e:	d002      	beq.n	0x266
     260:	6862      	ldr	r2, [r4, #4]
     262:	68a1      	ldr	r1, [r4, #8]
     264:	e071      	b.n	0x34a
     266:	68e1      	ldr	r1, [r4, #12]
     268:	4620      	mov	r0, r4
     26a:	2500      	movs	r5, #0
     26c:	4788      	blx	r1
     26e:	4606      	mov	r6, r0
     270:	2000      	movs	r0, #0
     272:	61e0      	str	r0, [r4, #28]
     274:	4607      	mov	r7, r0
     276:	61a0      	str	r0, [r4, #24]
     278:	2e2a      	cmp	r6, #42	; 0x2a
     27a:	d00a      	beq.n	0x292
     27c:	4630      	mov	r0, r6
     27e:	f002 feaf 	bl	0x2fe0
     282:	2800      	cmp	r0, #0
     284:	d027      	beq.n	0x2d6
     286:	3e30      	subs	r6, #48	; 0x30
     288:	00b8      	lsls	r0, r7, #2
     28a:	1900      	adds	r0, r0, r4
     28c:	9000      	str	r0, [sp, #0]
     28e:	6186      	str	r6, [r0, #24]
     290:	e019      	b.n	0x2c6
     292:	9802      	ldr	r0, [sp, #8]
     294:	00ba      	lsls	r2, r7, #2
     296:	1912      	adds	r2, r2, r4
     298:	c802      	ldmia	r0!, {r1}
     29a:	6191      	str	r1, [r2, #24]
     29c:	9002      	str	r0, [sp, #8]
     29e:	4620      	mov	r0, r4
     2a0:	68e1      	ldr	r1, [r4, #12]
     2a2:	4788      	blx	r1
     2a4:	2f01      	cmp	r7, #1
     2a6:	4606      	mov	r6, r0
     2a8:	d117      	bne.n	0x2da
     2aa:	69e0      	ldr	r0, [r4, #28]
     2ac:	2800      	cmp	r0, #0
     2ae:	da1f      	bge.n	0x2f0
     2b0:	2020      	movs	r0, #32
     2b2:	4385      	bics	r5, r0
     2b4:	e01c      	b.n	0x2f0
     2b6:	9800      	ldr	r0, [sp, #0]
     2b8:	210a      	movs	r1, #10
     2ba:	6980      	ldr	r0, [r0, #24]
     2bc:	4348      	muls	r0, r1
     2be:	9900      	ldr	r1, [sp, #0]
     2c0:	1980      	adds	r0, r0, r6
     2c2:	3830      	subs	r0, #48	; 0x30
     2c4:	6188      	str	r0, [r1, #24]
     2c6:	4620      	mov	r0, r4
     2c8:	68e1      	ldr	r1, [r4, #12]
     2ca:	4788      	blx	r1
     2cc:	4606      	mov	r6, r0
     2ce:	f002 fe87 	bl	0x2fe0
     2d2:	2800      	cmp	r0, #0
     2d4:	d1ef      	bne.n	0x2b6
     2d6:	2f01      	cmp	r7, #1
     2d8:	d00a      	beq.n	0x2f0
     2da:	2e2e      	cmp	r6, #46	; 0x2e
     2dc:	d108      	bne.n	0x2f0
     2de:	4620      	mov	r0, r4
     2e0:	68e1      	ldr	r1, [r4, #12]
     2e2:	4788      	blx	r1
     2e4:	4606      	mov	r6, r0
     2e6:	2020      	movs	r0, #32
     2e8:	4305      	orrs	r5, r0
     2ea:	1c7f      	adds	r7, r7, #1
     2ec:	2f02      	cmp	r7, #2
     2ee:	dbc3      	blt.n	0x278
     2f0:	69a0      	ldr	r0, [r4, #24]
     2f2:	2800      	cmp	r0, #0
     2f4:	da03      	bge.n	0x2fe
     2f6:	4240      	negs	r0, r0
     2f8:	61a0      	str	r0, [r4, #24]
     2fa:	2001      	movs	r0, #1
     2fc:	4305      	orrs	r5, r0
     2fe:	07e8      	lsls	r0, r5, #31
     300:	d001      	beq.n	0x306
     302:	2010      	movs	r0, #16
     304:	4385      	bics	r5, r0
     306:	2e00      	cmp	r6, #0
     308:	d023      	beq.n	0x352
     30a:	4630      	mov	r0, r6
     30c:	3841      	subs	r0, #65	; 0x41
     30e:	2819      	cmp	r0, #25
     310:	d803      	bhi.n	0x31a
     312:	2001      	movs	r0, #1
     314:	02c0      	lsls	r0, r0, #11
     316:	4305      	orrs	r5, r0
     318:	3620      	adds	r6, #32
     31a:	4620      	mov	r0, r4
     31c:	6025      	str	r5, [r4, #0]
     31e:	4631      	mov	r1, r6
     320:	9a02      	ldr	r2, [sp, #8]
     322:	4615      	mov	r5, r2
     324:	f7ff ff0a 	bl	0x13c
     328:	2800      	cmp	r0, #0
     32a:	d00b      	beq.n	0x344
     32c:	2801      	cmp	r0, #1
     32e:	d006      	beq.n	0x33e
     330:	1ded      	adds	r5, r5, #7
     332:	08e8      	lsrs	r0, r5, #3
     334:	00c0      	lsls	r0, r0, #3
     336:	3008      	adds	r0, #8
     338:	9002      	str	r0, [sp, #8]
     33a:	e78a      	b.n	0x252
     33c:	e009      	b.n	0x352
     33e:	1d2d      	adds	r5, r5, #4
     340:	9502      	str	r5, [sp, #8]
     342:	e786      	b.n	0x252
     344:	6862      	ldr	r2, [r4, #4]
     346:	4630      	mov	r0, r6
     348:	68a1      	ldr	r1, [r4, #8]
     34a:	4790      	blx	r2
     34c:	6a20      	ldr	r0, [r4, #32]
     34e:	1c40      	adds	r0, r0, #1
     350:	e77e      	b.n	0x250
     352:	6a20      	ldr	r0, [r4, #32]
     354:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
     356:	4770      	bx	lr
     358:	4770      	bx	lr
     35a:	4770      	bx	lr

printf_??? ?
     35c:	b5ff      	push	{r0, r1, r2, r3, r4, r5, r6, r7, lr}
     35e:	4604      	mov	r4, r0
     360:	460d      	mov	r5, r1
     362:	b081      	sub	sp, #4
     364:	3024      	adds	r0, #36	; 0x24
     366:	9000      	str	r0, [sp, #0]
     368:	6821      	ldr	r1, [r4, #0]
     36a:	0688      	lsls	r0, r1, #26
     36c:	d504      	bpl.n	0x378
     36e:	2210      	movs	r2, #16
     370:	69e0      	ldr	r0, [r4, #28]
     372:	4391      	bics	r1, r2
     374:	6021      	str	r1, [r4, #0]
     376:	e000      	b.n	0x37a
     378:	2001      	movs	r0, #1
     37a:	42a8      	cmp	r0, r5
     37c:	dd01      	ble.n	0x382
     37e:	1b47      	subs	r7, r0, r5
     380:	e000      	b.n	0x384
     382:	2700      	movs	r7, #0
     384:	9804      	ldr	r0, [sp, #16]
     386:	69a1      	ldr	r1, [r4, #24]
     388:	197a      	adds	r2, r7, r5
     38a:	1810      	adds	r0, r2, r0
     38c:	1a08      	subs	r0, r1, r0
     38e:	61a0      	str	r0, [r4, #24]
     390:	7820      	ldrb	r0, [r4, #0]
     392:	06c0      	lsls	r0, r0, #27
     394:	d402      	bmi.n	0x39c
     396:	4620      	mov	r0, r4
     398:	46c0      	nop			; (mov r8, r8)
     39a:	46c0      	nop			; (mov r8, r8)
     39c:	2600      	movs	r6, #0
     39e:	e008      	b.n	0x3b2
     3a0:	9803      	ldr	r0, [sp, #12]
     3a2:	6862      	ldr	r2, [r4, #4]
     3a4:	68a1      	ldr	r1, [r4, #8]
     3a6:	5d80      	ldrb	r0, [r0, r6]
     3a8:	4790      	blx	r2
     3aa:	6a20      	ldr	r0, [r4, #32]
     3ac:	1c40      	adds	r0, r0, #1
     3ae:	1c76      	adds	r6, r6, #1
     3b0:	6220      	str	r0, [r4, #32]
     3b2:	9804      	ldr	r0, [sp, #16]
     3b4:	4286      	cmp	r6, r0
     3b6:	dbf3      	blt.n	0x3a0
     3b8:	7820      	ldrb	r0, [r4, #0]
     3ba:	06c0      	lsls	r0, r0, #27
     3bc:	d50a      	bpl.n	0x3d4
     3be:	4620      	mov	r0, r4
     3c0:	46c0      	nop			; (mov r8, r8)
     3c2:	46c0      	nop			; (mov r8, r8)
     3c4:	e006      	b.n	0x3d4
     3c6:	6862      	ldr	r2, [r4, #4]
     3c8:	68a1      	ldr	r1, [r4, #8]
     3ca:	2030      	movs	r0, #48	; 0x30
     3cc:	4790      	blx	r2
     3ce:	6a20      	ldr	r0, [r4, #32]
     3d0:	1c40      	adds	r0, r0, #1
     3d2:	6220      	str	r0, [r4, #32]
     3d4:	4638      	mov	r0, r7
     3d6:	1e7f      	subs	r7, r7, #1
     3d8:	2800      	cmp	r0, #0
     3da:	dcf4      	bgt.n	0x3c6
     3dc:	e007      	b.n	0x3ee
     3de:	9800      	ldr	r0, [sp, #0]
     3e0:	6862      	ldr	r2, [r4, #4]
     3e2:	68a1      	ldr	r1, [r4, #8]
     3e4:	5d40      	ldrb	r0, [r0, r5]
     3e6:	4790      	blx	r2
     3e8:	6a20      	ldr	r0, [r4, #32]
     3ea:	1c40      	adds	r0, r0, #1
     3ec:	6220      	str	r0, [r4, #32]
     3ee:	4628      	mov	r0, r5
     3f0:	1e6d      	subs	r5, r5, #1
     3f2:	2800      	cmp	r0, #0
     3f4:	dcf3      	bgt.n	0x3de
     3f6:	4620      	mov	r0, r4
     3f8:	46c0      	nop			; (mov r8, r8)
     3fa:	46c0      	nop			; (mov r8, r8)
     3fc:	7820      	ldrb	r0, [r4, #0]
     3fe:	0600      	lsls	r0, r0, #24
     400:	d502      	bpl.n	0x408
     402:	2002      	movs	r0, #2
     404:	b005      	add	sp, #20
     406:	bdf0      	pop	{r4, r5, r6, r7, pc}
     408:	2001      	movs	r0, #1
     40a:	e7fb      	b.n	0x404

UART0_vprintf(format, scratchpad, ap):	???
     40c:	4b08      	ldr	r3, [pc, #32]	; (0x430)
     40e:	b570      	push	{r4, r5, r6, lr}
     410:	460d      	mov	r5, r1				; r5 := ap
     412:	447b      	add	r3, pc
     414:	f000 f813 	bl	0x43e
     418:	4604      	mov	r4, r0				; r4 := scratchpad
     41a:	4628      	mov	r0, r5
     41c:	f002 fe56 	bl	0x30cc
     420:	2800      	cmp	r0, #0
     422:	d002      	beq.n	0x42a				; UART0_vprintf_EndOfLine
     424:	2000      	movs	r0, #0
     426:	43c0      	mvns	r0, r0
     428:	bd70      	pop	{r4, r5, r6, pc}
UART0_vprintf_EndOfLine: ???
     42a:	4620      	mov	r0, r4
     42c:	bd70      	pop	{r4, r5, r6, pc}

     42e:	0000      	;	padding
     430:	00002cbf      	;

     434:	6901      	ldr	r1, [r0, #16]
     436:	1c4a      	adds	r2, r1, #1
     438:	6102      	str	r2, [r0, #16]
     43a:	7808      	ldrb	r0, [r1, #0]
     43c:	4770      	bx	lr

vprintf_???:
     43e:	b500      	push	{lr}
     440:	b08f      	sub	sp, #60	; 0x3c
     442:	9102      	str	r1, [sp, #8]
     444:	2100      	movs	r1, #0
     446:	9105      	str	r1, [sp, #20]
     448:	4905      	ldr	r1, [pc, #20]	; (0x460)
     44a:	9301      	str	r3, [sp, #4]
     44c:	4479      	add	r1, pc
     44e:	9103      	str	r1, [sp, #12]
     450:	4611      	mov	r1, r2
     452:	9004      	str	r0, [sp, #16]
     454:	4668      	mov	r0, sp
     456:	f7ff fef7 	bl	0x248
     45a:	b00f      	add	sp, #60	; 0x3c
     45c:	bd00      	pop	{pc}

     45e:	0000      	;	padding
     460:	ffffffe5	;

Init???
     464:	4675      	mov	r5, lr
     466:	f000 f823 	bl	0x4b0
     46a:	46ae      	mov	lr, r5
     46c:	0005      	movs	r5, r0
     46e:	4669      	mov	r1, sp
     470:	4653      	mov	r3, sl
     472:	08c0      	lsrs	r0, r0, #3
     474:	00c0      	lsls	r0, r0, #3
     476:	4685      	mov	sp, r0
     478:	b018      	add	sp, #96	; 0x60
     47a:	b520      	push	{r5, lr}
     47c:	f7ff fe92 	bl	0x1a4
     480:	bc60      	pop	{r5, r6}
     482:	2700      	movs	r7, #0
     484:	0849      	lsrs	r1, r1, #1
     486:	46b6      	mov	lr, r6
     488:	2600      	movs	r6, #0
     48a:	c5c0      	stmia	r5!, {r6, r7}
     48c:	c5c0      	stmia	r5!, {r6, r7}
     48e:	c5c0      	stmia	r5!, {r6, r7}
     490:	c5c0      	stmia	r5!, {r6, r7}
     492:	c5c0      	stmia	r5!, {r6, r7}
     494:	c5c0      	stmia	r5!, {r6, r7}
     496:	c5c0      	stmia	r5!, {r6, r7}
     498:	c5c0      	stmia	r5!, {r6, r7}
     49a:	3d40      	subs	r5, #64	; 0x40
     49c:	0049      	lsls	r1, r1, #1
     49e:	468d      	mov	sp, r1
     4a0:	4770      	bx	lr

Exit:
     4a2:	4604      	mov	r4, r0
     4a4:	46c0      	nop			; (mov r8, r8)
     4a6:	46c0      	nop			; (mov r8, r8)
     4a8:	4620      	mov	r0, r4
     4aa:	f7ff fe5e 	bl	0x16a				; ExitAfterMain:
     4ae:	0000      	movs	r0, r0
     4b0:	4800      	ldr	r0, [pc, #0]	; (0x4b4)
     4b2:	4770      	bx	lr

     4b4:	200006d0      	;

TrapIntoDebugMode:
     4b8:	4901      	ldr	r1, [pc, #4]	; (0x4c0)
     4ba:	2018      	movs	r0, #24
     4bc:	beab      	bkpt	0x00ab
     4be:	e7fe      	b.n	0x4be		; TERMINAL LOOP

     4c0:	00020026      	;

     4c4:	4770      	bx	lr
     4c6:	0000      	movs	r0, r0
     4c8:	2000      	movs	r0, #0
     4ca:	4902      	ldr	r1, [pc, #8]	; (0x4d4)
     4cc:	6008      	str	r0, [r1, #0]
     4ce:	2004      	movs	r0, #4
     4d0:	6008      	str	r0, [r1, #0]
     4d2:	4770      	bx	lr
     4d4:	000c      	movs	r4, r1
     4d6:	2000      	movs	r0, #0

Delay(msecs):								; *probably* msecs
     4d8:	e008      	b.n	0x4ec
     4da:	2100      	movs	r1, #0
     4dc:	e002      	b.n	0x4e4
     4de:	1c53      	adds	r3, r2, #1
     4e0:	b2da      	uxtb	r2, r3
     4e2:	1c49      	adds	r1, r1, #1
     4e4:	4b03      	ldr	r3, [pc, #12]	; (0x4f4)
     4e6:	4299      	cmp	r1, r3
     4e8:	d3f9      	bcc.n	0x4de
     4ea:	1e40      	subs	r0, r0, #1
     4ec:	2800      	cmp	r0, #0
     4ee:	d1f4      	bne.n	0x4da
     4f0:	4770      	bx	lr

     4f2:	0000      	;	padding
     4f4:	00000333      	;

WiznetSocketSetup(void): -> int						; returns 0 in case of error, 1 if succeeded
     4f8:	b510      	push	{r4, lr}
     4fa:	2121      	movs	r1, #33	; 0x21
     4fc:	2001      	movs	r0, #1				; Wiznet_Write_Address(0x400, 0x21)
     4fe:	0280      	lsls	r0, r0, #10			; Socket 0 Mode Register: Disable Multicast, MAC Filter
     500:	f002 fd3e 	bl	0x2f80				;   and Delayed ACK; use TCP as protocol
     504:	2101      	movs	r1, #1
     506:	481d      	ldr	r0, [pc, #116]	; (0x57c)	; Wiznet_Write_Address(0x401, 0x1)
     508:	f002 fd3a 	bl	0x2f80				; => Socket 0 Command register: Open Socket
     50c:	481b      	ldr	r0, [pc, #108]	; (0x57c)
     50e:	1c80      	adds	r0, r0, #2			; Wiznet_Read_Address(0x403)
     510:	f001 fb46 	bl	0x1ba0				; <= Socket 0 Status register
     514:	2813      	cmp	r0, #19				; 0x13 == SOCK_INIT
     516:	d008      	beq.n	0x52a				; => WiznetSocketInitOk
WiznetSocketSetup_Failed1:
     518:	2110      	movs	r1, #16
     51a:	4818      	ldr	r0, [pc, #96]	; (0x57c)	; Wiznet_Write_Address(0x401, 0x10)
     51c:	f002 fd30 	bl	0x2f80				; => Close socket
     520:	a017      	add	r0, pc, #92	; (adr r0, 0x580)
     522:	f7ff fe57 	bl	0x1d4				; UART0_printf
     526:	2000      	movs	r0, #0
WiznetSocketSetup_Done:
     528:	bd10      	pop	{r4, pc}			; Return

WiznetSocketInitOk:
     52a:	2400      	movs	r4, #0				; for r4 in 0..4
     52c:	e00a      	b.n	0x544
WiznetSocketSetDstIPAddr:
     52e:	4a1a      	ldr	r2, [pc, #104]	; (0x598)
     530:	5d12      	ldrb	r2, [r2, r4]
     532:	1c52      	adds	r2, r2, #1
     534:	b2d1      	uxtb	r1, r2
     536:	4a11      	ldr	r2, [pc, #68]	; (0x57c)
     538:	320b      	adds	r2, #11
     53a:	18a0      	adds	r0, r4, r2			; r0 is 0x401+(#11..#14)
     53c:	f002 fd20 	bl	0x2f80				; Wiznet_Write_Address(0x40c..0x40f, SrcIPAddr[0..4])
     540:	1c60      	adds	r0, r4, #1			; => set DstIPAddress for Socket 0
     542:	b2c4      	uxtb	r4, r0
     544:	2c04      	cmp	r4, #4
     546:	dbf2      	blt.n	0x52e				; WiznetSocketSetDstIPAddr

     548:	2104      	movs	r1, #4				; 0x04 == CONNECT
     54a:	480c      	ldr	r0, [pc, #48]	; (0x57c)	; Wiznet_Write_Address(0x401, 0x4)
     54c:	f002 fd18 	bl	0x2f80				; => try to connect
     550:	2064      	movs	r0, #100	; 0x64
     552:	f7ff ffc1 	bl	0x4d8				; Delay(#100)
     556:	4809      	ldr	r0, [pc, #36]	; (0x57c)
     558:	1d40      	adds	r0, r0, #5
     55a:	f001 fb21 	bl	0x1ba0				; Wiznet_Read_Address(0x406)
     55e:	4604      	mov	r4, r0				; => r4 := Socket 0 DstHardwareAddr[0]
     560:	2110      	movs	r1, #16
     562:	4806      	ldr	r0, [pc, #24]	; (0x57c)	; Wiznet_Write_Address(0x401, 0x10)
     564:	f002 fd0c 	bl	0x2f80				; => CLOSE socket
     568:	2cff      	cmp	r4, #255	; 0xff		; CHECK FOR BROADCAST MAC ADDRESS
     56a:	d104      	bne.n	0x576
     56c:	a00b      	add	r0, pc, #44	; (adr r0, 0x59c)
     56e:	f7ff fe31 	bl	0x1d4				; UART0_printf
WiznetSocketSetup_Failed2:
     572:	2000      	movs	r0, #0
     574:	e7d8      	b.n	0x528				; WiznetSocketSetup_Done
WiznetSocketSetup_Success
     576:	2001      	movs	r0, #1
     578:	e7d6      	b.n	0x528				; WiznetSocketSetup_Done
     57a:	0000      	;	padding

     57c:	00000401      	;	Wiznet: Socket 0 Command register

     580:	706f      	;	String 'open_scoket--eeror\r\n\0\0\0\0' (sic!)
     582:	6e65      	;
     584:	735f      	;
     586:	6f63      	;
     588:	656b      	;
     58a:	2d74      	;
     58c:	652d      	;
     58e:	7265      	;
     590:	726f      	;
     592:	0a0d      	;
     594:	0000      	;
     596:	0000      	;

     598:	20000060      	;	u8 SrcIPAddr[4]

     59c:	200a      	;	String ' \n No_gateway\r\n'
     59e:	6f4e      	;
     5a0:	675f      	;
     5a2:	7461      	;
     5a4:	7765      	;
     5a6:	7961      	;
     5a8:	0a0d      	;
     5aa:	0000      	;


SomeGPIOConfiguration???:
     5ac:	b530      	push	{r4, r5, lr}
     5ae:	0003      	movs	r3, r0
     5b0:	f002 fd08 	bl	0x2fc4
     5b4:	0405      	lsls	r5, r0, #16
     5b6:	6d35      	ldr	r5, [r6, #80]	; 0x50
     5b8:	dca5      	bgt.n	0x506
     5ba:	00f4      	lsls	r4, r6, #3
     5bc:	2a00      	cmp	r2, #0
     5be:	d003      	beq.n	0x5c8
     5c0:	2a01      	cmp	r2, #1
     5c2:	d001      	beq.n	0x5c8
     5c4:	2a02      	cmp	r2, #2
     5c6:	d11d      	bne.n	0x604
     5c8:	4b83      	ldr	r3, [pc, #524]	; (0x7d8)
     5ca:	681b      	ldr	r3, [r3, #0]	; P0 IO Mode Control Reg
     5cc:	004d      	lsls	r5, r1, #1
     5ce:	2403      	movs	r4, #3
     5d0:	40ac      	lsls	r4, r5
     5d2:	43a3      	bics	r3, r4
     5d4:	4c80      	ldr	r4, [pc, #512]	; (0x7d8)
     5d6:	6023      	str	r3, [r4, #0]	; P0 IO Mode Control Reg
     5d8:	2a01      	cmp	r2, #1
     5da:	d108      	bne.n	0x5ee
     5dc:	4623      	mov	r3, r4
     5de:	681b      	ldr	r3, [r3, #0]
     5e0:	004d      	lsls	r5, r1, #1
     5e2:	2401      	movs	r4, #1
     5e4:	40ac      	lsls	r4, r5
     5e6:	4323      	orrs	r3, r4
     5e8:	4c7b      	ldr	r4, [pc, #492]	; (0x7d8)
     5ea:	6023      	str	r3, [r4, #0]	; P0 IO Mode Control Reg
     5ec:	e016      	b.n	0x61c
     5ee:	2a02      	cmp	r2, #2
     5f0:	d114      	bne.n	0x61c
     5f2:	4b79      	ldr	r3, [pc, #484]	; (0x7d8)
     5f4:	681b      	ldr	r3, [r3, #0]	; P0 IO Mode Control Reg
     5f6:	004d      	lsls	r5, r1, #1
     5f8:	2402      	movs	r4, #2
     5fa:	40ac      	lsls	r4, r5
     5fc:	4323      	orrs	r3, r4
     5fe:	4c76      	ldr	r4, [pc, #472]	; (0x7d8)
     600:	6023      	str	r3, [r4, #0]	; P0 IO Mode Control Reg
     602:	e00b      	b.n	0x61c
     604:	2a03      	cmp	r2, #3
     606:	d108      	bne.n	0x61a
     608:	4b73      	ldr	r3, [pc, #460]	; (0x7d8)
     60a:	681b      	ldr	r3, [r3, #0]	; P0 IO Mode Control Reg
     60c:	004d      	lsls	r5, r1, #1
     60e:	2403      	movs	r4, #3
     610:	40ac      	lsls	r4, r5
     612:	4323      	orrs	r3, r4
     614:	4c70      	ldr	r4, [pc, #448]	; (0x7d8)
     616:	6023      	str	r3, [r4, #0]	; P0 IO Mode Control Reg
     618:	e000      	b.n	0x61c
     61a:	bd30      	pop	{r4, r5, pc}
     61c:	e0d8      	b.n	0x7d0
     61e:	2a00      	cmp	r2, #0
     620:	d003      	beq.n	0x62a
     622:	2a01      	cmp	r2, #1
     624:	d001      	beq.n	0x62a
     626:	2a02      	cmp	r2, #2
     628:	d122      	bne.n	0x670
     62a:	4b6b      	ldr	r3, [pc, #428]	; (0x7d8)
     62c:	3340      	adds	r3, #64	; 0x40
     62e:	681b      	ldr	r3, [r3, #0]	; P1 IO Mode Control Reg
     630:	004d      	lsls	r5, r1, #1
     632:	2403      	movs	r4, #3
     634:	40ac      	lsls	r4, r5
     636:	43a3      	bics	r3, r4
     638:	4c67      	ldr	r4, [pc, #412]	; (0x7d8)
     63a:	3440      	adds	r4, #64	; 0x40
     63c:	6023      	str	r3, [r4, #0]	; P1 IO Mode Control Reg
     63e:	2a01      	cmp	r2, #1
     640:	d109      	bne.n	0x656
     642:	4623      	mov	r3, r4
     644:	681b      	ldr	r3, [r3, #0]
     646:	004d      	lsls	r5, r1, #1
     648:	2401      	movs	r4, #1
     64a:	40ac      	lsls	r4, r5
     64c:	4323      	orrs	r3, r4
     64e:	4c62      	ldr	r4, [pc, #392]	; (0x7d8)
     650:	3440      	adds	r4, #64	; 0x40
     652:	6023      	str	r3, [r4, #0]	; P1 IO Mode Control Reg
     654:	e01a      	b.n	0x68c
     656:	2a02      	cmp	r2, #2
     658:	d118      	bne.n	0x68c
     65a:	4b5f      	ldr	r3, [pc, #380]	; (0x7d8)
     65c:	3340      	adds	r3, #64	; 0x40
     65e:	681b      	ldr	r3, [r3, #0]	; P1 IO Mode Control Reg
     660:	004d      	lsls	r5, r1, #1
     662:	2402      	movs	r4, #2
     664:	40ac      	lsls	r4, r5
     666:	4323      	orrs	r3, r4
     668:	4c5b      	ldr	r4, [pc, #364]	; (0x7d8)
     66a:	3440      	adds	r4, #64	; 0x40
     66c:	6023      	str	r3, [r4, #0]	; P1 IO Mode Control Reg
     66e:	e00d      	b.n	0x68c
     670:	2a03      	cmp	r2, #3
     672:	d10a      	bne.n	0x68a
     674:	4b58      	ldr	r3, [pc, #352]	; (0x7d8)
     676:	3340      	adds	r3, #64	; 0x40
     678:	681b      	ldr	r3, [r3, #0]	; P1 IO Mode Control Reg
     67a:	004d      	lsls	r5, r1, #1
     67c:	2403      	movs	r4, #3
     67e:	40ac      	lsls	r4, r5
     680:	4323      	orrs	r3, r4
     682:	4c55      	ldr	r4, [pc, #340]	; (0x7d8)
     684:	3440      	adds	r4, #64	; 0x40
     686:	6023      	str	r3, [r4, #0]	; P1 IO Mode Control Reg
     688:	e000      	b.n	0x68c
     68a:	e7c6      	b.n	0x61a
     68c:	e0a0      	b.n	0x7d0
     68e:	2a00      	cmp	r2, #0
     690:	d003      	beq.n	0x69a
     692:	2a01      	cmp	r2, #1
     694:	d001      	beq.n	0x69a
     696:	2a02      	cmp	r2, #2
     698:	d122      	bne.n	0x6e0
     69a:	4b4f      	ldr	r3, [pc, #316]	; (0x7d8)
     69c:	3380      	adds	r3, #128	; 0x80
     69e:	681b      	ldr	r3, [r3, #0]	; P2 IO Mode Control Reg
     6a0:	004d      	lsls	r5, r1, #1
     6a2:	2403      	movs	r4, #3
     6a4:	40ac      	lsls	r4, r5
     6a6:	43a3      	bics	r3, r4
     6a8:	4c4b      	ldr	r4, [pc, #300]	; (0x7d8)
     6aa:	3480      	adds	r4, #128	; 0x80
     6ac:	6023      	str	r3, [r4, #0]	; P2 IO Mode Control Reg
     6ae:	2a01      	cmp	r2, #1
     6b0:	d109      	bne.n	0x6c6
     6b2:	4623      	mov	r3, r4
     6b4:	681b      	ldr	r3, [r3, #0]
     6b6:	004d      	lsls	r5, r1, #1
     6b8:	2401      	movs	r4, #1
     6ba:	40ac      	lsls	r4, r5
     6bc:	4323      	orrs	r3, r4
     6be:	4c46      	ldr	r4, [pc, #280]	; (0x7d8)
     6c0:	3480      	adds	r4, #128	; 0x80
     6c2:	6023      	str	r3, [r4, #0]	; P2 IO Mode Control Reg
     6c4:	e01a      	b.n	0x6fc
     6c6:	2a02      	cmp	r2, #2
     6c8:	d118      	bne.n	0x6fc
     6ca:	4b43      	ldr	r3, [pc, #268]	; (0x7d8)
     6cc:	3380      	adds	r3, #128	; 0x80
     6ce:	681b      	ldr	r3, [r3, #0]	; P2 IO Mode Control Reg
     6d0:	004d      	lsls	r5, r1, #1
     6d2:	2402      	movs	r4, #2
     6d4:	40ac      	lsls	r4, r5
     6d6:	4323      	orrs	r3, r4
     6d8:	4c3f      	ldr	r4, [pc, #252]	; (0x7d8)
     6da:	3480      	adds	r4, #128	; 0x80
     6dc:	6023      	str	r3, [r4, #0]	; P2 IO Mode Control Reg
     6de:	e00d      	b.n	0x6fc
     6e0:	2a03      	cmp	r2, #3
     6e2:	d10a      	bne.n	0x6fa
     6e4:	4b3c      	ldr	r3, [pc, #240]	; (0x7d8)
     6e6:	3380      	adds	r3, #128	; 0x80
     6e8:	681b      	ldr	r3, [r3, #0]	; P2 IO Mode Control Reg
     6ea:	004d      	lsls	r5, r1, #1
     6ec:	2403      	movs	r4, #3
     6ee:	40ac      	lsls	r4, r5
     6f0:	4323      	orrs	r3, r4
     6f2:	4c39      	ldr	r4, [pc, #228]	; (0x7d8)
     6f4:	3480      	adds	r4, #128	; 0x80
     6f6:	6023      	str	r3, [r4, #0]	; P2 IO Mode Control Reg
     6f8:	e000      	b.n	0x6fc
     6fa:	e78e      	b.n	0x61a
     6fc:	e068      	b.n	0x7d0
     6fe:	2a00      	cmp	r2, #0
     700:	d003      	beq.n	0x70a
     702:	2a01      	cmp	r2, #1
     704:	d001      	beq.n	0x70a
     706:	2a02      	cmp	r2, #2
     708:	d121      	bne.n	0x74e
     70a:	4b33      	ldr	r3, [pc, #204]	; (0x7d8)
     70c:	33c0      	adds	r3, #192	; 0xc0
     70e:	681c      	ldr	r4, [r3, #0]	; P3 IO Mode Control Reg
     710:	004d      	lsls	r5, r1, #1
     712:	2303      	movs	r3, #3
     714:	40ab      	lsls	r3, r5
     716:	439c      	bics	r4, r3
     718:	4b2f      	ldr	r3, [pc, #188]	; (0x7d8)
     71a:	33c0      	adds	r3, #192	; 0xc0
     71c:	601c      	str	r4, [r3, #0]	; P3 IO Mode Control Reg
     71e:	2a01      	cmp	r2, #1
     720:	d108      	bne.n	0x734
     722:	681b      	ldr	r3, [r3, #0]
     724:	004d      	lsls	r5, r1, #1
     726:	2401      	movs	r4, #1
     728:	40ac      	lsls	r4, r5
     72a:	4323      	orrs	r3, r4
     72c:	4c2a      	ldr	r4, [pc, #168]	; (0x7d8)
     72e:	34c0      	adds	r4, #192	; 0xc0
     730:	6023      	str	r3, [r4, #0]	; P3 IO Mode Control Reg
     732:	e01a      	b.n	0x76a
     734:	2a02      	cmp	r2, #2
     736:	d118      	bne.n	0x76a
     738:	4b27      	ldr	r3, [pc, #156]	; (0x7d8)
     73a:	33c0      	adds	r3, #192	; 0xc0
     73c:	681b      	ldr	r3, [r3, #0]	; P3 IO Mode Control Reg
     73e:	004d      	lsls	r5, r1, #1
     740:	2402      	movs	r4, #2
     742:	40ac      	lsls	r4, r5
     744:	4323      	orrs	r3, r4
     746:	4c24      	ldr	r4, [pc, #144]	; (0x7d8)
     748:	34c0      	adds	r4, #192	; 0xc0
     74a:	6023      	str	r3, [r4, #0]	; P3 IO Mode Control Reg
     74c:	e00d      	b.n	0x76a
     74e:	2a03      	cmp	r2, #3
     750:	d10a      	bne.n	0x768
     752:	4b21      	ldr	r3, [pc, #132]	; (0x7d8)
     754:	33c0      	adds	r3, #192	; 0xc0
     756:	681b      	ldr	r3, [r3, #0]	; P3 IO Mode Control Reg
     758:	004d      	lsls	r5, r1, #1
     75a:	2403      	movs	r4, #3
     75c:	40ac      	lsls	r4, r5
     75e:	4323      	orrs	r3, r4
     760:	4c1d      	ldr	r4, [pc, #116]	; (0x7d8)
     762:	34c0      	adds	r4, #192	; 0xc0
     764:	6023      	str	r3, [r4, #0]	; P3 IO Mode Control Reg
     766:	e000      	b.n	0x76a
     768:	e757      	b.n	0x61a
     76a:	e031      	b.n	0x7d0
     76c:	2a00      	cmp	r2, #0
     76e:	d003      	beq.n	0x778
     770:	2a01      	cmp	r2, #1
     772:	d001      	beq.n	0x778
     774:	2a02      	cmp	r2, #2
     776:	d11d      	bne.n	0x7b4
     778:	4b18      	ldr	r3, [pc, #96]	; (0x7dc)
     77a:	681c      	ldr	r4, [r3, #0]	; P4 IO Mode Control Reg
     77c:	004d      	lsls	r5, r1, #1
     77e:	2303      	movs	r3, #3
     780:	40ab      	lsls	r3, r5
     782:	439c      	bics	r4, r3
     784:	4b15      	ldr	r3, [pc, #84]	; (0x7dc)
     786:	601c      	str	r4, [r3, #0]	; P4 IO Mode Control Reg
     788:	2a01      	cmp	r2, #1
     78a:	d108      	bne.n	0x79e
     78c:	681b      	ldr	r3, [r3, #0]
     78e:	004d      	lsls	r5, r1, #1
     790:	2401      	movs	r4, #1
     792:	40ac      	lsls	r4, r5
     794:	4323      	orrs	r3, r4
     796:	4c11      	ldr	r4, [pc, #68]	; (0x7dc)
     798:	6023      	str	r3, [r4, #0]	; P4 IO Mode Control Reg
     79a:	e017      	b.n	0x7cc
     79c:	e017      	b.n	0x7ce
     79e:	2a02      	cmp	r2, #2
     7a0:	d114      	bne.n	0x7cc
     7a2:	4b0e      	ldr	r3, [pc, #56]	; (0x7dc)
     7a4:	681b      	ldr	r3, [r3, #0]	; P4 IO Mode Control Reg
     7a6:	004d      	lsls	r5, r1, #1
     7a8:	2402      	movs	r4, #2
     7aa:	40ac      	lsls	r4, r5
     7ac:	4323      	orrs	r3, r4
     7ae:	4c0b      	ldr	r4, [pc, #44]	; (0x7dc)
     7b0:	6023      	str	r3, [r4, #0]	; P4 IO Mode Control Reg
     7b2:	e00b      	b.n	0x7cc
     7b4:	2a03      	cmp	r2, #3
     7b6:	d108      	bne.n	0x7ca
     7b8:	4b08      	ldr	r3, [pc, #32]	; (0x7dc)
     7ba:	681b      	ldr	r3, [r3, #0]	; P4 IO Mode Control Reg
     7bc:	004d      	lsls	r5, r1, #1
     7be:	2403      	movs	r4, #3
     7c0:	40ac      	lsls	r4, r5
     7c2:	4323      	orrs	r3, r4
     7c4:	4c05      	ldr	r4, [pc, #20]	; (0x7dc)
     7c6:	6023      	str	r3, [r4, #0]	; P4 IO Mode Control Reg
     7c8:	e000      	b.n	0x7cc
     7ca:	e726      	b.n	0x61a
     7cc:	e000      	b.n	0x7d0
     7ce:	bf00      	nop
     7d0:	bf00      	nop
     7d2:	bf00      	nop
     7d4:	e721      	b.n	0x61a
     7d6:	0000      	movs	r0, r0

     7d8:	50004000      	;	GPIO registers for PORT0
     7dc:	50004100      	;	GPIO registers for PORT4

EINT0_WiznetHandler:
     7e0:	b510      	push	{r4, lr}
     7e2:	2004      	movs	r0, #4
     7e4:	4906      	ldr	r1, [pc, #24]	; (0x800)
     7e6:	6208      	str	r0, [r1, #32]			; clear pending interrupt flag for P3.2 by writing #4 to interrupt source flag for GPIO P3
     7e8:	4906      	ldr	r1, [pc, #24]	; (0x804)
     7ea:	6008      	str	r0, [r1, #0]			; disable interrupt IRQ#2 (EINT0, Wiznet IRQ)
     7ec:	f002 f9da 	bl	0x2ba4				; WiznetHandleIncoming
     7f0:	a005      	add	r0, pc, #20	; (adr r0, 0x808)
     7f2:	f7ff fcef 	bl	0x1d4				; UART0_printf
     7f6:	2004      	movs	r0, #4
     7f8:	4902      	ldr	r1, [pc, #8]	; (0x804)
     7fa:	3980      	subs	r1, #128			; re-enable interrupt IRQ#2 (EINT0, Wiznet IRQ)
     7fc:	6008      	str	r0, [r1, #0]
     7fe:	bd10      	pop	{r4, pc}

     800:	500040c0      	;	GPIO registers for PORT3
     804:	e000e180      	;	NVIC / external interrupt control registers

     808:	4e45      	;	String 'ENT0\r\n\0\0'
     80a:	3054      	;
     80c:	0a0d      	;
     80e:	0000      	;

EINT1Handler:
     810:	b510      	push	{r4, lr}
     812:	2008      	movs	r0, #8
     814:	4903      	ldr	r1, [pc, #12]	; (0x824)
     816:	6208      	str	r0, [r1, #32]
     818:	4903      	ldr	r1, [pc, #12]	; (0x828)
     81a:	6008      	str	r0, [r1, #0]
     81c:	a003      	add	r0, pc, #12	; (adr r0, 0x82c)
     81e:	f7ff fcd9 	bl	0x1d4				; UART0_printf
     822:	bd10      	pop	{r4, pc}

     824:	500040c0      	;	GPIO registers for PORT3
     828:	e000e180      	;	NVIC / external interrupt control registers

     82c:	690a      	;	String '\ninput eint1\0\0\0\0'
     82e:	706e      	;
     830:	7475      	;
     832:	6520      	;
     834:	6e69      	;
     836:	3174      	;
     838:	0000      	;
     83a:	0000      	;

     83c:	b510      	push	{r4, lr}
     83e:	2201      	movs	r2, #1
     840:	2106      	movs	r1, #6
     842:	2003      	movs	r0, #3
     844:	f7ff feb2 	bl	0x5ac
     848:	2201      	movs	r2, #1
     84a:	2103      	movs	r1, #3
     84c:	2004      	movs	r0, #4
     84e:	f7ff fead 	bl	0x5ac
     852:	2201      	movs	r2, #1
     854:	4611      	mov	r1, r2
     856:	2004      	movs	r0, #4
     858:	f7ff fea8 	bl	0x5ac
     85c:	2201      	movs	r2, #1
     85e:	2104      	movs	r1, #4
     860:	4610      	mov	r0, r2
     862:	f7ff fea3 	bl	0x5ac
     866:	2201      	movs	r2, #1
     868:	2105      	movs	r1, #5
     86a:	4610      	mov	r0, r2
     86c:	f7ff fe9e 	bl	0x5ac
     870:	2200      	movs	r2, #0
     872:	2106      	movs	r1, #6
     874:	2001      	movs	r0, #1
     876:	f7ff fe99 	bl	0x5ac
     87a:	2201      	movs	r2, #1
     87c:	2107      	movs	r1, #7
     87e:	4610      	mov	r0, r2
     880:	f7ff fe94 	bl	0x5ac
     884:	2201      	movs	r2, #1
     886:	2100      	movs	r1, #0
     888:	4608      	mov	r0, r1
     88a:	f7ff fe8f 	bl	0x5ac
     88e:	2201      	movs	r2, #1
     890:	2102      	movs	r1, #2
     892:	2000      	movs	r0, #0
     894:	f7ff fe8a 	bl	0x5ac
     898:	2201      	movs	r2, #1
     89a:	2104      	movs	r1, #4
     89c:	2000      	movs	r0, #0
     89e:	f7ff fe85 	bl	0x5ac
     8a2:	2201      	movs	r2, #1
     8a4:	2106      	movs	r1, #6
     8a6:	2000      	movs	r0, #0
     8a8:	f7ff fe80 	bl	0x5ac
     8ac:	2201      	movs	r2, #1
     8ae:	2105      	movs	r1, #5
     8b0:	2004      	movs	r0, #4
     8b2:	f7ff fe7b 	bl	0x5ac
     8b6:	2201      	movs	r2, #1
     8b8:	2107      	movs	r1, #7
     8ba:	2002      	movs	r0, #2
     8bc:	f7ff fe76 	bl	0x5ac
     8c0:	2201      	movs	r2, #1
     8c2:	4611      	mov	r1, r2
     8c4:	2000      	movs	r0, #0
     8c6:	f7ff fe71 	bl	0x5ac
     8ca:	2201      	movs	r2, #1
     8cc:	2103      	movs	r1, #3
     8ce:	2000      	movs	r0, #0
     8d0:	f7ff fe6c 	bl	0x5ac
     8d4:	2201      	movs	r2, #1
     8d6:	2105      	movs	r1, #5
     8d8:	2000      	movs	r0, #0
     8da:	f7ff fe67 	bl	0x5ac
     8de:	2201      	movs	r2, #1
     8e0:	2107      	movs	r1, #7
     8e2:	2000      	movs	r0, #0
     8e4:	f7ff fe62 	bl	0x5ac
     8e8:	2201      	movs	r2, #1
     8ea:	2104      	movs	r1, #4
     8ec:	4608      	mov	r0, r1
     8ee:	f7ff fe5d 	bl	0x5ac
     8f2:	2201      	movs	r2, #1
     8f4:	2106      	movs	r1, #6
     8f6:	2002      	movs	r0, #2
     8f8:	f7ff fe58 	bl	0x5ac
     8fc:	2201      	movs	r2, #1
     8fe:	2100      	movs	r1, #0
     900:	4610      	mov	r0, r2
     902:	f7ff fe53 	bl	0x5ac
     906:	2201      	movs	r2, #1
     908:	2102      	movs	r1, #2
     90a:	2004      	movs	r0, #4
     90c:	f7ff fe4e 	bl	0x5ac
     910:	2201      	movs	r2, #1
     912:	2102      	movs	r1, #2
     914:	4610      	mov	r0, r2
     916:	f7ff fe49 	bl	0x5ac
     91a:	2201      	movs	r2, #1
     91c:	2100      	movs	r1, #0
     91e:	2003      	movs	r0, #3
     920:	f7ff fe44 	bl	0x5ac
     924:	2201      	movs	r2, #1
     926:	2103      	movs	r1, #3
     928:	4610      	mov	r0, r2
     92a:	f7ff fe3f 	bl	0x5ac
     92e:	2201      	movs	r2, #1
     930:	4611      	mov	r1, r2
     932:	2003      	movs	r0, #3
     934:	f7ff fe3a 	bl	0x5ac
     938:	2000      	movs	r0, #0
     93a:	4909      	ldr	r1, [pc, #36]	; (0x960)
     93c:	6108      	str	r0, [r1, #16]
     93e:	2001      	movs	r0, #1
     940:	4907      	ldr	r1, [pc, #28]	; (0x960)
     942:	3940      	subs	r1, #64	; 0x40
     944:	6388      	str	r0, [r1, #56]	; 0x38
     946:	4906      	ldr	r1, [pc, #24]	; (0x960)
     948:	60c8      	str	r0, [r1, #12]
     94a:	4905      	ldr	r1, [pc, #20]	; (0x960)
     94c:	3980      	subs	r1, #128	; 0x80
     94e:	6308      	str	r0, [r1, #48]	; 0x30
     950:	4903      	ldr	r1, [pc, #12]	; (0x960)
     952:	3940      	subs	r1, #64	; 0x40
     954:	6388      	str	r0, [r1, #56]	; 0x38
     956:	63c8      	str	r0, [r1, #60]	; 0x3c
     958:	4901      	ldr	r1, [pc, #4]	; (0x960)
     95a:	6108      	str	r0, [r1, #16]
     95c:	6048      	str	r0, [r1, #4]
     95e:	bd10      	pop	{r4, pc}

     960:	50004280      	;	GPIO registers for PORT4

     964:	b510      	push	{r4, lr}
     966:	f002 f89b 	bl	0x2aa0
     96a:	4804      	ldr	r0, [pc, #16]	; (0x97c)
     96c:	6800      	ldr	r0, [r0, #0]
     96e:	2101      	movs	r1, #1
     970:	4308      	orrs	r0, r1
     972:	4902      	ldr	r1, [pc, #8]	; (0x97c)
     974:	6008      	str	r0, [r1, #0]
     976:	f000 f9c7 	bl	0xd08
     97a:	bd10      	pop	{r4, pc}

     97c:	40004000      	;	WDT timer control register

     980:	b086      	sub	sp, #24
     982:	4605      	mov	r5, r0
     984:	2000      	movs	r0, #0
     986:	4922      	ldr	r1, [pc, #136]	; (0xa10)
     988:	60c8      	str	r0, [r1, #12]
     98a:	2300      	movs	r3, #0
     98c:	462a      	mov	r2, r5
     98e:	4921      	ldr	r1, [pc, #132]	; (0xa14)
     990:	2001      	movs	r0, #1
     992:	f002 fa31 	bl	0x2df8
     996:	2001      	movs	r0, #1
     998:	491d      	ldr	r1, [pc, #116]	; (0xa10)
     99a:	60c8      	str	r0, [r1, #12]
     99c:	20ff      	movs	r0, #255	; 0xff
     99e:	302d      	adds	r0, #45	; 0x2d
     9a0:	f7ff fd9a 	bl	0x4d8				; Delay(#45)
     9a4:	2300      	movs	r3, #0
     9a6:	462a      	mov	r2, r5
     9a8:	a901      	add	r1, sp, #4
     9aa:	2001      	movs	r0, #1
     9ac:	f000 ffe0 	bl	0x1970
     9b0:	2400      	movs	r4, #0
     9b2:	e012      	b.n	0x9da
     9b4:	0060      	lsls	r0, r4, #1
     9b6:	4917      	ldr	r1, [pc, #92]	; (0xa14)
     9b8:	5a08      	ldrh	r0, [r1, r0]
     9ba:	0061      	lsls	r1, r4, #1
     9bc:	aa01      	add	r2, sp, #4
     9be:	5a51      	ldrh	r1, [r2, r1]
     9c0:	4288      	cmp	r0, r1
     9c2:	d008      	beq.n	0x9d6
     9c4:	20fb      	movs	r0, #251	; 0xfb
     9c6:	f001 fb2b 	bl	0x2020				; UART1PutChar(0xfb)
     9ca:	2000      	movs	r0, #0
     9cc:	f001 fb28 	bl	0x2020				; UART1PutChar(0x00)
     9d0:	205b      	movs	r0, #91	; 0x5b
     9d2:	f001 fb25 	bl	0x2020				; UART1PutChar(0x5b)
     9d6:	1c60      	adds	r0, r4, #1
     9d8:	b2c4      	uxtb	r4, r0
     9da:	42ac      	cmp	r4, r5
     9dc:	dbea      	blt.n	0x9b4
     9de:	20fb      	movs	r0, #251	; 0xfb
     9e0:	f001 fb1e 	bl	0x2020				; UART1PutChar(0xfb)
     9e4:	20ff      	movs	r0, #255	; 0xff
     9e6:	f001 fb1b 	bl	0x2020				; UART1PutChar(0xff)
     9ea:	205b      	movs	r0, #91	; 0x5b
     9ec:	f001 fb18 	bl	0x2020				; UART1PutChar(0x5b)
     9f0:	e00d      	b.n	0xa0e
     9f2:	2001      	movs	r0, #1
     9f4:	4906      	ldr	r1, [pc, #24]	; (0xa10)
     9f6:	3940      	subs	r1, #64	; 0x40
     9f8:	6388      	str	r0, [r1, #56]	; 0x38
     9fa:	2064      	movs	r0, #100	; 0x64
     9fc:	f7ff fd6c 	bl	0x4d8				; Delay(#100)
     a00:	2000      	movs	r0, #0
     a02:	4903      	ldr	r1, [pc, #12]	; (0xa10)
     a04:	3940      	subs	r1, #64	; 0x40
     a06:	6388      	str	r0, [r1, #56]	; 0x38
     a08:	2064      	movs	r0, #100	; 0x64
     a0a:	f7ff fd65 	bl	0x4d8				; Delay(#100)
     a0e:	e7f0      	b.n	0x9f2
     a10:	4280      	cmp	r0, r0
     a12:	5000      	str	r0, [r0, r0]
     a14:	0110      	lsls	r0, r2, #4
     a16:	2000      	movs	r0, #0


ConfigureSystemClocks?
     a18:	b510      	push	{r4, lr}
     a1a:	4818      	ldr	r0, [pc, #96]	; (0xa7c)
     a1c:	6940      	ldr	r0, [r0, #20]
     a1e:	2103      	movs	r1, #3
     a20:	0609      	lsls	r1, r1, #24
     a22:	4388      	bics	r0, r1
     a24:	4915      	ldr	r1, [pc, #84]	; (0xa7c)
     a26:	6148      	str	r0, [r1, #20]
     a28:	f002 f83a 	bl	0x2aa0
     a2c:	4813      	ldr	r0, [pc, #76]	; (0xa7c)
     a2e:	6800      	ldr	r0, [r0, #0]
     a30:	2101      	movs	r1, #1
     a32:	4308      	orrs	r0, r1
     a34:	4911      	ldr	r1, [pc, #68]	; (0xa7c)
     a36:	6008      	str	r0, [r1, #0]
     a38:	bf00      	nop
     a3a:	4810      	ldr	r0, [pc, #64]	; (0xa7c)
     a3c:	68c0      	ldr	r0, [r0, #12]
     a3e:	07c0      	lsls	r0, r0, #31
     a40:	0fc0      	lsrs	r0, r0, #31
     a42:	d0fa      	beq.n	0xa3a
     a44:	480d      	ldr	r0, [pc, #52]	; (0xa7c)
     a46:	6900      	ldr	r0, [r0, #16]
     a48:	08c0      	lsrs	r0, r0, #3
     a4a:	00c0      	lsls	r0, r0, #3
     a4c:	490b      	ldr	r1, [pc, #44]	; (0xa7c)
     a4e:	6108      	str	r0, [r1, #16]
     a50:	f7ff fef4 	bl	0x83c
     a54:	f001 ff02 	bl	0x285c
     a58:	f000 f812 	bl	0xa80
     a5c:	f7ff fd34 	bl	0x4c8
     a60:	f001 f918 	bl	0x1c94
     a64:	f002 fac4 	bl	0x2ff0
     a68:	2001      	movs	r0, #1
     a6a:	f001 fe07 	bl	0x267c
     a6e:	2002      	movs	r0, #2
     a70:	f001 fe04 	bl	0x267c
     a74:	f002 f994 	bl	0x2da0
     a78:	bd10      	pop	{r4, pc}
     a7a:	0000      	movs	r0, r0
     a7c:	0200      	lsls	r0, r0, #8
     a7e:	5000      	str	r0, [r0, r0]
     a80:	481a      	ldr	r0, [pc, #104]	; (0xaec)
     a82:	6800      	ldr	r0, [r0, #0]
     a84:	210f      	movs	r1, #15
     a86:	0209      	lsls	r1, r1, #8
     a88:	4388      	bics	r0, r1
     a8a:	2105      	movs	r1, #5
     a8c:	0249      	lsls	r1, r1, #9
     a8e:	1840      	adds	r0, r0, r1
     a90:	4916      	ldr	r1, [pc, #88]	; (0xaec)
     a92:	6008      	str	r0, [r1, #0]
     a94:	2005      	movs	r0, #5
     a96:	0700      	lsls	r0, r0, #28
     a98:	6bc0      	ldr	r0, [r0, #60]	; 0x3c
     a9a:	4915      	ldr	r1, [pc, #84]	; (0xaf0)
     a9c:	4008      	ands	r0, r1
     a9e:	2103      	movs	r1, #3
     aa0:	0309      	lsls	r1, r1, #12
     aa2:	1840      	adds	r0, r0, r1
     aa4:	2105      	movs	r1, #5
     aa6:	0709      	lsls	r1, r1, #28
     aa8:	63c8      	str	r0, [r1, #60]	; 0x3c
     aaa:	4608      	mov	r0, r1
     aac:	68c0      	ldr	r0, [r0, #12]
     aae:	21ff      	movs	r1, #255	; 0xff
     ab0:	3101      	adds	r1, #1
     ab2:	4308      	orrs	r0, r1
     ab4:	2105      	movs	r1, #5
     ab6:	0709      	lsls	r1, r1, #28
     ab8:	60c8      	str	r0, [r1, #12]
     aba:	4608      	mov	r0, r1
     abc:	68c0      	ldr	r0, [r0, #12]
     abe:	21ff      	movs	r1, #255	; 0xff
     ac0:	3101      	adds	r1, #1
     ac2:	4388      	bics	r0, r1
     ac4:	2105      	movs	r1, #5
     ac6:	0709      	lsls	r1, r1, #28
     ac8:	60c8      	str	r0, [r1, #12]
     aca:	480a      	ldr	r0, [pc, #40]	; (0xaf4)
     acc:	6880      	ldr	r0, [r0, #8]
     ace:	21ff      	movs	r1, #255	; 0xff
     ad0:	3101      	adds	r1, #1
     ad2:	4308      	orrs	r0, r1
     ad4:	4907      	ldr	r1, [pc, #28]	; (0xaf4)
     ad6:	6088      	str	r0, [r1, #8]
     ad8:	200f      	movs	r0, #15
     ada:	4907      	ldr	r1, [pc, #28]	; (0xaf8)	; I2C CLK divider register := 0
     adc:	6108      	str	r0, [r1, #16]			; => I2C clock := PCLK/4
     ade:	4608      	mov	r0, r1
     ae0:	6800      	ldr	r0, [r0, #0]
     ae2:	2140      	movs	r1, #64	; 0x40
     ae4:	4308      	orrs	r0, r1
     ae6:	4904      	ldr	r1, [pc, #16]	; (0xaf8)	; set ENS1 flag in I2C Control register
     ae8:	6008      	str	r0, [r1, #0]			; => enable I2C controller
     aea:	4770      	bx	lr

     aec:	500040c0      	;	GPIO registers for PORT3
     af0:	ffffcfcf      	;
     af4:	50000200 	;	Clock Control registers
     af8:	40020000      	;	I2C 0 registers

InitIPStack???
     afc:	b570      	push	{r4, r5, r6, lr}
     afe:	4604      	mov	r4, r0
     b00:	4625      	mov	r5, r4				; r5 := parameter1
     b02:	7829      	ldrb	r1, [r5, #0]
     b04:	a042      	add	r0, pc, #264	; (adr r0, 0xc10)
     b06:	f7ff fb65 	bl	0x1d4				; UART0_printf
     b0a:	2300      	movs	r3, #0
     b0c:	2208      	movs	r2, #8
     b0e:	4945      	ldr	r1, [pc, #276]	; (0xc24)
     b10:	4618      	mov	r0, r3
     b12:	f000 ff2d 	bl	0x1970
     b16:	20fd      	movs	r0, #253	; 0xfd
     b18:	f001 fa82 	bl	0x2020				; UART1PutChar(0xfd)
     b1c:	4941      	ldr	r1, [pc, #260]	; (0xc24)
     b1e:	7808      	ldrb	r0, [r1, #0]
     b20:	f001 fa7e 	bl	0x2020				; UART1PutChar(MessageBuffer[0])
     b24:	493f      	ldr	r1, [pc, #252]	; (0xc24)
     b26:	7888      	ldrb	r0, [r1, #2]
     b28:	f001 fa7a 	bl	0x2020				; UART1PutChar(MessageBuffer[2])
     b2c:	493d      	ldr	r1, [pc, #244]	; (0xc24)
     b2e:	7908      	ldrb	r0, [r1, #4]
     b30:	f001 fa76 	bl	0x2020				; UART1PutChar(MessageBuffer[4])
     b34:	493b      	ldr	r1, [pc, #236]	; (0xc24)
     b36:	7988      	ldrb	r0, [r1, #6]
     b38:	f001 fa72 	bl	0x2020				; UART1PutChar(MessageBuffer[6])
     b3c:	4939      	ldr	r1, [pc, #228]	; (0xc24)
     b3e:	7a08      	ldrb	r0, [r1, #8]
     b40:	f001 fa6e 	bl	0x2020				; UART1PutChar(MessageBuffer[8])
     b44:	4937      	ldr	r1, [pc, #220]	; (0xc24)
     b46:	7a88      	ldrb	r0, [r1, #10]
     b48:	f001 fa6a 	bl	0x2020				; UART1PutChar(MessageBuffer[10])
     b4c:	4935      	ldr	r1, [pc, #212]	; (0xc24)
     b4e:	7b08      	ldrb	r0, [r1, #12]
     b50:	f001 fa66 	bl	0x2020				; UART1PutChar(MessageBuffer[12])
     b54:	205d      	movs	r0, #93	; 0x5d
     b56:	f001 fa63 	bl	0x2020				; UART1PutChar(0x5d)
     b5a:	20c0      	movs	r0, #192	; 0xc0
     b5c:	4932      	ldr	r1, [pc, #200]	; (0xc28)
     b5e:	7008      	strb	r0, [r1, #0]
     b60:	20a8      	movs	r0, #168	; 0xa8
     b62:	7048      	strb	r0, [r1, #1]
     b64:	482f      	ldr	r0, [pc, #188]	; (0xc24)
     b66:	7980      	ldrb	r0, [r0, #6]
     b68:	7088      	strb	r0, [r1, #2]
     b6a:	2001      	movs	r0, #1
     b6c:	70c8      	strb	r0, [r1, #3]
     b6e:	20ff      	movs	r0, #255	; 0xff
     b70:	492e      	ldr	r1, [pc, #184]	; (0xc2c)
     b72:	7008      	strb	r0, [r1, #0]
     b74:	7048      	strb	r0, [r1, #1]
     b76:	7088      	strb	r0, [r1, #2]
     b78:	2000      	movs	r0, #0
     b7a:	70c8      	strb	r0, [r1, #3]
     b7c:	200c      	movs	r0, #12
     b7e:	492c      	ldr	r1, [pc, #176]	; (0xc30)
     b80:	7008      	strb	r0, [r1, #0]
     b82:	2029      	movs	r0, #41	; 0x29
     b84:	7048      	strb	r0, [r1, #1]
     b86:	20ab      	movs	r0, #171	; 0xab
     b88:	7088      	strb	r0, [r1, #2]
     b8a:	207c      	movs	r0, #124	; 0x7c
     b8c:	70c8      	strb	r0, [r1, #3]
     b8e:	2000      	movs	r0, #0
     b90:	7108      	strb	r0, [r1, #4]
     b92:	2001      	movs	r0, #1
     b94:	7148      	strb	r0, [r1, #5]
     b96:	4823      	ldr	r0, [pc, #140]	; (0xc24)
     b98:	7880      	ldrb	r0, [r0, #2]
     b9a:	4926      	ldr	r1, [pc, #152]	; (0xc34)
     b9c:	7008      	strb	r0, [r1, #0]
     b9e:	4821      	ldr	r0, [pc, #132]	; (0xc24)
     ba0:	7900      	ldrb	r0, [r0, #4]
     ba2:	7048      	strb	r0, [r1, #1]
     ba4:	481f      	ldr	r0, [pc, #124]	; (0xc24)
     ba6:	7980      	ldrb	r0, [r0, #6]
     ba8:	7088      	strb	r0, [r1, #2]
     baa:	481e      	ldr	r0, [pc, #120]	; (0xc24)
     bac:	7a00      	ldrb	r0, [r0, #8]
     bae:	70c8      	strb	r0, [r1, #3]
     bb0:	481c      	ldr	r0, [pc, #112]	; (0xc24)
     bb2:	7a80      	ldrb	r0, [r0, #10]
     bb4:	4920      	ldr	r1, [pc, #128]	; (0xc38)
     bb6:	7008      	strb	r0, [r1, #0]
     bb8:	481a      	ldr	r0, [pc, #104]	; (0xc24)
     bba:	7b00      	ldrb	r0, [r0, #12]
     bbc:	7048      	strb	r0, [r1, #1]
     bbe:	20c0      	movs	r0, #192	; 0xc0
     bc0:	491e      	ldr	r1, [pc, #120]	; (0xc3c)
     bc2:	7008      	strb	r0, [r1, #0]
     bc4:	20a8      	movs	r0, #168	; 0xa8
     bc6:	7048      	strb	r0, [r1, #1]
     bc8:	2001      	movs	r0, #1
     bca:	7088      	strb	r0, [r1, #2]
     bcc:	20cd      	movs	r0, #205	; 0xcd
     bce:	70c8      	strb	r0, [r1, #3]
     bd0:	2017      	movs	r0, #23
     bd2:	491b      	ldr	r1, [pc, #108]	; (0xc40)
     bd4:	7008      	strb	r0, [r1, #0]
     bd6:	2070      	movs	r0, #112	; 0x70
     bd8:	7048      	strb	r0, [r1, #1]
     bda:	2000      	movs	r0, #0
     bdc:	4919      	ldr	r1, [pc, #100]	; (0xc44)
     bde:	7008      	strb	r0, [r1, #0]
     be0:	4919      	ldr	r1, [pc, #100]	; (0xc48)
     be2:	6048      	str	r0, [r1, #4]
     be4:	2064      	movs	r0, #100	; 0x64
     be6:	f7ff fc77 	bl	0x4d8				; Delay(#100)
     bea:	2001      	movs	r0, #1
     bec:	4916      	ldr	r1, [pc, #88]	; (0xc48)
     bee:	6048      	str	r0, [r1, #4]
     bf0:	2064      	movs	r0, #100	; 0x64
     bf2:	f7ff fc71 	bl	0x4d8				; Delay(#100)
     bf6:	f001 ffcb 	bl	0x2b90				; WiznetInit
     bfa:	f001 f8bd 	bl	0x1d78
     bfe:	4813      	ldr	r0, [pc, #76]	; (0xc4c)
     c00:	6800      	ldr	r0, [r0, #0]
     c02:	2101      	movs	r1, #1
     c04:	0349      	lsls	r1, r1, #13
     c06:	4388      	bics	r0, r1
     c08:	1840      	adds	r0, r0, r1
     c0a:	4910      	ldr	r1, [pc, #64]	; (0xc4c)
     c0c:	6008      	str	r0, [r1, #0]
     c0e:	bd70      	pop	{r4, r5, r6, pc}

     c10:	6946      	;	String 'First data=0x%x\r\n\0\0\0'
     c12:	7372      	;
     c14:	2074      	;
     c16:	6164      	;
     c18:	6174      	;
     c1a:	303d      	;
     c1c:	2578      	;
     c1e:	0d78      	;
     c20:	000a      	;
     c22:	0000      	;

     c24:	20000110      	;	MessageBuffer
     c28:	20000052      	;	u8 Gateway[4]
     c2c:	20000056      	;	u8 Subnet[4]
     c30:	2000005a      	;	u8 MAC[6]
     c34:	20000060      	;	u8 SrcIPAddr[4]
     c38:	20000064      	;	u8 TCPSrcPort[2]
     c3c:	20000066      	;	u8 DstIPAddr[4]
     c40:	2000006a      	;	u8 TCPDstPort[2]
     c44:	20000088      	;
     c48:	50004280      	;	GPIO registers for PORT4
     c4c:	20000008      	;

???
     c50:	b510      	push	{r4, lr}
     c52:	20c0      	movs	r0, #192	; 0xc0
     c54:	4923      	ldr	r1, [pc, #140]	; (0xce4)
     c56:	7008      	strb	r0, [r1, #0]
     c58:	20a8      	movs	r0, #168	; 0xa8
     c5a:	7048      	strb	r0, [r1, #1]
     c5c:	2001      	movs	r0, #1
     c5e:	7088      	strb	r0, [r1, #2]
     c60:	70c8      	strb	r0, [r1, #3]
     c62:	20ff      	movs	r0, #255	; 0xff
     c64:	4920      	ldr	r1, [pc, #128]	; (0xce8)
     c66:	7008      	strb	r0, [r1, #0]
     c68:	7048      	strb	r0, [r1, #1]
     c6a:	7088      	strb	r0, [r1, #2]
     c6c:	2000      	movs	r0, #0
     c6e:	70c8      	strb	r0, [r1, #3]
     c70:	200c      	movs	r0, #12
     c72:	491e      	ldr	r1, [pc, #120]	; (0xcec)
     c74:	7008      	strb	r0, [r1, #0]
     c76:	2029      	movs	r0, #41	; 0x29
     c78:	7048      	strb	r0, [r1, #1]
     c7a:	20ab      	movs	r0, #171	; 0xab
     c7c:	7088      	strb	r0, [r1, #2]
     c7e:	207c      	movs	r0, #124	; 0x7c
     c80:	70c8      	strb	r0, [r1, #3]
     c82:	2000      	movs	r0, #0
     c84:	7108      	strb	r0, [r1, #4]
     c86:	2001      	movs	r0, #1
     c88:	7148      	strb	r0, [r1, #5]
     c8a:	20c0      	movs	r0, #192	; 0xc0
     c8c:	4918      	ldr	r1, [pc, #96]	; (0xcf0)
     c8e:	7008      	strb	r0, [r1, #0]
     c90:	20a8      	movs	r0, #168	; 0xa8
     c92:	7048      	strb	r0, [r1, #1]
     c94:	2001      	movs	r0, #1
     c96:	7088      	strb	r0, [r1, #2]
     c98:	2004      	movs	r0, #4
     c9a:	70c8      	strb	r0, [r1, #3]
     c9c:	200b      	movs	r0, #11
     c9e:	4915      	ldr	r1, [pc, #84]	; (0xcf4)
     ca0:	7008      	strb	r0, [r1, #0]
     ca2:	20b8      	movs	r0, #184	; 0xb8
     ca4:	7048      	strb	r0, [r1, #1]
     ca6:	20c0      	movs	r0, #192	; 0xc0
     ca8:	4913      	ldr	r1, [pc, #76]	; (0xcf8)
     caa:	7008      	strb	r0, [r1, #0]
     cac:	20a8      	movs	r0, #168	; 0xa8
     cae:	7048      	strb	r0, [r1, #1]
     cb0:	2001      	movs	r0, #1
     cb2:	7088      	strb	r0, [r1, #2]
     cb4:	20cd      	movs	r0, #205	; 0xcd
     cb6:	70c8      	strb	r0, [r1, #3]
     cb8:	200b      	movs	r0, #11
     cba:	4910      	ldr	r1, [pc, #64]	; (0xcfc)
     cbc:	7008      	strb	r0, [r1, #0]
     cbe:	20b8      	movs	r0, #184	; 0xb8
     cc0:	7048      	strb	r0, [r1, #1]
     cc2:	2000      	movs	r0, #0
     cc4:	490e      	ldr	r1, [pc, #56]	; (0xd00)
     cc6:	7008      	strb	r0, [r1, #0]
     cc8:	490e      	ldr	r1, [pc, #56]	; (0xd04)
     cca:	6048      	str	r0, [r1, #4]
     ccc:	2064      	movs	r0, #100	; 0x64
     cce:	f7ff fc03 	bl	0x4d8				; Delay(#100)
     cd2:	2001      	movs	r0, #1
     cd4:	490b      	ldr	r1, [pc, #44]	; (0xd04)
     cd6:	6048      	str	r0, [r1, #4]
     cd8:	2064      	movs	r0, #100	; 0x64
     cda:	f7ff fbfd 	bl	0x4d8				; Delay(#100)
     cde:	f001 ff57 	bl	0x2b90				; WiznetInit
     ce2:	bd10      	pop	{r4, pc}

     ce4:	20000052      	;	u8 Gateway[4]
     ce8:	20000056      	;	u8 Subnet[4]
     cec:	2000005a      	;	u8 MAC[6]
     cf0:	20000060      	;	u8 SrcIPAddr[4]
     cf4:	20000064      	;	u8 TCPSrcPort[2]
     cf8:	20000066      	;	u8 DstIPAddr[4]
     cfc:	2000006a      	;	u8 TCPDstPort[2]
     d00:	20000088      	;
     d04:	50004280      	;	GPIO registers for PORT4

     d08:	2000      	movs	r0, #0
     d0a:	4901      	ldr	r1, [pc, #4]	; (0xd10)
     d0c:	6008      	str	r0, [r1, #0]
     d0e:	4770      	bx	lr
     d10:	0100      	lsls	r0, r0, #4
     d12:	5000      	str	r0, [r0, r0]

     d14:	b570      	push	{r4, r5, r6, lr}
     d16:	2400      	movs	r4, #0
     d18:	481d      	ldr	r0, [pc, #116]	; (0xd90)
     d1a:	6805      	ldr	r5, [r0, #0]
     d1c:	e035      	b.n	0xd8a
     d1e:	07e8      	lsls	r0, r5, #31
     d20:	0fc0      	lsrs	r0, r0, #31
     d22:	d030      	beq.n	0xd86
     d24:	200c      	movs	r0, #12
     d26:	4360      	muls	r0, r4
     d28:	491a      	ldr	r1, [pc, #104]	; (0xd94)
     d2a:	5808      	ldr	r0, [r1, r0]
     d2c:	1e40      	subs	r0, r0, #1
     d2e:	210c      	movs	r1, #12
     d30:	4361      	muls	r1, r4
     d32:	4a18      	ldr	r2, [pc, #96]	; (0xd94)
     d34:	5050      	str	r0, [r2, r1]
     d36:	2800      	cmp	r0, #0
     d38:	d125      	bne.n	0xd86
     d3a:	4817      	ldr	r0, [pc, #92]	; (0xd98)
     d3c:	6800      	ldr	r0, [r0, #0]
     d3e:	40e0      	lsrs	r0, r4
     d40:	07c0      	lsls	r0, r0, #31
     d42:	0fc0      	lsrs	r0, r0, #31
     d44:	d00e      	beq.n	0xd64
     d46:	200c      	movs	r0, #12
     d48:	4360      	muls	r0, r4
     d4a:	1880      	adds	r0, r0, r2
     d4c:	8881      	ldrh	r1, [r0, #4]
     d4e:	2004      	movs	r0, #4
     d50:	f002 faac 	bl	0x32ac
     d54:	210c      	movs	r1, #12
     d56:	4361      	muls	r1, r4
     d58:	4a0e      	ldr	r2, [pc, #56]	; (0xd94)
     d5a:	1889      	adds	r1, r1, r2
     d5c:	6888      	ldr	r0, [r1, #8]
     d5e:	f002 fa6b 	bl	0x3238
     d62:	e009      	b.n	0xd78
     d64:	220c      	movs	r2, #12
     d66:	4362      	muls	r2, r4
     d68:	4b0a      	ldr	r3, [pc, #40]	; (0xd94)
     d6a:	18d2      	adds	r2, r2, r3
     d6c:	8890      	ldrh	r0, [r2, #4]
     d6e:	220c      	movs	r2, #12
     d70:	4362      	muls	r2, r4
     d72:	18d2      	adds	r2, r2, r3
     d74:	6891      	ldr	r1, [r2, #8]
     d76:	4788      	blx	r1
     d78:	2001      	movs	r0, #1
     d7a:	40a0      	lsls	r0, r4
     d7c:	4904      	ldr	r1, [pc, #16]	; (0xd90)
     d7e:	6809      	ldr	r1, [r1, #0]
     d80:	4381      	bics	r1, r0
     d82:	4803      	ldr	r0, [pc, #12]	; (0xd90)
     d84:	6001      	str	r1, [r0, #0]
     d86:	086d      	lsrs	r5, r5, #1
     d88:	1c64      	adds	r4, r4, #1
     d8a:	2d00      	cmp	r5, #0
     d8c:	d1c7      	bne.n	0xd1e
     d8e:	bd70      	pop	{r4, r5, r6, pc}
     d90:	0038      	movs	r0, r7
     d92:	2000      	movs	r0, #0
     d94:	0238      	lsls	r0, r7, #8
     d96:	2000      	movs	r0, #0
     d98:	003c      	movs	r4, r7
     d9a:	2000      	movs	r0, #0
     d9c:	b5ff      	push	{r0, r1, r2, r3, r4, r5, r6, r7, lr}
     d9e:	b081      	sub	sp, #4
     da0:	4605      	mov	r5, r0
     da2:	460e      	mov	r6, r1
     da4:	4617      	mov	r7, r2
     da6:	2400      	movs	r4, #0
     da8:	e031      	b.n	0xe0e
     daa:	481c      	ldr	r0, [pc, #112]	; (0xe1c)
     dac:	6800      	ldr	r0, [r0, #0]
     dae:	40e0      	lsrs	r0, r4
     db0:	07c0      	lsls	r0, r0, #31
     db2:	0fc0      	lsrs	r0, r0, #31
     db4:	d12a      	bne.n	0xe0c
     db6:	200c      	movs	r0, #12
     db8:	4360      	muls	r0, r4
     dba:	4919      	ldr	r1, [pc, #100]	; (0xe20)
     dbc:	500e      	str	r6, [r1, r0]
     dbe:	9804      	ldr	r0, [sp, #16]
     dc0:	b281      	uxth	r1, r0
     dc2:	200c      	movs	r0, #12
     dc4:	4360      	muls	r0, r4
     dc6:	4a16      	ldr	r2, [pc, #88]	; (0xe20)
     dc8:	1880      	adds	r0, r0, r2
     dca:	8081      	strh	r1, [r0, #4]
     dcc:	200c      	movs	r0, #12
     dce:	4360      	muls	r0, r4
     dd0:	4611      	mov	r1, r2
     dd2:	1840      	adds	r0, r0, r1
     dd4:	6087      	str	r7, [r0, #8]
     dd6:	2d00      	cmp	r5, #0
     dd8:	d007      	beq.n	0xdea
     dda:	2001      	movs	r0, #1
     ddc:	40a0      	lsls	r0, r4
     dde:	4911      	ldr	r1, [pc, #68]	; (0xe24)
     de0:	6809      	ldr	r1, [r1, #0]
     de2:	4308      	orrs	r0, r1
     de4:	490f      	ldr	r1, [pc, #60]	; (0xe24)
     de6:	6008      	str	r0, [r1, #0]
     de8:	e006      	b.n	0xdf8
     dea:	2001      	movs	r0, #1
     dec:	40a0      	lsls	r0, r4
     dee:	490d      	ldr	r1, [pc, #52]	; (0xe24)
     df0:	6809      	ldr	r1, [r1, #0]
     df2:	4381      	bics	r1, r0
     df4:	480b      	ldr	r0, [pc, #44]	; (0xe24)
     df6:	6001      	str	r1, [r0, #0]
     df8:	2001      	movs	r0, #1
     dfa:	40a0      	lsls	r0, r4
     dfc:	4907      	ldr	r1, [pc, #28]	; (0xe1c)
     dfe:	6809      	ldr	r1, [r1, #0]
     e00:	4308      	orrs	r0, r1
     e02:	4906      	ldr	r1, [pc, #24]	; (0xe1c)
     e04:	6008      	str	r0, [r1, #0]
     e06:	4620      	mov	r0, r4
     e08:	b005      	add	sp, #20
     e0a:	bdf0      	pop	{r4, r5, r6, r7, pc}
     e0c:	1c64      	adds	r4, r4, #1
     e0e:	2c06      	cmp	r4, #6
     e10:	d3cb      	bcc.n	0xdaa
     e12:	a005      	add	r0, pc, #20	; (adr r0, 0xe28)
     e14:	f7ff f9de 	bl	0x1d4				; UART0_printf
     e18:	20ff      	movs	r0, #255	; 0xff
     e1a:	e7f5      	b.n	0xe08

     e1c:	20000038      	;
     e20:	20000238      	;
     e24:	2000003c      	;

     e28:	7265      	;	String 'error MSStartTimer\n\0'
     e2a:	6f72      	;
     e2c:	2072      	;
     e2e:	534d      	;
     e30:	7453      	;
     e32:	7261      	;
     e34:	5474      	;
     e36:	6d69      	;
     e38:	7265      	;
     e3a:	000a      	;

     e3c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
     e3e:	4605      	mov	r5, r0
     e40:	786f      	ldrb	r7, [r5, #1]
     e42:	796c      	ldrb	r4, [r5, #5]
     e44:	792e      	ldrb	r6, [r5, #4]
     e46:	0236      	lsls	r6, r6, #8
     e48:	7968      	ldrb	r0, [r5, #5]
     e4a:	4306      	orrs	r6, r0
     e4c:	4638      	mov	r0, r7
     e4e:	f002 fb08 	bl	0x3462				; UART1SendChar(?)
     e52:	4620      	mov	r0, r4
     e54:	f002 fb05 	bl	0x3462				; UART1SendChar(?)
     e58:	2f10      	cmp	r7, #16
     e5a:	d006      	beq.n	0xe6a
     e5c:	2f11      	cmp	r7, #17
     e5e:	d07c      	beq.n	0xf5a
     e60:	2f12      	cmp	r7, #18
     e62:	d07b      	beq.n	0xf5c
     e64:	2f13      	cmp	r7, #19
     e66:	d17a      	bne.n	0xf5e
     e68:	e004      	b.n	0xe74
     e6a:	48f8      	ldr	r0, [pc, #992]	; (0x124c)
     e6c:	6800      	ldr	r0, [r0, #0]
     e6e:	49f7      	ldr	r1, [pc, #988]	; (0x124c)
     e70:	6008      	str	r0, [r1, #0]
     e72:	e2b3      	b.n	0x13dc
     e74:	48f6      	ldr	r0, [pc, #984]	; (0x1250)
     e76:	4286      	cmp	r6, r0
     e78:	d159      	bne.n	0xf2e
     e7a:	49f4      	ldr	r1, [pc, #976]	; (0x124c)
     e7c:	6008      	str	r0, [r1, #0]
     e7e:	2000      	movs	r0, #0
     e80:	49f4      	ldr	r1, [pc, #976]	; (0x1254)
     e82:	6048      	str	r0, [r1, #4]
     e84:	f002 faec 	bl	0x3460
     e88:	2000      	movs	r0, #0
     e8a:	49f2      	ldr	r1, [pc, #968]	; (0x1254)
     e8c:	6008      	str	r0, [r1, #0]
     e8e:	f002 fae7 	bl	0x3460
     e92:	2000      	movs	r0, #0
     e94:	49ef      	ldr	r1, [pc, #956]	; (0x1254)
     e96:	60c8      	str	r0, [r1, #12]
     e98:	f002 fae2 	bl	0x3460
     e9c:	2000      	movs	r0, #0
     e9e:	49ed      	ldr	r1, [pc, #948]	; (0x1254)
     ea0:	6088      	str	r0, [r1, #8]
     ea2:	f002 fadd 	bl	0x3460
     ea6:	2000      	movs	r0, #0
     ea8:	49ea      	ldr	r1, [pc, #936]	; (0x1254)
     eaa:	6148      	str	r0, [r1, #20]
     eac:	f002 fad8 	bl	0x3460
     eb0:	2000      	movs	r0, #0
     eb2:	49e8      	ldr	r1, [pc, #928]	; (0x1254)
     eb4:	6108      	str	r0, [r1, #16]
     eb6:	f002 fad3 	bl	0x3460
     eba:	2000      	movs	r0, #0
     ebc:	49e5      	ldr	r1, [pc, #916]	; (0x1254)
     ebe:	61c8      	str	r0, [r1, #28]
     ec0:	f002 face 	bl	0x3460
     ec4:	2000      	movs	r0, #0
     ec6:	49e3      	ldr	r1, [pc, #908]	; (0x1254)
     ec8:	6188      	str	r0, [r1, #24]
     eca:	f002 fac9 	bl	0x3460
     ece:	2000      	movs	r0, #0
     ed0:	49e0      	ldr	r1, [pc, #896]	; (0x1254)
     ed2:	3180      	adds	r1, #128	; 0x80
     ed4:	6108      	str	r0, [r1, #16]
     ed6:	f002 fac3 	bl	0x3460
     eda:	2000      	movs	r0, #0
     edc:	49dd      	ldr	r1, [pc, #884]	; (0x1254)
     ede:	3180      	adds	r1, #128	; 0x80
     ee0:	6148      	str	r0, [r1, #20]
     ee2:	f002 fabd 	bl	0x3460
     ee6:	2000      	movs	r0, #0
     ee8:	49da      	ldr	r1, [pc, #872]	; (0x1254)
     eea:	3140      	adds	r1, #64	; 0x40
     eec:	6188      	str	r0, [r1, #24]
     eee:	f002 fab7 	bl	0x3460
     ef2:	2000      	movs	r0, #0
     ef4:	49d7      	ldr	r1, [pc, #860]	; (0x1254)
     ef6:	3140      	adds	r1, #64	; 0x40
     ef8:	61c8      	str	r0, [r1, #28]
     efa:	f002 fab1 	bl	0x3460
     efe:	2000      	movs	r0, #0
     f00:	49d4      	ldr	r1, [pc, #848]	; (0x1254)
     f02:	6208      	str	r0, [r1, #32]
     f04:	f002 faac 	bl	0x3460
     f08:	2000      	movs	r0, #0
     f0a:	49d2      	ldr	r1, [pc, #840]	; (0x1254)
     f0c:	3180      	adds	r1, #128	; 0x80
     f0e:	6088      	str	r0, [r1, #8]
     f10:	f002 faa6 	bl	0x3460
     f14:	2000      	movs	r0, #0
     f16:	49cf      	ldr	r1, [pc, #828]	; (0x1254)
     f18:	3140      	adds	r1, #64	; 0x40
     f1a:	6208      	str	r0, [r1, #32]
     f1c:	f002 faa0 	bl	0x3460
     f20:	2000      	movs	r0, #0
     f22:	49cc      	ldr	r1, [pc, #816]	; (0x1254)
     f24:	3140      	adds	r1, #64	; 0x40
     f26:	6248      	str	r0, [r1, #36]	; 0x24
     f28:	f002 fa9a 	bl	0x3460
     f2c:	e05d      	b.n	0xfea
     f2e:	2000      	movs	r0, #0
     f30:	49c6      	ldr	r1, [pc, #792]	; (0x124c)
     f32:	6008      	str	r0, [r1, #0]
     f34:	2001      	movs	r0, #1
     f36:	49c7      	ldr	r1, [pc, #796]	; (0x1254)
     f38:	6048      	str	r0, [r1, #4]
     f3a:	f002 fa91 	bl	0x3460
     f3e:	2001      	movs	r0, #1
     f40:	49c4      	ldr	r1, [pc, #784]	; (0x1254)
     f42:	6008      	str	r0, [r1, #0]
     f44:	f002 fa8c 	bl	0x3460
     f48:	2001      	movs	r0, #1
     f4a:	49c2      	ldr	r1, [pc, #776]	; (0x1254)
     f4c:	60c8      	str	r0, [r1, #12]
     f4e:	f002 fa87 	bl	0x3460
     f52:	2001      	movs	r0, #1
     f54:	49bf      	ldr	r1, [pc, #764]	; (0x1254)
     f56:	6088      	str	r0, [r1, #8]
     f58:	e002      	b.n	0xf60
     f5a:	e047      	b.n	0xfec
     f5c:	e13e      	b.n	0x11dc
     f5e:	e23c      	b.n	0x13da
     f60:	f002 fa7e 	bl	0x3460
     f64:	2001      	movs	r0, #1
     f66:	49bb      	ldr	r1, [pc, #748]	; (0x1254)
     f68:	6148      	str	r0, [r1, #20]
     f6a:	f002 fa79 	bl	0x3460
     f6e:	2001      	movs	r0, #1
     f70:	49b8      	ldr	r1, [pc, #736]	; (0x1254)
     f72:	6108      	str	r0, [r1, #16]
     f74:	f002 fa74 	bl	0x3460
     f78:	2001      	movs	r0, #1
     f7a:	49b6      	ldr	r1, [pc, #728]	; (0x1254)
     f7c:	61c8      	str	r0, [r1, #28]
     f7e:	f002 fa6f 	bl	0x3460
     f82:	2001      	movs	r0, #1
     f84:	49b3      	ldr	r1, [pc, #716]	; (0x1254)
     f86:	6188      	str	r0, [r1, #24]
     f88:	f002 fa6a 	bl	0x3460
     f8c:	2001      	movs	r0, #1
     f8e:	49b1      	ldr	r1, [pc, #708]	; (0x1254)
     f90:	3180      	adds	r1, #128	; 0x80
     f92:	6108      	str	r0, [r1, #16]
     f94:	f002 fa64 	bl	0x3460
     f98:	2001      	movs	r0, #1
     f9a:	49ae      	ldr	r1, [pc, #696]	; (0x1254)
     f9c:	3180      	adds	r1, #128	; 0x80
     f9e:	6148      	str	r0, [r1, #20]
     fa0:	f002 fa5e 	bl	0x3460
     fa4:	2001      	movs	r0, #1
     fa6:	49ab      	ldr	r1, [pc, #684]	; (0x1254)
     fa8:	3140      	adds	r1, #64	; 0x40
     faa:	6188      	str	r0, [r1, #24]
     fac:	f002 fa58 	bl	0x3460
     fb0:	2001      	movs	r0, #1
     fb2:	49a8      	ldr	r1, [pc, #672]	; (0x1254)
     fb4:	3140      	adds	r1, #64	; 0x40
     fb6:	61c8      	str	r0, [r1, #28]
     fb8:	f002 fa52 	bl	0x3460
     fbc:	2001      	movs	r0, #1
     fbe:	49a5      	ldr	r1, [pc, #660]	; (0x1254)
     fc0:	6208      	str	r0, [r1, #32]
     fc2:	f002 fa4d 	bl	0x3460
     fc6:	2001      	movs	r0, #1
     fc8:	49a2      	ldr	r1, [pc, #648]	; (0x1254)
     fca:	3180      	adds	r1, #128	; 0x80
     fcc:	6088      	str	r0, [r1, #8]
     fce:	f002 fa47 	bl	0x3460
     fd2:	2001      	movs	r0, #1
     fd4:	499f      	ldr	r1, [pc, #636]	; (0x1254)
     fd6:	3140      	adds	r1, #64	; 0x40
     fd8:	6208      	str	r0, [r1, #32]
     fda:	f002 fa41 	bl	0x3460
     fde:	2001      	movs	r0, #1
     fe0:	499c      	ldr	r1, [pc, #624]	; (0x1254)
     fe2:	3140      	adds	r1, #64	; 0x40
     fe4:	6248      	str	r0, [r1, #36]	; 0x24
     fe6:	f002 fa3b 	bl	0x3460
     fea:	e1f7      	b.n	0x13dc
     fec:	0023      	movs	r3, r4
     fee:	f001 ffe9 	bl	0x2fc4
     ff2:	f211 180a 			; <UNDEFINED> instruction: 0xf211180a
     ff6:	3426      	adds	r4, #38	; 0x26
     ff8:	5042      	str	r2, [r0, r1]
     ffa:	6c5e      	ldr	r6, [r3, #68]	; 0x44
     ffc:	897a      	ldrh	r2, [r7, #10]
     ffe:	a798      	add	r7, pc, #608	; (adr r7, 0x1260)
    1000:	c4b6      	stmia	r4!, {r1, r2, r4, r5, r7}
    1002:	e2d3      	b.n	0x15ac
    1004:	00f2      	lsls	r2, r6, #3
    1006:	1e60      	subs	r0, r4, #1
    1008:	2101      	movs	r1, #1
    100a:	4081      	lsls	r1, r0
    100c:	488f      	ldr	r0, [pc, #572]	; (0x124c)
    100e:	6800      	ldr	r0, [r0, #0]
    1010:	4388      	bics	r0, r1
    1012:	498e      	ldr	r1, [pc, #568]	; (0x124c)
    1014:	6008      	str	r0, [r1, #0]
    1016:	2001      	movs	r0, #1
    1018:	498e      	ldr	r1, [pc, #568]	; (0x1254)
    101a:	6048      	str	r0, [r1, #4]
    101c:	f002 fa20 	bl	0x3460
    1020:	e0da      	b.n	0x11d8
    1022:	1e61      	subs	r1, r4, #1
    1024:	2001      	movs	r0, #1
    1026:	4088      	lsls	r0, r1
    1028:	4988      	ldr	r1, [pc, #544]	; (0x124c)
    102a:	6809      	ldr	r1, [r1, #0]
    102c:	4381      	bics	r1, r0
    102e:	4887      	ldr	r0, [pc, #540]	; (0x124c)
    1030:	6001      	str	r1, [r0, #0]
    1032:	2001      	movs	r0, #1
    1034:	4987      	ldr	r1, [pc, #540]	; (0x1254)
    1036:	6008      	str	r0, [r1, #0]
    1038:	f002 fa12 	bl	0x3460
    103c:	e0cc      	b.n	0x11d8
    103e:	1e60      	subs	r0, r4, #1
    1040:	2101      	movs	r1, #1
    1042:	4081      	lsls	r1, r0
    1044:	4881      	ldr	r0, [pc, #516]	; (0x124c)
    1046:	6800      	ldr	r0, [r0, #0]
    1048:	4388      	bics	r0, r1
    104a:	4980      	ldr	r1, [pc, #512]	; (0x124c)
    104c:	6008      	str	r0, [r1, #0]
    104e:	2001      	movs	r0, #1
    1050:	4980      	ldr	r1, [pc, #512]	; (0x1254)
    1052:	60c8      	str	r0, [r1, #12]
    1054:	f002 fa04 	bl	0x3460
    1058:	e0be      	b.n	0x11d8
    105a:	1e60      	subs	r0, r4, #1
    105c:	2101      	movs	r1, #1
    105e:	4081      	lsls	r1, r0
    1060:	487a      	ldr	r0, [pc, #488]	; (0x124c)
    1062:	6800      	ldr	r0, [r0, #0]
    1064:	4388      	bics	r0, r1
    1066:	4979      	ldr	r1, [pc, #484]	; (0x124c)
    1068:	6008      	str	r0, [r1, #0]
    106a:	2001      	movs	r0, #1
    106c:	4979      	ldr	r1, [pc, #484]	; (0x1254)
    106e:	6088      	str	r0, [r1, #8]
    1070:	f002 f9f6 	bl	0x3460
    1074:	e0b0      	b.n	0x11d8
    1076:	1e61      	subs	r1, r4, #1
    1078:	2001      	movs	r0, #1
    107a:	4088      	lsls	r0, r1
    107c:	4973      	ldr	r1, [pc, #460]	; (0x124c)
    107e:	6809      	ldr	r1, [r1, #0]
    1080:	4381      	bics	r1, r0
    1082:	4872      	ldr	r0, [pc, #456]	; (0x124c)
    1084:	6001      	str	r1, [r0, #0]
    1086:	2001      	movs	r0, #1
    1088:	4972      	ldr	r1, [pc, #456]	; (0x1254)
    108a:	6148      	str	r0, [r1, #20]
    108c:	f002 f9e8 	bl	0x3460
    1090:	e0a2      	b.n	0x11d8
    1092:	1e61      	subs	r1, r4, #1
    1094:	2001      	movs	r0, #1
    1096:	4088      	lsls	r0, r1
    1098:	496c      	ldr	r1, [pc, #432]	; (0x124c)
    109a:	6809      	ldr	r1, [r1, #0]
    109c:	4381      	bics	r1, r0
    109e:	486b      	ldr	r0, [pc, #428]	; (0x124c)
    10a0:	6001      	str	r1, [r0, #0]
    10a2:	2001      	movs	r0, #1
    10a4:	496b      	ldr	r1, [pc, #428]	; (0x1254)
    10a6:	6108      	str	r0, [r1, #16]
    10a8:	f002 f9da 	bl	0x3460
    10ac:	e094      	b.n	0x11d8
    10ae:	1e61      	subs	r1, r4, #1
    10b0:	2001      	movs	r0, #1
    10b2:	4088      	lsls	r0, r1
    10b4:	4965      	ldr	r1, [pc, #404]	; (0x124c)
    10b6:	6809      	ldr	r1, [r1, #0]
    10b8:	4381      	bics	r1, r0
    10ba:	4864      	ldr	r0, [pc, #400]	; (0x124c)
    10bc:	6001      	str	r1, [r0, #0]
    10be:	2001      	movs	r0, #1
    10c0:	4964      	ldr	r1, [pc, #400]	; (0x1254)
    10c2:	61c8      	str	r0, [r1, #28]
    10c4:	f002 f9cc 	bl	0x3460
    10c8:	e086      	b.n	0x11d8
    10ca:	1e61      	subs	r1, r4, #1
    10cc:	2001      	movs	r0, #1
    10ce:	4088      	lsls	r0, r1
    10d0:	495e      	ldr	r1, [pc, #376]	; (0x124c)
    10d2:	6809      	ldr	r1, [r1, #0]
    10d4:	4381      	bics	r1, r0
    10d6:	485d      	ldr	r0, [pc, #372]	; (0x124c)
    10d8:	6001      	str	r1, [r0, #0]
    10da:	2001      	movs	r0, #1
    10dc:	495d      	ldr	r1, [pc, #372]	; (0x1254)
    10de:	6188      	str	r0, [r1, #24]
    10e0:	f002 f9be 	bl	0x3460
    10e4:	e078      	b.n	0x11d8
    10e6:	1e60      	subs	r0, r4, #1
    10e8:	2101      	movs	r1, #1
    10ea:	4081      	lsls	r1, r0
    10ec:	4857      	ldr	r0, [pc, #348]	; (0x124c)
    10ee:	6800      	ldr	r0, [r0, #0]
    10f0:	4388      	bics	r0, r1
    10f2:	4956      	ldr	r1, [pc, #344]	; (0x124c)
    10f4:	6008      	str	r0, [r1, #0]
    10f6:	2001      	movs	r0, #1
    10f8:	4956      	ldr	r1, [pc, #344]	; (0x1254)
    10fa:	3180      	adds	r1, #128	; 0x80
    10fc:	6108      	str	r0, [r1, #16]
    10fe:	f002 f9af 	bl	0x3460
    1102:	e069      	b.n	0x11d8
    1104:	1e60      	subs	r0, r4, #1
    1106:	2101      	movs	r1, #1
    1108:	4081      	lsls	r1, r0
    110a:	4850      	ldr	r0, [pc, #320]	; (0x124c)
    110c:	6800      	ldr	r0, [r0, #0]
    110e:	4388      	bics	r0, r1
    1110:	494e      	ldr	r1, [pc, #312]	; (0x124c)
    1112:	6008      	str	r0, [r1, #0]
    1114:	2001      	movs	r0, #1
    1116:	494f      	ldr	r1, [pc, #316]	; (0x1254)
    1118:	3180      	adds	r1, #128	; 0x80
    111a:	6148      	str	r0, [r1, #20]
    111c:	f002 f9a0 	bl	0x3460
    1120:	e05a      	b.n	0x11d8
    1122:	1e60      	subs	r0, r4, #1
    1124:	2101      	movs	r1, #1
    1126:	4081      	lsls	r1, r0
    1128:	4848      	ldr	r0, [pc, #288]	; (0x124c)
    112a:	6800      	ldr	r0, [r0, #0]
    112c:	4388      	bics	r0, r1
    112e:	4947      	ldr	r1, [pc, #284]	; (0x124c)
    1130:	6008      	str	r0, [r1, #0]
    1132:	2001      	movs	r0, #1
    1134:	4947      	ldr	r1, [pc, #284]	; (0x1254)
    1136:	3140      	adds	r1, #64	; 0x40
    1138:	6188      	str	r0, [r1, #24]
    113a:	f002 f991 	bl	0x3460
    113e:	e04b      	b.n	0x11d8
    1140:	1e61      	subs	r1, r4, #1
    1142:	2001      	movs	r0, #1
    1144:	4088      	lsls	r0, r1
    1146:	4941      	ldr	r1, [pc, #260]	; (0x124c)
    1148:	6809      	ldr	r1, [r1, #0]
    114a:	4381      	bics	r1, r0
    114c:	483f      	ldr	r0, [pc, #252]	; (0x124c)
    114e:	6001      	str	r1, [r0, #0]
    1150:	2001      	movs	r0, #1
    1152:	4940      	ldr	r1, [pc, #256]	; (0x1254)
    1154:	3140      	adds	r1, #64	; 0x40
    1156:	61c8      	str	r0, [r1, #28]
    1158:	f002 f982 	bl	0x3460
    115c:	e03c      	b.n	0x11d8
    115e:	1e61      	subs	r1, r4, #1
    1160:	2001      	movs	r0, #1
    1162:	4088      	lsls	r0, r1
    1164:	4939      	ldr	r1, [pc, #228]	; (0x124c)
    1166:	6809      	ldr	r1, [r1, #0]
    1168:	4381      	bics	r1, r0
    116a:	4838      	ldr	r0, [pc, #224]	; (0x124c)
    116c:	6001      	str	r1, [r0, #0]
    116e:	2001      	movs	r0, #1
    1170:	4938      	ldr	r1, [pc, #224]	; (0x1254)
    1172:	6208      	str	r0, [r1, #32]
    1174:	f002 f974 	bl	0x3460
    1178:	e02e      	b.n	0x11d8
    117a:	1e61      	subs	r1, r4, #1
    117c:	2001      	movs	r0, #1
    117e:	4088      	lsls	r0, r1
    1180:	4932      	ldr	r1, [pc, #200]	; (0x124c)
    1182:	6809      	ldr	r1, [r1, #0]
    1184:	4381      	bics	r1, r0
    1186:	4831      	ldr	r0, [pc, #196]	; (0x124c)
    1188:	6001      	str	r1, [r0, #0]
    118a:	2001      	movs	r0, #1
    118c:	4931      	ldr	r1, [pc, #196]	; (0x1254)
    118e:	3180      	adds	r1, #128	; 0x80
    1190:	6088      	str	r0, [r1, #8]
    1192:	f002 f965 	bl	0x3460
    1196:	e01f      	b.n	0x11d8
    1198:	1e61      	subs	r1, r4, #1
    119a:	2001      	movs	r0, #1
    119c:	4088      	lsls	r0, r1
    119e:	492b      	ldr	r1, [pc, #172]	; (0x124c)
    11a0:	6809      	ldr	r1, [r1, #0]
    11a2:	4381      	bics	r1, r0
    11a4:	4829      	ldr	r0, [pc, #164]	; (0x124c)
    11a6:	6001      	str	r1, [r0, #0]
    11a8:	2001      	movs	r0, #1
    11aa:	492a      	ldr	r1, [pc, #168]	; (0x1254)
    11ac:	3140      	adds	r1, #64	; 0x40
    11ae:	6208      	str	r0, [r1, #32]
    11b0:	f002 f956 	bl	0x3460
    11b4:	e010      	b.n	0x11d8
    11b6:	1e60      	subs	r0, r4, #1
    11b8:	2101      	movs	r1, #1
    11ba:	4081      	lsls	r1, r0
    11bc:	4823      	ldr	r0, [pc, #140]	; (0x124c)
    11be:	6800      	ldr	r0, [r0, #0]
    11c0:	4388      	bics	r0, r1
    11c2:	4922      	ldr	r1, [pc, #136]	; (0x124c)
    11c4:	6008      	str	r0, [r1, #0]
    11c6:	2001      	movs	r0, #1
    11c8:	4922      	ldr	r1, [pc, #136]	; (0x1254)
    11ca:	3140      	adds	r1, #64	; 0x40
    11cc:	6248      	str	r0, [r1, #36]	; 0x24
    11ce:	f002 f947 	bl	0x3460
    11d2:	e001      	b.n	0x11d8
    11d4:	e7ff      	b.n	0x11d6
    11d6:	bf00      	nop
    11d8:	bf00      	nop
    11da:	e0ff      	b.n	0x13dc
    11dc:	0023      	movs	r3, r4
    11de:	f001 fef1 	bl	0x2fc4
    11e2:	f911 180a 	ldrsb.w	r1, [r1, <undefined>]
    11e6:	3b26      	subs	r3, #38	; 0x26
    11e8:	5749      	ldrsb	r1, [r1, r5]
    11ea:	7365      	strb	r5, [r4, #13]
    11ec:	9081      	str	r0, [sp, #516]	; 0x204
    11ee:	ae9f      	add	r6, sp, #636	; 0x27c
    11f0:	cbbd      	ldmia	r3, {r0, r2, r3, r4, r5, r7}
    11f2:	e9da 00f9 	ldrd	r0, r0, [sl, #996]	; 0x3e4
    11f6:	1e61      	subs	r1, r4, #1
    11f8:	2001      	movs	r0, #1
    11fa:	4088      	lsls	r0, r1
    11fc:	4913      	ldr	r1, [pc, #76]	; (0x124c)
    11fe:	6809      	ldr	r1, [r1, #0]
    1200:	4308      	orrs	r0, r1
    1202:	4912      	ldr	r1, [pc, #72]	; (0x124c)
    1204:	6008      	str	r0, [r1, #0]
    1206:	2000      	movs	r0, #0
    1208:	4912      	ldr	r1, [pc, #72]	; (0x1254)
    120a:	6048      	str	r0, [r1, #4]
    120c:	f002 f928 	bl	0x3460
    1210:	e0e1      	b.n	0x13d6
    1212:	1e61      	subs	r1, r4, #1
    1214:	2001      	movs	r0, #1
    1216:	4088      	lsls	r0, r1
    1218:	490c      	ldr	r1, [pc, #48]	; (0x124c)
    121a:	6809      	ldr	r1, [r1, #0]
    121c:	4308      	orrs	r0, r1
    121e:	490b      	ldr	r1, [pc, #44]	; (0x124c)
    1220:	6008      	str	r0, [r1, #0]
    1222:	2000      	movs	r0, #0
    1224:	490b      	ldr	r1, [pc, #44]	; (0x1254)
    1226:	6008      	str	r0, [r1, #0]
    1228:	f002 f91a 	bl	0x3460
    122c:	e0d3      	b.n	0x13d6
    122e:	1e61      	subs	r1, r4, #1
    1230:	2001      	movs	r0, #1
    1232:	4088      	lsls	r0, r1
    1234:	4905      	ldr	r1, [pc, #20]	; (0x124c)
    1236:	6809      	ldr	r1, [r1, #0]
    1238:	4308      	orrs	r0, r1
    123a:	4904      	ldr	r1, [pc, #16]	; (0x124c)
    123c:	6008      	str	r0, [r1, #0]
    123e:	2000      	movs	r0, #0
    1240:	4904      	ldr	r1, [pc, #16]	; (0x1254)
    1242:	60c8      	str	r0, [r1, #12]
    1244:	f002 f90c 	bl	0x3460
    1248:	e0c5      	b.n	0x13d6

    124a:	0000      	;	padding
    124c:	20000028      	;
    1250:	0000ffff	;
    1254:	50004200      	;	GPIO registers for PORT0

    1258:	1e61      	subs	r1, r4, #1
    125a:	2001      	movs	r0, #1
    125c:	4088      	lsls	r0, r1
    125e:	4975      	ldr	r1, [pc, #468]	; (0x1434)
    1260:	6809      	ldr	r1, [r1, #0]
    1262:	4308      	orrs	r0, r1
    1264:	4973      	ldr	r1, [pc, #460]	; (0x1434)
    1266:	6008      	str	r0, [r1, #0]
    1268:	2000      	movs	r0, #0
    126a:	4973      	ldr	r1, [pc, #460]	; (0x1438)
    126c:	6088      	str	r0, [r1, #8]
    126e:	f002 f8f7 	bl	0x3460
    1272:	e0b0      	b.n	0x13d6
    1274:	1e61      	subs	r1, r4, #1
    1276:	2001      	movs	r0, #1
    1278:	4088      	lsls	r0, r1
    127a:	496e      	ldr	r1, [pc, #440]	; (0x1434)
    127c:	6809      	ldr	r1, [r1, #0]
    127e:	4308      	orrs	r0, r1
    1280:	496c      	ldr	r1, [pc, #432]	; (0x1434)
    1282:	6008      	str	r0, [r1, #0]
    1284:	2000      	movs	r0, #0
    1286:	496c      	ldr	r1, [pc, #432]	; (0x1438)
    1288:	6148      	str	r0, [r1, #20]
    128a:	f002 f8e9 	bl	0x3460
    128e:	e0a2      	b.n	0x13d6
    1290:	1e61      	subs	r1, r4, #1
    1292:	2001      	movs	r0, #1
    1294:	4088      	lsls	r0, r1
    1296:	4967      	ldr	r1, [pc, #412]	; (0x1434)
    1298:	6809      	ldr	r1, [r1, #0]
    129a:	4308      	orrs	r0, r1
    129c:	4965      	ldr	r1, [pc, #404]	; (0x1434)
    129e:	6008      	str	r0, [r1, #0]
    12a0:	2000      	movs	r0, #0
    12a2:	4965      	ldr	r1, [pc, #404]	; (0x1438)
    12a4:	6108      	str	r0, [r1, #16]
    12a6:	f002 f8db 	bl	0x3460
    12aa:	e094      	b.n	0x13d6
    12ac:	1e61      	subs	r1, r4, #1
    12ae:	2001      	movs	r0, #1
    12b0:	4088      	lsls	r0, r1
    12b2:	4960      	ldr	r1, [pc, #384]	; (0x1434)
    12b4:	6809      	ldr	r1, [r1, #0]
    12b6:	4308      	orrs	r0, r1
    12b8:	495e      	ldr	r1, [pc, #376]	; (0x1434)
    12ba:	6008      	str	r0, [r1, #0]
    12bc:	2000      	movs	r0, #0
    12be:	495e      	ldr	r1, [pc, #376]	; (0x1438)
    12c0:	61c8      	str	r0, [r1, #28]
    12c2:	f002 f8cd 	bl	0x3460
    12c6:	e086      	b.n	0x13d6
    12c8:	1e61      	subs	r1, r4, #1
    12ca:	2001      	movs	r0, #1
    12cc:	4088      	lsls	r0, r1
    12ce:	4959      	ldr	r1, [pc, #356]	; (0x1434)
    12d0:	6809      	ldr	r1, [r1, #0]
    12d2:	4308      	orrs	r0, r1
    12d4:	4957      	ldr	r1, [pc, #348]	; (0x1434)
    12d6:	6008      	str	r0, [r1, #0]
    12d8:	2000      	movs	r0, #0
    12da:	4957      	ldr	r1, [pc, #348]	; (0x1438)
    12dc:	6188      	str	r0, [r1, #24]
    12de:	f002 f8bf 	bl	0x3460
    12e2:	e078      	b.n	0x13d6
    12e4:	1e61      	subs	r1, r4, #1
    12e6:	2001      	movs	r0, #1
    12e8:	4088      	lsls	r0, r1
    12ea:	4952      	ldr	r1, [pc, #328]	; (0x1434)
    12ec:	6809      	ldr	r1, [r1, #0]
    12ee:	4308      	orrs	r0, r1
    12f0:	4950      	ldr	r1, [pc, #320]	; (0x1434)
    12f2:	6008      	str	r0, [r1, #0]
    12f4:	2000      	movs	r0, #0
    12f6:	4950      	ldr	r1, [pc, #320]	; (0x1438)
    12f8:	3180      	adds	r1, #128	; 0x80
    12fa:	6108      	str	r0, [r1, #16]
    12fc:	f002 f8b0 	bl	0x3460
    1300:	e069      	b.n	0x13d6
    1302:	1e61      	subs	r1, r4, #1
    1304:	2001      	movs	r0, #1
    1306:	4088      	lsls	r0, r1
    1308:	494a      	ldr	r1, [pc, #296]	; (0x1434)
    130a:	6809      	ldr	r1, [r1, #0]
    130c:	4308      	orrs	r0, r1
    130e:	4949      	ldr	r1, [pc, #292]	; (0x1434)
    1310:	6008      	str	r0, [r1, #0]
    1312:	2000      	movs	r0, #0
    1314:	4948      	ldr	r1, [pc, #288]	; (0x1438)
    1316:	3180      	adds	r1, #128	; 0x80
    1318:	6148      	str	r0, [r1, #20]
    131a:	f002 f8a1 	bl	0x3460
    131e:	e05a      	b.n	0x13d6
    1320:	1e61      	subs	r1, r4, #1
    1322:	2001      	movs	r0, #1
    1324:	4088      	lsls	r0, r1
    1326:	4943      	ldr	r1, [pc, #268]	; (0x1434)
    1328:	6809      	ldr	r1, [r1, #0]
    132a:	4308      	orrs	r0, r1
    132c:	4941      	ldr	r1, [pc, #260]	; (0x1434)
    132e:	6008      	str	r0, [r1, #0]
    1330:	2000      	movs	r0, #0
    1332:	4941      	ldr	r1, [pc, #260]	; (0x1438)
    1334:	3140      	adds	r1, #64	; 0x40
    1336:	6188      	str	r0, [r1, #24]
    1338:	f002 f892 	bl	0x3460
    133c:	e04b      	b.n	0x13d6
    133e:	1e61      	subs	r1, r4, #1
    1340:	2001      	movs	r0, #1
    1342:	4088      	lsls	r0, r1
    1344:	493b      	ldr	r1, [pc, #236]	; (0x1434)
    1346:	6809      	ldr	r1, [r1, #0]
    1348:	4308      	orrs	r0, r1
    134a:	493a      	ldr	r1, [pc, #232]	; (0x1434)
    134c:	6008      	str	r0, [r1, #0]
    134e:	2000      	movs	r0, #0
    1350:	4939      	ldr	r1, [pc, #228]	; (0x1438)
    1352:	3140      	adds	r1, #64	; 0x40
    1354:	61c8      	str	r0, [r1, #28]
    1356:	f002 f883 	bl	0x3460
    135a:	e03c      	b.n	0x13d6
    135c:	1e61      	subs	r1, r4, #1
    135e:	2001      	movs	r0, #1
    1360:	4088      	lsls	r0, r1
    1362:	4934      	ldr	r1, [pc, #208]	; (0x1434)
    1364:	6809      	ldr	r1, [r1, #0]
    1366:	4308      	orrs	r0, r1
    1368:	4932      	ldr	r1, [pc, #200]	; (0x1434)
    136a:	6008      	str	r0, [r1, #0]
    136c:	2000      	movs	r0, #0
    136e:	4932      	ldr	r1, [pc, #200]	; (0x1438)
    1370:	6208      	str	r0, [r1, #32]
    1372:	f002 f875 	bl	0x3460
    1376:	e02e      	b.n	0x13d6
    1378:	1e61      	subs	r1, r4, #1
    137a:	2001      	movs	r0, #1
    137c:	4088      	lsls	r0, r1
    137e:	492d      	ldr	r1, [pc, #180]	; (0x1434)
    1380:	6809      	ldr	r1, [r1, #0]
    1382:	4308      	orrs	r0, r1
    1384:	492b      	ldr	r1, [pc, #172]	; (0x1434)
    1386:	6008      	str	r0, [r1, #0]
    1388:	2000      	movs	r0, #0
    138a:	492b      	ldr	r1, [pc, #172]	; (0x1438)
    138c:	3180      	adds	r1, #128	; 0x80
    138e:	6088      	str	r0, [r1, #8]
    1390:	f002 f866 	bl	0x3460
    1394:	e01f      	b.n	0x13d6
    1396:	1e61      	subs	r1, r4, #1
    1398:	2001      	movs	r0, #1
    139a:	4088      	lsls	r0, r1
    139c:	4925      	ldr	r1, [pc, #148]	; (0x1434)
    139e:	6809      	ldr	r1, [r1, #0]
    13a0:	4308      	orrs	r0, r1
    13a2:	4924      	ldr	r1, [pc, #144]	; (0x1434)
    13a4:	6008      	str	r0, [r1, #0]
    13a6:	2000      	movs	r0, #0
    13a8:	4923      	ldr	r1, [pc, #140]	; (0x1438)
    13aa:	3140      	adds	r1, #64	; 0x40
    13ac:	6208      	str	r0, [r1, #32]
    13ae:	f002 f857 	bl	0x3460
    13b2:	e010      	b.n	0x13d6
    13b4:	1e61      	subs	r1, r4, #1
    13b6:	2001      	movs	r0, #1
    13b8:	4088      	lsls	r0, r1
    13ba:	491e      	ldr	r1, [pc, #120]	; (0x1434)
    13bc:	6809      	ldr	r1, [r1, #0]
    13be:	4308      	orrs	r0, r1
    13c0:	491c      	ldr	r1, [pc, #112]	; (0x1434)
    13c2:	6008      	str	r0, [r1, #0]
    13c4:	2000      	movs	r0, #0
    13c6:	491c      	ldr	r1, [pc, #112]	; (0x1438)
    13c8:	3140      	adds	r1, #64	; 0x40
    13ca:	6248      	str	r0, [r1, #36]	; 0x24
    13cc:	f002 f848 	bl	0x3460
    13d0:	e001      	b.n	0x13d6
    13d2:	e7ff      	b.n	0x13d4
    13d4:	bf00      	nop
    13d6:	bf00      	nop
    13d8:	e000      	b.n	0x13dc
    13da:	bf00      	nop
    13dc:	bf00      	nop
    13de:	2028      	movs	r0, #40	; 0x28
    13e0:	4916      	ldr	r1, [pc, #88]	; (0x143c)
    13e2:	7008      	strb	r0, [r1, #0]
    13e4:	2001      	movs	r0, #1
    13e6:	7048      	strb	r0, [r1, #1]
    13e8:	2000      	movs	r0, #0
    13ea:	7088      	strb	r0, [r1, #2]
    13ec:	70c8      	strb	r0, [r1, #3]
    13ee:	7108      	strb	r0, [r1, #4]
    13f0:	4810      	ldr	r0, [pc, #64]	; (0x1434)
    13f2:	8800      	ldrh	r0, [r0, #0]
    13f4:	0400      	lsls	r0, r0, #16
    13f6:	0e00      	lsrs	r0, r0, #24
    13f8:	7148      	strb	r0, [r1, #5]
    13fa:	480e      	ldr	r0, [pc, #56]	; (0x1434)
    13fc:	7800      	ldrb	r0, [r0, #0]
    13fe:	7188      	strb	r0, [r1, #6]
    1400:	4608      	mov	r0, r1
    1402:	7800      	ldrb	r0, [r0, #0]
    1404:	7849      	ldrb	r1, [r1, #1]
    1406:	1840      	adds	r0, r0, r1
    1408:	490c      	ldr	r1, [pc, #48]	; (0x143c)
    140a:	7889      	ldrb	r1, [r1, #2]
    140c:	1840      	adds	r0, r0, r1
    140e:	490b      	ldr	r1, [pc, #44]	; (0x143c)
    1410:	78c9      	ldrb	r1, [r1, #3]
    1412:	1840      	adds	r0, r0, r1
    1414:	4909      	ldr	r1, [pc, #36]	; (0x143c)
    1416:	7909      	ldrb	r1, [r1, #4]
    1418:	1840      	adds	r0, r0, r1
    141a:	4908      	ldr	r1, [pc, #32]	; (0x143c)
    141c:	7949      	ldrb	r1, [r1, #5]
    141e:	1840      	adds	r0, r0, r1
    1420:	4906      	ldr	r1, [pc, #24]	; (0x143c)
    1422:	7989      	ldrb	r1, [r1, #6]
    1424:	1840      	adds	r0, r0, r1
    1426:	4905      	ldr	r1, [pc, #20]	; (0x143c)
    1428:	71c8      	strb	r0, [r1, #7]
    142a:	2108      	movs	r1, #8
    142c:	2000      	movs	r0, #0
    142e:	f000 fd8f 	bl	0x1f50
    1432:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

    1434:	20000028      	;
    1438:	50004200      	;	GPIO registers for PORT0
    143c:	200002d0      	;

    1440:	b510      	push	{r4, lr}
    1442:	4812      	ldr	r0, [pc, #72]	; (0x148c)
    1444:	8800      	ldrh	r0, [r0, #0]
    1446:	4912      	ldr	r1, [pc, #72]	; (0x1490)
    1448:	8809      	ldrh	r1, [r1, #0]
    144a:	4288      	cmp	r0, r1
    144c:	d01c      	beq.n	0x1488
    144e:	4811      	ldr	r0, [pc, #68]	; (0x1494)
    1450:	490e      	ldr	r1, [pc, #56]	; (0x148c)
    1452:	8809      	ldrh	r1, [r1, #0]
    1454:	5c44      	ldrb	r4, [r0, r1]
    1456:	480d      	ldr	r0, [pc, #52]	; (0x148c)
    1458:	8800      	ldrh	r0, [r0, #0]
    145a:	1fc1      	subs	r1, r0, #7
    145c:	39ff      	subs	r1, #255	; 0xff
    145e:	39f9      	subs	r1, #249	; 0xf9
    1460:	d101      	bne.n	0x1466
    1462:	2000      	movs	r0, #0
    1464:	e002      	b.n	0x146c
    1466:	4809      	ldr	r0, [pc, #36]	; (0x148c)
    1468:	8800      	ldrh	r0, [r0, #0]
    146a:	1c40      	adds	r0, r0, #1
    146c:	4907      	ldr	r1, [pc, #28]	; (0x148c)
    146e:	8008      	strh	r0, [r1, #0]
    1470:	4809      	ldr	r0, [pc, #36]	; (0x1498)
    1472:	8800      	ldrh	r0, [r0, #0]
    1474:	1e40      	subs	r0, r0, #1
    1476:	4908      	ldr	r1, [pc, #32]	; (0x1498)
    1478:	8008      	strh	r0, [r1, #0]
    147a:	4621      	mov	r1, r4
    147c:	a007      	add	r0, pc, #28	; (adr r0, 0x149c)
    147e:	f7fe fea9 	bl	0x1d4				; UART0_printf
    1482:	4620      	mov	r0, r4
    1484:	f001 ff3a 	bl	0x32fc
    1488:	bd10      	pop	{r4, pc}
    148a:	0000      	movs	r0, r0

    148c:	2000004e      	;
    1490:	20000050      	;
    1494:	200004d0      	;
    1498:	2000004c      	;

    149c:	200a      	;	String '\n NET0-%X\0\0\0'
    149e:	454e      	;
    14a0:	3054      	;
    14a2:	252d      	;
    14a4:	0058      	;
    14a6:	0000      	;

    14a8:	b570      	push	{r4, r5, r6, lr}
    14aa:	4605      	mov	r5, r0
    14ac:	0428      	lsls	r0, r5, #16
    14ae:	0e06      	lsrs	r6, r0, #24
    14b0:	b2ec      	uxtb	r4, r5
    14b2:	20fd      	movs	r0, #253	; 0xfd
    14b4:	49fe      	ldr	r1, [pc, #1016]	; (0x18b0)
    14b6:	7008      	strb	r0, [r1, #0]
    14b8:	4608      	mov	r0, r1
    14ba:	7046      	strb	r6, [r0, #1]
    14bc:	7084      	strb	r4, [r0, #2]
    14be:	205d      	movs	r0, #93	; 0x5d
    14c0:	70c8      	strb	r0, [r1, #3]
    14c2:	2e09      	cmp	r6, #9
    14c4:	d070      	beq.n	0x15a8
    14c6:	dc08      	bgt.n	0x14da
    14c8:	0033      	movs	r3, r6
    14ca:	f001 fd7b 	bl	0x2fc4
    14ce:	8209      	strh	r1, [r1, #16]
    14d0:	2e19      	cmp	r6, #25
    14d2:	5843      	ldr	r3, [r0, r1]
    14d4:	8a6e      	ldrh	r6, [r5, #18]
    14d6:	b49f      	push	{r0, r1, r2, r3, r4, r7}
    14d8:	0082      	lsls	r2, r0, #2
    14da:	2e0e      	cmp	r6, #14
    14dc:	d075      	beq.n	0x15ca
    14de:	dc08      	bgt.n	0x14f2
    14e0:	2e0a      	cmp	r6, #10
    14e2:	d073      	beq.n	0x15cc
    14e4:	2e0b      	cmp	r6, #11
    14e6:	d072      	beq.n	0x15ce
    14e8:	2e0c      	cmp	r6, #12
    14ea:	d071      	beq.n	0x15d0
    14ec:	2e0d      	cmp	r6, #13
    14ee:	d170      	bne.n	0x15d2
    14f0:	e112      	b.n	0x1718
    14f2:	2e0f      	cmp	r6, #15
    14f4:	d06e      	beq.n	0x15d4
    14f6:	2e10      	cmp	r6, #16
    14f8:	d06d      	beq.n	0x15d6
    14fa:	2eff      	cmp	r6, #255	; 0xff
    14fc:	d1f7      	bne.n	0x14ee
    14fe:	e165      	b.n	0x17cc
    1500:	2c01      	cmp	r4, #1
    1502:	d105      	bne.n	0x1510
    1504:	2000      	movs	r0, #0
    1506:	49eb      	ldr	r1, [pc, #940]	; (0x18b4)
    1508:	6048      	str	r0, [r1, #4]
    150a:	f001 ffa9 	bl	0x3460
    150e:	e00b      	b.n	0x1528
    1510:	2c00      	cmp	r4, #0
    1512:	d105      	bne.n	0x1520
    1514:	2001      	movs	r0, #1
    1516:	49e7      	ldr	r1, [pc, #924]	; (0x18b4)
    1518:	6048      	str	r0, [r1, #4]
    151a:	f001 ffa1 	bl	0x3460
    151e:	e003      	b.n	0x1528
    1520:	20ff      	movs	r0, #255	; 0xff
    1522:	49e3      	ldr	r1, [pc, #908]	; (0x18b0)
    1524:	7048      	strb	r0, [r1, #1]
    1526:	7088      	strb	r0, [r1, #2]
    1528:	e20f      	b.n	0x194a
    152a:	2c01      	cmp	r4, #1
    152c:	d105      	bne.n	0x153a
    152e:	2000      	movs	r0, #0
    1530:	49e0      	ldr	r1, [pc, #896]	; (0x18b4)
    1532:	6008      	str	r0, [r1, #0]
    1534:	f001 ff94 	bl	0x3460
    1538:	e00b      	b.n	0x1552
    153a:	2c00      	cmp	r4, #0
    153c:	d105      	bne.n	0x154a
    153e:	2001      	movs	r0, #1
    1540:	49dc      	ldr	r1, [pc, #880]	; (0x18b4)
    1542:	6008      	str	r0, [r1, #0]
    1544:	f001 ff8c 	bl	0x3460
    1548:	e003      	b.n	0x1552
    154a:	20ff      	movs	r0, #255	; 0xff
    154c:	49d8      	ldr	r1, [pc, #864]	; (0x18b0)
    154e:	7048      	strb	r0, [r1, #1]
    1550:	7088      	strb	r0, [r1, #2]
    1552:	e1fa      	b.n	0x194a
    1554:	2c01      	cmp	r4, #1
    1556:	d105      	bne.n	0x1564
    1558:	2000      	movs	r0, #0
    155a:	49d6      	ldr	r1, [pc, #856]	; (0x18b4)
    155c:	60c8      	str	r0, [r1, #12]
    155e:	f001 ff7f 	bl	0x3460
    1562:	e00b      	b.n	0x157c
    1564:	2c00      	cmp	r4, #0
    1566:	d105      	bne.n	0x1574
    1568:	2001      	movs	r0, #1
    156a:	49d2      	ldr	r1, [pc, #840]	; (0x18b4)
    156c:	60c8      	str	r0, [r1, #12]
    156e:	f001 ff77 	bl	0x3460
    1572:	e003      	b.n	0x157c
    1574:	20ff      	movs	r0, #255	; 0xff
    1576:	49ce      	ldr	r1, [pc, #824]	; (0x18b0)
    1578:	7048      	strb	r0, [r1, #1]
    157a:	7088      	strb	r0, [r1, #2]
    157c:	e1e5      	b.n	0x194a
    157e:	2c01      	cmp	r4, #1
    1580:	d105      	bne.n	0x158e
    1582:	2000      	movs	r0, #0
    1584:	49cb      	ldr	r1, [pc, #812]	; (0x18b4)
    1586:	6088      	str	r0, [r1, #8]
    1588:	f001 ff6a 	bl	0x3460
    158c:	e00b      	b.n	0x15a6
    158e:	2c00      	cmp	r4, #0
    1590:	d105      	bne.n	0x159e
    1592:	2001      	movs	r0, #1
    1594:	49c7      	ldr	r1, [pc, #796]	; (0x18b4)
    1596:	6088      	str	r0, [r1, #8]
    1598:	f001 ff62 	bl	0x3460
    159c:	e003      	b.n	0x15a6
    159e:	20ff      	movs	r0, #255	; 0xff
    15a0:	49c3      	ldr	r1, [pc, #780]	; (0x18b0)
    15a2:	7048      	strb	r0, [r1, #1]
    15a4:	7088      	strb	r0, [r1, #2]
    15a6:	e1d0      	b.n	0x194a
    15a8:	e05a      	b.n	0x1660
    15aa:	2c01      	cmp	r4, #1
    15ac:	d105      	bne.n	0x15ba
    15ae:	2000      	movs	r0, #0
    15b0:	49c0      	ldr	r1, [pc, #768]	; (0x18b4)
    15b2:	6148      	str	r0, [r1, #20]
    15b4:	f001 ff54 	bl	0x3460
    15b8:	e012      	b.n	0x15e0
    15ba:	2c00      	cmp	r4, #0
    15bc:	d10c      	bne.n	0x15d8
    15be:	2001      	movs	r0, #1
    15c0:	49bc      	ldr	r1, [pc, #752]	; (0x18b4)
    15c2:	6148      	str	r0, [r1, #20]
    15c4:	f001 ff4c 	bl	0x3460
    15c8:	e00a      	b.n	0x15e0
    15ca:	e0ba      	b.n	0x1742
    15cc:	e05f      	b.n	0x168e
    15ce:	e075      	b.n	0x16bc
    15d0:	e08b      	b.n	0x16ea
    15d2:	e1b9      	b.n	0x1948
    15d4:	e0cc      	b.n	0x1770
    15d6:	e0e2      	b.n	0x179e
    15d8:	20ff      	movs	r0, #255	; 0xff
    15da:	49b5      	ldr	r1, [pc, #724]	; (0x18b0)
    15dc:	7048      	strb	r0, [r1, #1]
    15de:	7088      	strb	r0, [r1, #2]
    15e0:	e1b3      	b.n	0x194a
    15e2:	2c01      	cmp	r4, #1
    15e4:	d105      	bne.n	0x15f2
    15e6:	2000      	movs	r0, #0
    15e8:	49b2      	ldr	r1, [pc, #712]	; (0x18b4)
    15ea:	6108      	str	r0, [r1, #16]
    15ec:	f001 ff38 	bl	0x3460
    15f0:	e00b      	b.n	0x160a
    15f2:	2c00      	cmp	r4, #0
    15f4:	d105      	bne.n	0x1602
    15f6:	2001      	movs	r0, #1
    15f8:	49ae      	ldr	r1, [pc, #696]	; (0x18b4)
    15fa:	6108      	str	r0, [r1, #16]
    15fc:	f001 ff30 	bl	0x3460
    1600:	e003      	b.n	0x160a
    1602:	20ff      	movs	r0, #255	; 0xff
    1604:	49aa      	ldr	r1, [pc, #680]	; (0x18b0)
    1606:	7048      	strb	r0, [r1, #1]
    1608:	7088      	strb	r0, [r1, #2]
    160a:	e19e      	b.n	0x194a
    160c:	2c01      	cmp	r4, #1
    160e:	d105      	bne.n	0x161c
    1610:	2000      	movs	r0, #0
    1612:	49a8      	ldr	r1, [pc, #672]	; (0x18b4)
    1614:	61c8      	str	r0, [r1, #28]
    1616:	f001 ff23 	bl	0x3460
    161a:	e00b      	b.n	0x1634
    161c:	2c00      	cmp	r4, #0
    161e:	d105      	bne.n	0x162c
    1620:	2001      	movs	r0, #1
    1622:	49a4      	ldr	r1, [pc, #656]	; (0x18b4)
    1624:	61c8      	str	r0, [r1, #28]
    1626:	f001 ff1b 	bl	0x3460
    162a:	e003      	b.n	0x1634
    162c:	20ff      	movs	r0, #255	; 0xff
    162e:	49a0      	ldr	r1, [pc, #640]	; (0x18b0)
    1630:	7048      	strb	r0, [r1, #1]
    1632:	7088      	strb	r0, [r1, #2]
    1634:	e189      	b.n	0x194a
    1636:	2c01      	cmp	r4, #1
    1638:	d105      	bne.n	0x1646
    163a:	2000      	movs	r0, #0
    163c:	499d      	ldr	r1, [pc, #628]	; (0x18b4)
    163e:	6188      	str	r0, [r1, #24]
    1640:	f001 ff0e 	bl	0x3460
    1644:	e00b      	b.n	0x165e
    1646:	2c00      	cmp	r4, #0
    1648:	d105      	bne.n	0x1656
    164a:	2001      	movs	r0, #1
    164c:	4999      	ldr	r1, [pc, #612]	; (0x18b4)
    164e:	6188      	str	r0, [r1, #24]
    1650:	f001 ff06 	bl	0x3460
    1654:	e003      	b.n	0x165e
    1656:	20ff      	movs	r0, #255	; 0xff
    1658:	4995      	ldr	r1, [pc, #596]	; (0x18b0)
    165a:	7048      	strb	r0, [r1, #1]
    165c:	7088      	strb	r0, [r1, #2]
    165e:	e174      	b.n	0x194a
    1660:	2c01      	cmp	r4, #1
    1662:	d106      	bne.n	0x1672
    1664:	2000      	movs	r0, #0
    1666:	4993      	ldr	r1, [pc, #588]	; (0x18b4)
    1668:	3180      	adds	r1, #128	; 0x80
    166a:	6108      	str	r0, [r1, #16]
    166c:	f001 fef8 	bl	0x3460
    1670:	e00c      	b.n	0x168c
    1672:	2c00      	cmp	r4, #0
    1674:	d106      	bne.n	0x1684
    1676:	2001      	movs	r0, #1
    1678:	498e      	ldr	r1, [pc, #568]	; (0x18b4)
    167a:	3180      	adds	r1, #128	; 0x80
    167c:	6108      	str	r0, [r1, #16]
    167e:	f001 feef 	bl	0x3460
    1682:	e003      	b.n	0x168c
    1684:	20ff      	movs	r0, #255	; 0xff
    1686:	498a      	ldr	r1, [pc, #552]	; (0x18b0)
    1688:	7048      	strb	r0, [r1, #1]
    168a:	7088      	strb	r0, [r1, #2]
    168c:	e15d      	b.n	0x194a
    168e:	2c01      	cmp	r4, #1
    1690:	d106      	bne.n	0x16a0
    1692:	2000      	movs	r0, #0
    1694:	4987      	ldr	r1, [pc, #540]	; (0x18b4)
    1696:	3180      	adds	r1, #128	; 0x80
    1698:	6148      	str	r0, [r1, #20]
    169a:	f001 fee1 	bl	0x3460
    169e:	e00c      	b.n	0x16ba
    16a0:	2c00      	cmp	r4, #0
    16a2:	d106      	bne.n	0x16b2
    16a4:	2001      	movs	r0, #1
    16a6:	4983      	ldr	r1, [pc, #524]	; (0x18b4)
    16a8:	3180      	adds	r1, #128	; 0x80
    16aa:	6148      	str	r0, [r1, #20]
    16ac:	f001 fed8 	bl	0x3460
    16b0:	e003      	b.n	0x16ba
    16b2:	20ff      	movs	r0, #255	; 0xff
    16b4:	497e      	ldr	r1, [pc, #504]	; (0x18b0)
    16b6:	7048      	strb	r0, [r1, #1]
    16b8:	7088      	strb	r0, [r1, #2]
    16ba:	e146      	b.n	0x194a
    16bc:	2c01      	cmp	r4, #1
    16be:	d106      	bne.n	0x16ce
    16c0:	2000      	movs	r0, #0
    16c2:	497c      	ldr	r1, [pc, #496]	; (0x18b4)
    16c4:	3140      	adds	r1, #64	; 0x40
    16c6:	6188      	str	r0, [r1, #24]
    16c8:	f001 feca 	bl	0x3460
    16cc:	e00c      	b.n	0x16e8
    16ce:	2c00      	cmp	r4, #0
    16d0:	d106      	bne.n	0x16e0
    16d2:	2001      	movs	r0, #1
    16d4:	4977      	ldr	r1, [pc, #476]	; (0x18b4)
    16d6:	3140      	adds	r1, #64	; 0x40
    16d8:	6188      	str	r0, [r1, #24]
    16da:	f001 fec1 	bl	0x3460
    16de:	e003      	b.n	0x16e8
    16e0:	20ff      	movs	r0, #255	; 0xff
    16e2:	4973      	ldr	r1, [pc, #460]	; (0x18b0)
    16e4:	7048      	strb	r0, [r1, #1]
    16e6:	7088      	strb	r0, [r1, #2]
    16e8:	e12f      	b.n	0x194a
    16ea:	2c01      	cmp	r4, #1
    16ec:	d106      	bne.n	0x16fc
    16ee:	2000      	movs	r0, #0
    16f0:	4970      	ldr	r1, [pc, #448]	; (0x18b4)
    16f2:	3140      	adds	r1, #64	; 0x40
    16f4:	61c8      	str	r0, [r1, #28]
    16f6:	f001 feb3 	bl	0x3460
    16fa:	e00c      	b.n	0x1716
    16fc:	2c00      	cmp	r4, #0
    16fe:	d106      	bne.n	0x170e
    1700:	2001      	movs	r0, #1
    1702:	496c      	ldr	r1, [pc, #432]	; (0x18b4)
    1704:	3140      	adds	r1, #64	; 0x40
    1706:	61c8      	str	r0, [r1, #28]
    1708:	f001 feaa 	bl	0x3460
    170c:	e003      	b.n	0x1716
    170e:	20ff      	movs	r0, #255	; 0xff
    1710:	4967      	ldr	r1, [pc, #412]	; (0x18b0)
    1712:	7048      	strb	r0, [r1, #1]
    1714:	7088      	strb	r0, [r1, #2]
    1716:	e118      	b.n	0x194a
    1718:	2c01      	cmp	r4, #1
    171a:	d105      	bne.n	0x1728
    171c:	2000      	movs	r0, #0
    171e:	4965      	ldr	r1, [pc, #404]	; (0x18b4)
    1720:	6208      	str	r0, [r1, #32]
    1722:	f001 fe9d 	bl	0x3460
    1726:	e00b      	b.n	0x1740
    1728:	2c00      	cmp	r4, #0
    172a:	d105      	bne.n	0x1738
    172c:	2001      	movs	r0, #1
    172e:	4961      	ldr	r1, [pc, #388]	; (0x18b4)
    1730:	6208      	str	r0, [r1, #32]
    1732:	f001 fe95 	bl	0x3460
    1736:	e003      	b.n	0x1740
    1738:	20ff      	movs	r0, #255	; 0xff
    173a:	495d      	ldr	r1, [pc, #372]	; (0x18b0)
    173c:	7048      	strb	r0, [r1, #1]
    173e:	7088      	strb	r0, [r1, #2]
    1740:	e103      	b.n	0x194a
    1742:	2c01      	cmp	r4, #1
    1744:	d106      	bne.n	0x1754
    1746:	2000      	movs	r0, #0
    1748:	495a      	ldr	r1, [pc, #360]	; (0x18b4)
    174a:	3180      	adds	r1, #128	; 0x80
    174c:	6088      	str	r0, [r1, #8]
    174e:	f001 fe87 	bl	0x3460
    1752:	e00c      	b.n	0x176e
    1754:	2c00      	cmp	r4, #0
    1756:	d106      	bne.n	0x1766
    1758:	2001      	movs	r0, #1
    175a:	4956      	ldr	r1, [pc, #344]	; (0x18b4)
    175c:	3180      	adds	r1, #128	; 0x80
    175e:	6088      	str	r0, [r1, #8]
    1760:	f001 fe7e 	bl	0x3460
    1764:	e003      	b.n	0x176e
    1766:	20ff      	movs	r0, #255	; 0xff
    1768:	4951      	ldr	r1, [pc, #324]	; (0x18b0)
    176a:	7048      	strb	r0, [r1, #1]
    176c:	7088      	strb	r0, [r1, #2]
    176e:	e0ec      	b.n	0x194a
    1770:	2c01      	cmp	r4, #1
    1772:	d106      	bne.n	0x1782
    1774:	2000      	movs	r0, #0
    1776:	494f      	ldr	r1, [pc, #316]	; (0x18b4)
    1778:	3140      	adds	r1, #64	; 0x40
    177a:	6208      	str	r0, [r1, #32]
    177c:	f001 fe70 	bl	0x3460
    1780:	e00c      	b.n	0x179c
    1782:	2c00      	cmp	r4, #0
    1784:	d106      	bne.n	0x1794
    1786:	2001      	movs	r0, #1
    1788:	494a      	ldr	r1, [pc, #296]	; (0x18b4)
    178a:	3140      	adds	r1, #64	; 0x40
    178c:	6208      	str	r0, [r1, #32]
    178e:	f001 fe67 	bl	0x3460
    1792:	e003      	b.n	0x179c
    1794:	20ff      	movs	r0, #255	; 0xff
    1796:	4946      	ldr	r1, [pc, #280]	; (0x18b0)
    1798:	7048      	strb	r0, [r1, #1]
    179a:	7088      	strb	r0, [r1, #2]
    179c:	e0d5      	b.n	0x194a
    179e:	2c01      	cmp	r4, #1
    17a0:	d106      	bne.n	0x17b0
    17a2:	2000      	movs	r0, #0
    17a4:	4943      	ldr	r1, [pc, #268]	; (0x18b4)
    17a6:	3140      	adds	r1, #64	; 0x40
    17a8:	6248      	str	r0, [r1, #36]	; 0x24
    17aa:	f001 fe59 	bl	0x3460
    17ae:	e00c      	b.n	0x17ca
    17b0:	2c00      	cmp	r4, #0
    17b2:	d106      	bne.n	0x17c2
    17b4:	2001      	movs	r0, #1
    17b6:	493f      	ldr	r1, [pc, #252]	; (0x18b4)
    17b8:	3140      	adds	r1, #64	; 0x40
    17ba:	6248      	str	r0, [r1, #36]	; 0x24
    17bc:	f001 fe50 	bl	0x3460
    17c0:	e003      	b.n	0x17ca
    17c2:	20ff      	movs	r0, #255	; 0xff
    17c4:	493a      	ldr	r1, [pc, #232]	; (0x18b0)
    17c6:	7048      	strb	r0, [r1, #1]
    17c8:	7088      	strb	r0, [r1, #2]
    17ca:	e0be      	b.n	0x194a
    17cc:	2cff      	cmp	r4, #255	; 0xff
    17ce:	d157      	bne.n	0x1880
    17d0:	2000      	movs	r0, #0
    17d2:	4938      	ldr	r1, [pc, #224]	; (0x18b4)
    17d4:	6048      	str	r0, [r1, #4]
    17d6:	f001 fe43 	bl	0x3460
    17da:	2000      	movs	r0, #0
    17dc:	4935      	ldr	r1, [pc, #212]	; (0x18b4)
    17de:	6008      	str	r0, [r1, #0]
    17e0:	f001 fe3e 	bl	0x3460
    17e4:	2000      	movs	r0, #0
    17e6:	4933      	ldr	r1, [pc, #204]	; (0x18b4)
    17e8:	60c8      	str	r0, [r1, #12]
    17ea:	f001 fe39 	bl	0x3460
    17ee:	2000      	movs	r0, #0
    17f0:	4930      	ldr	r1, [pc, #192]	; (0x18b4)
    17f2:	6088      	str	r0, [r1, #8]
    17f4:	f001 fe34 	bl	0x3460
    17f8:	2000      	movs	r0, #0
    17fa:	492e      	ldr	r1, [pc, #184]	; (0x18b4)
    17fc:	6148      	str	r0, [r1, #20]
    17fe:	f001 fe2f 	bl	0x3460
    1802:	2000      	movs	r0, #0
    1804:	492b      	ldr	r1, [pc, #172]	; (0x18b4)
    1806:	6108      	str	r0, [r1, #16]
    1808:	f001 fe2a 	bl	0x3460
    180c:	2000      	movs	r0, #0
    180e:	4929      	ldr	r1, [pc, #164]	; (0x18b4)
    1810:	61c8      	str	r0, [r1, #28]
    1812:	f001 fe25 	bl	0x3460
    1816:	2000      	movs	r0, #0
    1818:	4926      	ldr	r1, [pc, #152]	; (0x18b4)
    181a:	6188      	str	r0, [r1, #24]
    181c:	f001 fe20 	bl	0x3460
    1820:	2000      	movs	r0, #0
    1822:	4924      	ldr	r1, [pc, #144]	; (0x18b4)
    1824:	3180      	adds	r1, #128	; 0x80
    1826:	6108      	str	r0, [r1, #16]
    1828:	f001 fe1a 	bl	0x3460
    182c:	2000      	movs	r0, #0
    182e:	4921      	ldr	r1, [pc, #132]	; (0x18b4)
    1830:	3180      	adds	r1, #128	; 0x80
    1832:	6148      	str	r0, [r1, #20]
    1834:	f001 fe14 	bl	0x3460
    1838:	2000      	movs	r0, #0
    183a:	491e      	ldr	r1, [pc, #120]	; (0x18b4)
    183c:	3140      	adds	r1, #64	; 0x40
    183e:	6188      	str	r0, [r1, #24]
    1840:	f001 fe0e 	bl	0x3460
    1844:	2000      	movs	r0, #0
    1846:	491b      	ldr	r1, [pc, #108]	; (0x18b4)
    1848:	3140      	adds	r1, #64	; 0x40
    184a:	61c8      	str	r0, [r1, #28]
    184c:	f001 fe08 	bl	0x3460
    1850:	2000      	movs	r0, #0
    1852:	4918      	ldr	r1, [pc, #96]	; (0x18b4)
    1854:	6208      	str	r0, [r1, #32]
    1856:	f001 fe03 	bl	0x3460
    185a:	2000      	movs	r0, #0
    185c:	4915      	ldr	r1, [pc, #84]	; (0x18b4)
    185e:	3180      	adds	r1, #128	; 0x80
    1860:	6088      	str	r0, [r1, #8]
    1862:	f001 fdfd 	bl	0x3460
    1866:	2000      	movs	r0, #0
    1868:	4912      	ldr	r1, [pc, #72]	; (0x18b4)
    186a:	3140      	adds	r1, #64	; 0x40
    186c:	6208      	str	r0, [r1, #32]
    186e:	f001 fdf7 	bl	0x3460
    1872:	2000      	movs	r0, #0
    1874:	490f      	ldr	r1, [pc, #60]	; (0x18b4)
    1876:	3140      	adds	r1, #64	; 0x40
    1878:	6248      	str	r0, [r1, #36]	; 0x24
    187a:	f001 fdf1 	bl	0x3460
    187e:	e062      	b.n	0x1946
    1880:	2cf0      	cmp	r4, #240	; 0xf0
    1882:	d15c      	bne.n	0x193e
    1884:	2001      	movs	r0, #1
    1886:	490b      	ldr	r1, [pc, #44]	; (0x18b4)
    1888:	6048      	str	r0, [r1, #4]
    188a:	f001 fde9 	bl	0x3460
    188e:	2001      	movs	r0, #1
    1890:	4908      	ldr	r1, [pc, #32]	; (0x18b4)
    1892:	6008      	str	r0, [r1, #0]
    1894:	f001 fde4 	bl	0x3460
    1898:	2001      	movs	r0, #1
    189a:	4906      	ldr	r1, [pc, #24]	; (0x18b4)
    189c:	60c8      	str	r0, [r1, #12]
    189e:	f001 fddf 	bl	0x3460
    18a2:	2001      	movs	r0, #1
    18a4:	4903      	ldr	r1, [pc, #12]	; (0x18b4)
    18a6:	6088      	str	r0, [r1, #8]
    18a8:	f001 fdda 	bl	0x3460
    18ac:	2001      	movs	r0, #1
    18ae:	e003      	b.n	0x18b8

    18b0:	200002d0      	;
    18b4:	50004200      	;	GPIO registers for PORT0

    18b8:	4927      	ldr	r1, [pc, #156]	; (0x1958)
    18ba:	6148      	str	r0, [r1, #20]
    18bc:	f001 fdd0 	bl	0x3460
    18c0:	2001      	movs	r0, #1
    18c2:	4925      	ldr	r1, [pc, #148]	; (0x1958)
    18c4:	6108      	str	r0, [r1, #16]
    18c6:	f001 fdcb 	bl	0x3460
    18ca:	2001      	movs	r0, #1
    18cc:	4922      	ldr	r1, [pc, #136]	; (0x1958)
    18ce:	61c8      	str	r0, [r1, #28]
    18d0:	f001 fdc6 	bl	0x3460
    18d4:	2001      	movs	r0, #1
    18d6:	4920      	ldr	r1, [pc, #128]	; (0x1958)
    18d8:	6188      	str	r0, [r1, #24]
    18da:	f001 fdc1 	bl	0x3460
    18de:	2001      	movs	r0, #1
    18e0:	491d      	ldr	r1, [pc, #116]	; (0x1958)
    18e2:	3180      	adds	r1, #128	; 0x80
    18e4:	6108      	str	r0, [r1, #16]
    18e6:	f001 fdbb 	bl	0x3460
    18ea:	2001      	movs	r0, #1
    18ec:	491a      	ldr	r1, [pc, #104]	; (0x1958)
    18ee:	3180      	adds	r1, #128	; 0x80
    18f0:	6148      	str	r0, [r1, #20]
    18f2:	f001 fdb5 	bl	0x3460
    18f6:	2001      	movs	r0, #1
    18f8:	4917      	ldr	r1, [pc, #92]	; (0x1958)
    18fa:	3140      	adds	r1, #64	; 0x40
    18fc:	6188      	str	r0, [r1, #24]
    18fe:	f001 fdaf 	bl	0x3460
    1902:	2001      	movs	r0, #1
    1904:	4914      	ldr	r1, [pc, #80]	; (0x1958)
    1906:	3140      	adds	r1, #64	; 0x40
    1908:	61c8      	str	r0, [r1, #28]
    190a:	f001 fda9 	bl	0x3460
    190e:	2001      	movs	r0, #1
    1910:	4911      	ldr	r1, [pc, #68]	; (0x1958)
    1912:	6208      	str	r0, [r1, #32]
    1914:	f001 fda4 	bl	0x3460
    1918:	2001      	movs	r0, #1
    191a:	490f      	ldr	r1, [pc, #60]	; (0x1958)
    191c:	3180      	adds	r1, #128	; 0x80
    191e:	6088      	str	r0, [r1, #8]
    1920:	f001 fd9e 	bl	0x3460
    1924:	2001      	movs	r0, #1
    1926:	490c      	ldr	r1, [pc, #48]	; (0x1958)
    1928:	3140      	adds	r1, #64	; 0x40
    192a:	6208      	str	r0, [r1, #32]
    192c:	f001 fd98 	bl	0x3460
    1930:	2001      	movs	r0, #1
    1932:	4909      	ldr	r1, [pc, #36]	; (0x1958)
    1934:	3140      	adds	r1, #64	; 0x40
    1936:	6248      	str	r0, [r1, #36]	; 0x24
    1938:	f001 fd92 	bl	0x3460
    193c:	e003      	b.n	0x1946
    193e:	20ff      	movs	r0, #255	; 0xff
    1940:	4906      	ldr	r1, [pc, #24]	; (0x195c)
    1942:	7048      	strb	r0, [r1, #1]
    1944:	7088      	strb	r0, [r1, #2]
    1946:	e000      	b.n	0x194a
    1948:	bf00      	nop

    194a:	bf00      	nop
    194c:	2104      	movs	r1, #4
    194e:	2000      	movs	r0, #0
    1950:	f000 fafe 	bl	0x1f50
    1954:	bd70      	pop	{r4, r5, r6, pc}
    1956:	0000      	movs	r0, r0

    1958:	50004200      	;	GPIO registers for PORT0
    195c:	200002d0      	;

EEPROM?
    1960:	b570      	push	{r4, r5, r6, lr}
    1962:	4604      	mov	r4, r0
    1964:	4620      	mov	r0, r4
    1966:	f000 fa3d 	bl	0x1de4
    196a:	4605      	mov	r5, r0
    196c:	bd70      	pop	{r4, r5, r6, pc}
    196e:	0000      	movs	r0, r0
    1970:	b570      	push	{r4, r5, r6, lr}
    1972:	4604      	mov	r4, r0
    1974:	4d89      	ldr	r5, [pc, #548]	; (0x1b9c)
    1976:	682d      	ldr	r5, [r5, #0]
    1978:	2620      	movs	r6, #32
    197a:	4335      	orrs	r5, r6
    197c:	4e87      	ldr	r6, [pc, #540]	; (0x1b9c)
    197e:	6035      	str	r5, [r6, #0]
    1980:	4635      	mov	r5, r6
    1982:	682d      	ldr	r5, [r5, #0]
    1984:	2608      	movs	r6, #8
    1986:	4335      	orrs	r5, r6
    1988:	4e84      	ldr	r6, [pc, #528]	; (0x1b9c)
    198a:	6035      	str	r5, [r6, #0]
    198c:	bf00      	nop
    198e:	4d83      	ldr	r5, [pc, #524]	; (0x1b9c)
    1990:	682d      	ldr	r5, [r5, #0]
    1992:	2608      	movs	r6, #8
    1994:	4035      	ands	r5, r6
    1996:	2d08      	cmp	r5, #8
    1998:	d1f9      	bne.n	0x198e
    199a:	4d80      	ldr	r5, [pc, #512]	; (0x1b9c)
    199c:	682d      	ldr	r5, [r5, #0]
    199e:	2628      	movs	r6, #40	; 0x28
    19a0:	43b5      	bics	r5, r6
    19a2:	4e7e      	ldr	r6, [pc, #504]	; (0x1b9c)
    19a4:	6035      	str	r5, [r6, #0]
    19a6:	bf00      	nop
    19a8:	4d7c      	ldr	r5, [pc, #496]	; (0x1b9c)
    19aa:	68ed      	ldr	r5, [r5, #12]
    19ac:	2d08      	cmp	r5, #8
    19ae:	d1fb      	bne.n	0x19a8
    19b0:	25a0      	movs	r5, #160	; 0xa0
    19b2:	4e7a      	ldr	r6, [pc, #488]	; (0x1b9c)
    19b4:	60b5      	str	r5, [r6, #8]
    19b6:	4635      	mov	r5, r6
    19b8:	682d      	ldr	r5, [r5, #0]
    19ba:	2608      	movs	r6, #8
    19bc:	4335      	orrs	r5, r6
    19be:	4e77      	ldr	r6, [pc, #476]	; (0x1b9c)
    19c0:	6035      	str	r5, [r6, #0]
    19c2:	bf00      	nop
    19c4:	4d75      	ldr	r5, [pc, #468]	; (0x1b9c)
    19c6:	682d      	ldr	r5, [r5, #0]
    19c8:	2608      	movs	r6, #8
    19ca:	4035      	ands	r5, r6
    19cc:	2d08      	cmp	r5, #8
    19ce:	d1f9      	bne.n	0x19c4
    19d0:	bf00      	nop
    19d2:	4d72      	ldr	r5, [pc, #456]	; (0x1b9c)
    19d4:	68ed      	ldr	r5, [r5, #12]
    19d6:	2d18      	cmp	r5, #24
    19d8:	d1fb      	bne.n	0x19d2
    19da:	0425      	lsls	r5, r4, #16
    19dc:	0e2d      	lsrs	r5, r5, #24
    19de:	4e6f      	ldr	r6, [pc, #444]	; (0x1b9c)
    19e0:	60b5      	str	r5, [r6, #8]
    19e2:	4635      	mov	r5, r6
    19e4:	682d      	ldr	r5, [r5, #0]
    19e6:	2608      	movs	r6, #8
    19e8:	4335      	orrs	r5, r6
    19ea:	4e6c      	ldr	r6, [pc, #432]	; (0x1b9c)
    19ec:	6035      	str	r5, [r6, #0]
    19ee:	bf00      	nop
    19f0:	4d6a      	ldr	r5, [pc, #424]	; (0x1b9c)
    19f2:	682d      	ldr	r5, [r5, #0]
    19f4:	2608      	movs	r6, #8
    19f6:	4035      	ands	r5, r6
    19f8:	2d08      	cmp	r5, #8
    19fa:	d1f9      	bne.n	0x19f0
    19fc:	bf00      	nop
    19fe:	4d67      	ldr	r5, [pc, #412]	; (0x1b9c)
    1a00:	68ed      	ldr	r5, [r5, #12]
    1a02:	2d28      	cmp	r5, #40	; 0x28
    1a04:	d1fb      	bne.n	0x19fe
    1a06:	b2e5      	uxtb	r5, r4
    1a08:	4e64      	ldr	r6, [pc, #400]	; (0x1b9c)
    1a0a:	60b5      	str	r5, [r6, #8]
    1a0c:	4635      	mov	r5, r6
    1a0e:	682d      	ldr	r5, [r5, #0]
    1a10:	2608      	movs	r6, #8
    1a12:	4335      	orrs	r5, r6
    1a14:	4e61      	ldr	r6, [pc, #388]	; (0x1b9c)
    1a16:	6035      	str	r5, [r6, #0]
    1a18:	bf00      	nop
    1a1a:	4d60      	ldr	r5, [pc, #384]	; (0x1b9c)
    1a1c:	682d      	ldr	r5, [r5, #0]
    1a1e:	2608      	movs	r6, #8
    1a20:	4035      	ands	r5, r6
    1a22:	2d08      	cmp	r5, #8
    1a24:	d1f9      	bne.n	0x1a1a
    1a26:	bf00      	nop
    1a28:	4d5c      	ldr	r5, [pc, #368]	; (0x1b9c)
    1a2a:	68ed      	ldr	r5, [r5, #12]
    1a2c:	2d28      	cmp	r5, #40	; 0x28
    1a2e:	d1fb      	bne.n	0x1a28
    1a30:	4d5a      	ldr	r5, [pc, #360]	; (0x1b9c)
    1a32:	682d      	ldr	r5, [r5, #0]
    1a34:	2620      	movs	r6, #32
    1a36:	4335      	orrs	r5, r6
    1a38:	4e58      	ldr	r6, [pc, #352]	; (0x1b9c)
    1a3a:	6035      	str	r5, [r6, #0]
    1a3c:	4635      	mov	r5, r6
    1a3e:	682d      	ldr	r5, [r5, #0]
    1a40:	2608      	movs	r6, #8
    1a42:	4335      	orrs	r5, r6
    1a44:	4e55      	ldr	r6, [pc, #340]	; (0x1b9c)
    1a46:	6035      	str	r5, [r6, #0]
    1a48:	bf00      	nop
    1a4a:	4d54      	ldr	r5, [pc, #336]	; (0x1b9c)
    1a4c:	682d      	ldr	r5, [r5, #0]
    1a4e:	2608      	movs	r6, #8
    1a50:	4035      	ands	r5, r6
    1a52:	2d08      	cmp	r5, #8
    1a54:	d1f9      	bne.n	0x1a4a
    1a56:	4d51      	ldr	r5, [pc, #324]	; (0x1b9c)
    1a58:	682d      	ldr	r5, [r5, #0]
    1a5a:	2628      	movs	r6, #40	; 0x28
    1a5c:	43b5      	bics	r5, r6
    1a5e:	4e4f      	ldr	r6, [pc, #316]	; (0x1b9c)
    1a60:	6035      	str	r5, [r6, #0]
    1a62:	bf00      	nop
    1a64:	4d4d      	ldr	r5, [pc, #308]	; (0x1b9c)
    1a66:	68ed      	ldr	r5, [r5, #12]
    1a68:	2d10      	cmp	r5, #16
    1a6a:	d1fb      	bne.n	0x1a64
    1a6c:	25a1      	movs	r5, #161	; 0xa1
    1a6e:	4e4b      	ldr	r6, [pc, #300]	; (0x1b9c)
    1a70:	60b5      	str	r5, [r6, #8]
    1a72:	4635      	mov	r5, r6
    1a74:	682d      	ldr	r5, [r5, #0]
    1a76:	2608      	movs	r6, #8
    1a78:	4335      	orrs	r5, r6
    1a7a:	4e48      	ldr	r6, [pc, #288]	; (0x1b9c)
    1a7c:	6035      	str	r5, [r6, #0]
    1a7e:	bf00      	nop
    1a80:	4d46      	ldr	r5, [pc, #280]	; (0x1b9c)
    1a82:	682d      	ldr	r5, [r5, #0]
    1a84:	2608      	movs	r6, #8
    1a86:	4035      	ands	r5, r6
    1a88:	2d08      	cmp	r5, #8
    1a8a:	d1f9      	bne.n	0x1a80
    1a8c:	bf00      	nop
    1a8e:	4d43      	ldr	r5, [pc, #268]	; (0x1b9c)
    1a90:	68ed      	ldr	r5, [r5, #12]
    1a92:	2d40      	cmp	r5, #64	; 0x40
    1a94:	d1fb      	bne.n	0x1a8e
    1a96:	4d41      	ldr	r5, [pc, #260]	; (0x1b9c)
    1a98:	682d      	ldr	r5, [r5, #0]
    1a9a:	2604      	movs	r6, #4
    1a9c:	4335      	orrs	r5, r6
    1a9e:	4e3f      	ldr	r6, [pc, #252]	; (0x1b9c)
    1aa0:	6035      	str	r5, [r6, #0]
    1aa2:	2b00      	cmp	r3, #0
    1aa4:	d037      	beq.n	0x1b16
    1aa6:	2000      	movs	r0, #0
    1aa8:	e032      	b.n	0x1b10
    1aaa:	4d3c      	ldr	r5, [pc, #240]	; (0x1b9c)
    1aac:	682d      	ldr	r5, [r5, #0]
    1aae:	2608      	movs	r6, #8
    1ab0:	4335      	orrs	r5, r6
    1ab2:	4e3a      	ldr	r6, [pc, #232]	; (0x1b9c)
    1ab4:	6035      	str	r5, [r6, #0]
    1ab6:	bf00      	nop
    1ab8:	4d38      	ldr	r5, [pc, #224]	; (0x1b9c)
    1aba:	682d      	ldr	r5, [r5, #0]
    1abc:	2608      	movs	r6, #8
    1abe:	4035      	ands	r5, r6
    1ac0:	2d08      	cmp	r5, #8
    1ac2:	d1f9      	bne.n	0x1ab8
    1ac4:	bf00      	nop
    1ac6:	4d35      	ldr	r5, [pc, #212]	; (0x1b9c)
    1ac8:	68ed      	ldr	r5, [r5, #12]
    1aca:	2d50      	cmp	r5, #80	; 0x50
    1acc:	d1fb      	bne.n	0x1ac6
    1ace:	4d33      	ldr	r5, [pc, #204]	; (0x1b9c)
    1ad0:	68ad      	ldr	r5, [r5, #8]
    1ad2:	800d      	strh	r5, [r1, #0]
    1ad4:	780d      	ldrb	r5, [r1, #0]
    1ad6:	062d      	lsls	r5, r5, #24
    1ad8:	0c2d      	lsrs	r5, r5, #16
    1ada:	800d      	strh	r5, [r1, #0]
    1adc:	4d2f      	ldr	r5, [pc, #188]	; (0x1b9c)
    1ade:	682d      	ldr	r5, [r5, #0]
    1ae0:	2608      	movs	r6, #8
    1ae2:	4335      	orrs	r5, r6
    1ae4:	4e2d      	ldr	r6, [pc, #180]	; (0x1b9c)
    1ae6:	6035      	str	r5, [r6, #0]
    1ae8:	bf00      	nop
    1aea:	4d2c      	ldr	r5, [pc, #176]	; (0x1b9c)
    1aec:	682d      	ldr	r5, [r5, #0]
    1aee:	2608      	movs	r6, #8
    1af0:	4035      	ands	r5, r6
    1af2:	2d08      	cmp	r5, #8
    1af4:	d1f9      	bne.n	0x1aea
    1af6:	bf00      	nop
    1af8:	4d28      	ldr	r5, [pc, #160]	; (0x1b9c)
    1afa:	68ed      	ldr	r5, [r5, #12]
    1afc:	2d50      	cmp	r5, #80	; 0x50
    1afe:	d1fb      	bne.n	0x1af8
    1b00:	880d      	ldrh	r5, [r1, #0]
    1b02:	4e26      	ldr	r6, [pc, #152]	; (0x1b9c)
    1b04:	68b6      	ldr	r6, [r6, #8]
    1b06:	4335      	orrs	r5, r6
    1b08:	800d      	strh	r5, [r1, #0]
    1b0a:	1c89      	adds	r1, r1, #2
    1b0c:	1c45      	adds	r5, r0, #1
    1b0e:	b2a8      	uxth	r0, r5
    1b10:	4290      	cmp	r0, r2
    1b12:	dbca      	blt.n	0x1aaa
    1b14:	e01b      	b.n	0x1b4e
    1b16:	2000      	movs	r0, #0
    1b18:	e017      	b.n	0x1b4a
    1b1a:	4d20      	ldr	r5, [pc, #128]	; (0x1b9c)
    1b1c:	682d      	ldr	r5, [r5, #0]
    1b1e:	2608      	movs	r6, #8
    1b20:	4335      	orrs	r5, r6
    1b22:	4e1e      	ldr	r6, [pc, #120]	; (0x1b9c)
    1b24:	6035      	str	r5, [r6, #0]
    1b26:	bf00      	nop
    1b28:	4d1c      	ldr	r5, [pc, #112]	; (0x1b9c)
    1b2a:	682d      	ldr	r5, [r5, #0]
    1b2c:	2608      	movs	r6, #8
    1b2e:	4035      	ands	r5, r6
    1b30:	2d08      	cmp	r5, #8
    1b32:	d1f9      	bne.n	0x1b28
    1b34:	bf00      	nop
    1b36:	4d19      	ldr	r5, [pc, #100]	; (0x1b9c)
    1b38:	68ed      	ldr	r5, [r5, #12]
    1b3a:	2d50      	cmp	r5, #80	; 0x50
    1b3c:	d1fb      	bne.n	0x1b36
    1b3e:	4d17      	ldr	r5, [pc, #92]	; (0x1b9c)
    1b40:	68ad      	ldr	r5, [r5, #8]
    1b42:	800d      	strh	r5, [r1, #0]
    1b44:	1c89      	adds	r1, r1, #2
    1b46:	1c45      	adds	r5, r0, #1
    1b48:	b2a8      	uxth	r0, r5
    1b4a:	4290      	cmp	r0, r2
    1b4c:	dbe5      	blt.n	0x1b1a
    1b4e:	4d13      	ldr	r5, [pc, #76]	; (0x1b9c)
    1b50:	682d      	ldr	r5, [r5, #0]
    1b52:	2604      	movs	r6, #4
    1b54:	43b5      	bics	r5, r6
    1b56:	4e11      	ldr	r6, [pc, #68]	; (0x1b9c)
    1b58:	6035      	str	r5, [r6, #0]
    1b5a:	4635      	mov	r5, r6
    1b5c:	682d      	ldr	r5, [r5, #0]
    1b5e:	2608      	movs	r6, #8
    1b60:	4335      	orrs	r5, r6
    1b62:	4e0e      	ldr	r6, [pc, #56]	; (0x1b9c)
    1b64:	6035      	str	r5, [r6, #0]
    1b66:	bf00      	nop
    1b68:	4d0c      	ldr	r5, [pc, #48]	; (0x1b9c)
    1b6a:	682d      	ldr	r5, [r5, #0]
    1b6c:	2608      	movs	r6, #8
    1b6e:	4035      	ands	r5, r6
    1b70:	2d08      	cmp	r5, #8
    1b72:	d1f9      	bne.n	0x1b68
    1b74:	4d09      	ldr	r5, [pc, #36]	; (0x1b9c)
    1b76:	682d      	ldr	r5, [r5, #0]
    1b78:	2610      	movs	r6, #16
    1b7a:	4335      	orrs	r5, r6
    1b7c:	4e07      	ldr	r6, [pc, #28]	; (0x1b9c)
    1b7e:	6035      	str	r5, [r6, #0]
    1b80:	4635      	mov	r5, r6
    1b82:	682d      	ldr	r5, [r5, #0]
    1b84:	2608      	movs	r6, #8
    1b86:	4335      	orrs	r5, r6
    1b88:	4e04      	ldr	r6, [pc, #16]	; (0x1b9c)
    1b8a:	6035      	str	r5, [r6, #0]
    1b8c:	bf00      	nop
    1b8e:	4d03      	ldr	r5, [pc, #12]	; (0x1b9c)
    1b90:	682d      	ldr	r5, [r5, #0]
    1b92:	2610      	movs	r6, #16
    1b94:	4235      	tst	r5, r6
    1b96:	d1fa      	bne.n	0x1b8e
    1b98:	bd70      	pop	{r4, r5, r6, pc}

    1b9a:	0000      	;	padding
    1b9c:	40020000      	;	I2C 0 registers

Wiznet_Read_Address(address):
    1ba0:	b570      	push	{r4, r5, r6, lr}
    1ba2:	4605      	mov	r5, r0				; r5 = parameter1	ADDRESS
    1ba4:	2600      	movs	r6, #0
    1ba6:	2400      	movs	r4, #0
    1ba8:	2000      	movs	r0, #0
    1baa:	490d      	ldr	r1, [pc, #52]	; (0x1be0)	; ???
    1bac:	6308      	str	r0, [r1, #48]	; 0x30
    1bae:	240f      	movs	r4, #15				; or-in MARKER for READ operation (0x0f)
    1bb0:	0424      	lsls	r4, r4, #16
    1bb2:	4620      	mov	r0, r4
    1bb4:	4328      	orrs	r0, r5				; or-in address
    1bb6:	4604      	mov	r4, r0
    1bb8:	0224      	lsls	r4, r4, #8			; no DATA payload when reading register
    1bba:	bf00      	nop
    1bbc:	2120      	movs	r1, #32
    1bbe:	4620      	mov	r0, r4
    1bc0:	f000 f8f8 	bl	0x1db4				; SPI0_Wiznet_StartTX(..., #32)
    1bc4:	bf00      	nop
WaitForReadTxCompletion:
    1bc6:	4807      	ldr	r0, [pc, #28]	; (0x1be4)	; ???
    1bc8:	6800      	ldr	r0, [r0, #0]
    1bca:	07c0      	lsls	r0, r0, #31
    1bcc:	0fc0      	lsrs	r0, r0, #31
    1bce:	d1fa      	bne.n	0x1bc6				; WaitForReadTxCompletion
    1bd0:	4804      	ldr	r0, [pc, #16]	; (0x1be4)	; Read received data from SPI transfer
    1bd2:	6900      	ldr	r0, [r0, #16]
    1bd4:	b2c6      	uxtb	r6, r0				; we only care for lowest 8 bit, but extend to 32 bit.
    1bd6:	2001      	movs	r0, #1
    1bd8:	4901      	ldr	r1, [pc, #4]	; (0x1be0)	; ???
    1bda:	6308      	str	r0, [r1, #48]	; 0x30
    1bdc:	4630      	mov	r0, r6
    1bde:	bd70      	pop	{r4, r5, r6, pc}

    1be0:	50004200      	;	GPIO registers for PORT0
    1be4:	40030000      	;	SPI 0 registers

SPI0_Wiznet_SetTransferLength(TransferLength):
CheckFirstBit:
    1be8:	2820      	cmp	r0, #32				; compare 32 to r0 (parameter1 ALWAYS #32)
    1bea:	dc4f      	bgt.n	0x1c8c
    1bec:	07c1      	lsls	r1, r0, #31
    1bee:	0fc9      	lsrs	r1, r1, #31			; r1 := param1 & 0x01
    1bf0:	d106      	bne.n	0x1c00
    1bf2:	4927      	ldr	r1, [pc, #156]	; (0x1c90)
    1bf4:	6809      	ldr	r1, [r1, #0]			; r1 := SPI0 CNTRL register
    1bf6:	2208      	movs	r2, #8
    1bf8:	4391      	bics	r1, r2
    1bfa:	4a25      	ldr	r2, [pc, #148]	; (0x1c90)
    1bfc:	6011      	str	r1, [r2, #0]			; SPI0 CNTRL register := ???
    1bfe:	e005      	b.n	0x1c0c
    1c00:	4923      	ldr	r1, [pc, #140]	; (0x1c90)
    1c02:	6809      	ldr	r1, [r1, #0]			; r1 := SPI0 CNTRL register
    1c04:	2208      	movs	r2, #8
    1c06:	4311      	orrs	r1, r2				; set bit 4 (TX_BIT_LEN lowest bit)
    1c08:	4a21      	ldr	r2, [pc, #132]	; (0x1c90)
    1c0a:	6011      	str	r1, [r2, #0]			; SPI0 CNTRL register := ???
CheckSecondBit:
    1c0c:	2102      	movs	r1, #2
    1c0e:	4208      	tst	r0, r1
    1c10:	d106      	bne.n	0x1c20
    1c12:	491f      	ldr	r1, [pc, #124]	; (0x1c90)
    1c14:	6809      	ldr	r1, [r1, #0]
    1c16:	2210      	movs	r2, #16
    1c18:	4391      	bics	r1, r2
    1c1a:	4a1d      	ldr	r2, [pc, #116]	; (0x1c90)
    1c1c:	6011      	str	r1, [r2, #0]
    1c1e:	e005      	b.n	0x1c2c
    1c20:	491b      	ldr	r1, [pc, #108]	; (0x1c90)
    1c22:	6809      	ldr	r1, [r1, #0]
    1c24:	2210      	movs	r2, #16
    1c26:	4311      	orrs	r1, r2
    1c28:	4a19      	ldr	r2, [pc, #100]	; (0x1c90)
    1c2a:	6011      	str	r1, [r2, #0]
CheckThirdBit:
    1c2c:	2104      	movs	r1, #4
    1c2e:	4208      	tst	r0, r1
    1c30:	d106      	bne.n	0x1c40
    1c32:	4917      	ldr	r1, [pc, #92]	; (0x1c90)
    1c34:	6809      	ldr	r1, [r1, #0]
    1c36:	2220      	movs	r2, #32
    1c38:	4391      	bics	r1, r2
    1c3a:	4a15      	ldr	r2, [pc, #84]	; (0x1c90)
    1c3c:	6011      	str	r1, [r2, #0]
    1c3e:	e005      	b.n	0x1c4c
    1c40:	4913      	ldr	r1, [pc, #76]	; (0x1c90)
    1c42:	6809      	ldr	r1, [r1, #0]
    1c44:	2220      	movs	r2, #32
    1c46:	4311      	orrs	r1, r2
    1c48:	4a11      	ldr	r2, [pc, #68]	; (0x1c90)
    1c4a:	6011      	str	r1, [r2, #0]
CheckFourthBit:
    1c4c:	2108      	movs	r1, #8
    1c4e:	4208      	tst	r0, r1
    1c50:	d106      	bne.n	0x1c60
    1c52:	490f      	ldr	r1, [pc, #60]	; (0x1c90)
    1c54:	6809      	ldr	r1, [r1, #0]
    1c56:	2240      	movs	r2, #64	; 0x40
    1c58:	4391      	bics	r1, r2
    1c5a:	4a0d      	ldr	r2, [pc, #52]	; (0x1c90)
    1c5c:	6011      	str	r1, [r2, #0]
    1c5e:	e005      	b.n	0x1c6c
    1c60:	490b      	ldr	r1, [pc, #44]	; (0x1c90)
    1c62:	6809      	ldr	r1, [r1, #0]
    1c64:	2240      	movs	r2, #64	; 0x40
    1c66:	4311      	orrs	r1, r2
    1c68:	4a09      	ldr	r2, [pc, #36]	; (0x1c90)
    1c6a:	6011      	str	r1, [r2, #0]
CheckFifthBit:
    1c6c:	2110      	movs	r1, #16
    1c6e:	4208      	tst	r0, r1
    1c70:	d106      	bne.n	0x1c80
    1c72:	4907      	ldr	r1, [pc, #28]	; (0x1c90)
    1c74:	6809      	ldr	r1, [r1, #0]
    1c76:	2280      	movs	r2, #128	; 0x80
    1c78:	4391      	bics	r1, r2
    1c7a:	4a05      	ldr	r2, [pc, #20]	; (0x1c90)
    1c7c:	6011      	str	r1, [r2, #0]
    1c7e:	e005      	b.n	0x1c8c
    1c80:	4903      	ldr	r1, [pc, #12]	; (0x1c90)
    1c82:	6809      	ldr	r1, [r1, #0]
    1c84:	2280      	movs	r2, #128	; 0x80
    1c86:	4311      	orrs	r1, r2
    1c88:	4a01      	ldr	r2, [pc, #4]	; (0x1c90)
    1c8a:	6011      	str	r1, [r2, #0]
    1c8c:	4770      	bx	lr

    1c8e:	0000      	;	padding
    1c90:	40030000      	;	SPI 0 registers

    1c94:	2005      	movs	r0, #5
    1c96:	0700      	lsls	r0, r0, #28
    1c98:	6b40      	ldr	r0, [r0, #52]	; 0x34
    1c9a:	4933      	ldr	r1, [pc, #204]	; (0x1d68)
    1c9c:	4008      	ands	r0, r1
    1c9e:	2105      	movs	r1, #5
    1ca0:	0709      	lsls	r1, r1, #28
    1ca2:	6348      	str	r0, [r1, #52]	; 0x34
    1ca4:	4608      	mov	r0, r1
    1ca6:	6b40      	ldr	r0, [r0, #52]	; 0x34
    1ca8:	210f      	movs	r1, #15
    1caa:	0309      	lsls	r1, r1, #12
    1cac:	4308      	orrs	r0, r1
    1cae:	2105      	movs	r1, #5
    1cb0:	0709      	lsls	r1, r1, #28
    1cb2:	6348      	str	r0, [r1, #52]	; 0x34
    1cb4:	4608      	mov	r0, r1
    1cb6:	68c0      	ldr	r0, [r0, #12]
    1cb8:	2101      	movs	r1, #1
    1cba:	0309      	lsls	r1, r1, #12
    1cbc:	4308      	orrs	r0, r1
    1cbe:	2105      	movs	r1, #5
    1cc0:	0709      	lsls	r1, r1, #28
    1cc2:	60c8      	str	r0, [r1, #12]
    1cc4:	4608      	mov	r0, r1
    1cc6:	68c0      	ldr	r0, [r0, #12]
    1cc8:	2101      	movs	r1, #1
    1cca:	0309      	lsls	r1, r1, #12
    1ccc:	4388      	bics	r0, r1
    1cce:	2105      	movs	r1, #5
    1cd0:	0709      	lsls	r1, r1, #28
    1cd2:	60c8      	str	r0, [r1, #12]
    1cd4:	4825      	ldr	r0, [pc, #148]	; (0x1d6c)
    1cd6:	6880      	ldr	r0, [r0, #8]
    1cd8:	2101      	movs	r1, #1
    1cda:	0309      	lsls	r1, r1, #12
    1cdc:	4308      	orrs	r0, r1
    1cde:	4923      	ldr	r1, [pc, #140]	; (0x1d6c)
    1ce0:	6088      	str	r0, [r1, #8]
    1ce2:	4608      	mov	r0, r1
    1ce4:	6980      	ldr	r0, [r0, #24]
    1ce6:	0900      	lsrs	r0, r0, #4
    1ce8:	0100      	lsls	r0, r0, #4
    1cea:	6188      	str	r0, [r1, #24]
    1cec:	4820      	ldr	r0, [pc, #128]	; (0x1d70)
    1cee:	6800      	ldr	r0, [r0, #0]
    1cf0:	0249      	lsls	r1, r1, #9
    1cf2:	4388      	bics	r0, r1
    1cf4:	491e      	ldr	r1, [pc, #120]	; (0x1d70)
    1cf6:	6008      	str	r0, [r1, #0]
    1cf8:	4608      	mov	r0, r1
    1cfa:	6800      	ldr	r0, [r0, #0]
    1cfc:	1509      	asrs	r1, r1, #20
    1cfe:	4388      	bics	r0, r1
    1d00:	491b      	ldr	r1, [pc, #108]	; (0x1d70)
    1d02:	6008      	str	r0, [r1, #0]
    1d04:	4608      	mov	r0, r1
    1d06:	6800      	ldr	r0, [r0, #0]
    1d08:	14c9      	asrs	r1, r1, #19
    1d0a:	4388      	bics	r0, r1
    1d0c:	4918      	ldr	r1, [pc, #96]	; (0x1d70)
    1d0e:	6008      	str	r0, [r1, #0]
    1d10:	4608      	mov	r0, r1
    1d12:	6800      	ldr	r0, [r0, #0]
    1d14:	2104      	movs	r1, #4
    1d16:	4308      	orrs	r0, r1
    1d18:	4915      	ldr	r1, [pc, #84]	; (0x1d70)
    1d1a:	6008      	str	r0, [r1, #0]
    1d1c:	4608      	mov	r0, r1
    1d1e:	6800      	ldr	r0, [r0, #0]
    1d20:	2102      	movs	r1, #2
    1d22:	4388      	bics	r0, r1
    1d24:	4912      	ldr	r1, [pc, #72]	; (0x1d70)
    1d26:	6008      	str	r0, [r1, #0]
    1d28:	4608      	mov	r0, r1
    1d2a:	6840      	ldr	r0, [r0, #4]
    1d2c:	0c00      	lsrs	r0, r0, #16
    1d2e:	0400      	lsls	r0, r0, #16
    1d30:	6048      	str	r0, [r1, #4]
    1d32:	4608      	mov	r0, r1
    1d34:	6840      	ldr	r0, [r0, #4]
    1d36:	490f      	ldr	r1, [pc, #60]	; (0x1d74)
    1d38:	6809      	ldr	r1, [r1, #0]
    1d3a:	4308      	orrs	r0, r1
    1d3c:	490c      	ldr	r1, [pc, #48]	; (0x1d70)
    1d3e:	6048      	str	r0, [r1, #4]
    1d40:	4608      	mov	r0, r1
    1d42:	6880      	ldr	r0, [r0, #8]
    1d44:	2104      	movs	r1, #4
    1d46:	4388      	bics	r0, r1
    1d48:	4909      	ldr	r1, [pc, #36]	; (0x1d70)
    1d4a:	6088      	str	r0, [r1, #8]
    1d4c:	4608      	mov	r0, r1
    1d4e:	6880      	ldr	r0, [r0, #8]
    1d50:	2108      	movs	r1, #8
    1d52:	4308      	orrs	r0, r1
    1d54:	4906      	ldr	r1, [pc, #24]	; (0x1d70)
    1d56:	6088      	str	r0, [r1, #8]
    1d58:	4608      	mov	r0, r1
    1d5a:	6880      	ldr	r0, [r0, #8]
    1d5c:	2101      	movs	r1, #1
    1d5e:	4308      	orrs	r0, r1
    1d60:	4903      	ldr	r1, [pc, #12]	; (0x1d70)
    1d62:	6088      	str	r0, [r1, #8]
    1d64:	4770      	bx	lr
    1d66:	0000      	movs	r0, r0
    1d68:	0f0f      	lsrs	r7, r1, #28
    1d6a:	ffff 0200 	vsubl.u<illegal width 64>	q8, d15, d0
    1d6e:	5000      	str	r0, [r0, r0]

    1d70:	40030000      	;	SPI 0 registers
    1d74:	2000000c      	;

    1d78:	480d      	ldr	r0, [pc, #52]	; (0x1db0)
    1d7a:	6840      	ldr	r0, [r0, #4]
    1d7c:	0c00      	lsrs	r0, r0, #16
    1d7e:	0400      	lsls	r0, r0, #16
    1d80:	490b      	ldr	r1, [pc, #44]	; (0x1db0)
    1d82:	6048      	str	r0, [r1, #4]
    1d84:	4608      	mov	r0, r1
    1d86:	6840      	ldr	r0, [r0, #4]
    1d88:	6048      	str	r0, [r1, #4]
    1d8a:	4608      	mov	r0, r1
    1d8c:	6880      	ldr	r0, [r0, #8]
    1d8e:	2104      	movs	r1, #4
    1d90:	4388      	bics	r0, r1
    1d92:	4907      	ldr	r1, [pc, #28]	; (0x1db0)
    1d94:	6088      	str	r0, [r1, #8]
    1d96:	4608      	mov	r0, r1
    1d98:	6880      	ldr	r0, [r0, #8]
    1d9a:	2108      	movs	r1, #8
    1d9c:	4308      	orrs	r0, r1
    1d9e:	4904      	ldr	r1, [pc, #16]	; (0x1db0)
    1da0:	6088      	str	r0, [r1, #8]
    1da2:	4608      	mov	r0, r1
    1da4:	6880      	ldr	r0, [r0, #8]
    1da6:	2101      	movs	r1, #1
    1da8:	4308      	orrs	r0, r1
    1daa:	4901      	ldr	r1, [pc, #4]	; (0x1db0)
    1dac:	6088      	str	r0, [r1, #8]
    1dae:	4770      	bx	lr

    1db0:	40030000      	;	SPI 0 registers

SPI0_Wiznet_StartTX(TxPayload, TransferLength):
    1db4:	b510      	push	{r4, lr}
    1db6:	4603      	mov	r3, r0				; r3 := parameter 1
    1db8:	460c      	mov	r4, r1				; r4 := parameter 2	(here always #32)
    1dba:	4809      	ldr	r0, [pc, #36]	; (0x1de0)	; r0 := SPI0 base addr
    1dbc:	6800      	ldr	r0, [r0, #0]			; r0 := SPI0 CNTRL register		# 05013004
    1dbe:	21ff      	movs	r1, #255	; 0xff
    1dc0:	3101      	adds	r1, #1				; clear lowest bit in TX_NUM field of CNTRL reg
    1dc2:	4388      	bics	r0, r1				; (disable SPI burst mode, transfer 1 word only)
    1dc4:	4906      	ldr	r1, [pc, #24]	; (0x1de0)	; r1 := SPI0 base addr
    1dc6:	6008      	str	r0, [r1, #0]			; SPI0 CNTRL register := r0
    1dc8:	4620      	mov	r0, r4
    1dca:	f7ff ff0d 	bl	0x1be8				; CALL SPI0_Wiznet_SetTransferLength(parameter2)
    1dce:	4804      	ldr	r0, [pc, #16]	; (0x1de0)	; r0 := SPI0 base addr
    1dd0:	6203      	str	r3, [r0, #32]			; SPI0 Data Transmit Register := r3 (parameter 1)
    1dd2:	6800      	ldr	r0, [r0, #0]			; r0 := SPI0 CNTRL register
    1dd4:	2101      	movs	r1, #1				; r1 := 1
    1dd6:	4308      	orrs	r0, r1				; set GO_BUSY bit in CNTRL register
    1dd8:	4901      	ldr	r1, [pc, #4]	; (0x1de0)	; r1 := SPI0 base addr
    1dda:	6008      	str	r0, [r1, #0]			; SPI0 CNTRL register := r0 => START SPI transfer
    1ddc:	bd10      	pop	{r4, pc}			; return

    1dde:	0000      	;	padding
    1de0:	40030000      	;	SPI 0 registers

    1de4:	b5f0      	push	{r4, r5, r6, r7, lr}
    1de6:	b085      	sub	sp, #20
    1de8:	4604      	mov	r4, r0
    1dea:	0221      	lsls	r1, r4, #8
    1dec:	4a50      	ldr	r2, [pc, #320]	; (0x1f30)
    1dee:	1889      	adds	r1, r1, r2
    1df0:	b288      	uxth	r0, r1
    1df2:	f7ff fed5 	bl	0x1ba0				; Wiznet_Read_Address
    1df6:	4607      	mov	r7, r0
    1df8:	023f      	lsls	r7, r7, #8
    1dfa:	0221      	lsls	r1, r4, #8
    1dfc:	4a4c      	ldr	r2, [pc, #304]	; (0x1f30)
    1dfe:	1889      	adds	r1, r1, r2
    1e00:	1c49      	adds	r1, r1, #1
    1e02:	b288      	uxth	r0, r1
    1e04:	f7ff fecc 	bl	0x1ba0				; Wiznet_Read_Address
    1e08:	19c0      	adds	r0, r0, r7
    1e0a:	b287      	uxth	r7, r0
    1e0c:	0221      	lsls	r1, r4, #8
    1e0e:	2285      	movs	r2, #133	; 0x85
    1e10:	00d2      	lsls	r2, r2, #3
    1e12:	1889      	adds	r1, r1, r2
    1e14:	b288      	uxth	r0, r1
    1e16:	f7ff fec3 	bl	0x1ba0				; Wiznet_Read_Address
    1e1a:	4605      	mov	r5, r0
    1e1c:	022d      	lsls	r5, r5, #8
    1e1e:	0221      	lsls	r1, r4, #8
    1e20:	2285      	movs	r2, #133	; 0x85
    1e22:	00d2      	lsls	r2, r2, #3
    1e24:	1889      	adds	r1, r1, r2
    1e26:	1c49      	adds	r1, r1, #1
    1e28:	b288      	uxth	r0, r1
    1e2a:	f7ff feb9 	bl	0x1ba0				; Wiznet_Read_Address
    1e2e:	1940      	adds	r0, r0, r5
    1e30:	b285      	uxth	r5, r0
    1e32:	462e      	mov	r6, r5
    1e34:	4628      	mov	r0, r5
    1e36:	17e9      	asrs	r1, r5, #31
    1e38:	0d49      	lsrs	r1, r1, #21
    1e3a:	1809      	adds	r1, r1, r0
    1e3c:	12c9      	asrs	r1, r1, #11
    1e3e:	9103      	str	r1, [sp, #12]
    1e40:	9803      	ldr	r0, [sp, #12]
    1e42:	02c0      	lsls	r0, r0, #11
    1e44:	1a28      	subs	r0, r5, r0
    1e46:	b285      	uxth	r5, r0
    1e48:	02e0      	lsls	r0, r4, #11
    1e4a:	2103      	movs	r1, #3
    1e4c:	0349      	lsls	r1, r1, #13
    1e4e:	1840      	adds	r0, r0, r1
    1e50:	1940      	adds	r0, r0, r5
    1e52:	b280      	uxth	r0, r0
    1e54:	9002      	str	r0, [sp, #8]
    1e56:	2000      	movs	r0, #0
    1e58:	9003      	str	r0, [sp, #12]
    1e5a:	e043      	b.n	0x1ee4
    1e5c:	2001      	movs	r0, #1
    1e5e:	02c0      	lsls	r0, r0, #11
    1e60:	4285      	cmp	r5, r0
    1e62:	db06      	blt.n	0x1e72
    1e64:	02e0      	lsls	r0, r4, #11
    1e66:	2103      	movs	r1, #3
    1e68:	0349      	lsls	r1, r1, #13
    1e6a:	1840      	adds	r0, r0, r1
    1e6c:	b280      	uxth	r0, r0
    1e6e:	9002      	str	r0, [sp, #8]
    1e70:	2500      	movs	r5, #0
    1e72:	9802      	ldr	r0, [sp, #8]
    1e74:	f7ff fe94 	bl	0x1ba0				; Wiznet_Read_Address
    1e78:	9001      	str	r0, [sp, #4]
    1e7a:	482e      	ldr	r0, [pc, #184]	; (0x1f34)
    1e7c:	8800      	ldrh	r0, [r0, #0]
    1e7e:	2101      	movs	r1, #1
    1e80:	0249      	lsls	r1, r1, #9
    1e82:	4288      	cmp	r0, r1
    1e84:	da18      	bge.n	0x1eb8
    1e86:	4668      	mov	r0, sp
    1e88:	7901      	ldrb	r1, [r0, #4]
    1e8a:	482b      	ldr	r0, [pc, #172]	; (0x1f38)
    1e8c:	4a2b      	ldr	r2, [pc, #172]	; (0x1f3c)
    1e8e:	8812      	ldrh	r2, [r2, #0]
    1e90:	5481      	strb	r1, [r0, r2]
    1e92:	482a      	ldr	r0, [pc, #168]	; (0x1f3c)
    1e94:	8800      	ldrh	r0, [r0, #0]
    1e96:	1fc1      	subs	r1, r0, #7
    1e98:	39ff      	subs	r1, #255	; 0xff
    1e9a:	39f9      	subs	r1, #249	; 0xf9
    1e9c:	d101      	bne.n	0x1ea2
    1e9e:	2000      	movs	r0, #0
    1ea0:	e002      	b.n	0x1ea8
    1ea2:	4826      	ldr	r0, [pc, #152]	; (0x1f3c)
    1ea4:	8800      	ldrh	r0, [r0, #0]
    1ea6:	1c40      	adds	r0, r0, #1
    1ea8:	4924      	ldr	r1, [pc, #144]	; (0x1f3c)
    1eaa:	8008      	strh	r0, [r1, #0]
    1eac:	4821      	ldr	r0, [pc, #132]	; (0x1f34)
    1eae:	8800      	ldrh	r0, [r0, #0]
    1eb0:	1c40      	adds	r0, r0, #1
    1eb2:	4920      	ldr	r1, [pc, #128]	; (0x1f34)
    1eb4:	8008      	strh	r0, [r1, #0]
    1eb6:	e006      	b.n	0x1ec6
    1eb8:	2000      	movs	r0, #0
    1eba:	4920      	ldr	r1, [pc, #128]	; (0x1f3c)
    1ebc:	8008      	strh	r0, [r1, #0]
    1ebe:	491d      	ldr	r1, [pc, #116]	; (0x1f34)
    1ec0:	8008      	strh	r0, [r1, #0]
    1ec2:	491f      	ldr	r1, [pc, #124]	; (0x1f40)
    1ec4:	8008      	strh	r0, [r1, #0]
    1ec6:	4668      	mov	r0, sp
    1ec8:	7901      	ldrb	r1, [r0, #4]
    1eca:	a01e      	add	r0, pc, #120	; (adr r0, 0x1f44)
    1ecc:	f7fe f982 	bl	0x1d4				; UART0_printf
    1ed0:	9802      	ldr	r0, [sp, #8]
    1ed2:	1c40      	adds	r0, r0, #1
    1ed4:	b280      	uxth	r0, r0
    1ed6:	9002      	str	r0, [sp, #8]
    1ed8:	1c68      	adds	r0, r5, #1
    1eda:	b285      	uxth	r5, r0
    1edc:	9803      	ldr	r0, [sp, #12]
    1ede:	1c40      	adds	r0, r0, #1
    1ee0:	b280      	uxth	r0, r0
    1ee2:	9003      	str	r0, [sp, #12]
    1ee4:	9803      	ldr	r0, [sp, #12]
    1ee6:	42b8      	cmp	r0, r7
    1ee8:	dbb8      	blt.n	0x1e5c
    1eea:	19f0      	adds	r0, r6, r7
    1eec:	b286      	uxth	r6, r0
    1eee:	17f2      	asrs	r2, r6, #31
    1ef0:	0e12      	lsrs	r2, r2, #24
    1ef2:	1992      	adds	r2, r2, r6
    1ef4:	0412      	lsls	r2, r2, #16
    1ef6:	0e11      	lsrs	r1, r2, #24
    1ef8:	0222      	lsls	r2, r4, #8
    1efa:	2385      	movs	r3, #133	; 0x85
    1efc:	00db      	lsls	r3, r3, #3
    1efe:	18d2      	adds	r2, r2, r3
    1f00:	b290      	uxth	r0, r2
    1f02:	9600      	str	r6, [sp, #0]
    1f04:	f001 f83c 	bl	0x2f80				; Wiznet_Write_Address
    1f08:	b2f1      	uxtb	r1, r6
    1f0a:	0222      	lsls	r2, r4, #8
    1f0c:	2385      	movs	r3, #133	; 0x85
    1f0e:	00db      	lsls	r3, r3, #3
    1f10:	18d2      	adds	r2, r2, r3
    1f12:	1c52      	adds	r2, r2, #1
    1f14:	b290      	uxth	r0, r2
    1f16:	f001 f833 	bl	0x2f80				; Wiznet_Write_Address
    1f1a:	0221      	lsls	r1, r4, #8
    1f1c:	4a04      	ldr	r2, [pc, #16]	; (0x1f30)
    1f1e:	3a25      	subs	r2, #37	; 0x25
    1f20:	1889      	adds	r1, r1, r2
    1f22:	b288      	uxth	r0, r1
    1f24:	2140      	movs	r1, #64	; 0x40
    1f26:	f001 f82b 	bl	0x2f80				; Wiznet_Write_Address
    1f2a:	4638      	mov	r0, r7
    1f2c:	b005      	add	sp, #20
    1f2e:	bdf0      	pop	{r4, r5, r6, r7, pc}

    1f30:	20000426      	;
    1f34:	2000004c      	;
    1f38:	200004d0      	;
    1f3c:	20000050      	;
    1f40:	2000004e      	;

    1f44:	7852      	;	String 'Rx=0x%x\r\a\0\0\0'
    1f46:	303d      	;
    1f48:	2578      	;
    1f4a:	0d78      	;
    1f4c:	000a      	;
    1f4e:	0000      	;

    1f50:	b5f3      	push	{r0, r1, r4, r5, r6, r7, lr}
    1f52:	b083      	sub	sp, #12
    1f54:	4606      	mov	r6, r0
    1f56:	0231      	lsls	r1, r6, #8
    1f58:	4a2f      	ldr	r2, [pc, #188]	; (0x2018)
    1f5a:	1889      	adds	r1, r1, r2
    1f5c:	b288      	uxth	r0, r1
    1f5e:	f7ff fe1f 	bl	0x1ba0				; Wiznet_Read_Address
    1f62:	4604      	mov	r4, r0
    1f64:	0224      	lsls	r4, r4, #8
    1f66:	0231      	lsls	r1, r6, #8
    1f68:	4a2b      	ldr	r2, [pc, #172]	; (0x2018)
    1f6a:	1889      	adds	r1, r1, r2
    1f6c:	1c49      	adds	r1, r1, #1
    1f6e:	b288      	uxth	r0, r1
    1f70:	f7ff fe16 	bl	0x1ba0				; Wiznet_Read_Address
    1f74:	1900      	adds	r0, r0, r4
    1f76:	b284      	uxth	r4, r0
    1f78:	4625      	mov	r5, r4
    1f7a:	4620      	mov	r0, r4
    1f7c:	17e1      	asrs	r1, r4, #31
    1f7e:	0d49      	lsrs	r1, r1, #21
    1f80:	1809      	adds	r1, r1, r0
    1f82:	12cf      	asrs	r7, r1, #11
    1f84:	02f8      	lsls	r0, r7, #11
    1f86:	1a20      	subs	r0, r4, r0
    1f88:	b284      	uxth	r4, r0
    1f8a:	02f0      	lsls	r0, r6, #11
    1f8c:	2101      	movs	r1, #1
    1f8e:	0389      	lsls	r1, r1, #14
    1f90:	1840      	adds	r0, r0, r1
    1f92:	1900      	adds	r0, r0, r4
    1f94:	b280      	uxth	r0, r0
    1f96:	9002      	str	r0, [sp, #8]
    1f98:	2700      	movs	r7, #0
    1f9a:	e017      	b.n	0x1fcc
    1f9c:	2001      	movs	r0, #1
    1f9e:	02c0      	lsls	r0, r0, #11
    1fa0:	4284      	cmp	r4, r0
    1fa2:	db06      	blt.n	0x1fb2
    1fa4:	02f0      	lsls	r0, r6, #11
    1fa6:	2101      	movs	r1, #1
    1fa8:	0389      	lsls	r1, r1, #14
    1faa:	1840      	adds	r0, r0, r1
    1fac:	b280      	uxth	r0, r0
    1fae:	9002      	str	r0, [sp, #8]
    1fb0:	2400      	movs	r4, #0
    1fb2:	481a      	ldr	r0, [pc, #104]	; (0x201c)
    1fb4:	5dc1      	ldrb	r1, [r0, r7]
    1fb6:	9802      	ldr	r0, [sp, #8]
    1fb8:	f000 ffe2 	bl	0x2f80				; Wiznet_Write_Address
    1fbc:	9802      	ldr	r0, [sp, #8]
    1fbe:	1c40      	adds	r0, r0, #1
    1fc0:	b280      	uxth	r0, r0
    1fc2:	9002      	str	r0, [sp, #8]
    1fc4:	1c60      	adds	r0, r4, #1
    1fc6:	b284      	uxth	r4, r0
    1fc8:	1c78      	adds	r0, r7, #1
    1fca:	b287      	uxth	r7, r0
    1fcc:	9804      	ldr	r0, [sp, #16]
    1fce:	4287      	cmp	r7, r0
    1fd0:	d3e4      	bcc.n	0x1f9c
    1fd2:	9804      	ldr	r0, [sp, #16]
    1fd4:	1828      	adds	r0, r5, r0
    1fd6:	b285      	uxth	r5, r0
    1fd8:	17ea      	asrs	r2, r5, #31
    1fda:	0e12      	lsrs	r2, r2, #24
    1fdc:	1952      	adds	r2, r2, r5
    1fde:	0412      	lsls	r2, r2, #16
    1fe0:	0e11      	lsrs	r1, r2, #24
    1fe2:	0232      	lsls	r2, r6, #8
    1fe4:	4b0c      	ldr	r3, [pc, #48]	; (0x2018)
    1fe6:	18d2      	adds	r2, r2, r3
    1fe8:	b290      	uxth	r0, r2
    1fea:	9501      	str	r5, [sp, #4]
    1fec:	f000 ffc8 	bl	0x2f80				; Wiznet_Write_Address
    1ff0:	b2e9      	uxtb	r1, r5
    1ff2:	0232      	lsls	r2, r6, #8
    1ff4:	4b08      	ldr	r3, [pc, #32]	; (0x2018)
    1ff6:	18d2      	adds	r2, r2, r3
    1ff8:	1c52      	adds	r2, r2, #1
    1ffa:	b290      	uxth	r0, r2
    1ffc:	f000 ffc0 	bl	0x2f80				; Wiznet_Write_Address
    2000:	0231      	lsls	r1, r6, #8
    2002:	4a05      	ldr	r2, [pc, #20]	; (0x2018)
    2004:	3a23      	subs	r2, #35	; 0x23
    2006:	1889      	adds	r1, r1, r2
    2008:	b288      	uxth	r0, r1
    200a:	2120      	movs	r1, #32
    200c:	f000 ffb8 	bl	0x2f80				; Wiznet_Write_Address
    2010:	2001      	movs	r0, #1
    2012:	b005      	add	sp, #20
    2014:	bdf0      	pop	{r4, r5, r6, r7, pc}
    2016:	0000      	movs	r0, r0
    2018:	0424      	lsls	r4, r4, #16
    201a:	0000      	movs	r0, r0
    201c:	02d0      	lsls	r0, r2, #11
    201e:	2000      	movs	r0, #0

UART1PutChar(c):
    2020:	bf00      	nop
UART1WhileTxFifoFullBody1:
    2022:	4908      	ldr	r1, [pc, #32]	; (0x2044)
    2024:	6989      	ldr	r1, [r1, #24]			; r1 := UART1 FIFO Status register
    2026:	2201      	movs	r2, #1
    2028:	05d2      	lsls	r2, r2, #23			; 1 << 23 in FIFO Status register is TX_FULL: TX fifo is full
    202a:	4211      	tst	r1, r2
    202c:	d1f9      	bne.n	0x2022				; UART1WhileTxFifoFullBody
    202e:	4905      	ldr	r1, [pc, #20]	; (0x2044)
    2030:	6008      	str	r0, [r1, #0]			; put c into UART1 ***RECEIVE*** Buffer Register (BUG?!)
    2032:	bf00      	nop					; this *seems* to be a bug, but sending WORKS for UART1!
UART1WhileTxFifoFullBody2:
    2034:	4903      	ldr	r1, [pc, #12]	; (0x2044)
    2036:	6989      	ldr	r1, [r1, #24]
    2038:	2201      	movs	r2, #1
    203a:	0592      	lsls	r2, r2, #22
    203c:	4211      	tst	r1, r2
    203e:	d1f9      	bne.n	0x2034				; UART1WhileTxFifoFullBody2
    2040:	4770      	bx	lr

    2042:	0000      	;	padding
    2044:	40150000      	;	base address of UART1

UART0PutChar(c): ????
    2048:	bf00      	nop
UART0WhileTxFifoNotEmptyBody1:
    204a:	490a      	ldr	r1, [pc, #40]	; (0x2074)
    204c:	6989      	ldr	r1, [r1, #24]			; r1 := UART0 FIFO Status register
    204e:	2201      	movs	r2, #1
    2050:	0592      	lsls	r2, r2, #22			; 1 << 22 in FIFO Status register is TX_EMPTY: TX fifo is empty
    2052:	4211      	tst	r1, r2
    2054:	d0f9      	beq.n	0x204a				; UART0WhileTxFifoNotEmptyBody1
    2056:	4907      	ldr	r1, [pc, #28]	; (0x2074)
    2058:	6008      	str	r0, [r1, #0]			; put c into UART0 ***RECEIVE*** Buffer Register (BUG?!)
    205a:	280a      	cmp	r0, #10
    205c:	d109      	bne.n	0x2072				; UART0PutCharExit
UART0FlushOnNewline:
    205e:	bf00      	nop
UART0WhileTxFifoNotEmptyBody2:
    2060:	4904      	ldr	r1, [pc, #16]	; (0x2074)
    2062:	6989      	ldr	r1, [r1, #24]
    2064:	2201      	movs	r2, #1
    2066:	0592      	lsls	r2, r2, #22
    2068:	4211      	tst	r1, r2
    206a:	d0f9      	beq.n	0x2060				; UART0WhileTxFifoNotEmptyBody2
    206c:	210d      	movs	r1, #13
    206e:	4a01      	ldr	r2, [pc, #4]	; (0x2074)
    2070:	6011      	str	r1, [r2, #0]
UART0PutCharExit:
    2072:	4770      	bx	lr

    2074:	40050000      	;	base address of UART0

    2078:	b510      	push	{r4, lr}
    207a:	4604      	mov	r4, r0
    207c:	0221      	lsls	r1, r4, #8
    207e:	2201      	movs	r2, #1
    2080:	0292      	lsls	r2, r2, #10
    2082:	1889      	adds	r1, r1, r2
    2084:	b288      	uxth	r0, r1
    2086:	2101      	movs	r1, #1
    2088:	f000 ff7a 	bl	0x2f80				; Wiznet_Write_Address
    208c:	0221      	lsls	r1, r4, #8
    208e:	4a10      	ldr	r2, [pc, #64]	; (0x20d0)
    2090:	1889      	adds	r1, r1, r2
    2092:	b288      	uxth	r0, r1
    2094:	2101      	movs	r1, #1
    2096:	f000 ff73 	bl	0x2f80				; Wiznet_Write_Address
    209a:	0221      	lsls	r1, r4, #8
    209c:	4a0c      	ldr	r2, [pc, #48]	; (0x20d0)
    209e:	1c92      	adds	r2, r2, #2
    20a0:	1889      	adds	r1, r1, r2
    20a2:	b288      	uxth	r0, r1
    20a4:	f7ff fd7c 	bl	0x1ba0				; Wiznet_Read_Address
    20a8:	2813      	cmp	r0, #19
    20aa:	d008      	beq.n	0x20be
    20ac:	0221      	lsls	r1, r4, #8
    20ae:	4a08      	ldr	r2, [pc, #32]	; (0x20d0)
    20b0:	1889      	adds	r1, r1, r2
    20b2:	b288      	uxth	r0, r1
    20b4:	2110      	movs	r1, #16
    20b6:	f000 ff63 	bl	0x2f80				; Wiznet_Write_Address
    20ba:	2000      	movs	r0, #0
    20bc:	bd10      	pop	{r4, pc}
    20be:	0221      	lsls	r1, r4, #8
    20c0:	4a03      	ldr	r2, [pc, #12]	; (0x20d0)
    20c2:	1889      	adds	r1, r1, r2
    20c4:	b288      	uxth	r0, r1
    20c6:	2104      	movs	r1, #4
    20c8:	f000 ff5a 	bl	0x2f80				; Wiznet_Write_Address
    20cc:	2001      	movs	r0, #1
    20ce:	e7f5      	b.n	0x20bc

    20d0:	00000401      	;	Wiznet: Socket 0 Command register

Wiznet???(?)
    20d4:	b570      	push	{r4, r5, r6, lr}
    20d6:	4605      	mov	r5, r0				; r5 := parameter1
    20d8:	0229      	lsls	r1, r5, #8
    20da:	4a5a      	ldr	r2, [pc, #360]	; (0x2244)
    20dc:	1889      	adds	r1, r1, r2
    20de:	b288      	uxth	r0, r1
    20e0:	2105      	movs	r1, #5
    20e2:	f000 ff4d 	bl	0x2f80				; Wiznet_Write_Address(?, 5)
    20e6:	0229      	lsls	r1, r5, #8
    20e8:	4a56      	ldr	r2, [pc, #344]	; (0x2244)
    20ea:	1889      	adds	r1, r1, r2
    20ec:	1c49      	adds	r1, r1, #1
    20ee:	b288      	uxth	r0, r1
    20f0:	21b4      	movs	r1, #180	; 0xb4
    20f2:	f000 ff45 	bl	0x2f80				; Wiznet_Write_Address(?, 0xb4)
    20f6:	4629      	mov	r1, r5
    20f8:	a053      	add	r0, pc, #332	; (adr r0, 0x2248)
    20fa:	f7fe f86b 	bl	0x1d4				; UART0_printf
    20fe:	2d00      	cmp	r5, #0
    2100:	d006      	beq.n	0x2110
    2102:	2d01      	cmp	r5, #1
    2104:	d02a      	beq.n	0x215c
    2106:	2d02      	cmp	r5, #2
    2108:	d04e      	beq.n	0x21a8
    210a:	2d03      	cmp	r5, #3
    210c:	d171      	bne.n	0x21f2
    210e:	e071      	b.n	0x21f4
    2110:	4850      	ldr	r0, [pc, #320]	; (0x2254)
    2112:	7801      	ldrb	r1, [r0, #0]
    2114:	484b      	ldr	r0, [pc, #300]	; (0x2244)
    2116:	380e      	subs	r0, #14
    2118:	f000 ff32 	bl	0x2f80				; Wiznet_Write_Address(0x404, TCPSrcPort[0])
    211c:	484d      	ldr	r0, [pc, #308]	; (0x2254)
    211e:	7841      	ldrb	r1, [r0, #1]
    2120:	4848      	ldr	r0, [pc, #288]	; (0x2244)
    2122:	380d      	subs	r0, #13
    2124:	f000 ff2c 	bl	0x2f80				; Wiznet_Write_Address(0x405, TCPSrcPort[1])
    2128:	484b      	ldr	r0, [pc, #300]	; (0x2258)
    212a:	7801      	ldrb	r1, [r0, #0]
    212c:	2041      	movs	r0, #65	; 0x41
    212e:	0100      	lsls	r0, r0, #4
    2130:	f000 ff26 	bl	0x2f80				; Wiznet_Write_Address(0x410, TCPDstPort[0])
    2134:	4848      	ldr	r0, [pc, #288]	; (0x2258)
    2136:	7841      	ldrb	r1, [r0, #1]
    2138:	4842      	ldr	r0, [pc, #264]	; (0x2244)
    213a:	1e40      	subs	r0, r0, #1
    213c:	f000 ff20 	bl	0x2f80				; Wiznet_Write_Address(0x411, TCPDstPort[1])
    2140:	2400      	movs	r4, #0
    2142:	e008      	b.n	0x2156				; WhileCopyDstIPBody
WhileCopyDstIPBody:
    2144:	4a45      	ldr	r2, [pc, #276]	; (0x225c)
    2146:	5d11      	ldrb	r1, [r2, r4]
    2148:	4a3e      	ldr	r2, [pc, #248]	; (0x2244)
    214a:	1f92      	subs	r2, r2, #6			0x412-6
    214c:	18a2      	adds	r2, r4, r2
    214e:	b290      	uxth	r0, r2
    2150:	f000 ff16 	bl	0x2f80				; Wiznet_Write_Address(0x412, DstIPAddr[0])
    2154:	1c64      	adds	r4, r4, #1
WhileCopyDstIPCheck:
    2156:	2c04      	cmp	r4, #4
    2158:	d3f4      	bcc.n	0x2144				; WhileCopyDstIPBody
    215a:	e071      	b.n	0x2240
    215c:	4840      	ldr	r0, [pc, #256]	; (0x2260)
    215e:	7801      	ldrb	r1, [r0, #0]
    2160:	4838      	ldr	r0, [pc, #224]	; (0x2244)
    2162:	30f2      	adds	r0, #242	; 0xf2
    2164:	f000 ff0c 	bl	0x2f80				; Wiznet_Write_Address
    2168:	483d      	ldr	r0, [pc, #244]	; (0x2260)
    216a:	7841      	ldrb	r1, [r0, #1]
    216c:	4835      	ldr	r0, [pc, #212]	; (0x2244)
    216e:	30f3      	adds	r0, #243	; 0xf3
    2170:	f000 ff06 	bl	0x2f80				; Wiznet_Write_Address
    2174:	483b      	ldr	r0, [pc, #236]	; (0x2264)
    2176:	7801      	ldrb	r1, [r0, #0]
    2178:	2051      	movs	r0, #81	; 0x51
    217a:	0100      	lsls	r0, r0, #4
    217c:	f000 ff00 	bl	0x2f80				; Wiznet_Write_Address
    2180:	4838      	ldr	r0, [pc, #224]	; (0x2264)
    2182:	7841      	ldrb	r1, [r0, #1]
    2184:	482f      	ldr	r0, [pc, #188]	; (0x2244)
    2186:	30ff      	adds	r0, #255	; 0xff
    2188:	f000 fefa 	bl	0x2f80				; Wiznet_Write_Address
    218c:	2400      	movs	r4, #0
    218e:	e008      	b.n	0x21a2
    2190:	4a35      	ldr	r2, [pc, #212]	; (0x2268)
    2192:	5d11      	ldrb	r1, [r2, r4]
    2194:	4a2b      	ldr	r2, [pc, #172]	; (0x2244)
    2196:	32fa      	adds	r2, #250	; 0xfa
    2198:	18a2      	adds	r2, r4, r2
    219a:	b290      	uxth	r0, r2
    219c:	f000 fef0 	bl	0x2f80				; Wiznet_Write_Address
    21a0:	1c64      	adds	r4, r4, #1
    21a2:	2c04      	cmp	r4, #4
    21a4:	d3f4      	bcc.n	0x2190
    21a6:	e04b      	b.n	0x2240
    21a8:	4830      	ldr	r0, [pc, #192]	; (0x226c)
    21aa:	7801      	ldrb	r1, [r0, #0]
    21ac:	4830      	ldr	r0, [pc, #192]	; (0x2270)
    21ae:	f000 fee7 	bl	0x2f80				; Wiznet_Write_Address
    21b2:	482e      	ldr	r0, [pc, #184]	; (0x226c)
    21b4:	7841      	ldrb	r1, [r0, #1]
    21b6:	482e      	ldr	r0, [pc, #184]	; (0x2270)
    21b8:	1c40      	adds	r0, r0, #1
    21ba:	f000 fee1 	bl	0x2f80				; Wiznet_Write_Address
    21be:	482d      	ldr	r0, [pc, #180]	; (0x2274)
    21c0:	7801      	ldrb	r1, [r0, #0]
    21c2:	2061      	movs	r0, #97	; 0x61
    21c4:	0100      	lsls	r0, r0, #4
    21c6:	f000 fedb 	bl	0x2f80				; Wiznet_Write_Address
    21ca:	482a      	ldr	r0, [pc, #168]	; (0x2274)
    21cc:	7841      	ldrb	r1, [r0, #1]
    21ce:	4828      	ldr	r0, [pc, #160]	; (0x2270)
    21d0:	300d      	adds	r0, #13
    21d2:	f000 fed5 	bl	0x2f80				; Wiznet_Write_Address
    21d6:	2400      	movs	r4, #0
    21d8:	e008      	b.n	0x21ec
    21da:	4a27      	ldr	r2, [pc, #156]	; (0x2278)
    21dc:	5d11      	ldrb	r1, [r2, r4]
    21de:	4a24      	ldr	r2, [pc, #144]	; (0x2270)
    21e0:	3208      	adds	r2, #8
    21e2:	18a2      	adds	r2, r4, r2
    21e4:	b290      	uxth	r0, r2
    21e6:	f000 fecb 	bl	0x2f80				; Wiznet_Write_Address
    21ea:	1c64      	adds	r4, r4, #1
    21ec:	2c04      	cmp	r4, #4
    21ee:	d3f4      	bcc.n	0x21da
    21f0:	e026      	b.n	0x2240
    21f2:	e024      	b.n	0x223e
    21f4:	4821      	ldr	r0, [pc, #132]	; (0x227c)
    21f6:	7801      	ldrb	r1, [r0, #0]
    21f8:	4821      	ldr	r0, [pc, #132]	; (0x2280)
    21fa:	f000 fec1 	bl	0x2f80				; Wiznet_Write_Address
    21fe:	481f      	ldr	r0, [pc, #124]	; (0x227c)
    2200:	7841      	ldrb	r1, [r0, #1]
    2202:	481f      	ldr	r0, [pc, #124]	; (0x2280)
    2204:	1c40      	adds	r0, r0, #1
    2206:	f000 febb 	bl	0x2f80				; Wiznet_Write_Address
    220a:	481e      	ldr	r0, [pc, #120]	; (0x2284)
    220c:	7801      	ldrb	r1, [r0, #0]
    220e:	2071      	movs	r0, #113	; 0x71
    2210:	0100      	lsls	r0, r0, #4
    2212:	f000 feb5 	bl	0x2f80				; Wiznet_Write_Address
    2216:	481b      	ldr	r0, [pc, #108]	; (0x2284)
    2218:	7841      	ldrb	r1, [r0, #1]
    221a:	4819      	ldr	r0, [pc, #100]	; (0x2280)
    221c:	300d      	adds	r0, #13
    221e:	f000 feaf 	bl	0x2f80				; Wiznet_Write_Address
    2222:	2400      	movs	r4, #0
    2224:	e008      	b.n	0x2238
    2226:	4a18      	ldr	r2, [pc, #96]	; (0x2288)
    2228:	5d11      	ldrb	r1, [r2, r4]
    222a:	4a15      	ldr	r2, [pc, #84]	; (0x2280)
    222c:	3208      	adds	r2, #8
    222e:	18a2      	adds	r2, r4, r2
    2230:	b290      	uxth	r0, r2
    2232:	f000 fea5 	bl	0x2f80				; Wiznet_Write_Address
    2236:	1c64      	adds	r4, r4, #1
    2238:	2c04      	cmp	r4, #4
    223a:	d3f4      	bcc.n	0x2226
    223c:	e000      	b.n	0x2240
    223e:	bf00      	nop
    2240:	bf00      	nop
    2242:	bd70      	pop	{r4, r5, r6, pc}

    2244:	00000412      	;	Wiznet: Socket 0 MSSR0 register

    2248:	730a      	;	String '\nsocket %x\0\0'
    224a:	636f      	;
    224c:	656b      	;
    224e:	2074      	;
    2250:	7825      	;
    2252:	0000      	;

    2254:	20000064      	;	u8 TCPSrcPort[2]
    2258:	2000006a      	;	u8 TCPDstPort[2]
    225c:	20000066      	;	u8 DstIPAddr[4]
    2260:	2000006c      	;
    2264:	20000072      	;
    2268:	2000006e      	;
    226c:	20000074      	;
    2270:	00000604      	;
    2274:	2000007a      	;
    2278:	20000076      	;
    227c:	2000007c      	;
    2280:	00000704      	;
    2284:	20000082      	;
    2288:	2000007e      	;

    228c:	b510      	push	{r4, lr}
    228e:	4604      	mov	r4, r0
    2290:	0221      	lsls	r1, r4, #8
    2292:	2201      	movs	r2, #1
    2294:	0292      	lsls	r2, r2, #10
    2296:	1889      	adds	r1, r1, r2
    2298:	b288      	uxth	r0, r1
    229a:	2101      	movs	r1, #1
    229c:	f000 fe70 	bl	0x2f80				; Wiznet_Write_Address
    22a0:	0221      	lsls	r1, r4, #8
    22a2:	4a19      	ldr	r2, [pc, #100]	; (0x2308)
    22a4:	1889      	adds	r1, r1, r2
    22a6:	b288      	uxth	r0, r1
    22a8:	2101      	movs	r1, #1
    22aa:	f000 fe69 	bl	0x2f80				; Wiznet_Write_Address
    22ae:	0221      	lsls	r1, r4, #8
    22b0:	4a15      	ldr	r2, [pc, #84]	; (0x2308)
    22b2:	1c92      	adds	r2, r2, #2
    22b4:	1889      	adds	r1, r1, r2
    22b6:	b288      	uxth	r0, r1
    22b8:	f7ff fc72 	bl	0x1ba0				; Wiznet_Read_Address
    22bc:	2813      	cmp	r0, #19
    22be:	d008      	beq.n	0x22d2
    22c0:	0221      	lsls	r1, r4, #8
    22c2:	4a11      	ldr	r2, [pc, #68]	; (0x2308)
    22c4:	1889      	adds	r1, r1, r2
    22c6:	b288      	uxth	r0, r1
    22c8:	2110      	movs	r1, #16
    22ca:	f000 fe59 	bl	0x2f80				; Wiznet_Write_Address
    22ce:	2000      	movs	r0, #0
    22d0:	bd10      	pop	{r4, pc}
    22d2:	0221      	lsls	r1, r4, #8
    22d4:	4a0c      	ldr	r2, [pc, #48]	; (0x2308)
    22d6:	1889      	adds	r1, r1, r2
    22d8:	b288      	uxth	r0, r1
    22da:	2102      	movs	r1, #2
    22dc:	f000 fe50 	bl	0x2f80				; Wiznet_Write_Address
    22e0:	0221      	lsls	r1, r4, #8
    22e2:	4a09      	ldr	r2, [pc, #36]	; (0x2308)
    22e4:	1c92      	adds	r2, r2, #2
    22e6:	1889      	adds	r1, r1, r2
    22e8:	b288      	uxth	r0, r1
    22ea:	f7ff fc59 	bl	0x1ba0				; Wiznet_Read_Address
    22ee:	2814      	cmp	r0, #20
    22f0:	d008      	beq.n	0x2304
    22f2:	0221      	lsls	r1, r4, #8
    22f4:	4a04      	ldr	r2, [pc, #16]	; (0x2308)
    22f6:	1889      	adds	r1, r1, r2
    22f8:	b288      	uxth	r0, r1
    22fa:	2110      	movs	r1, #16
    22fc:	f000 fe40 	bl	0x2f80				; Wiznet_Write_Address
    2300:	2000      	movs	r0, #0
    2302:	e7e5      	b.n	0x22d0
    2304:	2001      	movs	r0, #1
    2306:	e7e3      	b.n	0x22d0
    2308:	0401      	lsls	r1, r0, #16
    230a:	0000      	movs	r0, r0
    230c:	b510      	push	{r4, lr}
    230e:	4604      	mov	r4, r0
    2310:	0221      	lsls	r1, r4, #8
    2312:	2201      	movs	r2, #1
    2314:	0292      	lsls	r2, r2, #10
    2316:	1889      	adds	r1, r1, r2
    2318:	b288      	uxth	r0, r1
    231a:	2102      	movs	r1, #2
    231c:	f000 fe30 	bl	0x2f80				; Wiznet_Write_Address
    2320:	0221      	lsls	r1, r4, #8
    2322:	4a0d      	ldr	r2, [pc, #52]	; (0x2358)
    2324:	1889      	adds	r1, r1, r2
    2326:	b288      	uxth	r0, r1
    2328:	2101      	movs	r1, #1
    232a:	f000 fe29 	bl	0x2f80				; Wiznet_Write_Address
    232e:	0221      	lsls	r1, r4, #8
    2330:	4a09      	ldr	r2, [pc, #36]	; (0x2358)
    2332:	1c92      	adds	r2, r2, #2
    2334:	1889      	adds	r1, r1, r2
    2336:	b288      	uxth	r0, r1
    2338:	f7ff fc32 	bl	0x1ba0				; Wiznet_Read_Address
    233c:	2822      	cmp	r0, #34	; 0x22
    233e:	d008      	beq.n	0x2352
    2340:	0221      	lsls	r1, r4, #8
    2342:	4a05      	ldr	r2, [pc, #20]	; (0x2358)
    2344:	1889      	adds	r1, r1, r2
    2346:	b288      	uxth	r0, r1
    2348:	2110      	movs	r1, #16
    234a:	f000 fe19 	bl	0x2f80				; Wiznet_Write_Address
    234e:	2000      	movs	r0, #0
    2350:	bd10      	pop	{r4, pc}
    2352:	2001      	movs	r0, #1
    2354:	e7fc      	b.n	0x2350
    2356:	0000      	movs	r0, r0
    2358:	0401      	lsls	r1, r0, #16
    235a:	0000      	movs	r0, r0

TIM0Handler:
    235c:	b510      	push	{r4, lr}
    235e:	4806      	ldr	r0, [pc, #24]	; (0x2378)
    2360:	6880      	ldr	r0, [r0, #8]
    2362:	2101      	movs	r1, #1
    2364:	4308      	orrs	r0, r1
    2366:	4904      	ldr	r1, [pc, #16]	; (0x2378)
    2368:	6088      	str	r0, [r1, #8]
    236a:	4804      	ldr	r0, [pc, #16]	; (0x237c)
    236c:	6800      	ldr	r0, [r0, #0]
    236e:	2800      	cmp	r0, #0
    2370:	d001      	beq.n	0x2376
    2372:	f001 f893 	bl	0x349c
    2376:	bd10      	pop	{r4, pc}

    2378:	40010000      	;	TIM0/TIM1 control registers
    237c:	20000038      	;

    2380:	4823      	ldr	r0, [pc, #140]	; (0x2410)
    2382:	6880      	ldr	r0, [r0, #8]
    2384:	2104      	movs	r1, #4
    2386:	4308      	orrs	r0, r1
    2388:	4921      	ldr	r1, [pc, #132]	; (0x2410)
    238a:	6088      	str	r0, [r1, #8]
    238c:	4608      	mov	r0, r1
    238e:	6940      	ldr	r0, [r0, #20]
    2390:	2107      	movs	r1, #7
    2392:	0209      	lsls	r1, r1, #8
    2394:	4388      	bics	r0, r1
    2396:	491e      	ldr	r1, [pc, #120]	; (0x2410)
    2398:	6148      	str	r0, [r1, #20]
    239a:	2005      	movs	r0, #5
    239c:	0700      	lsls	r0, r0, #28
    239e:	68c0      	ldr	r0, [r0, #12]
    23a0:	2104      	movs	r1, #4
    23a2:	4308      	orrs	r0, r1
    23a4:	2105      	movs	r1, #5
    23a6:	0709      	lsls	r1, r1, #28
    23a8:	60c8      	str	r0, [r1, #12]
    23aa:	4608      	mov	r0, r1
    23ac:	68c0      	ldr	r0, [r0, #12]
    23ae:	2104      	movs	r1, #4
    23b0:	4388      	bics	r0, r1
    23b2:	2105      	movs	r1, #5
    23b4:	0709      	lsls	r1, r1, #28
    23b6:	60c8      	str	r0, [r1, #12]
    23b8:	4816      	ldr	r0, [pc, #88]	; (0x2414)
    23ba:	6800      	ldr	r0, [r0, #0]
    23bc:	2103      	movs	r1, #3
    23be:	06c9      	lsls	r1, r1, #27
    23c0:	4388      	bics	r0, r1
    23c2:	4914      	ldr	r1, [pc, #80]	; (0x2414)
    23c4:	6008      	str	r0, [r1, #0]
    23c6:	4608      	mov	r0, r1
    23c8:	6800      	ldr	r0, [r0, #0]
    23ca:	02c9      	lsls	r1, r1, #11
    23cc:	4308      	orrs	r0, r1
    23ce:	4911      	ldr	r1, [pc, #68]	; (0x2414)
    23d0:	6008      	str	r0, [r1, #0]
    23d2:	4608      	mov	r0, r1
    23d4:	6800      	ldr	r0, [r0, #0]
    23d6:	0a00      	lsrs	r0, r0, #8
    23d8:	0200      	lsls	r0, r0, #8
    23da:	6008      	str	r0, [r1, #0]
    23dc:	480e      	ldr	r0, [pc, #56]	; (0x2418)
    23de:	6048      	str	r0, [r1, #4]
    23e0:	4608      	mov	r0, r1
    23e2:	6800      	ldr	r0, [r0, #0]
    23e4:	0349      	lsls	r1, r1, #13
    23e6:	4308      	orrs	r0, r1
    23e8:	490a      	ldr	r1, [pc, #40]	; (0x2414)
    23ea:	6008      	str	r0, [r1, #0]
    23ec:	1588      	asrs	r0, r1, #22
    23ee:	490b      	ldr	r1, [pc, #44]	; (0x241c)
    23f0:	6008      	str	r0, [r1, #0]
    23f2:	4808      	ldr	r0, [pc, #32]	; (0x2414)
    23f4:	6800      	ldr	r0, [r0, #0]
    23f6:	2101      	movs	r1, #1
    23f8:	0689      	lsls	r1, r1, #26
    23fa:	4308      	orrs	r0, r1
    23fc:	4905      	ldr	r1, [pc, #20]	; (0x2414)
    23fe:	6008      	str	r0, [r1, #0]
    2400:	4608      	mov	r0, r1
    2402:	6800      	ldr	r0, [r0, #0]
    2404:	0389      	lsls	r1, r1, #14
    2406:	4308      	orrs	r0, r1
    2408:	4902      	ldr	r1, [pc, #8]	; (0x2414)
    240a:	6008      	str	r0, [r1, #0]
    240c:	4770      	bx	lr
    240e:	0000      	movs	r0, r0

    2410:	50000200      	;	Clock Control registers
    2414:	40010000      	;	TIM0/TIM1 Control registers
    2418:	0001d4c0      	;
    241c:	e000e100      	;	NVIC / external interrupt control registers

TIM1Handler:
    2420:	b510      	push	{r4, lr}
    2422:	4805      	ldr	r0, [pc, #20]	; (0x2438)
    2424:	6a80      	ldr	r0, [r0, #40]	; 0x28
    2426:	2101      	movs	r1, #1
    2428:	4308      	orrs	r0, r1
    242a:	4903      	ldr	r1, [pc, #12]	; (0x2438)
    242c:	6288      	str	r0, [r1, #40]	; 0x28
    242e:	2100      	movs	r1, #0
    2430:	2003      	movs	r0, #3
    2432:	f000 ff3b 	bl	0x32ac
    2436:	bd10      	pop	{r4, pc}

    2438:	40010000      	;	TIM0/TIM1 Control registers

    243c:	4823      	ldr	r0, [pc, #140]	; (0x24cc)
    243e:	6880      	ldr	r0, [r0, #8]
    2440:	2108      	movs	r1, #8
    2442:	4308      	orrs	r0, r1
    2444:	4921      	ldr	r1, [pc, #132]	; (0x24cc)
    2446:	6088      	str	r0, [r1, #8]
    2448:	4608      	mov	r0, r1
    244a:	6940      	ldr	r0, [r0, #20]
    244c:	2107      	movs	r1, #7
    244e:	0309      	lsls	r1, r1, #12
    2450:	4388      	bics	r0, r1
    2452:	491e      	ldr	r1, [pc, #120]	; (0x24cc)
    2454:	6148      	str	r0, [r1, #20]
    2456:	2005      	movs	r0, #5
    2458:	0700      	lsls	r0, r0, #28
    245a:	68c0      	ldr	r0, [r0, #12]
    245c:	2108      	movs	r1, #8
    245e:	4308      	orrs	r0, r1
    2460:	2105      	movs	r1, #5
    2462:	0709      	lsls	r1, r1, #28
    2464:	60c8      	str	r0, [r1, #12]
    2466:	4608      	mov	r0, r1
    2468:	68c0      	ldr	r0, [r0, #12]
    246a:	2108      	movs	r1, #8
    246c:	4388      	bics	r0, r1
    246e:	2105      	movs	r1, #5
    2470:	0709      	lsls	r1, r1, #28
    2472:	60c8      	str	r0, [r1, #12]
    2474:	4816      	ldr	r0, [pc, #88]	; (0x24d0)
    2476:	6a00      	ldr	r0, [r0, #32]
    2478:	2103      	movs	r1, #3
    247a:	06c9      	lsls	r1, r1, #27
    247c:	4388      	bics	r0, r1
    247e:	4914      	ldr	r1, [pc, #80]	; (0x24d0)
    2480:	6208      	str	r0, [r1, #32]
    2482:	4608      	mov	r0, r1
    2484:	6a00      	ldr	r0, [r0, #32]
    2486:	02c9      	lsls	r1, r1, #11
    2488:	4308      	orrs	r0, r1
    248a:	4911      	ldr	r1, [pc, #68]	; (0x24d0)
    248c:	6208      	str	r0, [r1, #32]
    248e:	4608      	mov	r0, r1
    2490:	6a00      	ldr	r0, [r0, #32]
    2492:	0a00      	lsrs	r0, r0, #8
    2494:	0200      	lsls	r0, r0, #8
    2496:	6208      	str	r0, [r1, #32]
    2498:	480e      	ldr	r0, [pc, #56]	; (0x24d4)
    249a:	6248      	str	r0, [r1, #36]	; 0x24
    249c:	4608      	mov	r0, r1
    249e:	6a00      	ldr	r0, [r0, #32]
    24a0:	0349      	lsls	r1, r1, #13
    24a2:	4308      	orrs	r0, r1
    24a4:	490a      	ldr	r1, [pc, #40]	; (0x24d0)
    24a6:	6208      	str	r0, [r1, #32]
    24a8:	1548      	asrs	r0, r1, #21
    24aa:	490b      	ldr	r1, [pc, #44]	; (0x24d8)
    24ac:	6008      	str	r0, [r1, #0]
    24ae:	4808      	ldr	r0, [pc, #32]	; (0x24d0)
    24b0:	6a00      	ldr	r0, [r0, #32]
    24b2:	2101      	movs	r1, #1
    24b4:	0689      	lsls	r1, r1, #26
    24b6:	4308      	orrs	r0, r1
    24b8:	4905      	ldr	r1, [pc, #20]	; (0x24d0)
    24ba:	6208      	str	r0, [r1, #32]
    24bc:	4608      	mov	r0, r1
    24be:	6a00      	ldr	r0, [r0, #32]
    24c0:	0389      	lsls	r1, r1, #14
    24c2:	4308      	orrs	r0, r1
    24c4:	4902      	ldr	r1, [pc, #8]	; (0x24d0)
    24c6:	6208      	str	r0, [r1, #32]
    24c8:	4770      	bx	lr
    24ca:	0000      	movs	r0, r0

    24cc:	50000200      	;	Clock Control registers
    24d0:	40010000      	;	TIM0/TIM1 Control registers
    24d4:	005b8d80      	;
    24d8:	e000e100      	;	NVIC / external interrupt control registers

TIM2Handler:
    24dc:	b510      	push	{r4, lr}
    24de:	480e      	ldr	r0, [pc, #56]	; (0x2518)
    24e0:	6880      	ldr	r0, [r0, #8]
    24e2:	2101      	movs	r1, #1
    24e4:	4308      	orrs	r0, r1
    24e6:	490c      	ldr	r1, [pc, #48]	; (0x2518)
    24e8:	6088      	str	r0, [r1, #8]
    24ea:	480c      	ldr	r0, [pc, #48]	; (0x251c)
    24ec:	6800      	ldr	r0, [r0, #0]
    24ee:	0480      	lsls	r0, r0, #18
    24f0:	0fc0      	lsrs	r0, r0, #31
    24f2:	d10f      	bne.n	0x2514
    24f4:	480a      	ldr	r0, [pc, #40]	; (0x2520)
    24f6:	7800      	ldrb	r0, [r0, #0]
    24f8:	1c40      	adds	r0, r0, #1
    24fa:	b2c0      	uxtb	r0, r0
    24fc:	4908      	ldr	r1, [pc, #32]	; (0x2520)
    24fe:	7008      	strb	r0, [r1, #0]
    2500:	2814      	cmp	r0, #20
    2502:	d107      	bne.n	0x2514
    2504:	2000      	movs	r0, #0
    2506:	7008      	strb	r0, [r1, #0]
    2508:	2316      	movs	r3, #22
    250a:	4a06      	ldr	r2, [pc, #24]	; (0x2524)
    250c:	2103      	movs	r1, #3
    250e:	2001      	movs	r0, #1
    2510:	f7fe fc44 	bl	0xd9c
    2514:	bd10      	pop	{r4, pc}
    2516:	0000      	movs	r0, r0

    2518:	40110000      	;	TIM2/TIM3 Control registers
    251c:	20000008      	;
    2520:	20000010      	;
    2524:	00003471      	;

    2528:	4824      	ldr	r0, [pc, #144]	; (0x25bc)
    252a:	6880      	ldr	r0, [r0, #8]
    252c:	2110      	movs	r1, #16
    252e:	4308      	orrs	r0, r1
    2530:	4922      	ldr	r1, [pc, #136]	; (0x25bc)
    2532:	6088      	str	r0, [r1, #8]
    2534:	4608      	mov	r0, r1
    2536:	6940      	ldr	r0, [r0, #20]
    2538:	2107      	movs	r1, #7
    253a:	0409      	lsls	r1, r1, #16
    253c:	4388      	bics	r0, r1
    253e:	491f      	ldr	r1, [pc, #124]	; (0x25bc)
    2540:	6148      	str	r0, [r1, #20]
    2542:	2005      	movs	r0, #5
    2544:	0700      	lsls	r0, r0, #28
    2546:	68c0      	ldr	r0, [r0, #12]
    2548:	2110      	movs	r1, #16
    254a:	4308      	orrs	r0, r1
    254c:	2105      	movs	r1, #5
    254e:	0709      	lsls	r1, r1, #28
    2550:	60c8      	str	r0, [r1, #12]
    2552:	4608      	mov	r0, r1
    2554:	68c0      	ldr	r0, [r0, #12]
    2556:	2110      	movs	r1, #16
    2558:	4388      	bics	r0, r1
    255a:	2105      	movs	r1, #5
    255c:	0709      	lsls	r1, r1, #28
    255e:	60c8      	str	r0, [r1, #12]
    2560:	4817      	ldr	r0, [pc, #92]	; (0x25c0)
    2562:	6800      	ldr	r0, [r0, #0]
    2564:	0a00      	lsrs	r0, r0, #8
    2566:	0200      	lsls	r0, r0, #8
    2568:	4915      	ldr	r1, [pc, #84]	; (0x25c0)
    256a:	6008      	str	r0, [r1, #0]
    256c:	4815      	ldr	r0, [pc, #84]	; (0x25c4)
    256e:	6048      	str	r0, [r1, #4]
    2570:	4608      	mov	r0, r1
    2572:	6800      	ldr	r0, [r0, #0]
    2574:	2103      	movs	r1, #3
    2576:	06c9      	lsls	r1, r1, #27
    2578:	4388      	bics	r0, r1
    257a:	4911      	ldr	r1, [pc, #68]	; (0x25c0)
    257c:	6008      	str	r0, [r1, #0]
    257e:	4608      	mov	r0, r1
    2580:	6800      	ldr	r0, [r0, #0]
    2582:	2101      	movs	r1, #1
    2584:	06c9      	lsls	r1, r1, #27
    2586:	4308      	orrs	r0, r1
    2588:	490d      	ldr	r1, [pc, #52]	; (0x25c0)
    258a:	6008      	str	r0, [r1, #0]
    258c:	4608      	mov	r0, r1
    258e:	6800      	ldr	r0, [r0, #0]
    2590:	0349      	lsls	r1, r1, #13
    2592:	4308      	orrs	r0, r1
    2594:	490a      	ldr	r1, [pc, #40]	; (0x25c0)
    2596:	6008      	str	r0, [r1, #0]
    2598:	2001      	movs	r0, #1
    259a:	0280      	lsls	r0, r0, #10
    259c:	490a      	ldr	r1, [pc, #40]	; (0x25c8)
    259e:	6008      	str	r0, [r1, #0]
    25a0:	4807      	ldr	r0, [pc, #28]	; (0x25c0)
    25a2:	6800      	ldr	r0, [r0, #0]
    25a4:	2101      	movs	r1, #1
    25a6:	0689      	lsls	r1, r1, #26
    25a8:	4308      	orrs	r0, r1
    25aa:	4905      	ldr	r1, [pc, #20]	; (0x25c0)
    25ac:	6008      	str	r0, [r1, #0]
    25ae:	4608      	mov	r0, r1
    25b0:	6800      	ldr	r0, [r0, #0]
    25b2:	0389      	lsls	r1, r1, #14
    25b4:	4308      	orrs	r0, r1
    25b6:	4902      	ldr	r1, [pc, #8]	; (0x25c0)
    25b8:	6008      	str	r0, [r1, #0]
    25ba:	4770      	bx	lr

    25bc:	50000200      	;	Clock Control registers
    25c0:	40110000      	;	TIM2/TIM3 Control registers
    25c4:	00249f00      	;
    25c8:	e000e100      	;	NVIC / external interrupt control registers

TIM3Handler:
    25cc:	4803      	ldr	r0, [pc, #12]	; (0x25dc)
    25ce:	6a80      	ldr	r0, [r0, #40]	; 0x28
    25d0:	2101      	movs	r1, #1
    25d2:	4308      	orrs	r0, r1
    25d4:	4901      	ldr	r1, [pc, #4]	; (0x25dc)
    25d6:	6288      	str	r0, [r1, #40]	; 0x28
    25d8:	4770      	bx	lr

    25da:	0000      	;	padding
    25dc:	40110000      	;	TIM2/TIM3 Control registers

    25e0:	4822      	ldr	r0, [pc, #136]	; (0x266c)
    25e2:	6880      	ldr	r0, [r0, #8]
    25e4:	2120      	movs	r1, #32
    25e6:	4308      	orrs	r0, r1
    25e8:	4920      	ldr	r1, [pc, #128]	; (0x266c)
    25ea:	6088      	str	r0, [r1, #8]
    25ec:	4608      	mov	r0, r1
    25ee:	6940      	ldr	r0, [r0, #20]
    25f0:	2107      	movs	r1, #7
    25f2:	0509      	lsls	r1, r1, #20
    25f4:	4388      	bics	r0, r1
    25f6:	491d      	ldr	r1, [pc, #116]	; (0x266c)
    25f8:	6148      	str	r0, [r1, #20]
    25fa:	2005      	movs	r0, #5
    25fc:	0700      	lsls	r0, r0, #28
    25fe:	68c0      	ldr	r0, [r0, #12]
    2600:	2120      	movs	r1, #32
    2602:	4308      	orrs	r0, r1
    2604:	2105      	movs	r1, #5
    2606:	0709      	lsls	r1, r1, #28
    2608:	60c8      	str	r0, [r1, #12]
    260a:	4608      	mov	r0, r1
    260c:	68c0      	ldr	r0, [r0, #12]
    260e:	2120      	movs	r1, #32
    2610:	4388      	bics	r0, r1
    2612:	2105      	movs	r1, #5
    2614:	0709      	lsls	r1, r1, #28
    2616:	60c8      	str	r0, [r1, #12]
    2618:	4815      	ldr	r0, [pc, #84]	; (0x2670)
    261a:	6a00      	ldr	r0, [r0, #32]
    261c:	2103      	movs	r1, #3
    261e:	06c9      	lsls	r1, r1, #27
    2620:	4388      	bics	r0, r1
    2622:	4913      	ldr	r1, [pc, #76]	; (0x2670)
    2624:	6208      	str	r0, [r1, #32]
    2626:	4608      	mov	r0, r1
    2628:	6a00      	ldr	r0, [r0, #32]
    262a:	6208      	str	r0, [r1, #32]
    262c:	4608      	mov	r0, r1
    262e:	6a00      	ldr	r0, [r0, #32]
    2630:	0a00      	lsrs	r0, r0, #8
    2632:	0200      	lsls	r0, r0, #8
    2634:	6208      	str	r0, [r1, #32]
    2636:	480f      	ldr	r0, [pc, #60]	; (0x2674)
    2638:	6248      	str	r0, [r1, #36]	; 0x24
    263a:	4608      	mov	r0, r1
    263c:	6a00      	ldr	r0, [r0, #32]
    263e:	0349      	lsls	r1, r1, #13
    2640:	4308      	orrs	r0, r1
    2642:	490b      	ldr	r1, [pc, #44]	; (0x2670)
    2644:	6208      	str	r0, [r1, #32]
    2646:	2001      	movs	r0, #1
    2648:	02c0      	lsls	r0, r0, #11
    264a:	490b      	ldr	r1, [pc, #44]	; (0x2678)
    264c:	6008      	str	r0, [r1, #0]
    264e:	4808      	ldr	r0, [pc, #32]	; (0x2670)
    2650:	6a00      	ldr	r0, [r0, #32]
    2652:	2101      	movs	r1, #1
    2654:	0689      	lsls	r1, r1, #26
    2656:	4308      	orrs	r0, r1
    2658:	4905      	ldr	r1, [pc, #20]	; (0x2670)
    265a:	6208      	str	r0, [r1, #32]
    265c:	4608      	mov	r0, r1
    265e:	6a00      	ldr	r0, [r0, #32]
    2660:	0389      	lsls	r1, r1, #14
    2662:	4308      	orrs	r0, r1
    2664:	4902      	ldr	r1, [pc, #8]	; (0x2670)
    2666:	6208      	str	r0, [r1, #32]
    2668:	4770      	bx	lr
    266a:	0000      	movs	r0, r0

    266c:	50000200      	;	Clock Control registers
    2670:	40110000      	;	TIM2/TIM3 Control registers
    2674:	00b71b00      	;
    2678:	e000e100      	;	NVIC / external interrupt control registers

BigJumpTable?
    267c:	b500      	push	{lr}
    267e:	4602      	mov	r2, r0				; r2 := parameter1 (which timer? 1,2,3 or 4)
    2680:	2a01      	cmp	r2, #1
    2682:	d006      	beq.n	0x2692
    2684:	2a02      	cmp	r2, #2
    2686:	d007      	beq.n	0x2698
    2688:	2a03      	cmp	r2, #3
    268a:	d008      	beq.n	0x269e
    268c:	2a04      	cmp	r2, #4
    268e:	d10c      	bne.n	0x26aa
    2690:	e008      	b.n	0x26a4

    2692:	f7ff fe75 	bl	0x2380
    2696:	e009      	b.n	0x26ac

    2698:	f7ff fed0 	bl	0x243c
    269c:	e006      	b.n	0x26ac

    269e:	f7ff ff43 	bl	0x2528
    26a2:	e003      	b.n	0x26ac

    26a4:	f7ff ff9c 	bl	0x25e0
    26a8:	e000      	b.n	0x26ac

    26aa:	bf00      	nop

ElseIfError?
    26ac:	bf00      	nop
    26ae:	bd00      	pop	{pc}
    26b0:	e027      	b.n	0x2702
    26b2:	481f      	ldr	r0, [pc, #124]	; (0x2730)
    26b4:	6800      	ldr	r0, [r0, #0]
    26b6:	2108      	movs	r1, #8
    26b8:	4308      	orrs	r0, r1
    26ba:	491d      	ldr	r1, [pc, #116]	; (0x2730)
    26bc:	6008      	str	r0, [r1, #0]
    26be:	4608      	mov	r0, r1
    26c0:	6800      	ldr	r0, [r0, #0]
    26c2:	2120      	movs	r1, #32
    26c4:	4308      	orrs	r0, r1
    26c6:	491a      	ldr	r1, [pc, #104]	; (0x2730)
    26c8:	6008      	str	r0, [r1, #0]
    26ca:	bf00      	nop
    26cc:	4818      	ldr	r0, [pc, #96]	; (0x2730)
    26ce:	6800      	ldr	r0, [r0, #0]
    26d0:	2108      	movs	r1, #8
    26d2:	4008      	ands	r0, r1
    26d4:	2808      	cmp	r0, #8
    26d6:	d1f9      	bne.n	0x26cc
    26d8:	4815      	ldr	r0, [pc, #84]	; (0x2730)
    26da:	6800      	ldr	r0, [r0, #0]
    26dc:	2120      	movs	r1, #32
    26de:	4388      	bics	r0, r1
    26e0:	4913      	ldr	r1, [pc, #76]	; (0x2730)
    26e2:	6008      	str	r0, [r1, #0]
    26e4:	20a0      	movs	r0, #160	; 0xa0
    26e6:	6088      	str	r0, [r1, #8]
    26e8:	4608      	mov	r0, r1
    26ea:	6800      	ldr	r0, [r0, #0]
    26ec:	2108      	movs	r1, #8
    26ee:	4308      	orrs	r0, r1
    26f0:	490f      	ldr	r1, [pc, #60]	; (0x2730)
    26f2:	6008      	str	r0, [r1, #0]
    26f4:	bf00      	nop
    26f6:	480e      	ldr	r0, [pc, #56]	; (0x2730)
    26f8:	6800      	ldr	r0, [r0, #0]
    26fa:	2108      	movs	r1, #8
    26fc:	4008      	ands	r0, r1
    26fe:	2808      	cmp	r0, #8
    2700:	d1f9      	bne.n	0x26f6
    2702:	480b      	ldr	r0, [pc, #44]	; (0x2730)
    2704:	68c0      	ldr	r0, [r0, #12]
    2706:	2818      	cmp	r0, #24
    2708:	d1d3      	bne.n	0x26b2
    270a:	4809      	ldr	r0, [pc, #36]	; (0x2730)
    270c:	6800      	ldr	r0, [r0, #0]
    270e:	2108      	movs	r1, #8
    2710:	4308      	orrs	r0, r1
    2712:	4907      	ldr	r1, [pc, #28]	; (0x2730)
    2714:	6008      	str	r0, [r1, #0]
    2716:	4608      	mov	r0, r1
    2718:	6800      	ldr	r0, [r0, #0]
    271a:	2110      	movs	r1, #16
    271c:	4308      	orrs	r0, r1
    271e:	4904      	ldr	r1, [pc, #16]	; (0x2730)
    2720:	6008      	str	r0, [r1, #0]
    2722:	bf00      	nop
    2724:	4802      	ldr	r0, [pc, #8]	; (0x2730)
    2726:	6800      	ldr	r0, [r0, #0]
    2728:	2110      	movs	r1, #16
    272a:	4208      	tst	r0, r1
    272c:	d1fa      	bne.n	0x2724
    272e:	4770      	bx	lr

    2730:	40020000      	;	I2C 0 registers

UART1Handler:
    2734:	b508      	push	{r3, lr}
    2736:	4830      	ldr	r0, [pc, #192]	; (0x27f8)
    2738:	69c0      	ldr	r0, [r0, #28]
    273a:	21ff      	movs	r1, #255	; 0xff
    273c:	3101      	adds	r1, #1
    273e:	4208      	tst	r0, r1
    2740:	d058      	beq.n	0x27f4
    2742:	e052      	b.n	0x27ea
    2744:	bf00      	nop
    2746:	482c      	ldr	r0, [pc, #176]	; (0x27f8)
    2748:	6980      	ldr	r0, [r0, #24]
    274a:	2101      	movs	r1, #1
    274c:	0389      	lsls	r1, r1, #14
    274e:	4208      	tst	r0, r1
    2750:	d1f9      	bne.n	0x2746
    2752:	4829      	ldr	r0, [pc, #164]	; (0x27f8)
    2754:	6800      	ldr	r0, [r0, #0]
    2756:	b2c0      	uxtb	r0, r0
    2758:	9000      	str	r0, [sp, #0]
    275a:	4828      	ldr	r0, [pc, #160]	; (0x27fc)
    275c:	8800      	ldrh	r0, [r0, #0]
    275e:	28ff      	cmp	r0, #255	; 0xff
    2760:	dc1e      	bgt.n	0x27a0
    2762:	4668      	mov	r0, sp
    2764:	7800      	ldrb	r0, [r0, #0]
    2766:	4926      	ldr	r1, [pc, #152]	; (0x2800)
    2768:	4a26      	ldr	r2, [pc, #152]	; (0x2804)
    276a:	8812      	ldrh	r2, [r2, #0]
    276c:	5488      	strb	r0, [r1, r2]
    276e:	4825      	ldr	r0, [pc, #148]	; (0x2804)
    2770:	8800      	ldrh	r0, [r0, #0]
    2772:	28ff      	cmp	r0, #255	; 0xff
    2774:	d101      	bne.n	0x277a
    2776:	2000      	movs	r0, #0
    2778:	e002      	b.n	0x2780
    277a:	4822      	ldr	r0, [pc, #136]	; (0x2804)
    277c:	8800      	ldrh	r0, [r0, #0]
    277e:	1c40      	adds	r0, r0, #1
    2780:	4920      	ldr	r1, [pc, #128]	; (0x2804)
    2782:	8008      	strh	r0, [r1, #0]
    2784:	481d      	ldr	r0, [pc, #116]	; (0x27fc)
    2786:	8800      	ldrh	r0, [r0, #0]
    2788:	1c40      	adds	r0, r0, #1
    278a:	491c      	ldr	r1, [pc, #112]	; (0x27fc)
    278c:	8008      	strh	r0, [r1, #0]
    278e:	481e      	ldr	r0, [pc, #120]	; (0x2808)
    2790:	6800      	ldr	r0, [r0, #0]
    2792:	2101      	movs	r1, #1
    2794:	02c9      	lsls	r1, r1, #11
    2796:	4388      	bics	r0, r1
    2798:	1840      	adds	r0, r0, r1
    279a:	491b      	ldr	r1, [pc, #108]	; (0x2808)
    279c:	6008      	str	r0, [r1, #0]
    279e:	e024      	b.n	0x27ea
    27a0:	2000      	movs	r0, #0
    27a2:	4918      	ldr	r1, [pc, #96]	; (0x2804)
    27a4:	8008      	strh	r0, [r1, #0]
    27a6:	4915      	ldr	r1, [pc, #84]	; (0x27fc)
    27a8:	8008      	strh	r0, [r1, #0]
    27aa:	4918      	ldr	r1, [pc, #96]	; (0x280c)
    27ac:	8008      	strh	r0, [r1, #0]
    27ae:	4668      	mov	r0, sp
    27b0:	7801      	ldrb	r1, [r0, #0]
    27b2:	4813      	ldr	r0, [pc, #76]	; (0x2800)
    27b4:	4a13      	ldr	r2, [pc, #76]	; (0x2804)
    27b6:	8812      	ldrh	r2, [r2, #0]
    27b8:	5481      	strb	r1, [r0, r2]
    27ba:	4812      	ldr	r0, [pc, #72]	; (0x2804)
    27bc:	8800      	ldrh	r0, [r0, #0]
    27be:	28ff      	cmp	r0, #255	; 0xff
    27c0:	d101      	bne.n	0x27c6
    27c2:	2000      	movs	r0, #0
    27c4:	e002      	b.n	0x27cc
    27c6:	480f      	ldr	r0, [pc, #60]	; (0x2804)
    27c8:	8800      	ldrh	r0, [r0, #0]
    27ca:	1c40      	adds	r0, r0, #1
    27cc:	490d      	ldr	r1, [pc, #52]	; (0x2804)
    27ce:	8008      	strh	r0, [r1, #0]
    27d0:	480a      	ldr	r0, [pc, #40]	; (0x27fc)
    27d2:	8800      	ldrh	r0, [r0, #0]
    27d4:	1c40      	adds	r0, r0, #1
    27d6:	4909      	ldr	r1, [pc, #36]	; (0x27fc)
    27d8:	8008      	strh	r0, [r1, #0]
    27da:	480b      	ldr	r0, [pc, #44]	; (0x2808)
    27dc:	6800      	ldr	r0, [r0, #0]
    27de:	2101      	movs	r1, #1
    27e0:	02c9      	lsls	r1, r1, #11
    27e2:	4388      	bics	r0, r1
    27e4:	1840      	adds	r0, r0, r1
    27e6:	4908      	ldr	r1, [pc, #32]	; (0x2808)
    27e8:	6008      	str	r0, [r1, #0]
    27ea:	4803      	ldr	r0, [pc, #12]	; (0x27f8)
    27ec:	69c0      	ldr	r0, [r0, #28]
    27ee:	07c0      	lsls	r0, r0, #31
    27f0:	0fc0      	lsrs	r0, r0, #31
    27f2:	d1a7      	bne.n	0x2744
    27f4:	bd08      	pop	{r3, pc}
    27f6:	0000      	movs	r0, r0

    27f8:	40150000      	;	UART1 registers
    27fc:	2000001c      	;
    2800:	20000138      	;
    2804:	20000020      	;
    2808:	20000008      	;
    280c:	2000001e      	;

    2810:	2800      	cmp	r0, #0
    2812:	d00a      	beq.n	0x282a
    2814:	490e      	ldr	r1, [pc, #56]	; (0x2850)
    2816:	6849      	ldr	r1, [r1, #4]
    2818:	2201      	movs	r2, #1
    281a:	4311      	orrs	r1, r2
    281c:	4a0c      	ldr	r2, [pc, #48]	; (0x2850)
    281e:	6051      	str	r1, [r2, #4]
    2820:	2101      	movs	r1, #1
    2822:	0349      	lsls	r1, r1, #13
    2824:	4a0b      	ldr	r2, [pc, #44]	; (0x2854)
    2826:	6011      	str	r1, [r2, #0]
    2828:	e011      	b.n	0x284e
    282a:	490b      	ldr	r1, [pc, #44]	; (0x2858)
    282c:	6889      	ldr	r1, [r1, #8]
    282e:	2201      	movs	r2, #1
    2830:	0452      	lsls	r2, r2, #17
    2832:	4391      	bics	r1, r2
    2834:	4a08      	ldr	r2, [pc, #32]	; (0x2858)
    2836:	6091      	str	r1, [r2, #8]
    2838:	4905      	ldr	r1, [pc, #20]	; (0x2850)
    283a:	6849      	ldr	r1, [r1, #4]
    283c:	0849      	lsrs	r1, r1, #1
    283e:	0049      	lsls	r1, r1, #1
    2840:	4a03      	ldr	r2, [pc, #12]	; (0x2850)
    2842:	6051      	str	r1, [r2, #4]
    2844:	2101      	movs	r1, #1
    2846:	0349      	lsls	r1, r1, #13
    2848:	4a02      	ldr	r2, [pc, #8]	; (0x2854)
    284a:	3280      	adds	r2, #128	; 0x80
    284c:	6011      	str	r1, [r2, #0]
    284e:	4770      	bx	lr

    2850:	40150000      	;	UART1 registers
    2854:	e000e100      	;	NVIC / external interrupt control registers
    2858:	50000200      	;	Clock Control registers

    285c:	b500      	push	{lr}
    285e:	2005      	movs	r0, #5
    2860:	0700      	lsls	r0, r0, #28
    2862:	6b40      	ldr	r0, [r0, #52]	; 0x34
    2864:	4936      	ldr	r1, [pc, #216]	; (0x2940)
    2866:	4008      	ands	r0, r1
    2868:	2105      	movs	r1, #5
    286a:	0709      	lsls	r1, r1, #28
    286c:	6348      	str	r0, [r1, #52]	; 0x34
    286e:	4608      	mov	r0, r1
    2870:	6b40      	ldr	r0, [r0, #52]	; 0x34
    2872:	2103      	movs	r1, #3
    2874:	0289      	lsls	r1, r1, #10
    2876:	4308      	orrs	r0, r1
    2878:	2105      	movs	r1, #5
    287a:	0709      	lsls	r1, r1, #28
    287c:	6348      	str	r0, [r1, #52]	; 0x34
    287e:	4831      	ldr	r0, [pc, #196]	; (0x2944)
    2880:	6880      	ldr	r0, [r0, #8]
    2882:	2101      	movs	r1, #1
    2884:	0449      	lsls	r1, r1, #17
    2886:	4308      	orrs	r0, r1
    2888:	492e      	ldr	r1, [pc, #184]	; (0x2944)
    288a:	6088      	str	r0, [r1, #8]
    288c:	4608      	mov	r0, r1
    288e:	6940      	ldr	r0, [r0, #20]
    2890:	2103      	movs	r1, #3
    2892:	0609      	lsls	r1, r1, #24
    2894:	4388      	bics	r0, r1
    2896:	492b      	ldr	r1, [pc, #172]	; (0x2944)
    2898:	6148      	str	r0, [r1, #20]
    289a:	4608      	mov	r0, r1
    289c:	6980      	ldr	r0, [r0, #24]
    289e:	210f      	movs	r1, #15
    28a0:	0209      	lsls	r1, r1, #8
    28a2:	4388      	bics	r0, r1
    28a4:	4927      	ldr	r1, [pc, #156]	; (0x2944)
    28a6:	6188      	str	r0, [r1, #24]
    28a8:	2005      	movs	r0, #5
    28aa:	0700      	lsls	r0, r0, #28
    28ac:	68c0      	ldr	r0, [r0, #12]
    28ae:	0209      	lsls	r1, r1, #8
    28b0:	4308      	orrs	r0, r1
    28b2:	2105      	movs	r1, #5
    28b4:	0709      	lsls	r1, r1, #28
    28b6:	60c8      	str	r0, [r1, #12]
    28b8:	4608      	mov	r0, r1
    28ba:	68c0      	ldr	r0, [r0, #12]
    28bc:	2101      	movs	r1, #1
    28be:	0449      	lsls	r1, r1, #17
    28c0:	4388      	bics	r0, r1
    28c2:	2105      	movs	r1, #5
    28c4:	0709      	lsls	r1, r1, #28
    28c6:	60c8      	str	r0, [r1, #12]
    28c8:	481f      	ldr	r0, [pc, #124]	; (0x2948)
    28ca:	6880      	ldr	r0, [r0, #8]
    28cc:	2104      	movs	r1, #4
    28ce:	4308      	orrs	r0, r1
    28d0:	491d      	ldr	r1, [pc, #116]	; (0x2948)
    28d2:	6088      	str	r0, [r1, #8]
    28d4:	4608      	mov	r0, r1
    28d6:	6880      	ldr	r0, [r0, #8]
    28d8:	2102      	movs	r1, #2
    28da:	4308      	orrs	r0, r1
    28dc:	491a      	ldr	r1, [pc, #104]	; (0x2948)
    28de:	6088      	str	r0, [r1, #8]
    28e0:	4608      	mov	r0, r1
    28e2:	68c0      	ldr	r0, [r0, #12]
    28e4:	2108      	movs	r1, #8
    28e6:	4388      	bics	r0, r1
    28e8:	4917      	ldr	r1, [pc, #92]	; (0x2948)
    28ea:	60c8      	str	r0, [r1, #12]
    28ec:	4608      	mov	r0, r1
    28ee:	68c0      	ldr	r0, [r0, #12]
    28f0:	0880      	lsrs	r0, r0, #2
    28f2:	0080      	lsls	r0, r0, #2
    28f4:	60c8      	str	r0, [r1, #12]
    28f6:	4608      	mov	r0, r1
    28f8:	68c0      	ldr	r0, [r0, #12]
    28fa:	2103      	movs	r1, #3
    28fc:	4308      	orrs	r0, r1
    28fe:	4912      	ldr	r1, [pc, #72]	; (0x2948)
    2900:	60c8      	str	r0, [r1, #12]
    2902:	4608      	mov	r0, r1
    2904:	68c0      	ldr	r0, [r0, #12]
    2906:	2104      	movs	r1, #4
    2908:	4388      	bics	r0, r1
    290a:	490f      	ldr	r1, [pc, #60]	; (0x2948)
    290c:	60c8      	str	r0, [r1, #12]
    290e:	4608      	mov	r0, r1
    2910:	6a40      	ldr	r0, [r0, #36]	; 0x24
    2912:	2101      	movs	r1, #1
    2914:	0749      	lsls	r1, r1, #29
    2916:	4308      	orrs	r0, r1
    2918:	490b      	ldr	r1, [pc, #44]	; (0x2948)
    291a:	6248      	str	r0, [r1, #36]	; 0x24
    291c:	4608      	mov	r0, r1
    291e:	6a40      	ldr	r0, [r0, #36]	; 0x24
    2920:	2101      	movs	r1, #1
    2922:	0709      	lsls	r1, r1, #28
    2924:	4308      	orrs	r0, r1
    2926:	4908      	ldr	r1, [pc, #32]	; (0x2948)
    2928:	6248      	str	r0, [r1, #36]	; 0x24
    292a:	4608      	mov	r0, r1
    292c:	6a40      	ldr	r0, [r0, #36]	; 0x24
    292e:	21ce      	movs	r1, #206	; 0xce
    2930:	4308      	orrs	r0, r1
    2932:	4905      	ldr	r1, [pc, #20]	; (0x2948)
    2934:	6248      	str	r0, [r1, #36]	; 0x24
    2936:	20ff      	movs	r0, #255	; 0xff
    2938:	f7ff ff6a 	bl	0x2810
    293c:	bd00      	pop	{pc}
    293e:	0000      	;	padding

    2940:	fffff3f3	;
    2944:	50000200      	;	Clock Control registers
    2948:	40150000      	;	UART1 registers

    294c:	b510      	push	{r4, lr}
    294e:	4604      	mov	r4, r0
    2950:	4837      	ldr	r0, [pc, #220]	; (0x2a30)
    2952:	7800      	ldrb	r0, [r0, #0]
    2954:	0003      	movs	r3, r0
    2956:	f000 fb35 	bl	0x2fc4
    295a:	0406      	lsls	r6, r0, #16
    295c:	180e      	adds	r6, r1, r0
    295e:	2f22      	cmp	r7, #34	; 0x22
    2960:	643e      	str	r6, [r7, #64]	; 0x40
    2962:	2cfb      	cmp	r4, #251	; 0xfb
    2964:	d103      	bne.n	0x296e
    2966:	2001      	movs	r0, #1
    2968:	4931      	ldr	r1, [pc, #196]	; (0x2a30)
    296a:	7008      	strb	r0, [r1, #0]
    296c:	e002      	b.n	0x2974
    296e:	2000      	movs	r0, #0
    2970:	492f      	ldr	r1, [pc, #188]	; (0x2a30)
    2972:	7008      	strb	r0, [r1, #0]
    2974:	e059      	b.n	0x2a2a
    2976:	2c21      	cmp	r4, #33	; 0x21
    2978:	d103      	bne.n	0x2982
    297a:	2002      	movs	r0, #2
    297c:	492c      	ldr	r1, [pc, #176]	; (0x2a30)
    297e:	7008      	strb	r0, [r1, #0]
    2980:	e002      	b.n	0x2988
    2982:	2000      	movs	r0, #0
    2984:	492a      	ldr	r1, [pc, #168]	; (0x2a30)
    2986:	7008      	strb	r0, [r1, #0]
    2988:	e04f      	b.n	0x2a2a
    298a:	2c55      	cmp	r4, #85	; 0x55
    298c:	d103      	bne.n	0x2996
    298e:	2003      	movs	r0, #3
    2990:	4927      	ldr	r1, [pc, #156]	; (0x2a30)
    2992:	7008      	strb	r0, [r1, #0]
    2994:	e002      	b.n	0x299c
    2996:	2000      	movs	r0, #0
    2998:	4925      	ldr	r1, [pc, #148]	; (0x2a30)
    299a:	7008      	strb	r0, [r1, #0]
    299c:	e045      	b.n	0x2a2a
    299e:	2c18      	cmp	r4, #24
    29a0:	d106      	bne.n	0x29b0
    29a2:	2004      	movs	r0, #4
    29a4:	4922      	ldr	r1, [pc, #136]	; (0x2a30)
    29a6:	7008      	strb	r0, [r1, #0]
    29a8:	2000      	movs	r0, #0
    29aa:	4922      	ldr	r1, [pc, #136]	; (0x2a34)
    29ac:	7008      	strb	r0, [r1, #0]
    29ae:	e002      	b.n	0x29b6
    29b0:	2000      	movs	r0, #0
    29b2:	491f      	ldr	r1, [pc, #124]	; (0x2a30)
    29b4:	7008      	strb	r0, [r1, #0]
    29b6:	e038      	b.n	0x2a2a
    29b8:	2c06      	cmp	r4, #6
    29ba:	d108      	bne.n	0x29ce
    29bc:	2005      	movs	r0, #5
    29be:	491c      	ldr	r1, [pc, #112]	; (0x2a30)
    29c0:	7008      	strb	r0, [r1, #0]
    29c2:	481c      	ldr	r0, [pc, #112]	; (0x2a34)
    29c4:	7004      	strb	r4, [r0, #0]
    29c6:	2000      	movs	r0, #0
    29c8:	491b      	ldr	r1, [pc, #108]	; (0x2a38)
    29ca:	7008      	strb	r0, [r1, #0]
    29cc:	e002      	b.n	0x29d4
    29ce:	2000      	movs	r0, #0
    29d0:	4917      	ldr	r1, [pc, #92]	; (0x2a30)
    29d2:	7008      	strb	r0, [r1, #0]
    29d4:	e029      	b.n	0x2a2a
    29d6:	4817      	ldr	r0, [pc, #92]	; (0x2a34)
    29d8:	7800      	ldrb	r0, [r0, #0]
    29da:	1e40      	subs	r0, r0, #1
    29dc:	4915      	ldr	r1, [pc, #84]	; (0x2a34)
    29de:	7008      	strb	r0, [r1, #0]
    29e0:	4608      	mov	r0, r1
    29e2:	7800      	ldrb	r0, [r0, #0]
    29e4:	2800      	cmp	r0, #0
    29e6:	dd0a      	ble.n	0x29fe
    29e8:	4813      	ldr	r0, [pc, #76]	; (0x2a38)
    29ea:	7800      	ldrb	r0, [r0, #0]
    29ec:	0040      	lsls	r0, r0, #1
    29ee:	4913      	ldr	r1, [pc, #76]	; (0x2a3c)
    29f0:	520c      	strh	r4, [r1, r0]
    29f2:	4811      	ldr	r0, [pc, #68]	; (0x2a38)
    29f4:	7800      	ldrb	r0, [r0, #0]
    29f6:	1c40      	adds	r0, r0, #1
    29f8:	490f      	ldr	r1, [pc, #60]	; (0x2a38)
    29fa:	7008      	strb	r0, [r1, #0]
    29fc:	e010      	b.n	0x2a20
    29fe:	2001      	movs	r0, #1
    2a00:	490c      	ldr	r1, [pc, #48]	; (0x2a34)
    2a02:	7008      	strb	r0, [r1, #0]
    2a04:	480c      	ldr	r0, [pc, #48]	; (0x2a38)
    2a06:	7800      	ldrb	r0, [r0, #0]
    2a08:	0040      	lsls	r0, r0, #1
    2a0a:	490c      	ldr	r1, [pc, #48]	; (0x2a3c)
    2a0c:	520c      	strh	r4, [r1, r0]
    2a0e:	480a      	ldr	r0, [pc, #40]	; (0x2a38)
    2a10:	7800      	ldrb	r0, [r0, #0]
    2a12:	1c40      	adds	r0, r0, #1
    2a14:	4908      	ldr	r1, [pc, #32]	; (0x2a38)
    2a16:	7008      	strb	r0, [r1, #0]
    2a18:	4608      	mov	r0, r1
    2a1a:	7800      	ldrb	r0, [r0, #0]
    2a1c:	f7fd ffb0 	bl	0x980
    2a20:	e003      	b.n	0x2a2a
    2a22:	2000      	movs	r0, #0
    2a24:	4902      	ldr	r1, [pc, #8]	; (0x2a30)
    2a26:	7008      	strb	r0, [r1, #0]
    2a28:	bf00      	nop
    2a2a:	bf00      	nop
    2a2c:	bd10      	pop	{r4, pc}
    2a2e:	0000      	movs	r0, r0

    2a30:	20000022      	;
    2a34:	20000023      	;
    2a38:	20000024      	;
    2a3c:	20000110      	;	MessageBuffer

    2a40:	b510      	push	{r4, lr}
    2a42:	4812      	ldr	r0, [pc, #72]	; (0x2a8c)
    2a44:	8800      	ldrh	r0, [r0, #0]
    2a46:	4912      	ldr	r1, [pc, #72]	; (0x2a90)
    2a48:	8809      	ldrh	r1, [r1, #0]
    2a4a:	4288      	cmp	r0, r1
    2a4c:	d017      	beq.n	0x2a7e
    2a4e:	4811      	ldr	r0, [pc, #68]	; (0x2a94)
    2a50:	490e      	ldr	r1, [pc, #56]	; (0x2a8c)
    2a52:	8809      	ldrh	r1, [r1, #0]
    2a54:	5c44      	ldrb	r4, [r0, r1]
    2a56:	480d      	ldr	r0, [pc, #52]	; (0x2a8c)
    2a58:	8800      	ldrh	r0, [r0, #0]
    2a5a:	28ff      	cmp	r0, #255	; 0xff
    2a5c:	d101      	bne.n	0x2a62
    2a5e:	2000      	movs	r0, #0
    2a60:	e002      	b.n	0x2a68
    2a62:	480a      	ldr	r0, [pc, #40]	; (0x2a8c)
    2a64:	8800      	ldrh	r0, [r0, #0]
    2a66:	1c40      	adds	r0, r0, #1
    2a68:	4908      	ldr	r1, [pc, #32]	; (0x2a8c)
    2a6a:	8008      	strh	r0, [r1, #0]
    2a6c:	480a      	ldr	r0, [pc, #40]	; (0x2a98)
    2a6e:	8800      	ldrh	r0, [r0, #0]
    2a70:	1e40      	subs	r0, r0, #1
    2a72:	4909      	ldr	r1, [pc, #36]	; (0x2a98)
    2a74:	8008      	strh	r0, [r1, #0]
    2a76:	4620      	mov	r0, r4
    2a78:	f7ff ff68 	bl	0x294c
    2a7c:	e005      	b.n	0x2a8a
    2a7e:	4807      	ldr	r0, [pc, #28]	; (0x2a9c)
    2a80:	6800      	ldr	r0, [r0, #0]
    2a82:	0840      	lsrs	r0, r0, #1
    2a84:	0040      	lsls	r0, r0, #1
    2a86:	4905      	ldr	r1, [pc, #20]	; (0x2a9c)
    2a88:	6008      	str	r0, [r1, #0]
    2a8a:	bd10      	pop	{r4, pc}

    2a8c:	2000001e      	;
    2a90:	20000020      	;
    2a94:	20000138      	;
    2a98:	2000001c      	;
    2a9c:	20000008      	;

    2aa0:	2059      	movs	r0, #89	; 0x59
    2aa2:	4903      	ldr	r1, [pc, #12]	; (0x2ab0)
    2aa4:	6008      	str	r0, [r1, #0]
    2aa6:	2016      	movs	r0, #22
    2aa8:	6008      	str	r0, [r1, #0]
    2aaa:	2088      	movs	r0, #136	; 0x88
    2aac:	6008      	str	r0, [r1, #0]
    2aae:	4770      	bx	lr

    2ab0:	50000100      	;	System Global Control Registers

WiznetConfigureIPStack:
    2ab4:	b510      	push	{r4, lr}
    2ab6:	2180      	movs	r1, #128	; 0x80
    2ab8:	2000      	movs	r0, #0				; Wiznet_Write_Address(0, 0x80)
    2aba:	f000 fa61 	bl	0x2f80				; => RESET Wiznet chip
    2abe:	2064      	movs	r0, #100	; 0x64
    2ac0:	f7fd fd0a 	bl	0x4d8				; Delay(#100)
    2ac4:	2400      	movs	r4, #0
    2ac6:	e006      	b.n	0x2ad6				; WhileCopyGatewayCheck
WhileCopyGatewayBody:
    2ac8:	4a23      	ldr	r2, [pc, #140]	; (0x2b58)
    2aca:	5d11      	ldrb	r1, [r2, r4]
    2acc:	1c60      	adds	r0, r4, #1
    2ace:	f000 fa57 	bl	0x2f80				; Wiznet_Write_Address(1..4, Gateway[0..3])
    2ad2:	1c60      	adds	r0, r4, #1
    2ad4:	b2c4      	uxtb	r4, r0
WhileCopyGatewayCheck:
    2ad6:	2c04      	cmp	r4, #4
    2ad8:	dbf6      	blt.n	0x2ac8				; WhileCopyGatewayBody
    2ada:	2400      	movs	r4, #0
    2adc:	e006      	b.n	0x2aec				; WhileCopySubnetCheck
WhileCopySubnetBody:
    2ade:	4a1f      	ldr	r2, [pc, #124]	; (0x2b5c)
    2ae0:	5d11      	ldrb	r1, [r2, r4]
    2ae2:	1d60      	adds	r0, r4, #5
    2ae4:	f000 fa4c 	bl	0x2f80				; Wiznet_Write_Address(5..8, Subnet[0..3])
    2ae8:	1c60      	adds	r0, r4, #1
    2aea:	b2c4      	uxtb	r4, r0
WhileCopySubnetCheck:
    2aec:	2c04      	cmp	r4, #4
    2aee:	dbf6      	blt.n	0x2ade				; WhileCopySubnetBody
    2af0:	2400      	movs	r4, #0
    2af2:	e007      	b.n	0x2b04				; WhileCopyMACCheck
WhileCopyMACBody:
    2af4:	4a1a      	ldr	r2, [pc, #104]	; (0x2b60)
    2af6:	5d11      	ldrb	r1, [r2, r4]
    2af8:	4620      	mov	r0, r4
    2afa:	3009      	adds	r0, #9
    2afc:	f000 fa40 	bl	0x2f80				; Wiznet_Write_Address(9..14, MAC[0..6])
    2b00:	1c60      	adds	r0, r4, #1
    2b02:	b2c4      	uxtb	r4, r0
WhileCopyMACCheck:
    2b04:	2c06      	cmp	r4, #6
    2b06:	dbf5      	blt.n	0x2af4				; WhileCopyMACBody
    2b08:	2400      	movs	r4, #0
    2b0a:	e007      	b.n	0x2b1c				; WhileCopySrcIPCheck
WhileCopySrcIPBody:
    2b0c:	4a15      	ldr	r2, [pc, #84]	; (0x2b64)
    2b0e:	5d11      	ldrb	r1, [r2, r4]
    2b10:	4620      	mov	r0, r4
    2b12:	300f      	adds	r0, #15
    2b14:	f000 fa34 	bl	0x2f80				; Wiznet_Write_Address(15..18, SrcIPAddr[0..4])
    2b18:	1c60      	adds	r0, r4, #1
    2b1a:	b2c4      	uxtb	r4, r0
WhileCopySrcIPCheck:
    2b1c:	2c04      	cmp	r4, #4
    2b1e:	dbf5      	blt.n	0x2b0c				; WhileCopySrcIPBody
    2b20:	2155      	movs	r1, #85	; 0x55
    2b22:	201a      	movs	r0, #26				; Wiznet_Write_Address(0x1a, 0x55)
    2b24:	f000 fa2c 	bl	0x2f80				; => Set RX Memory Size to 0x55 bytes
    2b28:	2155      	movs	r1, #85	; 0x55
    2b2a:	201b      	movs	r0, #27				; Wiznet_Write_Address(0x1b, 0x55)
    2b2c:	f000 fa28 	bl	0x2f80				; => Set TX Memory Size to 0x55 bytes
    2b30:	a00d      	add	r0, pc, #52	; (adr r0, 0x2b68)
    2b32:	f7fd fb4f 	bl	0x1d4				; UART0_printf
    2b36:	2107      	movs	r1, #7
    2b38:	2017      	movs	r0, #23
    2b3a:	f000 fa21 	bl	0x2f80				; Wiznet_Write_Address(0x17, 0x7)
    2b3e:	21d0      	movs	r1, #208	; 0xd0
    2b40:	2018      	movs	r0, #24				; Wiznet_Write_Address(0x18, 0xd0)
    2b42:	f000 fa1d 	bl	0x2f80				; => Set Retry time value to 0x7d0 (=2000)
    2b46:	2108      	movs	r1, #8
    2b48:	2019      	movs	r0, #25				; Wiznet_Write_Address(0x19, 8)
    2b4a:	f000 fa19 	bl	0x2f80				; => Set Retry Count to 8
    2b4e:	21cf      	movs	r1, #207	; 0xcf
    2b50:	2016      	movs	r0, #22				; Wiznet_Write_Address(0x16, 0xcf)
    2b52:	f000 fa15 	bl	0x2f80				; => Enable Interrupts: all but PPPoE interrupts
    2b56:	bd10      	pop	{r4, pc}

    2b58:	20000052      	;	u8 Gateway[4]
    2b5c:	20000056      	;	u8 Subnet[4]
    2b60:	2000005a      	;	u8 MAC[6]
    2b64:	20000060      	;	u8 SrcIPAddr[4]

    2b68:	3557      	;	String 'W5100_RMSR and  W5100_TMSR all is 2k\r\n\0\0'
    2b6a:	3031		;
    2b6c:	5f30      	;
    2b6e:	4d52      	;
    2b70:	5253      	;
    2b72:	6120      	;
    2b74:	646e      	;
    2b76:	2020      	;
    2b78:	3557      	;
    2b7a:	3031      	;
    2b7c:	5f30      	;
    2b7e:	4d54      	;
    2b80:	5253      	;
    2b82:	6120      	;
    2b84:	6c6c      	;
    2b86:	6920      	;
    2b88:	2073      	;
    2b8a:	6b32      	;
    2b8c:	0a0d      	;
    2b8e:	0000      	;

WiznetInit?
    2b90:	b510      	push	{r4, lr}
    2b92:	f7ff ff8f 	bl	0x2ab4				; WiznetConfigureIPStack
    2b96:	f7fd fcaf 	bl	0x4f8				; WiznetSocketSetup
    2b9a:	2000      	movs	r0, #0
    2b9c:	f7ff fa9a 	bl	0x20d4
    2ba0:	bd10      	pop	{r4, pc}

    2ba2:	0000      	;	padding

WiznetHandleIncoming: ???
    2ba4:	b570      	push	{r4, r5, r6, lr}
    2ba6:	2000      	movs	r0, #0
    2ba8:	494b      	ldr	r1, [pc, #300]	; (0x2cd8)
    2baa:	7008      	strb	r0, [r1, #0]
    2bac:	2015      	movs	r0, #21
    2bae:	f7fe fff7 	bl	0x1ba0				; Wiznet_Read_Address(0x15) (IR register)
    2bb2:	4605      	mov	r5, r0				; r5 := IR register contents
    2bb4:	20f0      	movs	r0, #240	; 0xf0
    2bb6:	4028      	ands	r0, r5
    2bb8:	4601      	mov	r1, r0
    2bba:	2015      	movs	r0, #21				; Wiznet_Write_Address(0x15, ...)
    2bbc:	f000 f9e0 	bl	0x2f80				; => clear all generic interrupt flags from wiznet
    2bc0:	2080      	movs	r0, #128	; 0x80
    2bc2:	4028      	ands	r0, r5				; IP CONFLICT flag set?
    2bc4:	2880      	cmp	r0, #128	; 0x80
    2bc6:	d102      	bne.n	0x2bce
    2bc8:	a044      	add	r0, pc, #272	; (adr r0, 0x2cdc)
    2bca:	f7fd fb03 	bl	0x1d4				; UART0_printf
    2bce:	2040      	movs	r0, #64	; 0x40
    2bd0:	4028      	ands	r0, r5				; UNREACHable flag set?
    2bd2:	2840      	cmp	r0, #64	; 0x40
    2bd4:	d102      	bne.n	0x2bdc
    2bd6:	a046      	add	r0, pc, #280	; (adr r0, 0x2cf0)
    2bd8:	f7fd fafc 	bl	0x1d4				; UART0_printf
    2bdc:	07e8      	lsls	r0, r5, #31
    2bde:	0fc0      	lsrs	r0, r0, #31			; check lowest bit
    2be0:	d03b      	beq.n	0x2c5a				; NoSocket0Interrupts
    2be2:	4847      	ldr	r0, [pc, #284]	; (0x2d00)
    2be4:	f7fe ffdc 	bl	0x1ba0				; Wiznet_Read_Address(0x402) : Socket0 IR register
    2be8:	4604      	mov	r4, r0
    2bea:	4621      	mov	r1, r4
    2bec:	4844      	ldr	r0, [pc, #272]	; (0x2d00)	; clear all marked Socket0 interrupts
    2bee:	f000 f9c7 	bl	0x2f80				; Wiznet_Write_Address : Socket0 IR register
    2bf2:	07e0      	lsls	r0, r4, #31			; check lowest bit?
    2bf4:	0fc0      	lsrs	r0, r0, #31			; Socket0 CON interrupt?
    2bf6:	d008      	beq.n	0x2c0a				; Socket0NoConnect
    2bf8:	4842      	ldr	r0, [pc, #264]	; (0x2d04)
    2bfa:	7800      	ldrb	r0, [r0, #0]
    2bfc:	2102      	movs	r1, #2
    2bfe:	4308      	orrs	r0, r1
    2c00:	4940      	ldr	r1, [pc, #256]	; (0x2d04)
    2c02:	7008      	strb	r0, [r1, #0]			; set "connected" flag in Socket0ConnectionStatusFlags
    2c04:	a040      	add	r0, pc, #256	; (adr r0, 0x2d08)
    2c06:	f7fd fae5 	bl	0x1d4				; UART0_printf
Socket0NoConnect:
    2c0a:	2002      	movs	r0, #2
    2c0c:	4204      	tst	r4, r0				; DISCON flag set?
    2c0e:	d007      	beq.n	0x2c20				; Socket0NoDisconnect
    2c10:	2110      	movs	r1, #16
    2c12:	483b      	ldr	r0, [pc, #236]	; (0x2d00)
    2c14:	1e40      	subs	r0, r0, #1
    2c16:	f000 f9b3 	bl	0x2f80				; Wiznet_Write_Address
    2c1a:	2000      	movs	r0, #0				; clear Socket0ConnectionStatusFlags
    2c1c:	4939      	ldr	r1, [pc, #228]	; (0x2d04)
    2c1e:	7008      	strb	r0, [r1, #0]
Socket0NoDisconnect:
    2c20:	2010      	movs	r0, #16
    2c22:	4204      	tst	r4, r0				; SEND_OK flag?
    2c24:	d005      	beq.n	0x2c32				; Socket0StillSending
    2c26:	483f      	ldr	r0, [pc, #252]	; (0x2d24)
    2c28:	7800      	ldrb	r0, [r0, #0]
    2c2a:	2102      	movs	r1, #2
    2c2c:	4308      	orrs	r0, r1
    2c2e:	493d      	ldr	r1, [pc, #244]	; (0x2d24)	; set ReadyToSend flag (#2) in Socket0 Status Flags ???
    2c30:	7008      	strb	r0, [r1, #0]
Socket0StillSending:
    2c32:	2004      	movs	r0, #4				; RECV flag?
    2c34:	4204      	tst	r4, r0
    2c36:	d005      	beq.n	0x2c44				; Socket0NoDataReceived
    2c38:	483a      	ldr	r0, [pc, #232]	; (0x2d24)
    2c3a:	7800      	ldrb	r0, [r0, #0]
    2c3c:	2101      	movs	r1, #1
    2c3e:	4308      	orrs	r0, r1
    2c40:	4938      	ldr	r1, [pc, #224]	; (0x2d24)	; set DataAvailable flag (#1) in Socket0 Status Flags ???
    2c42:	7008      	strb	r0, [r1, #0]
Socket0NoDataReceived:
    2c44:	2008      	movs	r0, #8				; TIMEOUT flag?
    2c46:	4204      	tst	r4, r0
    2c48:	d007      	beq.n	0x2c5a				; NoSocket0Interrupts
    2c4a:	2110      	movs	r1, #16
    2c4c:	482c      	ldr	r0, [pc, #176]	; (0x2d00)
    2c4e:	1e40      	subs	r0, r0, #1			; Wiznet_Write_Address(0x401, 0x10)
    2c50:	f000 f996 	bl	0x2f80				; => CLOSE socket (due to timeout above)
    2c54:	2000      	movs	r0, #0
    2c56:	492b      	ldr	r1, [pc, #172]	; (0x2d04)
    2c58:	7008      	strb	r0, [r1, #0]
NoSocket0Interrupts:
    2c5a:	2002      	movs	r0, #2
    2c5c:	4028      	ands	r0, r5
    2c5e:	2802      	cmp	r0, #2
    2c60:	d138      	bne.n	0x2cd4				; NoSocket1Interrupts
    2c62:	4831      	ldr	r0, [pc, #196]	; (0x2d28)
    2c64:	f7fe ff9c 	bl	0x1ba0				; Wiznet_Read_Address
    2c68:	4604      	mov	r4, r0
    2c6a:	4621      	mov	r1, r4
    2c6c:	482e      	ldr	r0, [pc, #184]	; (0x2d28)
    2c6e:	f000 f987 	bl	0x2f80				; Wiznet_Write_Address
    2c72:	07e0      	lsls	r0, r4, #31
    2c74:	0fc0      	lsrs	r0, r0, #31
    2c76:	d005      	beq.n	0x2c84
    2c78:	482c      	ldr	r0, [pc, #176]	; (0x2d2c)
    2c7a:	7800      	ldrb	r0, [r0, #0]
    2c7c:	2102      	movs	r1, #2
    2c7e:	4308      	orrs	r0, r1
    2c80:	492a      	ldr	r1, [pc, #168]	; (0x2d2c)
    2c82:	7008      	strb	r0, [r1, #0]
    2c84:	2002      	movs	r0, #2
    2c86:	4204      	tst	r4, r0
    2c88:	d007      	beq.n	0x2c9a
    2c8a:	2110      	movs	r1, #16
    2c8c:	4826      	ldr	r0, [pc, #152]	; (0x2d28)
    2c8e:	1e40      	subs	r0, r0, #1
    2c90:	f000 f976 	bl	0x2f80				; Wiznet_Write_Address
    2c94:	2000      	movs	r0, #0
    2c96:	4925      	ldr	r1, [pc, #148]	; (0x2d2c)
    2c98:	7008      	strb	r0, [r1, #0]
    2c9a:	2010      	movs	r0, #16
    2c9c:	4204      	tst	r4, r0
    2c9e:	d005      	beq.n	0x2cac
    2ca0:	4823      	ldr	r0, [pc, #140]	; (0x2d30)
    2ca2:	7800      	ldrb	r0, [r0, #0]
    2ca4:	2102      	movs	r1, #2
    2ca6:	4308      	orrs	r0, r1
    2ca8:	4921      	ldr	r1, [pc, #132]	; (0x2d30)
    2caa:	7008      	strb	r0, [r1, #0]
    2cac:	2004      	movs	r0, #4
    2cae:	4204      	tst	r4, r0
    2cb0:	d005      	beq.n	0x2cbe
    2cb2:	481f      	ldr	r0, [pc, #124]	; (0x2d30)
    2cb4:	7800      	ldrb	r0, [r0, #0]
    2cb6:	2101      	movs	r1, #1
    2cb8:	4308      	orrs	r0, r1
    2cba:	491d      	ldr	r1, [pc, #116]	; (0x2d30)
    2cbc:	7008      	strb	r0, [r1, #0]
    2cbe:	2008      	movs	r0, #8
    2cc0:	4204      	tst	r4, r0
    2cc2:	d007      	beq.n	0x2cd4				; NoSocket1Interrupts
    2cc4:	2110      	movs	r1, #16
    2cc6:	4818      	ldr	r0, [pc, #96]	; (0x2d28)
    2cc8:	1e40      	subs	r0, r0, #1
    2cca:	f000 f959 	bl	0x2f80				; Wiznet_Write_Address
    2cce:	2000      	movs	r0, #0
    2cd0:	4916      	ldr	r1, [pc, #88]	; (0x2d2c)
    2cd2:	7008      	strb	r0, [r1, #0]
NoSocket1Interrupts:
    2cd4:	bd70      	pop	{r4, r5, r6, pc}

    2cd6:	0000      	;	padding
    2cd8:	20000090      	;

    2cdc:	7069      	;	String 'ip address congtu\r\n\0'
    2cde:	6120      	;
    2ce0:	6464      	;
    2ce2:	6572      	;
    2ce4:	7373      	;
    2ce6:	6320      	;
    2ce8:	6e6f      	;
    2cea:	7467      	;
    2cec:	0d75      	;
    2cee:	000a      	;

    2cf0:	6475      	;	String 'udpno come\r\n\0\0\0'
    2cf2:	2070      	;
    2cf4:	6f6e      	;
    2cf6:	6320      	;
    2cf8:	6d6f      	;
    2cfa:	0d65      	;
    2cfc:	000a      	;
    2cfe:	0000      	;

    2d00:	00000402      	;
    2d04:	20000084      	;	Socket0ConnectionStatusFlags

    2d08:	6f73      	;	String 'socket sucessfull conect\0\0\0\0'
    2d0a:	6b63      	;
    2d0c:	7465      	;
    2d0e:	7320      	;
    2d10:	6375      	;
    2d12:	7365      	;
    2d14:	6673      	;
    2d16:	6c75      	;
    2d18:	206c      	;
    2d1a:	6f63      	;
    2d1c:	656e      	;
    2d1e:	7463      	;
    2d20:	0000      	;
    2d22:	0000      	;

    2d24:	2000008c      	;	Socket0 More Status Flags ???
    2d28:	00000502      	;
    2d2c:	20000085      	;
    2d30:	2000008d      	;

    2d34:	b510      	push	{r4, lr}
    2d36:	4818      	ldr	r0, [pc, #96]	; (0x2d98)
    2d38:	7800      	ldrb	r0, [r0, #0]
    2d3a:	2800      	cmp	r0, #0
    2d3c:	d12a      	bne.n	0x2d94
    2d3e:	4817      	ldr	r0, [pc, #92]	; (0x2d9c)
    2d40:	7800      	ldrb	r0, [r0, #0]
    2d42:	2800      	cmp	r0, #0
    2d44:	d10a      	bne.n	0x2d5c
    2d46:	f7ff faa1 	bl	0x228c
    2d4a:	2801      	cmp	r0, #1
    2d4c:	d102      	bne.n	0x2d54
    2d4e:	4912      	ldr	r1, [pc, #72]	; (0x2d98)
    2d50:	7008      	strb	r0, [r1, #0]
    2d52:	e01f      	b.n	0x2d94
    2d54:	2000      	movs	r0, #0
    2d56:	4910      	ldr	r1, [pc, #64]	; (0x2d98)
    2d58:	7008      	strb	r0, [r1, #0]
    2d5a:	e01b      	b.n	0x2d94
    2d5c:	480f      	ldr	r0, [pc, #60]	; (0x2d9c)
    2d5e:	7800      	ldrb	r0, [r0, #0]
    2d60:	2801      	cmp	r0, #1
    2d62:	d10b      	bne.n	0x2d7c
    2d64:	2000      	movs	r0, #0
    2d66:	f7ff f987 	bl	0x2078
    2d6a:	2801      	cmp	r0, #1
    2d6c:	d102      	bne.n	0x2d74
    2d6e:	490a      	ldr	r1, [pc, #40]	; (0x2d98)
    2d70:	7008      	strb	r0, [r1, #0]
    2d72:	e00f      	b.n	0x2d94
    2d74:	2000      	movs	r0, #0
    2d76:	4908      	ldr	r1, [pc, #32]	; (0x2d98)
    2d78:	7008      	strb	r0, [r1, #0]
    2d7a:	e00b      	b.n	0x2d94
    2d7c:	2000      	movs	r0, #0
    2d7e:	f7ff fac5 	bl	0x230c
    2d82:	2801      	cmp	r0, #1
    2d84:	d103      	bne.n	0x2d8e
    2d86:	2003      	movs	r0, #3
    2d88:	4903      	ldr	r1, [pc, #12]	; (0x2d98)
    2d8a:	7008      	strb	r0, [r1, #0]
    2d8c:	e002      	b.n	0x2d94
    2d8e:	2000      	movs	r0, #0
    2d90:	4901      	ldr	r1, [pc, #4]	; (0x2d98)
    2d92:	7008      	strb	r0, [r1, #0]
    2d94:	bd10      	pop	{r4, pc}
    2d96:	0000      	movs	r0, r0

    2d98:	20000084      	;	Socket0ConnectionStatusFlags
    2d9c:	20000088      	;

    2da0:	b510      	push	{r4, lr}
    2da2:	f7ff fe7d 	bl	0x2aa0
    2da6:	4812      	ldr	r0, [pc, #72]	; (0x2df0)
    2da8:	6880      	ldr	r0, [r0, #8]
    2daa:	2101      	movs	r1, #1
    2dac:	4308      	orrs	r0, r1
    2dae:	4910      	ldr	r1, [pc, #64]	; (0x2df0)
    2db0:	6088      	str	r0, [r1, #8]
    2db2:	4608      	mov	r0, r1
    2db4:	6940      	ldr	r0, [r0, #20]
    2db6:	0880      	lsrs	r0, r0, #2
    2db8:	0080      	lsls	r0, r0, #2
    2dba:	1c80      	adds	r0, r0, #2
    2dbc:	6148      	str	r0, [r1, #20]
    2dbe:	480d      	ldr	r0, [pc, #52]	; (0x2df4)
    2dc0:	6800      	ldr	r0, [r0, #0]
    2dc2:	2102      	movs	r1, #2
    2dc4:	4308      	orrs	r0, r1
    2dc6:	490b      	ldr	r1, [pc, #44]	; (0x2df4)
    2dc8:	6008      	str	r0, [r1, #0]
    2dca:	4608      	mov	r0, r1
    2dcc:	6800      	ldr	r0, [r0, #0]
    2dce:	2107      	movs	r1, #7
    2dd0:	0209      	lsls	r1, r1, #8
    2dd2:	4388      	bics	r0, r1
    2dd4:	2103      	movs	r1, #3
    2dd6:	0249      	lsls	r1, r1, #9
    2dd8:	1840      	adds	r0, r0, r1
    2dda:	4906      	ldr	r1, [pc, #24]	; (0x2df4)
    2ddc:	6008      	str	r0, [r1, #0]
    2dde:	4608      	mov	r0, r1
    2de0:	6800      	ldr	r0, [r0, #0]
    2de2:	2180      	movs	r1, #128	; 0x80
    2de4:	4308      	orrs	r0, r1
    2de6:	4903      	ldr	r1, [pc, #12]	; (0x2df4)
    2de8:	6008      	str	r0, [r1, #0]
    2dea:	f7fd ff8d 	bl	0xd08
    2dee:	bd10      	pop	{r4, pc}

    2df0:	50000200      	;	Clock Control register
    2df4:	40004000      	;	WDT timer control register

    2df8:	b570      	push	{r4, r5, r6, lr}
    2dfa:	4605      	mov	r5, r0
    2dfc:	460c      	mov	r4, r1
    2dfe:	4616      	mov	r6, r2
    2e00:	485e      	ldr	r0, [pc, #376]	; (0x2f7c)
    2e02:	6800      	ldr	r0, [r0, #0]
    2e04:	2108      	movs	r1, #8
    2e06:	4308      	orrs	r0, r1
    2e08:	495c      	ldr	r1, [pc, #368]	; (0x2f7c)
    2e0a:	6008      	str	r0, [r1, #0]
    2e0c:	4608      	mov	r0, r1
    2e0e:	6800      	ldr	r0, [r0, #0]
    2e10:	2120      	movs	r1, #32
    2e12:	4308      	orrs	r0, r1
    2e14:	4959      	ldr	r1, [pc, #356]	; (0x2f7c)
    2e16:	6008      	str	r0, [r1, #0]
    2e18:	bf00      	nop
    2e1a:	4858      	ldr	r0, [pc, #352]	; (0x2f7c)
    2e1c:	6800      	ldr	r0, [r0, #0]
    2e1e:	2108      	movs	r1, #8
    2e20:	4008      	ands	r0, r1
    2e22:	2808      	cmp	r0, #8
    2e24:	d1f9      	bne.n	0x2e1a
    2e26:	4855      	ldr	r0, [pc, #340]	; (0x2f7c)
    2e28:	6800      	ldr	r0, [r0, #0]
    2e2a:	2128      	movs	r1, #40	; 0x28
    2e2c:	4388      	bics	r0, r1
    2e2e:	4953      	ldr	r1, [pc, #332]	; (0x2f7c)
    2e30:	6008      	str	r0, [r1, #0]
    2e32:	bf00      	nop
    2e34:	4851      	ldr	r0, [pc, #324]	; (0x2f7c)
    2e36:	68c0      	ldr	r0, [r0, #12]
    2e38:	2808      	cmp	r0, #8
    2e3a:	d1fb      	bne.n	0x2e34
    2e3c:	20a0      	movs	r0, #160	; 0xa0
    2e3e:	494f      	ldr	r1, [pc, #316]	; (0x2f7c)
    2e40:	6088      	str	r0, [r1, #8]
    2e42:	4608      	mov	r0, r1
    2e44:	6800      	ldr	r0, [r0, #0]
    2e46:	2108      	movs	r1, #8
    2e48:	4308      	orrs	r0, r1
    2e4a:	494c      	ldr	r1, [pc, #304]	; (0x2f7c)
    2e4c:	6008      	str	r0, [r1, #0]
    2e4e:	bf00      	nop
    2e50:	484a      	ldr	r0, [pc, #296]	; (0x2f7c)
    2e52:	6800      	ldr	r0, [r0, #0]
    2e54:	2108      	movs	r1, #8
    2e56:	4008      	ands	r0, r1
    2e58:	2808      	cmp	r0, #8
    2e5a:	d1f9      	bne.n	0x2e50
    2e5c:	bf00      	nop
    2e5e:	4847      	ldr	r0, [pc, #284]	; (0x2f7c)
    2e60:	68c0      	ldr	r0, [r0, #12]
    2e62:	2818      	cmp	r0, #24
    2e64:	d1fb      	bne.n	0x2e5e
    2e66:	0428      	lsls	r0, r5, #16
    2e68:	0e00      	lsrs	r0, r0, #24
    2e6a:	4944      	ldr	r1, [pc, #272]	; (0x2f7c)
    2e6c:	6088      	str	r0, [r1, #8]
    2e6e:	4608      	mov	r0, r1
    2e70:	6800      	ldr	r0, [r0, #0]
    2e72:	2108      	movs	r1, #8
    2e74:	4308      	orrs	r0, r1
    2e76:	4941      	ldr	r1, [pc, #260]	; (0x2f7c)
    2e78:	6008      	str	r0, [r1, #0]
    2e7a:	bf00      	nop
    2e7c:	483f      	ldr	r0, [pc, #252]	; (0x2f7c)
    2e7e:	6800      	ldr	r0, [r0, #0]
    2e80:	2108      	movs	r1, #8
    2e82:	4008      	ands	r0, r1
    2e84:	2808      	cmp	r0, #8
    2e86:	d1f9      	bne.n	0x2e7c
    2e88:	bf00      	nop
    2e8a:	483c      	ldr	r0, [pc, #240]	; (0x2f7c)
    2e8c:	68c0      	ldr	r0, [r0, #12]
    2e8e:	2828      	cmp	r0, #40	; 0x28
    2e90:	d1fb      	bne.n	0x2e8a
    2e92:	b2e8      	uxtb	r0, r5
    2e94:	4939      	ldr	r1, [pc, #228]	; (0x2f7c)
    2e96:	6088      	str	r0, [r1, #8]
    2e98:	4608      	mov	r0, r1
    2e9a:	6800      	ldr	r0, [r0, #0]
    2e9c:	2108      	movs	r1, #8
    2e9e:	4308      	orrs	r0, r1
    2ea0:	4936      	ldr	r1, [pc, #216]	; (0x2f7c)
    2ea2:	6008      	str	r0, [r1, #0]
    2ea4:	bf00      	nop
    2ea6:	4835      	ldr	r0, [pc, #212]	; (0x2f7c)
    2ea8:	6800      	ldr	r0, [r0, #0]
    2eaa:	2108      	movs	r1, #8
    2eac:	4008      	ands	r0, r1
    2eae:	2808      	cmp	r0, #8
    2eb0:	d1f9      	bne.n	0x2ea6
    2eb2:	bf00      	nop
    2eb4:	4831      	ldr	r0, [pc, #196]	; (0x2f7c)
    2eb6:	68c0      	ldr	r0, [r0, #12]
    2eb8:	2828      	cmp	r0, #40	; 0x28
    2eba:	d1fb      	bne.n	0x2eb4
    2ebc:	2200      	movs	r2, #0
    2ebe:	e046      	b.n	0x2f4e
    2ec0:	2b00      	cmp	r3, #0
    2ec2:	d02c      	beq.n	0x2f1e
    2ec4:	8820      	ldrh	r0, [r4, #0]
    2ec6:	1200      	asrs	r0, r0, #8
    2ec8:	492c      	ldr	r1, [pc, #176]	; (0x2f7c)
    2eca:	6088      	str	r0, [r1, #8]
    2ecc:	4608      	mov	r0, r1
    2ece:	6800      	ldr	r0, [r0, #0]
    2ed0:	2108      	movs	r1, #8
    2ed2:	4308      	orrs	r0, r1
    2ed4:	4929      	ldr	r1, [pc, #164]	; (0x2f7c)
    2ed6:	6008      	str	r0, [r1, #0]
    2ed8:	bf00      	nop
    2eda:	4828      	ldr	r0, [pc, #160]	; (0x2f7c)
    2edc:	6800      	ldr	r0, [r0, #0]
    2ede:	2108      	movs	r1, #8
    2ee0:	4008      	ands	r0, r1
    2ee2:	2808      	cmp	r0, #8
    2ee4:	d1f9      	bne.n	0x2eda
    2ee6:	bf00      	nop
    2ee8:	4824      	ldr	r0, [pc, #144]	; (0x2f7c)
    2eea:	68c0      	ldr	r0, [r0, #12]
    2eec:	2828      	cmp	r0, #40	; 0x28
    2eee:	d1fb      	bne.n	0x2ee8
    2ef0:	7820      	ldrb	r0, [r4, #0]
    2ef2:	4922      	ldr	r1, [pc, #136]	; (0x2f7c)
    2ef4:	6088      	str	r0, [r1, #8]
    2ef6:	4608      	mov	r0, r1
    2ef8:	6800      	ldr	r0, [r0, #0]
    2efa:	2108      	movs	r1, #8
    2efc:	4308      	orrs	r0, r1
    2efe:	491f      	ldr	r1, [pc, #124]	; (0x2f7c)
    2f00:	6008      	str	r0, [r1, #0]
    2f02:	bf00      	nop
    2f04:	481d      	ldr	r0, [pc, #116]	; (0x2f7c)
    2f06:	6800      	ldr	r0, [r0, #0]
    2f08:	2108      	movs	r1, #8
    2f0a:	4008      	ands	r0, r1
    2f0c:	2808      	cmp	r0, #8
    2f0e:	d1f9      	bne.n	0x2f04
    2f10:	bf00      	nop
    2f12:	481a      	ldr	r0, [pc, #104]	; (0x2f7c)
    2f14:	68c0      	ldr	r0, [r0, #12]
    2f16:	2828      	cmp	r0, #40	; 0x28
    2f18:	d1fb      	bne.n	0x2f12
    2f1a:	1ca4      	adds	r4, r4, #2
    2f1c:	e015      	b.n	0x2f4a
    2f1e:	8820      	ldrh	r0, [r4, #0]
    2f20:	4916      	ldr	r1, [pc, #88]	; (0x2f7c)
    2f22:	6088      	str	r0, [r1, #8]
    2f24:	1ca4      	adds	r4, r4, #2
    2f26:	4608      	mov	r0, r1
    2f28:	6800      	ldr	r0, [r0, #0]
    2f2a:	2108      	movs	r1, #8
    2f2c:	4308      	orrs	r0, r1
    2f2e:	4913      	ldr	r1, [pc, #76]	; (0x2f7c)
    2f30:	6008      	str	r0, [r1, #0]
    2f32:	bf00      	nop
    2f34:	4811      	ldr	r0, [pc, #68]	; (0x2f7c)
    2f36:	6800      	ldr	r0, [r0, #0]
    2f38:	2108      	movs	r1, #8
    2f3a:	4008      	ands	r0, r1
    2f3c:	2808      	cmp	r0, #8
    2f3e:	d1f9      	bne.n	0x2f34
    2f40:	bf00      	nop
    2f42:	480e      	ldr	r0, [pc, #56]	; (0x2f7c)
    2f44:	68c0      	ldr	r0, [r0, #12]
    2f46:	2828      	cmp	r0, #40	; 0x28
    2f48:	d1fb      	bne.n	0x2f42
    2f4a:	1c50      	adds	r0, r2, #1
    2f4c:	b2c2      	uxtb	r2, r0
    2f4e:	42b2      	cmp	r2, r6
    2f50:	dbb6      	blt.n	0x2ec0
    2f52:	480a      	ldr	r0, [pc, #40]	; (0x2f7c)
    2f54:	6800      	ldr	r0, [r0, #0]
    2f56:	2108      	movs	r1, #8
    2f58:	4308      	orrs	r0, r1
    2f5a:	4908      	ldr	r1, [pc, #32]	; (0x2f7c)
    2f5c:	6008      	str	r0, [r1, #0]
    2f5e:	4608      	mov	r0, r1
    2f60:	6800      	ldr	r0, [r0, #0]
    2f62:	2110      	movs	r1, #16
    2f64:	4308      	orrs	r0, r1
    2f66:	4905      	ldr	r1, [pc, #20]	; (0x2f7c)
    2f68:	6008      	str	r0, [r1, #0]
    2f6a:	bf00      	nop
    2f6c:	4803      	ldr	r0, [pc, #12]	; (0x2f7c)
    2f6e:	6800      	ldr	r0, [r0, #0]
    2f70:	2110      	movs	r1, #16
    2f72:	4208      	tst	r0, r1
    2f74:	d1fa      	bne.n	0x2f6c
    2f76:	f7ff fb9b 	bl	0x26b0
    2f7a:	bd70      	pop	{r4, r5, r6, pc}

    2f7c:	40020000      	;	I2C 0 registers

Wiznet_Write_Address(address, data):
    2f80:	b570      	push	{r4, r5, r6, lr}
    2f82:	4605      	mov	r5, r0				; r5 = parameter1	ADDRESS
    2f84:	460e      	mov	r6, r1				; r6 = parameter2	DATA
    2f86:	2400      	movs	r4, #0
    2f88:	2000      	movs	r0, #0
    2f8a:	490c      	ldr	r1, [pc, #48]	; (0x2fbc)	; ???
    2f8c:	6308      	str	r0, [r1, #48]	; 0x30
    2f8e:	24f0      	movs	r4, #240	; 0xf0		; or-in MARKER for WRITE operation (0xf0)
    2f90:	0424      	lsls	r4, r4, #16
    2f92:	4620      	mov	r0, r4
    2f94:	4328      	orrs	r0, r5				; or-in ADDRESS field
    2f96:	4604      	mov	r4, r0
    2f98:	0224      	lsls	r4, r4, #8
    2f9a:	4620      	mov	r0, r4
    2f9c:	4330      	orrs	r0, r6				; or-in DATA field
    2f9e:	4604      	mov	r4, r0
    2fa0:	2120      	movs	r1, #32
    2fa2:	4620      	mov	r0, r4
    2fa4:	f7fe ff06 	bl	0x1db4				; SPI0_Wiznet_StartTX(payload, #32)
    2fa8:	bf00      	nop
WaitForWriteTxCompletion:
    2faa:	4805      	ldr	r0, [pc, #20]	; (0x2fc0)
    2fac:	6800      	ldr	r0, [r0, #0]
    2fae:	07c0      	lsls	r0, r0, #31
    2fb0:	0fc0      	lsrs	r0, r0, #31
    2fb2:	d1fa      	bne.n	0x2faa				; WaitForWriteTxCompletion
    2fb4:	2001      	movs	r0, #1
    2fb6:	4901      	ldr	r1, [pc, #4]	; (0x2fbc)	; ???
    2fb8:	6308      	str	r0, [r1, #48]	; 0x30
    2fba:	bd70      	pop	{r4, r5, r6, pc}

    2fbc:	50004200      	;	GPIO registers for PORT0
    2fc0:	40030000      	;	SPI 0 registers

    2fc4:	b430      	push	{r4, r5}
    2fc6:	4674      	mov	r4, lr
    2fc8:	1e64      	subs	r4, r4, #1
    2fca:	7825      	ldrb	r5, [r4, #0]
    2fcc:	1c64      	adds	r4, r4, #1
    2fce:	42ab      	cmp	r3, r5
    2fd0:	d304      	bcc.n	0x2fdc
    2fd2:	5d63      	ldrb	r3, [r4, r5]
    2fd4:	005b      	lsls	r3, r3, #1
    2fd6:	18e3      	adds	r3, r4, r3
    2fd8:	bc30      	pop	{r4, r5}
    2fda:	4718      	bx	r3
    2fdc:	461d      	mov	r5, r3
    2fde:	e7f8      	b.n	0x2fd2
    2fe0:	3830      	subs	r0, #48	; 0x30
    2fe2:	280a      	cmp	r0, #10
    2fe4:	d201      	bcs.n	0x2fea
    2fe6:	2001      	movs	r0, #1
    2fe8:	4770      	bx	lr
    2fea:	2000      	movs	r0, #0
    2fec:	4770      	bx	lr
    2fee:	0000      	movs	r0, r0
    2ff0:	b500      	push	{lr}
    2ff2:	b087      	sub	sp, #28
    2ff4:	2000      	movs	r0, #0
    2ff6:	9004      	str	r0, [sp, #16]
    2ff8:	9005      	str	r0, [sp, #20]
    2ffa:	9006      	str	r0, [sp, #24]
    2ffc:	4b31      	ldr	r3, [pc, #196]	; (0x30c4)
    2ffe:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
    3000:	9303      	str	r3, [sp, #12]
    3002:	466b      	mov	r3, sp
    3004:	c307      	stmia	r3!, {r0, r1, r2}
    3006:	2300      	movs	r3, #0
    3008:	2201      	movs	r2, #1
    300a:	a904      	add	r1, sp, #16
    300c:	4618      	mov	r0, r3
    300e:	f7fe fcaf 	bl	0x1970
    3012:	4668      	mov	r0, sp
    3014:	8a00      	ldrh	r0, [r0, #16]
    3016:	2885      	cmp	r0, #133	; 0x85
    3018:	d051      	beq.n	0x30be
    301a:	2001      	movs	r0, #1
    301c:	492a      	ldr	r1, [pc, #168]	; (0x30c8)
    301e:	6388      	str	r0, [r1, #56]	; 0x38
    3020:	20c8      	movs	r0, #200	; 0xc8
    3022:	f7fd fa59 	bl	0x4d8				; Delay(#200)
    3026:	2000      	movs	r0, #0
    3028:	4927      	ldr	r1, [pc, #156]	; (0x30c8)
    302a:	6388      	str	r0, [r1, #56]	; 0x38
    302c:	20c8      	movs	r0, #200	; 0xc8
    302e:	f7fd fa53 	bl	0x4d8				; Delay(#200)
    3032:	2001      	movs	r0, #1
    3034:	4924      	ldr	r1, [pc, #144]	; (0x30c8)
    3036:	6388      	str	r0, [r1, #56]	; 0x38
    3038:	20c8      	movs	r0, #200	; 0xc8
    303a:	f7fd fa4d 	bl	0x4d8				; Delay(#200)
    303e:	2000      	movs	r0, #0
    3040:	4921      	ldr	r1, [pc, #132]	; (0x30c8)
    3042:	6388      	str	r0, [r1, #56]	; 0x38
    3044:	2001      	movs	r0, #1
    3046:	6388      	str	r0, [r1, #56]	; 0x38
    3048:	20c8      	movs	r0, #200	; 0xc8
    304a:	f7fd fa45 	bl	0x4d8				; Delay(#200)
    304e:	2000      	movs	r0, #0
    3050:	491d      	ldr	r1, [pc, #116]	; (0x30c8)
    3052:	6388      	str	r0, [r1, #56]	; 0x38
    3054:	20c8      	movs	r0, #200	; 0xc8
    3056:	f7fd fa3f 	bl	0x4d8				; Delay(#200)
    305a:	2001      	movs	r0, #1
    305c:	491a      	ldr	r1, [pc, #104]	; (0x30c8)
    305e:	6388      	str	r0, [r1, #56]	; 0x38
    3060:	20c8      	movs	r0, #200	; 0xc8
    3062:	f7fd fa39 	bl	0x4d8				; Delay(#200)
    3066:	2000      	movs	r0, #0
    3068:	4917      	ldr	r1, [pc, #92]	; (0x30c8)
    306a:	6388      	str	r0, [r1, #56]	; 0x38
    306c:	20c8      	movs	r0, #200	; 0xc8
    306e:	f7fd fa33 	bl	0x4d8				; Delay(#200)
    3072:	2001      	movs	r0, #1
    3074:	4914      	ldr	r1, [pc, #80]	; (0x30c8)
    3076:	6388      	str	r0, [r1, #56]	; 0x38
    3078:	20c8      	movs	r0, #200	; 0xc8
    307a:	f7fd fa2d 	bl	0x4d8				; Delay(#200)
    307e:	2000      	movs	r0, #0
    3080:	4911      	ldr	r1, [pc, #68]	; (0x30c8)
    3082:	6388      	str	r0, [r1, #56]	; 0x38
    3084:	20c8      	movs	r0, #200	; 0xc8
    3086:	f7fd fa27 	bl	0x4d8				; Delay(#200)
    308a:	2001      	movs	r0, #1
    308c:	490e      	ldr	r1, [pc, #56]	; (0x30c8)
    308e:	6388      	str	r0, [r1, #56]	; 0x38
    3090:	20c8      	movs	r0, #200	; 0xc8
    3092:	f7fd fa21 	bl	0x4d8				; Delay(#200)
    3096:	2000      	movs	r0, #0
    3098:	490b      	ldr	r1, [pc, #44]	; (0x30c8)
    309a:	6388      	str	r0, [r1, #56]	; 0x38
    309c:	20c8      	movs	r0, #200	; 0xc8
    309e:	f7fd fa1b 	bl	0x4d8				; Delay(#200)
    30a2:	2000      	movs	r0, #0
    30a4:	4908      	ldr	r1, [pc, #32]	; (0x30c8)
    30a6:	3140      	adds	r1, #64	; 0x40
    30a8:	60c8      	str	r0, [r1, #12]
    30aa:	2300      	movs	r3, #0
    30ac:	2208      	movs	r2, #8
    30ae:	4669      	mov	r1, sp
    30b0:	4618      	mov	r0, r3
    30b2:	f7ff fea1 	bl	0x2df8
    30b6:	2001      	movs	r0, #1
    30b8:	4903      	ldr	r1, [pc, #12]	; (0x30c8)
    30ba:	3140      	adds	r1, #64	; 0x40
    30bc:	60c8      	str	r0, [r1, #12]
    30be:	b007      	add	sp, #28
    30c0:	bd00      	pop	{pc}
    30c2:	0000      	movs	r0, r0
    30c4:	34b0      	adds	r4, #176	; 0xb0
    30c6:	0000      	movs	r0, r0
    30c8:	4240      	negs	r0, r0
    30ca:	5000      	str	r0, [r0, r0]

????
    30cc:	4601      	mov	r1, r0
    30ce:	2000      	movs	r0, #0
    30d0:	43c0      	mvns	r0, r0
    30d2:	4770      	bx	lr
    30d4:	b510      	push	{r4, lr}
    30d6:	4603      	mov	r3, r0
    30d8:	460c      	mov	r4, r1
    30da:	4618      	mov	r0, r3
    30dc:	f7fe ffb4 	bl	0x2048				; UART0PutChar
    30e0:	2000      	movs	r0, #0
    30e2:	bd10      	pop	{r4, pc}

Main:
    30e4:	b086      	sub	sp, #24
    30e6:	200a      	movs	r0, #10
    30e8:	f7fd f9f6 	bl	0x4d8				; Delay(#10)
    30ec:	f7fd fc94 	bl	0xa18				; ConfigureSystemClocks
    30f0:	f7fd fdae 	bl	0xc50
    30f4:	200a      	movs	r0, #10
    30f6:	f7fd f9ef 	bl	0x4d8				; Delay(#10)
    30fa:	a02d      	add	r0, pc, #180	; (adr r0, 0x31b0)
    30fc:	f7fd f86a 	bl	0x1d4				; UART0_printf
    3100:	2000      	movs	r0, #0
    3102:	4931      	ldr	r1, [pc, #196]	; (0x31c8)
    3104:	7008      	strb	r0, [r1, #0]
    3106:	4668      	mov	r0, sp
    3108:	f7fd fcf8 	bl	0xafc				; InitIPStack
UART1_Send_0x55_0x55_0x55_0x55_0x55_0x55:
    310c:	2055      	movs	r0, #85	; 0x55
    310e:	f000 f9a8 	bl	0x3462				; UART1SendChar(0x55)
    3112:	2055      	movs	r0, #85	; 0x55
    3114:	f000 f9a5 	bl	0x3462				; UART1SendChar(0x55)
    3118:	2055      	movs	r0, #85	; 0x55
    311a:	f000 f9a2 	bl	0x3462				; UART1SendChar(0x55)
    311e:	2055      	movs	r0, #85	; 0x55
    3120:	f000 f99f 	bl	0x3462				; UART1SendChar(0x55)
    3124:	2055      	movs	r0, #85	; 0x55
    3126:	f000 f99c 	bl	0x3462				; UART1SendChar(0x55)
    312a:	2055      	movs	r0, #85	; 0x55
    312c:	f000 f999 	bl	0x3462				; UART1SendChar(0x55)

    3130:	e03d      	b.n	0x31ae
MainWhileBody:
    3132:	f7ff fdff 	bl	0x2d34
    3136:	f7ff fd35 	bl	0x2ba4				; WiznetHandleIncoming
    313a:	4824      	ldr	r0, [pc, #144]	; (0x31cc)
    313c:	7800      	ldrb	r0, [r0, #0]
    313e:	07c0      	lsls	r0, r0, #31
    3140:	0fc0      	lsrs	r0, r0, #31
    3142:	d008      	beq.n	0x3156
    3144:	4821      	ldr	r0, [pc, #132]	; (0x31cc)
    3146:	7800      	ldrb	r0, [r0, #0]
    3148:	0840      	lsrs	r0, r0, #1
    314a:	0040      	lsls	r0, r0, #1
    314c:	491f      	ldr	r1, [pc, #124]	; (0x31cc)
    314e:	7008      	strb	r0, [r1, #0]
    3150:	2000      	movs	r0, #0
    3152:	f7fe fc05 	bl	0x1960
    3156:	f7fe f973 	bl	0x1440
    315a:	a805      	add	r0, sp, #20
    315c:	f000 f848 	bl	0x31f0
    3160:	4668      	mov	r0, sp
    3162:	8ac0      	ldrh	r0, [r0, #22]
    3164:	2800      	cmp	r0, #0
    3166:	d017      	beq.n	0x3198
    3168:	2803      	cmp	r0, #3
    316a:	d002      	beq.n	0x3172
    316c:	2804      	cmp	r0, #4
    316e:	d112      	bne.n	0x3196
    3170:	e006      	b.n	0x3180
    3172:	f7fd fbf7 	bl	0x964
    3176:	4669      	mov	r1, sp
    3178:	8a88      	ldrh	r0, [r1, #20]
    317a:	f000 f82b 	bl	0x31d4
    317e:	e015      	b.n	0x31ac
    3180:	f7fd fbf0 	bl	0x964
    3184:	4668      	mov	r0, sp
    3186:	8a84      	ldrh	r4, [r0, #20]
    3188:	a805      	add	r0, sp, #20
    318a:	f000 f831 	bl	0x31f0
    318e:	4620      	mov	r0, r4
    3190:	9905      	ldr	r1, [sp, #20]
    3192:	4788      	blx	r1
    3194:	e00a      	b.n	0x31ac
    3196:	bf00      	nop
    3198:	f7fd fbe4 	bl	0x964
    319c:	480c      	ldr	r0, [pc, #48]	; (0x31d0)
    319e:	6800      	ldr	r0, [r0, #0]
    31a0:	0500      	lsls	r0, r0, #20
    31a2:	0fc0      	lsrs	r0, r0, #31
    31a4:	d001      	beq.n	0x31aa
    31a6:	f7ff fc4b 	bl	0x2a40
    31aa:	bf00      	nop
    31ac:	bf00      	nop
    31ae:	e7c0      	b.n	0x3132				; MainWhileBody

    31b0:	200a      	;	String '\nall is Successfull\r\n\0\0'
    31b2:	6c61      	;
    31b4:	206c      	;
    31b6:	7369      	;
    31b8:	5320      	;
    31ba:	6375      	;
    31bc:	6563      	;
    31be:	7373      	;
    31c0:	7566      	;
    31c2:	6c6c      	;
    31c4:	0a0d      	;
    31c6:	0000      	;

    31c8:	20000088      	;
    31cc:	2000008c      	;
    31d0:	20000008      	;

    31d4:	4905      	ldr	r1, [pc, #20]	; (0x31ec)
    31d6:	6b89      	ldr	r1, [r1, #56]	; 0x38
    31d8:	2900      	cmp	r1, #0
    31da:	d003      	beq.n	0x31e4
    31dc:	2100      	movs	r1, #0
    31de:	4a03      	ldr	r2, [pc, #12]	; (0x31ec)
    31e0:	6391      	str	r1, [r2, #56]	; 0x38
    31e2:	e002      	b.n	0x31ea
    31e4:	2101      	movs	r1, #1
    31e6:	4a01      	ldr	r2, [pc, #4]	; (0x31ec)
    31e8:	6391      	str	r1, [r2, #56]	; 0x38
    31ea:	4770      	bx	lr
    31ec:	4240      	negs	r0, r0
    31ee:	5000      	str	r0, [r0, r0]
    31f0:	490e      	ldr	r1, [pc, #56]	; (0x322c)
    31f2:	6809      	ldr	r1, [r1, #0]
    31f4:	2900      	cmp	r1, #0
    31f6:	d101      	bne.n	0x31fc
    31f8:	6001      	str	r1, [r0, #0]
    31fa:	4770      	bx	lr
    31fc:	490c      	ldr	r1, [pc, #48]	; (0x3230)
    31fe:	6809      	ldr	r1, [r1, #0]
    3200:	0089      	lsls	r1, r1, #2
    3202:	4a0c      	ldr	r2, [pc, #48]	; (0x3234)
    3204:	5851      	ldr	r1, [r2, r1]
    3206:	6001      	str	r1, [r0, #0]
    3208:	4909      	ldr	r1, [pc, #36]	; (0x3230)
    320a:	6809      	ldr	r1, [r1, #0]
    320c:	1c49      	adds	r1, r1, #1
    320e:	4a08      	ldr	r2, [pc, #32]	; (0x3230)
    3210:	6011      	str	r1, [r2, #0]
    3212:	4611      	mov	r1, r2
    3214:	6809      	ldr	r1, [r1, #0]
    3216:	2914      	cmp	r1, #20
    3218:	d301      	bcc.n	0x321e
    321a:	2100      	movs	r1, #0
    321c:	6011      	str	r1, [r2, #0]
    321e:	4903      	ldr	r1, [pc, #12]	; (0x322c)
    3220:	6809      	ldr	r1, [r1, #0]
    3222:	1e49      	subs	r1, r1, #1
    3224:	4a01      	ldr	r2, [pc, #4]	; (0x322c)
    3226:	6011      	str	r1, [r2, #0]
    3228:	bf00      	nop
    322a:	e7e6      	b.n	0x31fa
    322c:	0048      	lsls	r0, r1, #1
    322e:	2000      	movs	r0, #0
    3230:	0044      	lsls	r4, r0, #1
    3232:	2000      	movs	r0, #0
    3234:	0280      	lsls	r0, r0, #10
    3236:	2000      	movs	r0, #0
    3238:	b510      	push	{r4, lr}
    323a:	4604      	mov	r4, r0
    323c:	480f      	ldr	r0, [pc, #60]	; (0x327c)
    323e:	6800      	ldr	r0, [r0, #0]
    3240:	2814      	cmp	r0, #20
    3242:	d303      	bcc.n	0x324c
    3244:	a00e      	add	r0, pc, #56	; (adr r0, 0x3280)
    3246:	f7fc ffc5 	bl	0x1d4				; UART0_printf
    324a:	bd10      	pop	{r4, pc}
    324c:	4815      	ldr	r0, [pc, #84]	; (0x32a4)
    324e:	6800      	ldr	r0, [r0, #0]
    3250:	0080      	lsls	r0, r0, #2
    3252:	4915      	ldr	r1, [pc, #84]	; (0x32a8)
    3254:	500c      	str	r4, [r1, r0]
    3256:	4813      	ldr	r0, [pc, #76]	; (0x32a4)
    3258:	6800      	ldr	r0, [r0, #0]
    325a:	1c40      	adds	r0, r0, #1
    325c:	4911      	ldr	r1, [pc, #68]	; (0x32a4)
    325e:	6008      	str	r0, [r1, #0]
    3260:	4608      	mov	r0, r1
    3262:	6800      	ldr	r0, [r0, #0]
    3264:	2814      	cmp	r0, #20
    3266:	d301      	bcc.n	0x326c
    3268:	2000      	movs	r0, #0
    326a:	6008      	str	r0, [r1, #0]
    326c:	4803      	ldr	r0, [pc, #12]	; (0x327c)
    326e:	6800      	ldr	r0, [r0, #0]
    3270:	1c40      	adds	r0, r0, #1
    3272:	4902      	ldr	r1, [pc, #8]	; (0x327c)
    3274:	6008      	str	r0, [r1, #0]
    3276:	bf00      	nop
    3278:	e7e7      	b.n	0x324a
    327a:	0000      	movs	r0, r0

    327c:	20000048      	;

    3280:	736d      	;	String 'msg_put_in: msg queue already full\n\0'
    3282:	5f67      	;
    3284:	7570      	;
    3286:	5f74      	;
    3288:	6e69      	;
    328a:	203a      	;
    328c:	736d      	;
    328e:	2067      	;
    3290:	7571      	;
    3292:	7565      	;
    3294:	2065      	;
    3296:	6c61      	;
    3298:	6572      	;
    329a:	6461      	;
    329c:	2079      	;
    329e:	7566      	;
    32a0:	6c6c      	;
    32a2:	000a      	;

    32a4:	20000040      	;
    32a8:	20000280      	;

    32ac:	4a10      	ldr	r2, [pc, #64]	; (0x32f0)
    32ae:	6812      	ldr	r2, [r2, #0]
    32b0:	2a14      	cmp	r2, #20
    32b2:	d300      	bcc.n	0x32b6
    32b4:	4770      	bx	lr
    32b6:	4a0f      	ldr	r2, [pc, #60]	; (0x32f4)
    32b8:	6812      	ldr	r2, [r2, #0]
    32ba:	0092      	lsls	r2, r2, #2
    32bc:	4b0e      	ldr	r3, [pc, #56]	; (0x32f8)
    32be:	18d2      	adds	r2, r2, r3
    32c0:	8050      	strh	r0, [r2, #2]
    32c2:	4a0c      	ldr	r2, [pc, #48]	; (0x32f4)
    32c4:	6812      	ldr	r2, [r2, #0]
    32c6:	0092      	lsls	r2, r2, #2
    32c8:	5299      	strh	r1, [r3, r2]
    32ca:	4a0a      	ldr	r2, [pc, #40]	; (0x32f4)
    32cc:	6812      	ldr	r2, [r2, #0]
    32ce:	1c52      	adds	r2, r2, #1
    32d0:	4b08      	ldr	r3, [pc, #32]	; (0x32f4)
    32d2:	601a      	str	r2, [r3, #0]
    32d4:	461a      	mov	r2, r3
    32d6:	6812      	ldr	r2, [r2, #0]
    32d8:	2a14      	cmp	r2, #20
    32da:	d301      	bcc.n	0x32e0
    32dc:	2200      	movs	r2, #0
    32de:	601a      	str	r2, [r3, #0]
    32e0:	4a03      	ldr	r2, [pc, #12]	; (0x32f0)
    32e2:	6812      	ldr	r2, [r2, #0]
    32e4:	1c52      	adds	r2, r2, #1
    32e6:	4b02      	ldr	r3, [pc, #8]	; (0x32f0)
    32e8:	601a      	str	r2, [r3, #0]
    32ea:	bf00      	nop
    32ec:	e7e2      	b.n	0x32b4
    32ee:	0000      	movs	r0, r0
    32f0:	0048      	lsls	r0, r1, #1
    32f2:	2000      	movs	r0, #0
    32f4:	0040      	lsls	r0, r0, #1
    32f6:	2000      	movs	r0, #0
    32f8:	0280      	lsls	r0, r0, #10
    32fa:	2000      	movs	r0, #0
    32fc:	b510      	push	{r4, lr}
    32fe:	4604      	mov	r4, r0
    3300:	4854      	ldr	r0, [pc, #336]	; (0x3454)
    3302:	7800      	ldrb	r0, [r0, #0]
    3304:	0003      	movs	r3, r0
    3306:	f7ff fe5d 	bl	0x2fc4
    330a:	0a11      	lsrs	r1, r2, #8
    330c:	766c      	strb	r4, [r5, #25]
    330e:	8b80      	ldrh	r0, [r0, #28]
    3310:	9e94      	ldr	r6, [sp, #592]	; 0x250
    3312:	9e9e      	ldr	r6, [sp, #632]	; 0x278
    3314:	1a9e      	subs	r6, r3, r2
    3316:	3426      	adds	r4, #38	; 0x26
    3318:	403a      	ands	r2, r7
    331a:	4c46      	ldr	r4, [pc, #280]	; (0x3434)
    331c:	009e      	lsls	r6, r3, #2
    331e:	2cfd      	cmp	r4, #253	; 0xfd
    3320:	d103      	bne.n	0x332a
    3322:	2001      	movs	r0, #1
    3324:	494b      	ldr	r1, [pc, #300]	; (0x3454)
    3326:	7008      	strb	r0, [r1, #0]
    3328:	e008      	b.n	0x333c
    332a:	2c58      	cmp	r4, #88	; 0x58
    332c:	d103      	bne.n	0x3336
    332e:	200a      	movs	r0, #10
    3330:	4948      	ldr	r1, [pc, #288]	; (0x3454)
    3332:	7008      	strb	r0, [r1, #0]
    3334:	e002      	b.n	0x333c
    3336:	2000      	movs	r0, #0
    3338:	4946      	ldr	r1, [pc, #280]	; (0x3454)
    333a:	7008      	strb	r0, [r1, #0]
    333c:	e087      	b.n	0x344e
    333e:	2c01      	cmp	r4, #1
    3340:	d105      	bne.n	0x334e
    3342:	200b      	movs	r0, #11
    3344:	4943      	ldr	r1, [pc, #268]	; (0x3454)
    3346:	7008      	strb	r0, [r1, #0]
    3348:	4843      	ldr	r0, [pc, #268]	; (0x3458)
    334a:	7004      	strb	r4, [r0, #0]
    334c:	e002      	b.n	0x3354
    334e:	2000      	movs	r0, #0
    3350:	4940      	ldr	r1, [pc, #256]	; (0x3454)
    3352:	7008      	strb	r0, [r1, #0]
    3354:	e07b      	b.n	0x344e
    3356:	2c10      	cmp	r4, #16
    3358:	db07      	blt.n	0x336a
    335a:	2c13      	cmp	r4, #19
    335c:	dc05      	bgt.n	0x336a
    335e:	200c      	movs	r0, #12
    3360:	493c      	ldr	r1, [pc, #240]	; (0x3454)
    3362:	7008      	strb	r0, [r1, #0]
    3364:	483c      	ldr	r0, [pc, #240]	; (0x3458)
    3366:	7044      	strb	r4, [r0, #1]
    3368:	e002      	b.n	0x3370
    336a:	2000      	movs	r0, #0
    336c:	4939      	ldr	r1, [pc, #228]	; (0x3454)
    336e:	7008      	strb	r0, [r1, #0]
    3370:	e06d      	b.n	0x344e
    3372:	200d      	movs	r0, #13
    3374:	4937      	ldr	r1, [pc, #220]	; (0x3454)
    3376:	7008      	strb	r0, [r1, #0]
    3378:	4837      	ldr	r0, [pc, #220]	; (0x3458)
    337a:	7084      	strb	r4, [r0, #2]
    337c:	e067      	b.n	0x344e
    337e:	200e      	movs	r0, #14
    3380:	4934      	ldr	r1, [pc, #208]	; (0x3454)
    3382:	7008      	strb	r0, [r1, #0]
    3384:	4834      	ldr	r0, [pc, #208]	; (0x3458)
    3386:	70c4      	strb	r4, [r0, #3]
    3388:	e061      	b.n	0x344e
    338a:	200f      	movs	r0, #15
    338c:	4931      	ldr	r1, [pc, #196]	; (0x3454)
    338e:	7008      	strb	r0, [r1, #0]
    3390:	4831      	ldr	r0, [pc, #196]	; (0x3458)
    3392:	7104      	strb	r4, [r0, #4]
    3394:	e05b      	b.n	0x344e
    3396:	2010      	movs	r0, #16
    3398:	492e      	ldr	r1, [pc, #184]	; (0x3454)
    339a:	7008      	strb	r0, [r1, #0]
    339c:	482e      	ldr	r0, [pc, #184]	; (0x3458)
    339e:	7144      	strb	r4, [r0, #5]
    33a0:	e055      	b.n	0x344e
    33a2:	482d      	ldr	r0, [pc, #180]	; (0x3458)
    33a4:	7800      	ldrb	r0, [r0, #0]
    33a6:	3058      	adds	r0, #88	; 0x58
    33a8:	492b      	ldr	r1, [pc, #172]	; (0x3458)
    33aa:	7849      	ldrb	r1, [r1, #1]
    33ac:	1840      	adds	r0, r0, r1
    33ae:	492a      	ldr	r1, [pc, #168]	; (0x3458)
    33b0:	7889      	ldrb	r1, [r1, #2]
    33b2:	1840      	adds	r0, r0, r1
    33b4:	4928      	ldr	r1, [pc, #160]	; (0x3458)
    33b6:	78c9      	ldrb	r1, [r1, #3]
    33b8:	1840      	adds	r0, r0, r1
    33ba:	4927      	ldr	r1, [pc, #156]	; (0x3458)
    33bc:	7909      	ldrb	r1, [r1, #4]
    33be:	1840      	adds	r0, r0, r1
    33c0:	4925      	ldr	r1, [pc, #148]	; (0x3458)
    33c2:	7949      	ldrb	r1, [r1, #5]
    33c4:	1840      	adds	r0, r0, r1
    33c6:	b2c0      	uxtb	r0, r0
    33c8:	4924      	ldr	r1, [pc, #144]	; (0x345c)
    33ca:	8008      	strh	r0, [r1, #0]
    33cc:	4608      	mov	r0, r1
    33ce:	8800      	ldrh	r0, [r0, #0]
    33d0:	4284      	cmp	r4, r0
    33d2:	d102      	bne.n	0x33da
    33d4:	4820      	ldr	r0, [pc, #128]	; (0x3458)
    33d6:	f7fd fd31 	bl	0xe3c
    33da:	2000      	movs	r0, #0
    33dc:	491d      	ldr	r1, [pc, #116]	; (0x3454)
    33de:	7008      	strb	r0, [r1, #0]
    33e0:	e035      	b.n	0x344e
    33e2:	2c02      	cmp	r4, #2
    33e4:	d103      	bne.n	0x33ee
    33e6:	2002      	movs	r0, #2
    33e8:	491a      	ldr	r1, [pc, #104]	; (0x3454)
    33ea:	7008      	strb	r0, [r1, #0]
    33ec:	e002      	b.n	0x33f4
    33ee:	2000      	movs	r0, #0
    33f0:	4918      	ldr	r1, [pc, #96]	; (0x3454)
    33f2:	7008      	strb	r0, [r1, #0]
    33f4:	e02b      	b.n	0x344e
    33f6:	2c20      	cmp	r4, #32
    33f8:	d103      	bne.n	0x3402
    33fa:	2003      	movs	r0, #3
    33fc:	4915      	ldr	r1, [pc, #84]	; (0x3454)
    33fe:	7008      	strb	r0, [r1, #0]
    3400:	e002      	b.n	0x3408
    3402:	2000      	movs	r0, #0
    3404:	4913      	ldr	r1, [pc, #76]	; (0x3454)
    3406:	7008      	strb	r0, [r1, #0]
    3408:	e021      	b.n	0x344e
    340a:	4814      	ldr	r0, [pc, #80]	; (0x345c)
    340c:	8004      	strh	r4, [r0, #0]
    340e:	7800      	ldrb	r0, [r0, #0]
    3410:	0600      	lsls	r0, r0, #24
    3412:	0c00      	lsrs	r0, r0, #16
    3414:	4911      	ldr	r1, [pc, #68]	; (0x345c)
    3416:	8008      	strh	r0, [r1, #0]
    3418:	2004      	movs	r0, #4
    341a:	490e      	ldr	r1, [pc, #56]	; (0x3454)
    341c:	7008      	strb	r0, [r1, #0]
    341e:	e016      	b.n	0x344e
    3420:	480e      	ldr	r0, [pc, #56]	; (0x345c)
    3422:	8800      	ldrh	r0, [r0, #0]
    3424:	4320      	orrs	r0, r4
    3426:	490d      	ldr	r1, [pc, #52]	; (0x345c)
    3428:	8008      	strh	r0, [r1, #0]
    342a:	2005      	movs	r0, #5
    342c:	4909      	ldr	r1, [pc, #36]	; (0x3454)
    342e:	7008      	strb	r0, [r1, #0]
    3430:	e00d      	b.n	0x344e
    3432:	2c5d      	cmp	r4, #93	; 0x5d
    3434:	d103      	bne.n	0x343e
    3436:	4809      	ldr	r0, [pc, #36]	; (0x345c)
    3438:	8800      	ldrh	r0, [r0, #0]
    343a:	f7fe f835 	bl	0x14a8
    343e:	2000      	movs	r0, #0
    3440:	4904      	ldr	r1, [pc, #16]	; (0x3454)
    3442:	7008      	strb	r0, [r1, #0]
    3444:	e003      	b.n	0x344e
    3446:	2000      	movs	r0, #0
    3448:	4902      	ldr	r1, [pc, #8]	; (0x3454)
    344a:	7008      	strb	r0, [r1, #0]
    344c:	bf00      	nop
    344e:	bf00      	nop
    3450:	bd10      	pop	{r4, pc}

    3452:	0000      	;	padding
    3454:	2000002c      	;
    3458:	2000002d      	;
    345c:	20000034      	;

JustReturn:
    3460:	4770      	bx	lr

UART1SendChar(c):
    3462:	b510      	push	{r4, lr}
    3464:	4604      	mov	r4, r0
    3466:	4620      	mov	r0, r4
    3468:	f7fe fdda 	bl	0x2020				; UART1PutChar(c)
    346c:	bd10      	pop	{r4, pc}

    346e:	0000      	;	padding

UART1_print_195502fd?
    3470:	b57c      	push	{r2, r3, r4, r5, r6, lr}
    3472:	4605      	mov	r5, r0
    3474:	a107      	add	r1, pc, #28	; (adr r1, 0x3494)
    3476:	c903      	ldmia	r1, {r0, r1}			; r0 := 195502fd, r1 := 0 ?
    3478:	9101      	str	r1, [sp, #4]
    347a:	9000      	str	r0, [sp, #0]
for (r4=0; r4<5; ++r4)
    347c:	2400      	movs	r4, #0
    347e:	e005      	b.n	0x348c
    3480:	4669      	mov	r1, sp
    3482:	5d08      	ldrb	r0, [r1, r4]
    3484:	f7ff ffed 	bl	0x3462				; UART1SendChar(?)
    3488:	1c60      	adds	r0, r4, #1
    348a:	b2c4      	uxtb	r4, r0
    348c:	2c05      	cmp	r4, #5
    348e:	dbf7      	blt.n	0x3480
    3490:	bd7c      	pop	{r2, r3, r4, r5, r6, pc}

    3492:	0000      	;	padding
    3494:	195502fd      	;
    3498:	00000000	;

    349c:	b510      	push	{r4, lr}
    349e:	4803      	ldr	r0, [pc, #12]	; (0x34ac)
    34a0:	6800      	ldr	r0, [r0, #0]
    34a2:	2800      	cmp	r0, #0
    34a4:	d001      	beq.n	0x34aa
    34a6:	f7fd fc35 	bl	0xd14
    34aa:	bd10      	pop	{r4, pc}

    34ac:	0038      	;
    34ae:	2000      	;
    34b0:	0085      	;
    34b2:	00c0      	;
    34b4:	00a8      	;
    34b6:	0001      	;
    34b8:	0004      	;
    34ba:	000b      	;
    34bc:	00b8      	;
    34be:	3130      	;
    34c0:	3332      	;
    34c2:	3534      	;
    34c4:	3736      	;
    34c6:	3938      	;
    34c8:	4241      	;
    34ca:	4443      	;
    34cc:	4645      	;
    34ce:	3040      	;
    34d0:	0058      	;
    34d2:	3130      	;
    34d4:	3332      	;
    34d6:	3534      	;
    34d8:	3736      	;
    34da:	3938      	;
    34dc:	6261      	;
    34de:	6463      	;
    34e0:	6665      	;
    34e2:	3040      	;
    34e4:	0078      	;
    34e6:	0000      	;
    34e8:	3508      	;
    34ea:	0000      	;
    34ec:	0000      	;
    34ee:	2000      	;
    34f0:	0098      	;
    34f2:	0000      	;
    34f4:	0104      	;
    34f6:	0000      	;
    34f8:	35a0      	;
    34fa:	0000      	;
    34fc:	0098      	;
    34fe:	2000      	;
    3500:	0a98      	;
    3502:	0000      	;
    3504:	0120      	;
    3506:	0000      	;
    3508:	0000      	;
    350a:	0000      	;
    350c:	0000      	;
    350e:	0000      	;
    3510:	0000      	;
    3512:	0000      	;
    3514:	0000      	;
    3516:	0000      	;
    3518:	0000      	;
    351a:	0000      	;
    351c:	0128      	;
    351e:	0000      	;
    3520:	5500      	;
    3522:	d355      	;
    3524:	0000      	;
    3526:	0000      	;
    3528:	0000      	;
    352a:	0000      	;
    352c:	0000      	;
    352e:	0000      	;
    3530:	0000      	;
    3532:	0000      	;
    3534:	0000      	;
    3536:	0000      	;
    3538:	0000      	;
    353a:	0000      	;
    353c:	0000      	;
    353e:	0000      	;
    3540:	0000      	;
    3542:	0000      	;
    3544:	0000      	;
    3546:	0000      	;
    3548:	0000      	;
    354a:	0000      	;
    354c:	0000      	;
    354e:	0000      	;
    3550:	0000      	;
    3552:	0000      	;
    3554:	0000      	;
    3556:	0000      	;
    3558:	0000      	;
    355a:	0000      	;
    355c:	0000      	;
    355e:	0000      	;
    3560:	0000      	;
    3562:	0000      	;
    3564:	0000      	;
    3566:	0000      	;
    3568:	0000      	;
    356a:	0000      	;
    356c:	0000      	;
    356e:	0000      	;
    3570:	0000      	;
    3572:	0000      	;
    3574:	0000      	;
    3576:	0000      	;
    3578:	0000      	;
    357a:	0000      	;
    357c:	0000      	;
    357e:	0000      	;
    3580:	0000      	;
    3582:	0000      	;
    3584:	0000      	;
    3586:	0000      	;
    3588:	0000      	;
    358a:	0000      	;
    358c:	0000      	;
    358e:	0000      	;
    3590:	0000      	;
    3592:	0000      	;
    3594:	0000      	;
    3596:	0000      	;
    3598:	0000      	;
    359a:	0000      	;
    359c:	0000      	;
    359e:	0000      	;
    35a0:	ffff ffff	;
    		only FFFF after this point
