		cpu	6502

as_hhc_main	equ	1

		include	"hhc.inc"

	org	$00

z00	rmb	1
z01	rmb	1
z02	rmb	1
z03	rmb	1	; chvect1 - ptr to standard LCD char xlat table
z04	rmb	1
z05	rmb	1	; chvect2 - ptr to alternate LCD char xlat table
z06	rmb	1
z07	rmb	1	; acvect - ptr to LCD accent translation table
z08	rmb	1
next	rmb	3
z0c	rmb	3
ivect1	rmb	3	; jmp to ?   used for tag decode
ivect2	rmb	3	; jmp to ?   used for tag decode
z15	rmb	2
z17	rmb	1
z18	rmb	1
jirq	rmb	3	; jmp to IRQ handler
z1c	rmb	3	; jmp to ?
z1f	rmb	3	; jmp to ?
z22	rmb	2	; ^cursor - pointer to alternate cursor pattern
z24	rmb	1
	rmb	1
v_key	rmb	2	; 'KEY vector
v_emit	rmb	2	; 'EMIT vector
v_abort	rmb	2	; 'ABORT vector
z2c	rmb	2
jnmi	rmb	3	; jmp to NMI handler
latchs	rmb	1	; shadow of the write-only hardware latch byte
z32	rmb	1
z33	rmb	1
z34	rmb	1
z35	rmb	1
z36	rmb	1
z37	rmb	1
z38	rmb	1
z39	rmb	1
z3a	rmb	1
z3b	rmb	1
z3c	rmb	1
z3d	rmb	1
z3e	rmb	1
z3f	rmb	1
z40	rmb	1	; CFLSH
z41	rmb	1

z42	rmb	3	; N (32-byte temp area), also jmp to ?
z45	rmb	1
z46	rmb	1
z47	rmb	1
z48	rmb	1
z49	rmb	1
z4a	rmb	1
z4b	rmb	1

	org	$57

z57	rmb	1
z58	rmb	1
z59	rmb	1
z5a	rmb	1
	rmb	1
z5c	rmb	1
z5d	rmb	1
z5e	rmb	1
z5f	rmb	1
z60	rmb	1
z61	rmb	1
xsave	rmb	1
z63	rmb	1
z64	rmb	1
z65	rmb	1
z66	rmb	1
z67	rmb	1	; BUFPOSN
	rmb	1
	rmb	1
z6a	rmb	1
z6b	rmb	1
z6c	rmb	1
z6d	rmb	1	; CHARBUF
z6e	rmb	1
z6f	rmb	1
z70	rmb	1
z71	rmb	1
z72	rmb	1
z73	rmb	1
z74	rmb	1

; $75..$fe are the "parameter stack"

	org	$fe

zfe	rmb	1
zff	rmb	1


d0100	equ	$0100
d0101	equ	$0101
d0102	equ	$0102
d0103	equ	$0103
d0104	equ	$0104
d0105	equ	$0105
d0107	equ	$0107
d0108	equ	$0108

d0200	equ	$0200
d0203	equ	$0203
d0204	equ	$0204
d0205	equ	$0205
d0206	equ	$0206
d0207	equ	$0207
funct	equ	$0208
d0209	equ	$0209
d020a	equ	$020a
d020b	equ	$020b
d020c	equ	$020c
d020d	equ	$020d
vtime	equ	$020e
d0213	equ	$0213
d0215	equ	$0215	; (FREEZE)
d0216	equ	$0216	; (ROTMODE)
d0217	equ	$0217	; SPEED
d0218	equ	$0218
d0219	equ	$0219

	org	$021b

tvect0	rmb	3*9	; tag table pointers, 2 byte addr, 1 byte bank
			; bank has bit 7 set if in capsule ROM

d0236	rmb	27
d0251	rmb	27

d026c	equ	$026c
d0273	equ	$0273
d0274	equ	$0274
d0278	equ	$0278
d027a	equ	$027a
d027b	equ	$027b
d027c	equ	$027c
d027d	equ	$027d
d027e	equ	$027e
d0280	equ	$0280
d0281	equ	$0281
d0282	equ	$0282
d0283	equ	$0283
d02b2	equ	$02b2
d02b3	equ	$02b3
d02b4	equ	$02b4
d02bf	equ	$02bf
d02c0	equ	$02c0
devtbl	equ	$02c1
d02d1	equ	$02d1
d02d7	equ	$02d7
d02dd	equ	$02dd
d02df	equ	$02df
d02e3	equ	$02e3
d02f2	equ	$02f2
d02f5	equ	$02f5
d02f6	equ	$02f6
d0377	equ	$0377
d0378	equ	$0378
d0379	equ	$0379
d037a	equ	$037a
d037b	equ	$037b
d037c	equ	$037c

; 2000-3fff: device control ROMs
d2000	equ	$2000	; CTROM
d2001	equ	$2001
d2023	equ	$2023	; CTRFLAGS
d2024	equ	$2024	; CTRFLAG2
d2025	equ	$2025	; CTVECT
d2027	equ	$2027	; CTEXT
ctrid	equ	$2028	; CTRID

; 4000-7fff: ROM capsules, and memory-mapped I/O
romaddr	equ	$4000
romvect	equ	$4028
romext	equ	$402a
cspeed	equ	$402b
romid	equ	$402c

d47fc	equ	$47fc	; I/O
d47fe	equ	$47fe
d47ff	equ	$47ff

; 5800-58ff: memory-mapped I/O
d5800	equ	$5800	; KB, DSPLY
d5802	equ	$5802
d5820	equ	$5820
d589f	equ	$589f
d58fa	equ	$58fa	; LOBAT
d58fb	equ	$58fb	; TLO
d58fc	equ	$58fc	; TMID
d58fd	equ	$58fd	; THI
latch	equ	$58fe
			; bit 7 - 1 for LCD control,   0 for keyboard control
			; bit 6 = 1 for CPU on,        0 for CPU off
			; bit 5 = beeper (used for SQUEAK)
			; bit 4 = 1 for slow ROM, I/O, 0 for normal
			; bit 3 = 1 for LCD on,        0 for LCD off
			; bit 2 = 1 for capsule ROM,   0 for memory-mapped I/O

			; bits 1..0 = 0, 1, 2 for capsule ROM, 3 for external

d58ff	equ	$58ff	; YOFF

; 8000-bfff: extrinsic RAM (RAM expanders)
d8000	equ	$8000
	
; c000-ffff: intrinsic ROM

	org	$c000
	include	"hhc_tags.inc"

Sc318:	clc
	lda	#$00
	ldx	#$40
Lc31d:	adc	d47fc,x
	rol	a
	dex
	dex
	dex
	dex
	bpl	Lc31d
	cmp	d0219
	rts

Sc32b:	sec
	sbc	#$08
	bmi	Lc33f
	tay
	lsr
	and	#$fc
	tax
	tya
	and	#$07
	tay
	lda	Dc7f3,y
	sta	d47fe,x
Lc33f:	rts

Sc340:	sec
	sbc	#$08
	bmi	Lc34e
	lsr
	and	#$fc
	tax
	lda	#$00
	sta	d47fe,x
Lc34e:	rts

Sc34f:	lda	#$80
	ora	d02d1
	sta	d02d1
	inc	d0203
	inc	z66
	rts

	lda	#$10

Sc35f:	ora	latchs

dolatch:	ora	#$08
	bit	z33
	bmi	Lc369
	and	#$f7
Lc369:	sta	latchs
	sta	latch
	rts

Sc36f:	pha
	lda	latchs
	sta	d02bf
	pla

Sc376:	and	#$f8
	ora	#$10
	jmp	dolatch

Sc37d:	lda	d02bf
	jmp	dolatch

Sc383:	lda	latchs
	sta	d02bf
	jmp	Sc376

Sc38b:	lda	latchs
	jmp	Sc376

Sc390:	and	latchs
	jmp	dolatch

getmem:	php
	sei
	clc
	adc	z32
	bcs	Lc3ad
	cmp	xsave
	bcs	Lc3ad
	stx	z1c+1
	ldx	z32
	sta	z32
	txa
	ldx	z1c+1
	plp
	cmp	#$00
	rts

Lc3ad:	plp
	lda	#$00
	rts

Sc3b1:	tay
	lda	latchs
	ora	#$80
	jsr	Sc36f
	tya
	rts

Sc3bb:	jsr	Sc3b1
	ora	d589f
Lc3c1:	sta	d589f
	jmp	Sc37d

Sc3c7:	jsr	Sc3b1
	and	d589f
	jmp	Lc3c1

Dc3d0:	fcb	$00,$00,$04,$04,$08,$02,$0c,$06

Sc3d8:	lda	z63
	and	#$07
	jsr	Sc3b1
	lda	d589f
	and	#$f1
	ora	Dc3d0,y
	jmp	Lc3c1

Dc3ea:	fcb	$54,$54,$54,$54,$50,$04,$50,$04
	fcb	$76,$76,$76,$76,$76,$76,$76,$76

Sc3fa:	ldx	#$00
Lc3fc:	lda	(z37,x)
	eor	#$ff
	sta	(z37,x)
	cmp	(z37,x)
	bne	Lc40e
	eor	#$ff
	sta	(z37,x)
	inc	z38
	bne	Lc3fc
Lc40e:	rts

Sc40f:	ldx	#$fd
	sta	z00,x
	jmp	Scde5

Sc416:	lda	z37
	sec
	sbc	#$06
	sta	z37
	bcs	Lc421
	dec	z38
Lc421:	ldy	#$00
	txa
	ora	z6c
	sta	(z37),y
	sty	z6c
	iny
	lda	(z37),y
	and	z6d
	sta	z6e
	ldy	#$05
	lda	#$00
Lc435:	sta	(z37),y
	dey
	bne	Lc435
	lda	z6e
	iny
	sta	(z37),y
	rts

Sc440:	jsr	Sc38b
	lda	#$00
	ldy	#$a5
	cpy	d8000
	beq	Lc44f
	sta	d02f2
Lc44f:	jsr	Sc40f
	lda	#$01
	sta	z6c
	ldx	#$3c
Lc458:	lda	d47fc,x
	cmp	#$ff
	beq	Lc4b3
	cmp	#$fb
	bne	Lc496
	lda	#$01
Lc465:	tay
	sta	d47fe,x
	lda	d8000
	eor	#$ff
	sta	d8000
	cmp	d8000
	php
	eor	#$ff
	sta	d8000
	plp
	bne	Lc48c
	stx	z73
	sty	z74
	ldx	#$fd
	sty	z00,x
	jsr	Sdfd9
	ldx	z73
	ldy	z74
Lc48c:	tya
	asl
	bcc	Lc465
	sta	d47fe,x
	jmp	Lc4b3

Lc496:	txa
	jsr	Scb0e
	bne	Lc4b3
	lda	d2023
	pha
	and	#$40
	bne	Lc4ab
	jsr	Sc416
	ora	#$20
	sta	(z37),y
Lc4ab:	pla
	and	#$80
	bne	Lc4b3
	jsr	Sc416
Lc4b3:	dex
	dex
	dex
	dex
	cpx	#$f8
	bne	Lc458
	lda	#$80
	jsr	Scb0e
	ldx	#$0a
	jsr	Sc416
	ora	#$30
	sta	(z37),y
	ldx	#$06
	jsr	Sc416
	ora	#$10
	sta	(z37),y
	lda	z37
	sta	z35
	lda	z38
	sta	z36
	lda	#$ff
	ldy	#$0e
Lc4de:	sta	devtbl+1,y
	dey
	bne	Lc4de
	sty	devtbl
	lda	#$06
	sta	devtbl+1
	rts

Sc4ed:	lda	z64
	ora	#$01
	sta	z64
	ldx	#$00
	clc
Lc4f6:	lda	z70,x
	sta	d58fb,x
	adc	vtime,x
	sta	d0378,x
	inx
	txa
	eor	#$03
	bne	Lc4f6
Lc507:	lda	#$00
	adc	vtime,x
	sta	d0378,x
	inx
	txa
	eor	#$05
	bne	Lc507
	lda	z64
	and	#$fe
	sta	z64
	rts

Sc51c:	ldx	#$2d
Lc51e:	lda	De8de,x
	sta	z00,x
	dex
	bpl	Lc51e
	sta	tvect0+5
	lda	#$80
	sta	tvect0+3
	lda	#$c1
	sta	tvect0+4
	rts

Sc534:	sei
	CLD
	ldx	#$3e
	lda	#$00
Lc53a:	sta	z00,x
	inx
	bne	Lc53a
	ldx	#$15
Lc541:	sta	d0200,x
	dex
	bpl	Lc541

	ldx	#$1b
Lc549:	lda	#$20
	sta	d0236-1,x
	lda	#$00
	sta	d0251-1,x
	dex
	bne	Lc549

	lda	#$c0
	sta	z65
	lda	#$80
	ora	d02e3
	sta	d02e3
	lda	#$50
	jsr	dolatch
	lda	#$10
	sta	z6d
	jsr	Sc318
	beq	Lc579
	sta	d0219
	lda	#$00
	sta	z6d
	sta	z34
Lc579:	lda	#$5a
	cmp	z34
	beq	Lc599
	lda	#$00
	sta	d0280
	sta	d0281
	lda	#$7b
	sta	z32
	lda	#$08
	sta	z38
	lda	#$00
	sta	z37
	jsr	Sc3fa
	jsr	Sc440
Lc599:	ldx	#$80
	stx	d02d7
	lda	#$a0
	sta	z64
	rts

Sc5a3:	lda	#$00
	tax
	beq	Lc5b0

Sc5a8:	lda	#$10
	bne	Lc5ae
Lc5ac:	lda	#$00
Lc5ae:	ldx	#$03
Lc5b0:	php
	sei
	stx	z71
	sta	z72
	ldy	#$00
	jsr	Sc38b
Lc5bb:	lda	z71
	bne	Lc5c7
	iny
	lda	(z35),y
	and	#$7f
	sta	(z35),y
	dey
Lc5c7:	lda	(z35),y
	lsr
	bcc	Lc5ce
	plp
	rts

Lc5ce:	tya
	adc	#$06
	tay
	cmp	#$06
	beq	Lc5fe
	lda	(z35),y
	jsr	Scb0e
	bne	Lc5fe
	stx	z3f
	sty	z40
	iny
	lda	(z35),y
	dey
	and	z72
	php
	lda	#$00
	plp
	bne	Lc5ef
	lda	z71
Lc5ef:	clc
	adc	z71
	adc	d2000
	adc	#$15
	sta	z1c+1
	jsr	z1c
	ldy	z40
Lc5fe:	jmp	Lc5bb

Sc601:	sei
	lda	#$00
	sta	d02b2
	sta	z66
	ldx	#$3c
Lc60b:	sta	d47fe,x
	dex
	dex
	dex
	dex
	bne	Lc60b
	ldx	#$fd
	txs
	lda	d02f2
	jsr	Sc40f
	jsr	Sc51c
	ldx	#$ff
	jsr	Se053
	lda	#$41
	jsr	Sc3c7
	jsr	Sc534
	lda	d02f2
	jsr	Sc40f
	jsr	Seb1f
	jsr	Sc5a8
	jsr	Sc5a3
Lc63c:	lda	#$00
	jsr	Sd91e
	ldx	#$ff
	cli
	inc	d0203
	inc	z66
	jsr	Sc34f
	ldy	d0216
	bmi	Lc65f
	lda	#$5a
	cmp	z34
	sty	z34
	bne	Lc65c
	jmp	Ldfaf

Lc65c:	jmp	next

Lc65f:	inc	d0216
	lda	#$80
	sta	z3c
	jmp	Lfede

Sc669:	ldy	d020a
	beq	Lc676
	lda	d0273,y
	dec	d020a
	iny
	rts

Lc676:	lda	z64
	ora	#$80
	sta	z64
	lda	funct
	beq	Lc68e
	dec	funct
	ldy	d0209
	lda	d0283,y
	inc	d0209
	rts

Lc68e:	ldy	d0207
	cpy	d0206
	beq	Lc6c4
	lda	d026c,y
	dey
	bpl	Lc69e
	ldy	#$07
Lc69e:	sty	d0207
	tay
	lda	z64
	and	#$10
	bne	Lc6c1
	tya
	sec
	sbc	#$15
	cmp	#$03
	bcs	Lc6c1
	asl
	asl
	asl
	asl
	tay
	lda	d0282,y
	sta	funct
	sty	d0209
	jmp	Sc669

Lc6c1:	tya
	ldy	#$01
Lc6c4:	rts

Sc6c5:	ldy	d0206
	cpy	#$08
	bcc	Lc6cf
	jsr	Sc601
Lc6cf:	sta	d026c,y
	lda	#$5a
	sta	z34
	dey
	bpl	Lc6db
	ldy	#$07
Lc6db:	cpy	d0207
	beq	Sc6e3
	sty	d0206

Sc6e3:	php
	sei
	ldy	#$01
	lda	(z35),y
	bpl	Lc70d
	jsr	Sc669
	beq	Lc70d
	pha
	ldy	#$01
	lda	(z35),y
	and	#$7f
	sta	(z35),y
	iny
	lda	(z35),y
	sta	z6c
	iny
	lda	(z35),y
	sta	z6d
	ldy	#$00
	lda	#$80
	sta	(z6c),y
	iny
	pla
	sta	(z6c),y
Lc70d:	plp
	rts

sleep:	php
	sei
	pha
	lda	d0204
	beq	Lc71a
	pla
	plp
	rts

Lc71a:	txa
	pha
	tya
	pha
	lda	latchs
	pha
	lda	z3d
	pha
	tsx
	inc	d0107,x
	bne	Lc72d
	inc	d0108,x
Lc72d:	stx	zff
	lda	z63
	ora	#$10
	sta	z63
	jsr	Sc38b
	ldx	z3d
	lda	#$00
	sta	d47fe,x
	lda	z3b
	jsr	Sc340
	lda	z3c
	jsr	Sc340
	lda	#$80
	sta	z3d
	lda	#$9f
	jsr	Sc390

RESET:	cld
	lda	#$5a
	cmp	d027a
	bne	Lc790
	asl
	cmp	d0377
	bne	Lc790
	ldx	zff
	txs
	lda	latchs
	ora	#$40
	jsr	Sc376
	lda	z64
	and	#$01
	beq	Lc773
	jsr	Sc4ed
Lc773:	lda	z63
	and	#$10
	bne	Lc77f
	sta	d0218
	jmp	Sc601

Lc77f:	eor	z63
	sta	z63
	lda	z3b
	jsr	Sc32b
	lda	z3c
	jsr	Sc32b
	jmp	Lcb52

Dc78f	equ	*-1		; XXX probably not the best definition for this

Lc790:	lda	d58fd
	bpl	Lc7a4
	lsr
	sta	d58fd
	lda	#$00
	sta	d58ff
	sta	latch
	jmp	reset

Lc7a4:	sei
	ldy	#$77
	lda	#$03
	sta	z01
	lda	#$00
	sta	z00
Lc7af:	sta	(z00),y
	dey
	bne	Lc7af
	dec	z01
	bpl	Lc7af
	ldx	#$fd
	txs
	jsr	Sc51c
	ldx	#$fd
	jsr	Sdfd9
	jsr	Sc534
	lda	#$00
	jsr	Sc3c7
	lda	#$80
	sta	z33

	lda	#$40	; RTI instruction
	sta	jnmi

	lda	#$05
	sta	d0217
	lda	#$93
	sta	d02f5
	lda	#$03
	sta	d02f6
	lda	#$ff
	sta	d0216
	lda	#$5a
	sta	d027a
	asl
	sta	d0377
	jmp	Lc63c

Dc7f3:	fcb	$01,$02,$04,$08,$10,$20,$40,$80
	fcb	$d7,$02,$d1,$02,$dd,$02,$e3

Dc802:	fcb	$02,$0b
Dc804:	fcb	$0e,$14,$93,$e8,$cd,$e1
	fcb	$07,$e2

x_set_timer:
	ldy	#$0a	; SET.TIMER
	lda	z01,x
Lc810:	cmp	d02b4,y
	bne	Lc81e
	lda	z00,x
	cmp	d02b3,y
	beq	Lc836
	lda	z01,x
Lc81e:	dey
	dey
	bpl	Lc810
	ldy	#$0a
Lc824:	lda	d02b4,y
	beq	Lc836
	dey
	dey
	bpl	Lc824
	lda	#$80
	ora	(z00,x)
	sta	(z00,x)
	jmp	x_drop

Lc836:	lda	#$7f
	and	(z00,x)
	sta	(z00,x)
	lda	z00,x
	sta	d02b3,y
	lda	z01,x
	sta	d02b4,y
	stx	xsave
	php
	sei
	jsr	Sc383
	ldy	d58fb
	dey
Lc851:	cpy	d58fb
	bne	Lc851
	jsr	Sc866
	jsr	Sc37d
	plp
	jmp	Lcf44

Sc860:	lda	d58fd
	bmi	Sc866
	rts

Sc866:	sec
	ldx	#$00
Lc869:	lda	d0378,x
	sbc	d58fb,x
	sta	vtime,x
	inx
	txa
	eor	#$03
	bne	Lc869
	ldx	#$00
	lda	d58fd
	bpl	Lc880
	dex
Lc880:	stx	z6c
	lda	d037b
	sbc	z6c
	sta	vtime+3
	lda	d037c
	sbc	z6c
	sta	vtime+4
	ldx	#$00
	stx	z6f
Lc896:	lda	d02b4,x
	beq	Lc8e6
	sta	z6d
	lda	d02b3,x
	sta	z6c
	ldy	#$00
	lda	(z6c),y
	bmi	Lc8b6
	ldy	#$05
Lc8aa:	lda	d020d,y
	cmp	(z6c),y
	bcc	Lc8cd
	bne	Lc8b6
	dey
	bne	Lc8aa
Lc8b6:	lda	#$80
	ldy	#$00
	ora	(z6c),y
	sta	(z6c),y
	tya
	sta	d02b4,x
	sta	d02b3,x
	inc	d0203
	inc	z66
	jmp	Lc8e6

Lc8cd:	lda	z6f
	beq	Lc8de
	ldy	#$05
Lc8d3:	lda	(z6c),y
	cmp	(z6e),y
	bcc	Lc8de
	bne	Lc8e6
	dey
	bne	Lc8d3
Lc8de:	lda	z6c
	sta	z6e
	lda	z6d
	sta	z6f
Lc8e6:	inx
	inx
	cpx	#$0c
	bne	Lc896
	lda	z6f
	beq	Lc90d
	ldy	#$01
	sec
Lc8f3:	lda	(z6e),y
	sbc	d020d,y
	sta	z6f,y
	iny
	tya
	eor	#$06
	bne	Lc8f3
	lda	z74
	bne	Lc90d
	lda	z73
	bne	Lc90d
	lda	z72
	bpl	Lc916
Lc90d:	lda	#$ff
	sta	z70
	sta	z71
	lsr
	sta	z72
Lc916:	jsr	Sc4ed
	lda	#$ff
	rts

Sc91c:	php
	sei
	ldy	d020a
	cpy	#$04
	bcs	Lc92b
	sta	d0274,y
	inc	d020a
Lc92b:	plp
	rts

Sc92d:	ldx	#$73
Lc92f:	lda	Dc78f,x
	sta	z00,x
	dex
	lda	Dc78f,x
	sta	z00,x
	jsr	Sd49b
	dex
	cpx	#$6c
	bcs	Lc92f
	jsr	Sc383
	lda	d58fb
Lc948:	cmp	d58fb
	beq	Lc948
	jsr	Sc866
	jsr	Sc37d
	lda	#$00
	sta	z33
	jsr	Sc35f
	sta	d0218
	sta	d58ff
	jmp	Lc5ac

Sc963:	lda	#$7f
	jsr	Sc390
	ldy	#$09
Lc96a:	lda	d58ff
	bne	Lc97e
	dey
	bne	Lc96a
	lda	#$ff
	sta	d0218
	sta	d58ff
	ldy	#$80
Lc97c:	tya
	rts

Lc97e:	ldx	#$01
	ldy	#$00
	sty	d0205
Lc985:	lda	d5800,x
	ora	d5800,x
	beq	Lc9b0
	stx	z6c
	sty	z6d
	tax
	tya
	asl
	asl
	asl
	tay
	txa
Lc998:	lsr
	bcc	Lc9a7
	ldx	d0205
	cpx	#$02
	beq	Lc97c
	sty	z6a,x
	inc	d0205
Lc9a7:	iny
	cmp	#$00
	bne	Lc998
	ldy	z6d
	ldx	z6c
Lc9b0:	txa
	asl
	tax
	iny
	bcc	Lc985
	ldx	d0205
	beq	Lc97c
	dex
	beq	Lc9da
	lda	#$40
	bit	z63
	bne	Lc97c
	ldx	d0218
	ldy	z6b
	cpx	z6a
	beq	Lc9d1
	ldy	z6a
	cpx	z6b
Lc9d1:	bne	Lc9d7
	ora	z63
	sta	z63
Lc9d7:	jmp	Lca08

Lc9da:	lda	#$bf
	and	z63
	sta	z63
	ldy	z6a
	lda	#$18
	cpy	d0218
	bne	Lca05
	cpy	#$2f
	bne	Lc9ee
	rts

Lc9ee:	cpy	#$0f
	bne	Lc9f3
	rts

Lc9f3:	dec	d02b2
	beq	Lc9f9
	rts

Lc9f9:	inc	d02b2
	ldx	d0278
	bpl	Lca02
	rts

Lca02:	lda	d0217
Lca05:	sta	d02b2
Lca08:	lda	z65
	ora	#$40
	sta	z65
	lda	#$20
	eor	latchs
	jsr	dolatch
	sty	d0218
	cpy	#$00
	bne	Lca1f
	jmp	Sc601

Lca1f:	cpy	#$3d
	bne	Lca2c
	jsr	Sc92d
	tsx
	inx
	inx
	jmp	Lc72d

Lca2c:	lda	z64
	and	#$02
	bne	Lca80
	cpy	#$38
	bne	Lca42
	lda	z63
	eor	#$08
	sta	z63
Lca3c:	jsr	Sc3d8
	lda	#$00
	rts

Lca42:	cpy	#$2f
	bne	Lca65
Lca46:	lda	z63
	and	#$0f
	tax
	lda	z63
	and	#$f0
	sta	z63
	lda	Dc3ea,x
	cpy	#$2f
	bne	Lca5c
	lsr
	lsr
	lsr
	lsr
Lca5c:	and	#$0f
	ora	z63
	sta	z63
	jmp	Lca3c

Lca65:	cpy	#$0f
	beq	Lca46
	lda	(z01),y
	sec
	sbc	#$15
	cmp	#$03
	bcs	Lca80
	asl
	asl
	asl
	asl
	sty	z6c
	tay
	lda	d0282,y
	beq	Lca3c
	ldy	z6c
Lca80:	lda	z63
	and	#$04
	beq	Lcaa5
	lda	z63
	and	#$02
	bne	Lca95
	lda	z63
	and	#$fb
	sta	z63
	jsr	Sc3d8
Lca95:	lda	z63
	and	#$01
	bne	Lcaa0
	lda	#$80
	jmp	Lcaa2

Lcaa0:	lda	#$40
Lcaa2:	jmp	Lcaba

Lcaa5:	lda	d5820
	and	#$80
	beq	Lcab1
	lda	#$40
	jmp	Lcaba

Lcab1:	lda	d5802
	and	#$80
	beq	Lcaba
	lda	#$80
Lcaba:	ora	d0218
	tay
	lda	(z01),y
	tax
	lda	z63
	and	#$08
	beq	Lcad2
	lda	#$86
	jsr	Sc91c
	lda	z63
	eor	#$08
	sta	z63
Lcad2:	txa
	ldx	d020b
	bne	Lcaf3
	ldx	#$03
Lcada:	cmp	Dc802,x
	bne	Lcaf0
	tay
	lda	Dc7f3-1,x
	and	d020c
	bne	Lcaef
	stx	d020b
	inc	z66
	bne	Lcaf6
Lcaef:	tya
Lcaf0:	dex
	bne	Lcada
Lcaf3:	jsr	Sc6c5
Lcaf6:	lda	#$80
	sta	d027b
	lda	#$00
	rts

x_turn_off:
	txa	; TURN.OFF
	pha
	php
	sei
	jsr	Sc92d
	plp
	pla
	tax
	jsr	sleep
	jmp	next

Scb0e:	php
	sei
	and	#$fc
	pha
	lda	#$00
	ldx	z3d
	sta	d47fe,x
	pla
	tax
	lda	d47fc,x
	ora	#$0c
	cmp	#$ff
	beq	Lcb2c
	lda	#$01
	sta	d47fe,x
	stx	z3d
Lcb2c:	plp
	lda	d2001
	cmp	#'C'	; first char of "COPYRIGHT"
	rts

Scb33:	jmp	(v_abort)

Lcb36:	sta	z3f
	pla
	pha
	and	#$10
	beq	Lcb41
	jmp	Lcce4

Lcb41:	cld
	lda	z3f
	pha
	txa
	pha
	tya
	pha
	lda	latchs
	pha
	lda	z3d
	pha
	jsr	Sc38b

Lcb52:	ldy	#$06
Lcb54:	lda	(z35),y
	and	#$01
	bne	Lcbad
	tya
	clc
	adc	#$06
	tay
	lda	(z35),y
	and	#$fc
	tax
	lda	d47ff,x
	bmi	Lcb54
	stx	z3f
	sty	z40
	cpx	z3d
	bne	Lcb78
	lda	d2001
	cmp	#'C'	; first char of "COPYRIGHT"
	beq	Lcb81
Lcb78:	txa
	jsr	Scb0e
	beq	Lcb81
	jmp	Sc601

Lcb81:	lda	d2000
	clc
	adc	#$0f
	sta	z1c+1
	ldx	z3f
	ldy	z40
	jsr	z1c
	ldy	z40
	iny
	lda	(z35),y
	and	#$40
	beq	Lcb9b
	inc	z66
Lcb9b:	pla
	cmp	z3d
	beq	Lcba3
	jsr	Scb0e
Lcba3:	pla
	jsr	dolatch
	pla
	tay
	pla
	tax
	pla
	RTI
Lcbad:	jsr	Sc860
	bmi	Lcbc0
	bit	z33
	bmi	Lcbc0
	lda	#$80
	sta	z33
	jsr	Sc34f
	jsr	Sc5a8
Lcbc0:	pla
	pha
	jsr	Scb0e
	jsr	Sc963
	bpl	Lcb9b
	jsr	Sc318
	beq	Lcb9b
	jmp	Sc601

postecb:	php
	sei
	iny
	iny
	tax
	lda	(z35),y
	sta	z73
	iny
	lda	(z35),y
	sta	z74
	txa
	ldx	#$00
	sta	(z73,x)
	dey
	dey
	plp
	rts


get_next_tag_byte:
	lda	(z15),y

advance_tag_pointer:
	inc	z15
	bne	Lcbf1
	inc	z15+1
Lcbf1:	rts


Scbf2:	inc	z00,x
	bne	Lcbf8
	inc	z01,x
Lcbf8:	rts

Scbf9:	lda	z00,x
	bne	Lcbff
	dec	z01,x
Lcbff:	dec	z00,x
	rts

Scc02:	sta	z3e
	tay
	bmi	Lcc15
	cmp	z3b
	beq	Lcc14
	dex
	dex
	sta	z00,x
	jsr	Scde5
Lcc12:	inx
	inx
Lcc14:	rts

Lcc15:	and	#$7f
	cmp	z3c
	beq	Lcc14
	dex
	dex
	sta	z00,x
	jsr	Sce1a
	jmp	Lcc12

next2:	lda	z17		; one of the locations next jumps to

	jsr	Scc02

	lda	#$2e		; make next point to next1
	sta	next+1

next1:	ldy	z66
	bne	Lcc86

Lcc32:	lda	(z15),y		; Y always zero here!
	inc	z15
	beq	Lcc81

Lcc38:	asl
	bcs	Lcc40

	sta	ivect1+1	; handle $00..$7f
	jmp	ivect1

Lcc40:	cmp	#$80
	bcs	Lcc49

	sta	ivect2+1	; handle $80..$bf
	jmp	ivect2

Lcc49:	sbc	#$80		; handle $c0..$ff - short tags not in mainframe
	clc
Lcc4c:	adc	tvect0,y
	sta	z0c+1
	lda	#$00
Lcc53:	adc	tvect0+1,y
	sta	z0c+2

	lda	tvect0+2,y	; check needed bank
	beq	Lcc68		; if 0, always present
	cmp	z17		; otherwise see if the bank is mapped
	beq	Lcc68		;   yes

	jsr	Scc02		; no, change bank
	lda	#next2&$ff	; make next point to next2
	sta	next+1

Lcc68:	ldy	#$00
	lda	z0c+1
	cmp	#$ff
	bcs	Lcc73
	jmp	z0c

Lcc73:	lda	(z0c+1),y
	sta	z42
	iny
	lda	(z0c+1),y
	sta	z42+1
	dey
	clc
	jmp	(z42)

Lcc81:	inc	z15+1
	jmp	Lcc38

Lcc86:	ldy	#$00
	lda	D020d
	bne	Lcc32
	inc	D020d
	txa
	pha
	lda	latchs
	pha
	lda	Z3d
	pha

lcc98:	lda	D0203
	beq	Lcca8
	lda	#$00
	sta	D0203
	jsr	Pe367
	jmp	Lccca

Lcca8:	ldy	#$00
	lda	D020b
	beq	Lccca
	asl
	tay
	lda	Dc804,y
	sta	z42+1
	iny
	lda	Dc804,y
	sta	Z42+2
	lda	#$4c		; JMP opcode
	sta	z42
	ldy	#$00
	tsx
	lda	D0103,x
	tax
	jsr	z42
Lccca:	dec	z66
	beq	Lccd1
	jmp	Lcc98

Lccd1:	jsr	Sc38b
	pla
	jsr	Scb0e
	pla
	jsr	dolatch
	pla
	tax
	dec	D020d
	jmp	next1		; why doesn't this jump to next (zero page)?

Lcce4:	plp
	stx	xsave
	pla
	tay
	pla
	tax
	tya
	bne	Lccef
	dex
Lccef:	dey

Lccf0:	lda	next+1
	pha
	lda	z18
	sta	next+1
	lda	z17
	pha
	lda	z15+1
	pha
	lda	z15
	pha
	sty	z15
	stx	z15+1
	lda	z3e
	sta	z17
Lcd08:	ldx	xsave
	jmp	next

dodoes:	pla
	tay
	pla
	sta	z42
	pla
	adc	#$01
	dex
	dex
	sta	z00,x
	pla
	adc	#$00
	sta	z01,x
	stx	xsave
	ldx	z42
	iny
	bne	Lccf0
	inx
	jmp	Lccf0

x_exit:	pla		; EXIT
	sta	z15
	pla
	sta	z15+1
	pla
	sta	z17
	pla
	sta	next+1
	jmp	next

; escape tags 1 through 8
x_esc1:
x_esc2:
x_esc3:
x_esc4:
x_esc5:
x_esc6:
x_esc7:
x_esc8:
	jsr	get_next_tag_byte
Lcd3b:	pha
	lda	ivect1+1
	lsr
	adc	ivect1+1
	tay
	pla
	asl
	bcs	Lcd49
	jmp	Lcc4c

Lcd49:	clc
	adc	tvect0,y
	sta	z0c+1
	lda	#$01
	jmp	Lcc53

x_p_semi_p:
	pla		; (;P)
	sta	z15
	pla
	sta	z15+1
	pla
	sta	z17
	pla
	sta	next+1
	rts

Lcd61:	jsr	Scb33
Lcd64:	dex
	dex
	cpx	z32
	bcc	Lcd61
Lcd6a:	sta	z01,x
	pla
	sta	z00,x
	jmp	next

Lcd72:	dex
	dex
	cpx	z32
	bcc	Lcd61
Lcd78:	sta	z00,x
	lda	#$00
	sta	z01,x
	jmp	next

x_2drop:
	inx		; 2DROP
	inx

x_drop:
	inx		; DROP
	inx
	cpx	#$7b
	bcc	Lcd61
	jmp	next

Lcd8c:	inx
	inx
	cpx	#$7b
	bcs	Lcd6a
	bcc	Lcd61

x_orblip:
	lda	z00,x	; ORBLIP
	jsr	Sc3bb
	jmp	x_drop

x_andblip:
	lda	z00,x	; ANDBLIP
	jsr	Sc3c7
	jmp	x_drop

Scda4:	lsr
	and	#$fc
	tay
	lda	d47fc,y
	eor	z42+2
	rts

Scdae:	sta	z42
	sty	z42+2
	lda	z00,x
	sta	z42+1
	ldy	#$00
	sty	z00,x
	sty	z01,x
	jmp	Sc383

Scdbf:	lda	z42
	jsr	Scda4
	bne	Lcdc9
	sta	d47fe,y
Lcdc9:	rts

Scdca:	lda	z42+1
	jsr	Scda4
	clc
	bne	Lcde2
	lda	z42+1
	and	#$07
	sty	z45
	tay
	lda	Dc7f3,y
	ldy	z45
	sta	d47fe,y
	sec
Lcde2:	jmp	Sc37d

Scde5:	lda	z00,x
	sec
	sbc	#$08
	sta	z00,x
	lda	z3b
	sec
	sbc	#$08
	ldy	#$fb
	jsr	Scdae
	jsr	Scdbf
	jsr	Scdca
	bcc	Lce12
	lda	d8000
	eor	#$ff
	sta	d8000
	cmp	d8000
	bne	Lce0d
	inc	z00,x
Lce0d:	eor	#$ff
	sta	d8000
Lce12:	lda	z42+1
	clc
	adc	#$08
	sta	z3b
	rts

Sce1a:	lda	z3c
	ldy	#$f7
	jsr	Scdae
	lda	z42+1
	sta	z3c
	lda	z42
	sec
	sbc	#$08
	bcc	Lce31
	sta	z42
	jsr	Scdbf
Lce31:	lda	z42+1
	sec
	sbc	#$03
	cmp	#$05
	bcc	Lce6d
	cmp	#$fd
	bcc	Lce4a
	lda	latchs
	ora	z42+1
	ora	#$14
	jsr	dolatch
	jmp	Lce56

Lce4a:	adc	#$fb
	sta	z42+1
	jsr	Scdca
	lda	#$07
	jsr	Sc35f
Lce56:	bcc	Lce6d
	lda	romaddr+1
	cmp	#'C'	; must be 'C' for first character of "Copyright"
	bne	Lce6d
	inc	z00,x
	lda	cspeed
	and	#$04
	bne	Lce6d
	lda	#$ef
	jsr	Sc390
Lce6d:	rts

x_set_ram:
	jsr	Scde5	; SET.RAM
	jmp	next

x_set_rom:
	jsr	Sce1a	; SET.ROM
	jmp	next

x_set_ctrl:
	stx	xsave	; SET.CTRL
	jsr	Sc383
	lda	z00,x
	jsr	Scb0e
	php
	jsr	Sc37d
	ldx	xsave
	plp
	jmp	Lcfd3

x_lit:
	jsr	get_next_tag_byte	; LIT
	pha
	jsr	get_next_tag_byte
	jmp	Lcd64

x_flit:
	txa		; FLIT
	adc	#$f8
	tax
	cpx	z32
	bcc	Lceb5
	stx	xsave
	lda	#$08
	sta	z42
Lcea6:	jsr	get_next_tag_byte
	sta	z00,x
	inx
	dec	z42
	bne	Lcea6
	ldx	xsave
	jmp	next

Lceb5:	jmp	Lcd61

x_clit3:
	iny		; CLIT3: load one-byte constant + $0300

x_clit2:
	iny		; CLIT2: load one-byte constant + $0200
	iny

x_clit:
	sty	z42	; CLIT: load one-byte constant
	ldy	#$00
	jsr	get_next_tag_byte
	pha
	lda	z42
	jmp	Lcd64

x_at:
	lda	(z00,x)	; @
	pha
	jsr	Scbf2
	lda	(z00,x)
	jmp	Lcd6a

x_bang:
	lda	z02,x	; !
	sta	(z00,x)
	jsr	Scbf2
	lda	z03,x
	sta	(z00,x)
	jmp	x_2drop

x_c_at:
	lda	(z00,x)	; C@
	jmp	Lcd78

x_c_bang:
	lda	z02,x	; C!
	sta	(z00,x)
	jmp	x_2drop

x_abort:
	jsr	Scb33	; ABORT

x_nop:
	jmp	next	; NOP

x_plus_bang:
	lda	z02,x	; +!
	adc	(z00,x)
	sta	(z00,x)
	jsr	Scbf2
	lda	z03,x
	adc	(z00,x)
	sta	(z00,x)
	jmp	x_2drop

x_query_dup:
	lda	z00,x	; ?DUP
	ora	z01,x
	beq	x_nop

x_dup:
	lda	z00,x	; DUP
	pha
	lda	z01,x
	jmp	Lcd64

x_over:
	lda	z02,x	; OVER
	pha
	lda	z03,x
	jmp	Lcd64

Scf1b:	stx	xsave
	lda	z00,x
	asl
	adc	xsave
	tax
	lda	z00,x
	rts

x_pick:
	jsr	Scf1b	; PICK
	pha
	lda	z01,x
	ldx	xsave
	jmp	Lcd6a

x_plus_c_bang:
	lda	(z00,x)	; +C!
	adc	z02,x
	sta	(z00,x)
	jmp	x_2drop

x_sp_at:
	txa		; SP@
	jmp	Lcd72

x_set_sp:
	lda	z00,x	; SET.SP
	tax
	jmp	next

Lcf44:	ldx	xsave
	jmp	x_drop

x_rot:
	dex		; ROT
	dex
	lda	#$03
	sta	z00,x

x_roll:
	jsr	Scf1b	; ROLL
	cpx	xsave
	bmi	Lcf44
	beq	Lcf44
	pha
	lda	z01,x
Lcf5b:	ldy	zff,x
	sty	z01,x
	dex
	cpx	xsave
	bne	Lcf5b
	jmp	Lcd8c

x_swap:
	lda	z02,x	; SWAP
	pha
	lda	z00,x
	sta	z02,x
	lda	z03,x
	ldy	z01,x
	sty	z03,x
	jmp	Lcd6a

x_2_to_r:
	lda	z01,x	; 2>R
	pha
	lda	z00,x
	pha
	inx
	inx

x_to_r:
	lda	z01,x	; >R
	pha
	lda	z00,x
	pha
	jmp	x_drop

x_2_r_to:
	dex		; 2R>
	dex
	pla
	sta	z00,x
	pla
	sta	z01,x

x_r_to:
	dex		; R>
	dex
	pla
	sta	z00,x
	pla
	sta	z01,x
	jmp	next

x_rp_bang:
	txa		; RP!
	ldx	#$fd
	txs
	tax
	lda	#$fa
	sta	z24
	jmp	next

x_r:
	stx	xsave	; R
	tsx
	lda	d0101,x
	pha
	lda	d0102,x
	ldx	xsave
	jmp	Lcd64

x_rp_at:
	stx	xsave	; RP@
	tsx
	inx
	txa
	pha
	lda	#$01
	ldx	xsave
	jmp	Lcd64

x_set_rp:
	stx	xsave	; SET.RP
	lda	z00,x
	tax
	dex
	txs
	ldx	xsave
	jmp	x_drop

x_not:
	lda	z00,x	; NOT, 0=
	ora	z01,x
Lcfd3:	bne	Lcfda

Lcfd5:	lda	#$01
	jmp	Lcd78

Lcfda:	lda	#$00
	jmp	Lcd78

x_0_less_than:
	lda	z01,x	; 0<
	bmi	Lcfd5
	bpl	Lcfda

x_9:	iny		; 9
x_8:	iny		; 8
x_7:	iny		; 7
x_6:	iny		; 6
x_5:	iny		; 5
x_4:	iny		; 4
x_3:	iny		; 3
x_2:	iny		; 2
x_1:	iny		; 1
x_0:	tya		; 0
	jmp	Lcd72


x_minus_1:
	lda	#$ff	; -1
	pha
	jmp	Lcd64


x_20h:
	fcb	$00	; 20H
	tag	clit
	fcb	$20

x_30h:
	fcb	$00	; 30H
	tag	clit
	fcb	$30

x_80h:
	fcb	$00	; 80H
	tag	clit
	fcb	$80

x_num_decb:
	fcb	$00	; #DECB
	tag	clit2
	fcb	$d7

x_falsify:
	fcb	$00	; FALSIFY
	tag	drop
	tag	0

	fcb	$00


x_and:
	lda	z00,x	; AND
	and	z02,x
	pha
	lda	z01,x
	and	z03,x
	jmp	Lcd8c

x_or:
	lda	z00,x	; OR
	ora	z02,x
	pha
	lda	z01,x
	ora	z03,x
	jmp	Lcd8c

x_xor:
	lda	z00,x	; XOR
	eor	z02,x
	pha
	lda	z01,x
	eor	z03,x
	jmp	Lcd8c

x_k:
	lda	#$f4	; K
	bne	Ld032

x_j:
	lda	#$fa	; J
Ld032:	adc	z24
	tay
	bcs	Ld039

x_i:
	ldy	z24	; I
Ld039:	lda	d0104,y
	pha
	lda	d0105,y
	jmp	Lcd64

x_flip:
	ldy	z00,x	; FLIP or ><
	lda	z01,x
	sty	z01,x
	sta	z00,x
	jmp	next

Sd04e:	lda	z02,x
	adc	z00,x
	sta	z02,x
	lda	z03,x
	adc	z01,x
	sta	z03,x
	rts

Sd05b:	sec
	lda	z02,x
	sbc	z00,x
	sta	z02,x
	lda	z03,x
	sbc	z01,x
	sta	z03,x
	rts

x_plus:
	jsr	Sd04e	; +
	jmp	x_drop

x_minus:
	jsr	Sd05b	; -
	jmp	x_drop

x_2_minus:
	dey		; 2-

x_1_minus:
	dey		; 1-
	tya
	ldy	#$ff
	bne	Ld081

x_2_plus:
	iny		; 2+

x_1_plus:
	iny		; 1+
	tya
	ldy	#$00
Ld081:	dex
	dex
	sta	z00,x
	sty	z01,x
	jmp	x_plus

x_2_times:
	asl	z00,x	; 2*
	rol	z01,x
	jmp	next

x_2_div:
	lda	z01,x	; 2/
	rol
	ror	z01,x
	ror	z00,x
	jmp	next

x_pushkey:
	lda	z00,x	; PUSHKEY
	jsr	Sc91c
	jmp	x_drop

x_toggle:
	fcb	$00	; TOGGLE
	tag	over		; OVER @ XOR SWAP !
	tag	at
	tag	xor
	tag	swap
	tag	bang

x_set_bits:
	fcb	$00	; SET.BITS
	tag	over		; OVER @ OR SWAP !
	tag	at
	tag	or
	tag	swap
	tag	bang

x_clr_bits:
	fcb	$00	; CLR.BITS
	tag	minus_1		; -1 XOR OVER @ AND SWAP !
	tag	xor
	tag	over
	tag	at
	tag	and
	tag	swap
	tag	bang

x_save:
	fcb	$00	; SAVE
	tag	2_r_to		; 2R> ROT DUP >R @ >R 2>R
	tag	rot
	tag	dup
	tag	to_r
	tag	at
	tag	to_r
	tag	2_to_r

x_restore:
	fcb	$00	; RESTORE
	tag	2_r_to		; 2R> 2R> ! 2>R
	tag	2_r_to
	tag	bang
	tag	2_to_r

x_crestore:
	fcb	$00	; CRESTORE
	tag	2_r_to		; 2R> 2R> C! 2>R
	tag	2_r_to
	tag	c_bang
	tag	2_to_r

	fcb	$00


x_tag_a7:
	php		; unknown tag $a7
	sei		; save P in z72, then disable interrupts
	pla
	sta	z72
	jmp	next

x_tag_a8:
	lda	z72	; unknown tag $a8
	pha		; restore P from z72
	plp
	jmp	next

x_execute:
	inx	; EXECUTE
	inx
	lda	zfe,x
	beq	Ld0eb
	cmp	#$09
	bcs	Ld0eb
	asl
	sta	ivect1+1
	lda	zff,x
	jmp	Lcd3b

Ld0eb:	jmp	Lcc38


x_p_call:
	jsr	get_next_tag_byte	; (CALL)
	sta	z42
	jsr	get_next_tag_byte
	sta	z42+1
	jmp	(z42)

scomp:	lda	#$80
	eor	z01,x
	sta	z01,x
	lda	#$80
	eor	z03,x
	sta	z03,x

ucomp:	lda	z03,x
	cmp	z01,x
	bne	Ld111
	lda	z02,x
	cmp	z00,x
Ld111:	rts

Ld112:	lda	#$00
	beq	Ld118
Ld116:	lda	#$01
Ld118:	pha
	lda	#$00
	jmp	Lcd8c

x_equal_to:
	jsr	ucomp	; =
	beq	Ld116
	bne	Ld112

x_not_equal_to:
	jsr	ucomp	; <>
	beq	Ld112
	bne	Ld116

x_less_than:
	jsr	scomp	; <
	bcc	Ld116
	bcs	Ld112

x_greater_than:
	jsr	scomp	; >
	beq	Ld112
	bcs	Ld116
	bcc	Ld112

x_u_less_than:
	jsr	ucomp	; U<
	bcc	Ld116
	bcs	Ld112

x_p_if:
	lda	z00,x	; (IF)
	ora	z01,x
	bne	Ld157
Ld149:	clc
	lda	(z15),y
	adc	z15
	sta	z15
	bcc	Ld154
	inc	z15+1
Ld154:	jmp	x_drop

Ld157:	jsr	advance_tag_pointer
	jmp	x_drop

x_p_until:
	lda	z00,x	; (UNTIL)
	ora	z01,x
	bne	Ld157
Ld163:	lda	z15
	sbc	(z15),y
	sta	z15
	bcs	Ld16d
	dec	z15+1
Ld16d:	jmp	x_drop

x_query_jump:
	lda	z00,x	; ?JUMP
	ora	z01,x
	bne	Ld188
Ld176:	lda	(z15),y
	adc	z15
	pha
	iny
	lda	(z15),y
	adc	z15+1
	sta	z15+1
	pla
	sta	z15
	jmp	x_drop

Ld188:	jsr	advance_tag_pointer
	jmp	Ld157

x_p_notif:
	lda	z00,x	; (NOTIF)
	ora	z01,x
	beq	Ld157
	bne	Ld149

x_p_if_its:
	jsr	get_next_tag_byte	; (IF.ITS)
	dex
	dex
	cmp	z02,x
	beq	Ld157
	bne	Ld149

x_p_eq_if:
	jsr	ucomp	; (=IF)
	bne	Ld1ac
Ld1a6:	jsr	advance_tag_pointer
	jmp	x_2drop

Ld1ac:	inx
	inx
	jmp	Ld149

x_p_less_if:
	jsr	scomp	; (<IF)
	bcc	Ld1a6
	bcs	Ld1ac

x_p_else:
	dex		; (ELSE)
	dex
	jmp	Ld149

x_p_again:
	dex		; (AGAIN)
	dex
	jmp	Ld163

x_jump:
	dex		; JUMP
	dex
	jmp	Ld176

x_p_do:
	lda	z24	; (DO)
	adc	#$06
	sta	z24
	tay
	lda	z15
	sta	d0100,y
	lda	z15+1
	sta	d0101,y
	lda	z02,x
	sta	d0102,y
	lda	z03,x
	sta	d0103,y
	lda	z00,x
	sta	d0104,y
	lda	z01,x
	sta	d0105,y
	tya
	adc	#$06
	sta	z42
	txa
	tsx
	cpx	z42
	tax
	bcc	Ld1fb
	jmp	x_2drop

Ld1fb:	jsr	Scb33

x_leave:
	ldy	z24	; LEAVE
	lda	d0104,y
	sta	d0102,y
	lda	d0105,y
	sta	d0103,y
	jmp	next

x_p_plus_loop:
	ldy	z01,x	; (+LOOP)
	lda	z00,x
	inx
	inx
	cpx	#$7b
	bcs	Ld21e
	jmp	Lcd61

x_p_loop:
	lda	#$01	; (LOOP)
Ld21e:	stx	xsave
	ldx	z24
	clc
	adc	d0104,x
	sta	d0104,x
	tya
	adc	d0105,x
	sta	d0105,x
	tya
	bpl	Ld242
	lda	d0102,x
	cmp	d0104,x
	lda	d0103,x
	sbc	d0105,x
	jmp	Ld24e

Ld242:	lda	d0104,x
	cmp	d0102,x
	lda	d0105,x
	sbc	d0103,x
Ld24e:	bmi	Ld259
	txa
	sec
	sbc	#$06
	sta	z24
	jmp	Ld263

Ld259:	lda	d0100,x
	sta	z15
	lda	d0101,x
	sta	z15+1
Ld263:	jmp	Lcd08

x_p_case:
	jsr	ucomp	; (CASE)
	bne	Ld271
	jsr	advance_tag_pointer
	jmp	x_2drop

Ld271:	jmp	Ld149

x_p_query_do:
	jsr	scomp	; (?DO)
	bcc	Ld285
	beq	Ld285
	jsr	scomp
	jsr	advance_tag_pointer
	clc
	jmp	x_p_do

Ld285:	inx
	inx
	jmp	Ld149

x_bounds:
	fcb	$00	; BOUNDS
	tag	over		; OVER + SWAP
	tag	plus
	tag	swap

x_query_range:
	fcb	$00	; ?RANGE
	tag	to_r		; >R OVER > OVER R> > OR NOT
	tag	over
	tag	greater_than
	tag	over
	tag	r_to
	tag	greater_than
	tag	or
	tag	not

x_bin_to_ascii:
	fcb	$00	; B>A
	tag	30h		; $30 + DUP 9 > IF 7 + THEN
	tag	plus
	tag	dup
	literal	'9'
	tag	greater_than
	tag	p_if
	fcb	$03
	tag	7
	tag	plus

x_lower_to_upper:
	fcb	$00	; L>U
	literal	$61			; $61 $7a ?RANGE IF 20H - THEN
	literal	$7a
	tag	query_range
	tag	p_if
	fcb	$03
	tag	20h
	tag	minus

x_2roll:
	fcb	$00	; 2ROLL
	tag	2_times			; 2* DUP 1+ ROLL SWAP ROLL
	tag	dup
	tag	1_plus
	tag	roll
	tag	swap
	tag	roll

x_2pick:
	fcb	$00	; 2PICK
	tag	2_times			; 2* DUP >R PICK R> PICK
	tag	dup
	tag	to_r
	tag	pick
	tag	r_to
	tag	pick

x_2rot:
	fcb	$00	; 2ROT
	tag	6			; 6 ROLL 6 ROLL
	tag	roll
	tag	6
	tag	roll

x_2swap:
	fcb	$00	; 2SWAP
	tag	4			; 4 ROLL 4 ROLL
	tag	roll
	tag	4
	tag	roll

x_2over:
	fcb	$00	; 2OVER
	tag	4			; 4 PICK 4 PICK
	tag	pick
	tag	4
	tag	pick

x_2dup:	fcb	$00	; 2DUP
	tag	over			; OVER OVER
	tag	over

x_2at:	fcb	$00	; 2@
	tag	dup			; DUP @ SWAP 2+ @
	tag	at
	tag	swap
	tag	2_plus
	tag	at

x_2bang:
	fcb	$00	; 2!
	tag	swap			; SWAP OVER 2+ ! !
	tag	over
	tag	2_plus
	tag	bang
	tag	bang

x_swapdrop:
	fcb	$00	; SWAPDROP, UNDER
	tag	swap			; SWAP DROP
	tag	drop

x_fdup:
	fcb	$00	; FDUP
	tag	2over			; 2OVER 2OVER
	tag	2over

x_fdrop:
	fcb	$00	; FDROP
	tag	2drop			; 2DROP 2DROP
	tag	2drop

x_fswap:
	fcb	$00	; FSWAP
	tag	4			; 4 2ROLL 4 2ROLL
	tag	2roll
	tag	4
	tag	2roll

x_fover:
	fcb	$00	; FOVER
	tag	4			; 4 2PICK 4 2PICK
	tag	2pick
	tag	4
	tag	2pick

	fcb	$00

x_u_times:
	tya		; U*
	sta	z42
	ldy	#$11
	bne	Ld309
Ld2f7:	bcc	Ld306
	sta	z42+1
	clc
	lda	z42
	adc	z00,x
	sta	z42
	lda	z42+1
	adc	z01,x
Ld306:	ror
	ror	z42
Ld309:	ror	z03,x
	ror	z02,x
	dey
	bne	Ld2f7
	sta	z01,x
	lda	z42
	sta	z00,x
	jmp	next

x_um_div:
	ldy	#$11	; UM/
	bne	Ld323
Ld31d:	rol	z02,x
	rol	z03,x
	bcs	Ld331
Ld323:	lda	z03,x
	cmp	z01,x
	bcc	Ld33e
	bne	Ld331
	lda	z02,x
	cmp	z00,x
	bcc	Ld33e
Ld331:	lda	z02,x
	sbc	z00,x
	sta	z02,x
	lda	z03,x
	sbc	z01,x
	sta	z03,x
	sec
Ld33e:	rol	z04,x
	rol	z05,x
	dey
	bne	Ld31d
	inx
	inx
	jmp	x_swap

x_times:
	fcb	$00	; *
	tag	u_times		; U* DROP
	tag	drop

	fcb	$00


x_negate:
	sec		; NEGATE
Ld34f:	tya
	sbc	z00,x
	sta	z00,x
	tya
	sbc	z01,x
	sta	z01,x
	jmp	next

x_dnegate:
	sec		; DNEGATE
	tya
	sbc	z02,x
	sta	z02,x
	tya
	sbc	z03,x
	sta	z03,x
	jmp	Ld34f


Sd36a:	lda	z01,x
	eor	z03,x
	pha
	jmp	next


Sd372:	pla
	bmi	x_dnegate
	jmp	next


x_abs	equ	*-1	; ABS
	tag	dup			; DUP 0< IF NEGATE
	tag	0_less_than
	tag	p_if
	fcb	$02
	tag	negate

x_m_times:
	fcb	$00	; M*
	tag	p_call			; (CALL
	fdb	Sd36a
	tag	abs			; ABS SWAP ABS U*
	tag	swap
	tag	abs
	tag	u_times
	tag	p_call			; (CALL
	fdb	Sd372

	fcb	$00


x_d_plus:
	lda	z02,x	; D+
	adc	z06,x
	sta	z06,x
	lda	z03,x
	adc	z07,x
	sta	z07,x
	lda	z00,x
	adc	z04,x
	sta	z04,x
	lda	z01,x
	adc	z05,x
	sta	z05,x
	jmp	x_2drop

x_d_minus:
	fcb	$00	; D-
	tag	dnegate		; DNEGATE
	tag	d_plus		; D+

x_d_equals:
	fcb	$00	; D=
	tag	d_minus		; D- OR 0=
	tag	or
	tag	0_equal

x_ud_less_than:
	fcb	$00	; UD<
	tag	to_r		; >R SWAP R> 2DUP
	tag	swap
	tag	r_to
	tag	2dup
	tag	p_eq_if		; =IF 2DROP U< EXIT
	fcb	$05
	tag	2drop
	tag	u_less_than
	tag	exit
	tag	2swap		; THEN 2SWAP 2DROP U<
	tag	2drop
	tag	u_less_than

x_ud_min:
	fcb	$00	; UDMIN
	tag	2over			; 2OVER 2OVER UD<
	tag	2over
	tag	ud_less_than
	tag	p_notif			; (NOTI) ofs=2
	fcb	$02
	tag	2swap			;   2SWAP 2DROP
	tag	2drop

x_dabs:
	fcb	$00	; DABS
	tag	dup			; DUP 0< IF DNEGATE THEN
	tag	0_less_than
	tag	p_if
	fcb	$03
	tag	dnegate

x_max:
	fcb	$00	; MAX
	tag	2dup			; 2DUP <IF SWAP DROP THEN
	tag	p_less_if
	fcb	$02
	tag	swap
	tag	drop

x_min:
	fcb	$00	; MIN
	tag	2dup			; 2DUP > IF SWAP DROP THEN
	tag	greater_than
	tag	p_if
	fcb	$02
	tag	swap
	tag	drop

	fcb	$00


Sd3da:	lda	z01,x
	pha
	lda	z03,x
	eor	z01,x
	pha
	jmp	next


Sd3e5:	pla
	bpl	Ld3eb
	jmp	x_negate
ld3eb:	jmp	next


x_m_div	equ	*-1	; M/
	tag	p_call			; (CALL)
	fdb	Sd3da
	tag	abs			; ABS >R DABS R> UM/
	tag	to_r
	tag	dabs
	tag	r_to
	tag	um_div
	tag	p_call			; (CALL)
	fdb	Sd3e5
	tag	swap			; SWAP
	tag	p_call			; (CALL)
	fdb	Sd3e5
	tag	swap			; SWAP

x_s_to_d:
	fcb	$00	; S>D
	tag	dup			; DUP 0< NEGATE
	tag	0_less_than
	tag	negate

x_div_mod:
	fcb	$00	; /MOD
	tag	to_r			; >R S>D R> M/
	tag	s_to_d
	tag	r_to
	tag	m_div

x_times_div_mod:
	fcb	$00	; */MOD
	tag	to_r			; >R M* R> M/
	tag	m_times
	tag	r_to
	tag	m_div

x_m_div_mod:
	fcb	$00	; M/MOD
	tag	to_r			; >R 0 R UM/ R> SWAP >R UM/ R>
	tag	0
	tag	r
	tag	um_div
	tag	r_to
	tag	swap
	tag	to_r
	tag	um_div
	tag	r_to

x_div:
	fcb	$00	; /
	tag	div_mod			; /MOD SWAPDROP
	tag	swapdrop

x_mod:
	fcb	$00	; MOD
	tag	2dup			; 2DUP /MOD DROP ROT 0< IF - ELSE SWAPDROP THEN
	tag	div_mod
	tag	drop
	tag	rot
	tag	0_less_than
	tag	p_if
	fcb	$04
	tag	minus
	tag	p_else
	fcb	$02
	tag	swapdrop

	fcb	$00


x_shift:
	lda	z01,x	; SHIFT
	bmi	Ld441
Ld431:	lda	z00,x
	beq	Ld43e
	asl	z02,x
	rol	z03,x
	dec	z00,x
	jmp	Ld431

Ld43e:	jmp	x_drop

Ld441:	lda	z00,x
	beq	Ld44e
	lsr	z03,x
	ror	z02,x
	inc	z00,x
	jmp	Ld441

Ld44e:	jmp	x_drop


x_charbuf:
	fcb	$00	; CHARBUF
	literal	D0236		; $0236 +
	tag	plus

	fcb	$00


Sd456:	lda	d02b3,y
	bcc	Ld45d
	lda	(z35),y
Ld45d:	eor	z00,x
	rts

Sd460:	jsr	Sd456
	bne	Ld478
	iny
	inx
	jsr	Sd456
	php
	dey
	dex
	plp
	bne	Ld478
	lda	#$80
	ora	(z00,x)
	sta	(z00,x)
	lda	#$00
Ld478:	rts

Sd479:	ldy	#$fa
Ld47b:	tya
	clc
	adc	#$07
	tay
	lda	(z35),y
	bpl	Ld495
	iny
	sec
	jsr	Sd460
	bne	Ld493
	dey
	lda	(z35),y
	and	#$7f
	sta	(z35),y
	iny
Ld493:	dey
	dey
Ld495:	lda	(z35),y
	and	#$01
	beq	Ld47b

Sd49b:	ldy	#$0a
Ld49d:	clc
	jsr	Sd460
	bne	Ld4a6
	sta	d02b4,y
Ld4a6:	dey
	dey
	bpl	Ld49d
	rts

x_cancel:
	jsr	Sd479	; CANCEL
	jmp	x_drop


setup:	ldy	#$00
	asl
	sta	z41
Ld4b6:	lda	z00,x
	sta	z42,y
	inx
	iny
	cpy	z41
	bne	Ld4b6
	ldy	#$00
	clc
	rts

x_flee:
	fcb	$00	; FLEE
	tag	dup		; DUP d0280 !
	literal	d0280
	tag	bang
	tag	dup		; DUP $ff and 3 * tvect0 + @ d027e !
	literal	$00ff
	tag	and
	tag	3
	tag	times
	literal	tvect0
	tag	plus
	tag	at
	literal	d027e
	tag	bang
	literal	z3c		; z3c @ d027c !
	tag	c_at
	literal	d027c
	tag	c_bang
	literal	z3d		; z3d @ d027z !
	tag	c_at
	literal	d027d
	tag	c_bang
	tag	execute		; EXECUTE HARD.CLR
	tag	hard_clr


Sd4e6:	jsr	Scbf9
	lda	#$03
	jsr	setup
	lda	z42+1
	bpl	Ld4f3
	rts

Ld4f3:	stx	xsave
	dex
	dex
	dex
	dex
	jsr	ucomp
	bcs	Sd521
	lda	z42+1
	adc	z45
	sta	z45
	clc
	lda	z42+1
	adc	z47
	sta	z47
	ldy	z42
Ld50d:	lda	(z46),y
	sta	(z42+2),y
	dey
	cpy	#$ff
	bne	Ld50d
	dec	z45
	dec	z47
	dec	z42+1
	bpl	Ld50d
	jmp	Ld53d

Sd521:	ldx	z42
	inx
	stx	z48
	cpy	z42+1
	beq	Ld52c
	sty	z48
Ld52c:	lda	(z46),y
	sta	(z42+2),y
	iny
	cpy	z48
	bne	Ld52c
	inc	z45
	inc	z47
	dec	z42+1
	bpl	Sd521
Ld53d:	ldx	xsave
	rts

x_move:
	jsr	Sd4e6	; MOVE
	jmp	next

x_dmove:
	lda	latchs	; DMOVE
	ora	#$80
	jsr	Sc36f
	jsr	Sd4e6
	jsr	Sc37d
	jmp	next

x_cmove:
	jsr	Scbf9	; CMOVE
	lda	#$03
	jsr	setup
	lda	z42+1
	bmi	Ld567
	stx	xsave
	jsr	Sd521
Ld567:	jmp	next


x_setbanks	equ	*-1	; SETBANKS
	tag	dup		; DUP $ff AND SET.RAM DROP
	literal	$00ff
	tag	and
	tag	set_ram
	tag	drop
	tag	flip		; FLIP $ff AND SET.ROM DROP
	literal	$00ff
	tag	and
	tag	set_rom
	tag	drop


x_bigmove:
	fcb	$00	; BIGMOVE
	literal	z3b		; $3b @ >R 4 ROLL SETBANKS MOVE
	tag	at
	tag	to_r
	tag	4
	tag	roll
	tag	setbanks
	tag	move
	tag	r_to		; R> SETBANKS
	tag	setbanks


x_fill:
	fcb	$00	; FILL
	tag	swap		; SWAP ?DUP IF
	tag	query_dup
	tag	p_if
	fcb	$0c
	tag	to_r		;   >R OVER C! DUP 1+ R> 1- CMOVE
	tag	over
	tag	c_bang
	tag	dup
	tag	1_plus
	tag	r_to
	tag	1_minus
	tag	cmove
	tag	p_else		; ELSE
	fcb	$02
	tag	2drop		;   2DROP THEN


x_erase:
	fcb	$00	; ERASE
	tag	0		; 0 FILL
	tag	fill


x_blanks:
	fcb	$00	; BLANKS
	tag	20h		; 20H FILL
	tag	fill


x_jump_tab:
	fcb	$00	; <JUMP-TAB>
	tag	2_times		; 2* R> DUP 2+ >R DUP @ - + @ EXECUTE
	tag	r_to
	tag	dup
	tag	2_plus
	tag	to_r
	tag	dup
	tag	at
	tag	minus
	tag	plus
	tag	at
	tag	execute

	fcb	$00


Sd5a9:	jsr	Sc383
Ld5ac:	lda	d58fb
	ldx	d58fc
	ldy	d58fd
	cmp	d58fb
	bne	Ld5ac
	pha
	jsr	Sc37d
	pla
	rts

Sd5c0:	stx	xsave
	jsr	Sd5a9
	pha
	txa
	ldx	xsave
	dex
	dex
	sty	z01,x
	sta	z00,x
	pla
	rts

x_get_gmt:
	jsr	Sd5c0	; GET.GMT
	dex
	dex
	sta	z00,x
	sec
	lda	d0378
	sbc	z00,x
	pha
	ldy	#$00
	lda	z03,x
	bpl	Ld5e6
	dey
Ld5e6:	sty	z00,x
	sty	z01,x
	lda	d0379
	sbc	z02,x
	sta	z02,x
	lda	d037a
	sbc	z03,x
	sta	z03,x
	lda	d037b
	sbc	z00,x
	sta	z00,x
	lda	d037c
	sbc	z01,x
	sta	z01,x
	pla
	jmp	Lcd72


x_s_d_times:
	fcb	$00	; SD*
	tag	rot		; ROT OVER U* 2SWAP U* DROP +
	tag	over
	tag	u_times
	tag	2swap
	tag	u_times
	tag	drop
	tag	plus


x_get_local:
	fcb	$00	; GET.LOCAL
	tag	get_gmt		; GET.GMT DROP
	tag	drop


x_set_delay_long:
	fcb	$00	; SET.DELAY.LONG
	tag	to_r		; >R 0 ROT GET.GMT 4 ROLL +
	tag	0
	tag	rot
	tag	get_gmt
	tag	4
	tag	roll
	tag	plus
	tag	dup		; DUP >R $0100 AND
	tag	to_r
	literal	$0100
	tag	and
	tag	p_if		; IF
	fcb	$04
	tag	1		;   1 0 D+ D+ R> R DUP 1+
	tag	0
	tag	d_plus
	tag	d_plus
	tag	r_to
	tag	r
	tag	dup
	tag	1_plus
	tag	rot
	tag	swap
	tag	c_bang
	tag	2_plus
	tag	2bang
	tag	r_to
	tag	set_timer


x_set_delay:
	fcb	$00	; SET.DELAY
	literal	$00ff		; $00ff ROT 2DUP FLIP AND >R AND R> ROT
	tag	rot
	tag	2dup
	tag	flip
	tag	and
	tag	to_r
	tag	and
	tag	r_to
	tag	rot
	tag	set_delay_long	; SET.DELAY.LONG

	fcb	$00


Dd644:	fcb	$41,$42,$43,$44,$45,$46,$47,$48	; ".ABCDEFGH"
	fcb	$49,$4a,$81,$82,$85,$86,$88,$89	; "IJ......"
	fcb	$8b

Dd655:	fcb	$00,$3f,$9e,$9d,$1f,$3e,$9c,$2e
	fcb	$2d,$8f,$00,$3f,$1f,$3e,$2e,$2d
	fcb	$4f

Sd666:	pha
	and	#$3f
	sta	z42
	pla
	ldy	#$11
Ld66e:	cmp	Dd644-1,y
	bne	Ld67c
	lda	Dd655-1,y
	and	#$3f
	sta	z42
	ldy	#$01
Ld67c:	dey
	bne	Ld66e

	ldy	#$06
Ld681:	lda	(z35),y
	and	#$01
	beq	Ld688
	rts

Ld688:	tya
	clc
	adc	#$06
	tay
	lda	(z35),y
	sty	z42+1
	jsr	Scb0e
	bne	Ld6a2
	lda	d2023
	and	#$3f
	cmp	z42
	bne	Sd6a0
	rts

Sd6a0:	ldy	z42+1
Ld6a2:	jmp	Ld681

x_attachx:
	iny		; ATTACHX

x_attach:
	sty	z41	; ATTACH
	lda	z3d
	pha
	jsr	Sc383
	stx	xsave
	ldy	z00,x
	cpy	#$10
	bcc	Ld6c2
Ld6b6:	pla
	jsr	Scb0e
	ldx	xsave
	jsr	Sc37d
	jmp	Ld112

Ld6c2:	lda	z02,x
	jsr	Sd666
Ld6c7:	bne	Ld6b6
	ldy	z42+1
	ldx	xsave
	lda	d2023
	and	#$c0
	bne	Ld6e0
	tya
	clc
	adc	#$06
	sta	z42+1
	lda	z02,x
	bmi	Ld6e0
	ldy	z42+1
Ld6e0:	lda	z41
	beq	Ld6fa
	sty	z47
	ldy	#$10
Ld6e8:	lda	d02c0,y
	cmp	z47
	bne	Ld6f5
	jsr	Sd6a0
	jmp	Ld6c7

Ld6f5:	dey
	bne	Ld6e8
	ldy	z47
Ld6fa:	tya
	ldy	z00,x
	sta	devtbl,y
	pla
	jsr	Scb0e
	ldx	xsave
	jsr	Sc37d
	jmp	Ld116

x_set_crom:
	jsr	Sc383	; SET.CROM
	stx	xsave
	lda	z00,x
	jsr	Sd666
	php
	jsr	Sc37d
	ldx	xsave
	plp
	jmp	Lcfd3


x_flee_cap:
	fcb	$00	; FLEE.CAP
	literal	z3c		; z3c @ 80H OR ROMVECT 2@ $ff AND DUP >R
	tag	c_at
	tag	80h
	tag	or
	literal	romvect
	tag	2at
	literal	$00ff
	tag	and
	tag	dup
	tag	to_r
	tag	3		; 3 * TVECT0 + SWAP OVER BANG 2+ C!
	tag	times
	literal	tvect0
	tag	plus
	tag	swap
	tag	over
	tag	bang
	tag	2_plus
	tag	c_bang
	tag	r_to		; R> ?DUP
	tag	query_dup
	tag	p_notif
	fcb	$03
	literal	$00c0
	tag	jump
	fdb	Lfd85


x_flee_crom:
	fcb	$00	; FLEE.CROM
	tag	0	;	0 $2025 ROT SET.CROM NOT UNTIL 2DROP
	literal	$2025
	tag	rot
	tag	set_crom
	tag	not
	tag	p_until
	fcb	$23
	tag	2drop


Sd74f:	fcb	$00
	tag	rot		; ROT OVER SWAP 1+ - (;P)
	tag	over
	tag	swap
	tag	1_plus
	tag	minus
	tag	p_semi_p


Sd756:	ldx	#$00
	ldy	z48
	stx	z48
	lda	(z46,x)
	ldx	z42
	rts

x_locate:
	jsr	Sd74f	; LOCATE
	lda	#$04
	jsr	setup
	stx	xsave
	lda	z45
	bne	Ld7b8
	lda	z42+1
	bpl	Ld7b8
	lda	z42+2
	ora	z45
	bne	Ld78f
Ld779:	ldx	xsave
	dex
	dex
	sec
	lda	z48
	sbc	z00,x
	sta	z00,x
	lda	z49
	sbc	z01,x
	sta	z01,x
	ldy	#$00
	jmp	x_1

Ld78f:	jsr	Sd756
Ld792:	cmp	(z48),y
	bne	Ld7ac
	sty	z48
	ldy	#$00
Ld79a:	lda	(z46),y
	cmp	(z48),y
	bne	Ld7a7
	iny
	cpy	z42+2
	bne	Ld79a
	beq	Ld779
Ld7a7:	stx	z42
	jsr	Sd756
Ld7ac:	iny
	bne	Ld7b1
	inc	z49
Ld7b1:	inx
	bne	Ld792
	inc	z42+1
	bne	Ld792
Ld7b8:	ldx	xsave
	lda	#$00
	jmp	Lcd72


x_cfind:
	fcb	$00	; CFIND
	literal	z37		; z37 @ 1- SWAP OVER C! 1 LOCATE
	tag	at
	tag	1_minus
	tag	swap
	tag	over
	tag	c_bang
	tag	1
	tag	locate


x_string_plus:
	fcb	$00	; S+
	tag	swap		; SWAP OVER - >R + R>
	tag	over
	tag	minus
	tag	to_r
	tag	plus
	tag	r_to


x_string_equal:
	fcb	$00	; S=
	tag	dup		; DUP 4 PICK
	tag	4
	tag	pick
	tag	p_eq_if
	fcb	$0a
	tag	locate
	tag	dup
	tag	p_if
	fcb	$03
	tag	2drop
	tag	1
	tag	p_else
	fcb	$03
	tag	fdrop
	tag	0

	fcb	$00


Sd7e3:	cmp	#$1b
	bcc	Ld7e8
	rts

Ld7e8:	stx	xsave
	tay
	lda	d0236,y
	sta	z46
	lda	d0251,y
	sta	z47
	cpy	z67
	bne	Ld81e
	lda	z64
	and	#$60
	cmp	#$60
	bne	Ld81b
	lda	d0278
	bmi	Ld81b
	lda	z22
	sta	z42
	lda	z22+1
	sta	z42+1
	lda	#$00
	sta	z46
	lda	z47
	and	#$80
	sta	z47
	jmp	Ld876

Ld81b:	jmp	Ld84b

Ld81e:	lda	#$20
	and	z47
	beq	Ld835
	lda	z64
	and	#$40
	bne	Ld832
	lda	#$3f
	sta	z46
	lda	#$00
	sta	z47
Ld832:	jmp	Ld84b

Ld835:	lda	#$40
	and	z47
	beq	Ld84b
	lda	z64
	and	#$40
	bne	Ld84b
	lda	#$20
	sta	z46
	lda	z47
	and	#$80
	sta	z47
Ld84b:	lda	#$00
	sta	z42+1
	lda	z46
	asl
	rol	z42+1
	asl
	rol	z42+1
	adc	z46
	sta	z42
	bcc	Ld85f
	inc	z42+1
Ld85f:	ldx	#$03
	lda	z47
	and	#$10
	beq	Ld869
	ldx	#$05
Ld869:	clc
	lda	z42
	adc	z00,x
	sta	z42
	lda	z42+1
	adc	z01,x
	sta	z42+1
Ld876:	lda	z47
	and	#$0f
	sta	z42+2
	asl
	asl
	adc	z42+2
	adc	z07
	sta	z42+2
	lda	#$00
	adc	z08
	sta	z45
	tya
	asl
	sta	z46
	asl
	adc	z46
	tax
	ldy	#$00
	bit	z47
	bpl	Ld899
	dey
Ld899:	sty	z47
	lda	#$80
	jsr	Sc35f
	ldy	#$00
Ld8a2:	lda	(z42),y
	ora	(z42+2),y
	eor	z47
	sta	d5800,x
	inx
	cpx	#$9f
	beq	Ld8ba
	iny
	cpy	#$05
	bne	Ld8a2
	lda	z47
	sta	d5800,x
Ld8ba:	lda	#$7f
	jsr	Sc390
	ldx	xsave
	rts

x_encode:
	lda	z00,x	; ENCODE
	jsr	Sd7e3
	jmp	x_drop


Sd8ca:	fcb	$00
	literal	d02d1
	tag	cancel
	literal	z67
	tag	c_at
	tag	encode
	tag	p_semi_p


Sd8d3:	fcb	$00
	fcb	$14,$33,$17,$37,$39,$4c,$0c,$13
	fcb	$d1,$17,$4c,$07,$14,$70,$33,$13
	fcb	$d1,$ae,$0d


Sd8e7:	jsr	Sd8d3
	ldy	#$1a
	lda	#$00
	sta	z4a
Ld8f0:	lda	#$60
	and	d0251,y
	beq	Ld904
Ld8f7:	sty	z4b
	tya
	jsr	Sd7e3
	inc	z4a
	ldy	z4b
	jmp	Ld913

Ld904:	cpy	z67
	bne	Ld913
	lda	d0278
	bmi	Ld913
	lda	z64
	and	#$20
	bne	Ld8f7
Ld913:	dey
	bpl	Ld8f0
	lda	z4a
	bne	Ld91d
	jsr	Sd8ca
Ld91d:	rts

Sd91e:	sta	z49
Ld920:	jsr	Sd7e3
	inc	z49
	lda	z49
	cmp	#$1b
	bmi	Ld920
	rts

x_updisp:
	lda	z00,x	; UPDISP
	jsr	Sd91e
	jmp	x_drop

x_refresh:
	jsr	Sd8e7	; REFRESH
	jmp	next

x_tag_13e	equ	*-1	; unknown tag $13e
	fcb	$20,$20,$1c,$1b,$42,$20,$40,$6f
	fcb	$18

x_tag_13f:
	fcb	$00	; unknown tag $13f
	fcb	$1c,$4e,$04,$0f,$0e,$00,$20,$20
	fcb	$40,$5d,$3d,$22,$20,$1b,$42,$22
	fcb	$20,$6f,$18

x_tag_140:
	fcb	$00	; unknown tag $140
	fcb	$1c,$13,$36,$3d,$14,$1a,$2f,$1d
	fcb	$3e,$1b,$23,$14,$5a,$17,$2f,$1d
	fcb	$47,$1c,$13,$51,$3d,$24,$13,$14
	fcb	$17,$2f,$21,$47,$b0

x_ins_ch_r:
	fcb	$00	; INS.CH.R
	fcb	$11,$01,$3e,$01,$40

x_del_ch_r:
	fcb	$00	; DEL.CH.R
	fcb	$13,$14,$17,$22,$13,$6a,$17,$13
	fcb	$14,$18,$11,$01,$3f,$01,$40,$13
	fcb	$14,$18

x_set_inv:
	fcb	$00	; SET.INV
	literal	$0214
	tag	80h
	tag	set_bits

x_unset_inv:
	fcb	$00	; UNSET.INV
	fcb	$13,$14,$37,$46		; CLIT2 $14 80H CLR.BITS

x_set_flsh:
	fcb	$00	; SET.FLSH
	fcb	$13,$14,$14,$40,$45	; CLIT2 $14 CLIT $40 SET.BITS

x_unset_flsh:
	fcb	$00	; UNSET.FLSH
	fcb	$13,$14,$14,$40,$46	; CLIT2 $14 CLIT $40 CLR.BITS

Td9a4:	fcb	$00
	fcb	$13,$15,$17,$1b,$1b	; CLIT2 $15 C@ DUP DUP
	fcb	$13,$36,$3d		; CLIT2 $36 +
	fcb	$14,$1a,$30,$1d		; CLIT $1a 3 PICK
	fcb	$3e,$1b,$23,$35		; - DUP >R 20H
	fcb	$2d,$1d,$47		; 6 PICK EXECUTE
	fcb	$13,$51,$3d		; CLIT2 $51 +
	fcb	$24,$13,$14,$17		; R> CLIT2 $14 C@
	fcb	$2e,$21,$47,$b0		; 5 ROLL EXECUTE UPDISP
	fcb	$00

x_posn:
	ldy	z67	; POSN
	lda	z00,x
	cmp	#$1b
	bcc	Ld9ce
	lda	#$1a
Ld9ce:	sta	z67
	cpy	#$1b
	bcs	Ld9d8
	tya
	jsr	Sd7e3
Ld9d8:	jmp	x_drop

x_scroll:
	fcb	$00	; SCROLL
	fcb	$14,$67,$17,$40		; CLIT $67 C@ 1-
	fcb	$13,$15,$17,$66		; CLIT2 $15 C@ MAX
	fcb	$14,$67,$18		; CLIT $67 C!
	fcb	$11			; LIT $3f01
	fdb	$3f01
	fcb	$0c			; (CALL) Td9a4
	fdb	Td9a4

x_scrolr:
	fcb	$00	; SCROLR
	fcb	$11			; LIT $3e01
	fdb	$3e01
	fcb	$0c			; (CALL) Td9a4
	fdb	Td9a4
	fcb	$00

x_wait:	stx	xsave	; WAIT
	php
	sei
	lda	(z00,x)
	bpl	Lda30
	lda	z33
	bpl	Lda30
	plp
	jmp	x_drop

x_waitm:
	stx	xsave	; WAITM
	php
	sei
	lda	z00,x
	sta	z42
	lda	z33
	bpl	Lda30
Lda11:	lda	(z02,x)
	bpl	Lda29
	ldx	xsave
	txa
	clc
	adc	z00,x
	adc	z00,x
	bcc	Lda23
	plp
	jmp	Lcd61

Lda23:	tax
	tya
	plp
	jmp	Lcd78

Lda29:	inx
	inx
	iny
	cpy	z42
	bcc	Lda11
Lda30:	ldx	#$15
	jsr	Scbf9
	jsr	sleep
	plp
	jmp	Lcd08

; da3c
	fcb	$00
	fcb	$0a,$0d

Dda3f:	fcb	$d8,$cc,$c0,$b4,$a9,$9f,$96,$8d
	fcb	$84,$7c,$75,$6d

Sda4b:	lda	#$02
	jsr	setup
; X disassemble
	fcb	$86,$62,$a5,$31
	fcb	$c8,$88,$f0,$05,$c5,$42,$4c,$61
	fcb	$da,$a4,$44,$49,$20,$20,$61,$c3
	fcb	$a6,$42,$ca,$d0,$fd,$2c,$dd,$02
	fcb	$10,$e7,$a9,$df,$20,$90,$c3,$4c
	fcb	$08,$cd

x_squeak:
	fcb	$00	; SQUEAK
	tag	2
	tag	SHIFT
	literal	d02dd
	tag	set_delay
	tag	query_dup
	tag	p_if
	fcb	$16
	tag	1_minus
	literal	$0c
	tag	div_mod
	tag	2
	tag	min
	tag	negate
	tag	4
	tag	swap
	tag	shift
	tag	swap
	literal	dda3f
	tag	plus
	tag	c_at
	tag	p_call
	fdb	Sda4b
	tag	p_else
	fcb	$08
	literal	d02dd
	tag	c_at
	tag	80h
	tag	and
	tag	p_until
	fcb	$05

Lda9b:	fcb	$00
	fcb	$14,$15,$35,$01,$48,$0d

Sdaa2:	jsr	Sc383
	bit	D58fa
	php
	jsr	Sc37d
	plp
	bpl	Ldab2
	jmp	x_1
Ldab2:	jmp	x_0

Ldab5:	fcb	$00
	fcb	$1b,$13,$15,$17,$50,$04,$01,$47
	fcb	$0d,$1b,$4c,$0a,$1b,$1b,$40,$1b
	fcb	$14,$67,$18,$71,$71,$0d

Ldacc:	fcb	$00
	fcb	$1b,$14,$1a,$50,$03,$73,$0d,$1b
	fcb	$1b,$42,$1b,$14,$67,$18,$71,$71
	fcb	$0d

Sdade:	fcb	$00
	fcb	$13,$16,$17,$31,$51,$1c,$13,$15
	fcb	$17,$1b,$14,$67,$18,$14,$1b,$1c
	fcb	$3e,$23,$1b,$6d,$25,$01,$33,$1b
	fcb	$13,$51,$3d,$24,$01,$32,$b0,$52
	fcb	$04,$73,$73,$73,$0d

x_lcd_cr:
	jsr	Sdade	; LCD.CR
	jmp	next

Sdb09	equ	*-1	; use zero byte of previous jump address as BRK
	fcb	$14,$33,$17,$37,$39,$28,$14,$64
	fcb	$17,$14,$88,$39,$3a,$4c,$05,$01
	fcb	$49,$52,$18,$13,$17,$17,$2d,$13
	fcb	$16,$17,$31,$50,$03,$3f,$3f,$6c
	fcb	$a5,$70,$33,$13,$7b,$18,$14,$64
	fcb	$2f,$45,$0d

x_cgrtn:
	jsr	Sdb09	; CGRTN
	jmp	next

x_disp_ch	equ	*-1	; DISP.CH
	fcb	$27,$0e,$27,$0e,$01,$19,$9c,$00
	fcb	$01,$41,$01,$42,$01,$43,$01,$44
	fcb	$01,$45,$01,$46,$01,$4b

Ldb51:	fcb	$00
	fcb	$13,$c0,$17,$14,$41,$3e,$33,$2d
	fcb	$5a,$4c,$07,$01,$34,$1c,$00,$52
	fcb	$02,$0f,$0d

Sdb65:	lda	#$80
	php
	sei
	jsr	postecb
	lda	(z35),y
	and	#$7f
	sta	(z35),y
	plp
	ldx	z61
	lda	z67
	sta	z00,x
	lda	d0213
	beq	Ldb90
	dec	d0213
	beq	Ldb89
	lda	z5a
	sta	d02c0
	rts

Ldb89:	lda	d02c0
	cmp	#$40
	bne	Ldb51
Ldb90:	lda	z64
	and	#$04
	beq	Ldb9d
	eor	z64
	sta	z64
	jsr	Sdade
Ldb9d:	lda	z5a
	cmp	#$1b
	bne	Ldba9
	lda	#$02
	sta	d0213
	rts

Ldba9:	cmp	#$0d
	bne	Ldbb0
	jmp	Sdb09

Ldbb0:	cmp	#$81
	bne	Ldbb7
	jmp	Ldab5

Ldbb7:	cmp	#$82
	bne	Ldbbe
	jmp	Ldacc

Ldbbe:	cmp	#$07
	bne	Ldbc5
	jmp	Lda9b

Ldbc5:	cmp	#$08
	bne	Ldbdc
	jsr	Ldab5
	ldy	z00,x
	lda	#$20
	sta	d0236,y
	lda	#$00
	sta	d0251,y
	tya
	jmp	Sd7e3

Ldbdc:	fcb	$00
	fcb	$14,$1a,$50,$0b,$13,$16,$17,$4e
	fcb	$05,$01,$4a,$52,$02,$73,$14,$67
	fcb	$17,$1c,$42,$15,$1b,$11,$00,$ff
	fcb	$39,$4e,$06,$13,$14,$17,$3c,$3a
	fcb	$1b,$14,$e0,$39,$4e,$05,$11,$40
	fcb	$80,$a6,$5d,$22,$6d,$18,$3c,$1b
	fcb	$23,$1c,$13,$51,$3d,$18,$1b,$42
	fcb	$14,$67,$18,$24,$14,$60,$39,$4c
	fcb	$04,$b1,$52,$03,$1b,$71,$42,$14
	fcb	$1a,$49,$14,$64,$17,$14,$88,$39
	fcb	$3a,$14,$64,$37,$46,$4e,$12,$13
	fcb	$17,$17,$2d,$13,$16,$17,$4c,$02
	fcb	$3f,$6c,$22,$70,$33,$13,$7b,$18
	fcb	$0d

Sdc46:	iny

Sdc47:	lda	(z35),y
	and	#$7f
	sta	(z35),y
	rts

Ldc4e:	inc	z5d
Ldc50:	inc	z5d
Ldc52:	inc	z5d
	ldy	z60
	jsr	Sdc46
Ldc59:	inc	z5d
Ldc5b:	inc	z5d
	ldx	z61
	lda	z5d
	ora	#$80
	sta	(z02,x)
	jmp	Ldd3d

x_rctl:	iny		; RCTL

x_rop:	iny		; ROP

x_rip:	iny		; RIP

x_rclose:
	iny		; RCLOSE

x_ropen:
	inc	d020d	; ROPEN
	lda	z3d
	pha
	sty	z5e
	stx	z61
	lda	latchs
	sta	z5f
	lda	#$00
	sta	z5d
	sta	(z02,x)
	ldy	z00,x
	cpy	#$10
	bcs	Ldc5b
	lda	devtbl,y
	cmp	#$ff
	beq	Ldc59
	tay
	sty	z60
	iny
	ldx	z5e
	dex
	dex
	cpx	#$02
	bcs	Ldca3
	lda	(z35),y
	and	#$20
	beq	Ldca0
	dex
Ldca0:	txa
	bne	Ldc52
Ldca3:	lda	(z35),y
	and	#$10
	sta	z57
	ldx	z61
	lda	z57
	bne	Ldcb6
	jsr	Sdc47
	lda	#$80
	sta	(z02,x)
Ldcb6:	lda	(z35),y
	bmi	Ldc4e
	iny
	lda	z02,x
	sta	(z35),y
	sta	z58
	iny
	lda	z03,x
	sta	(z35),y
	sta	z59
	dey
	dey
	ldx	z5e
	cpx	#$03
	bne	Ldcd9
	ldy	#$01
	lda	(z58),y
	sta	z5a
	ldy	z60
	iny
Ldcd9:	lda	z57
	beq	Ldd3d
	lda	(z35),y
	ora	#$80
	sta	(z35),y
	dey
	lda	(z35),y
	and	#$02
	beq	Ldd1a
	lda	z5e
	cmp	#$02
	bne	Ldd0e
	lda	(z35),y
	and	#$04
	bne	Ldcf9
Ldcf6:	jmp	Ldc52

Ldcf9:	jsr	Sc6e3
	ldx	z61
	lda	(z02,x)
	bpl	Ldd08
	jsr	Sd8ca
	jmp	Ldd0b

Ldd08:	jsr	Sd8e7
Ldd0b:	jmp	Ldd17

Ldd0e:	lda	(z35),y
	and	#$08
	beq	Ldcf6
	jsr	Sdb65
Ldd17:	jmp	Ldd3d

Ldd1a:	jsr	Sc38b
	lda	(z35),y
	jsr	Scb0e
	stx	z5c
	beq	Ldd29
	jmp	Ldc50

Ldd29:	lda	z5e
	asl
	clc
	adc	z5e
	sta	z1f+1
	ldx	z5c
	lda	d2000
	adc	z1f+1
	sta	z1f+1
	jsr	z1f
Ldd3d:	pla
	cmp	z3d
	beq	Ldd45
	jsr	Scb0e
Ldd45:	lda	z5f
	jsr	dolatch
	ldx	z61
	dec	d020d
	lda	z5d
	bne	Ldd56
	jmp	Ld116

Ldd56:	jmp	Ld112

x_nap:
	fcb	$00	; NAP
	fcb	$13,$78,$33,$01,$4d,$4e,$05,$33
	fcb	$13,$78,$18,$13,$dd,$ae,$13,$78
	fcb	$13,$dd,$31,$0b,$1b,$4c,$07,$13
	fcb	$79,$17,$22,$52,$04,$13,$78,$6e

x_p_key:
	fcb	$00	; (KEY)
	fcb	$13,$78,$1b,$1b,$33,$01,$4d,$4c
	fcb	$09,$0a,$42,$17,$1b,$13,$79,$18
	fcb	$00,$01,$0b

x_p_emit:
	fcb	$00	; (EMIT)
	fcb	$a5,$13,$7b,$1c		; #DECB CLIT2 $7b OVER
	fcb	$31,$0b,$0f,$22		; 2 WAITM DROP SWAP
	fcb	$1c,$42,$16,$32		; OVER 1+ ! 1
	fcb	$b2,$4c,$02		; ROP (IF) ofs=2
	fcb	$00			;   EXIT
	fcb	$01,$0b			; ABORT

x_key:
	fcb	$00	; KEY		; CLIT v_key @ EXECU
	fcb	$14,v_key,$15,$47

x_emit:
	fcb	$00	; EMIT		; CLIT v_emit @ EXECU
	fcb	$14,v_emit,$15,$47

x_beep:
	fcb	$00	; BEEP
	fcb	$2c,$76			; 7 EMIT

x_type:
	fcb	$00	; TYPE
	fcb	$a9,$59,$05		; BOUND (?DO) ofs=5
	fcb	$3b,$17,$76,$57		;   I C@ EMIT (LOOP

x_count:
	fcb	$00	; COUNT
	fcb	$1b,$17,$22,$42,$22

x_p_dot_quote:
	fcb	$00	; (.")
	fcb	$24,$79,$5d,$78,$3d,$23

Sddc3:	fcb	$00
	fcb	$1b,$74,$13,$f0,$18,$13,$f1,$17
	fcb	$31,$59,$09,$13,$ef,$1b,$3b,$b2
	fcb	$0f,$0a,$57,$0d

x_all_emit:
	inc	d020d	; ALL-EMIT
	jsr	Sddc3
	dec	d020d
	jmp	next

x_flame_on	equ	*-1	; FLAME.ON
	fcb	$31,$14,$50,$14,$41,$54,$3b,$1c
	fcb	$01,$37,$3d,$57,$13,$f1,$18,$11
	fcb	$01,$52,$14,$28,$16

x_smart_posn:
	fcb	$00	; SMART-POSN
	fcb	$14,$67,$17,$3e,$1b,$29,$4c,$05
	fcb	$14,$81,$52,$03,$14,$82,$22,$64
	fcb	$33,$59,$04,$1b,$76,$57,$0f

x_emit_esc:
	fcb	$00	; EMIT.ESC
	fcb	$14,$1b,$76,$76,$76

	fcb	$00

x_query_key:
	lda	d0206	; ?KEY
	eor	d0207
	ora	funct
	ora	d020a
	beq	Lde27
	iny
Lde27:	tya
	jmp	Lcd72


x_space:
	fcb	$00	; SPACE
	tag	20h
	tag	emit


x_cr:
	fcb	$00	; CR
	literal	$0d
	tag	emit


x_fast_cr:
	fcb	$00	; FAST.CR
	literal	z64
	tag	80h
	tag	set_bits
	tag	cr


x_spaces:
	fcb	$00	; SPACES
	tag	0
	tagrf	p_query_do,Tde43
	tag	space
	tag	p_loop
Tde43:


x_start_cursor:
	fcb	$00	; START.CURSOR
	literal	z64
	tag	20h
	tag	set_bits
	tag	refresh


x_stop_cursor:
	fcb	$00	; STOP.CURSOR
	literal	z64
	tag	20h
	tag	clr_bits
	literal	z67
	tag	c_at
	tag	encode


x_ascii_to_bin:
	fcb	$00	; A>B
	fcb	$01,$1a
	fcb	$1b,$36,$51,$04,$14,$10
	fcb	$3d,$14,$3a,$14,$40,$5a,$4c,$02
	fcb	$38,$1b,$14,$40,$4b,$4c,$03,$2c
	fcb	$3e,$36,$3e,$33,$14,$23,$5a,$62
	fcb	$00


x_soft_clr:
	ldy	#$5a	; SOFT.CLR

x_hard_clr:
	sty	z34	; HARD.CLR

x_clear:
	jmp	Sc601	; CLEAR


x_kbsave:
	fcb	$00	; KBSAVE
	fcb	$27,$2b,$32,$54,$3b,$15,$23,$31
	fcb	$56,$11,$df,$e8,$32,$2b,$6f,$26

x_kbrest:
	fcb	$00	; KBREST
	fcb	$27,$33,$2c,$54,$24,$3b,$16,$11
	fcb	$fe,$ff,$56,$26

x_save_key:
	fcb	$00	; SAVE.KEY
	fcb	$27,$14,$35,$15,$1b,$15,$23,$1b
	fcb	$11,$00,$80,$46,$41,$15,$13,$78
	fcb	$15,$26,$26

x_save_task:
	fcb	$00	; SAVE.TASK
	fcb	$27,$a7,$14,$74,$14,$28,$1b,$01
	fcb	$14,$16,$13,$13,$15,$13,$15,$15
	fcb	$26,$14,$64,$1b,$17,$14,$67,$17
	fcb	$26,$2b,$46,$01,$56,$01,$5b,$01
	fcb	$59,$13,$51,$13,$36,$54,$3b,$15
	fcb	$23,$31,$56,$33,$13,$15,$18,$32
	fcb	$13,$16,$18,$33,$13,$13,$16,$a8
	fcb	$7f,$26

x_rest_key:
	fcb	$00	; REST.KEY
	fcb	$27,$14,$35,$15,$27,$13,$78,$16
	fcb	$1c,$41,$16,$24,$22,$16,$26

x_restore_ram:
	fcb	$00	; RESTORE.RAM
	fcb	$13,$f2,$17,$10,$0f

x_restore_task:
	fcb	$00	; RESTORE.TASK
	fcb	$27,$a7,$13,$35,$13,$50,$54,$24
	fcb	$3b,$16,$11,$fe,$ff,$56,$13,$51
	fcb	$14,$1b,$01,$32,$01,$5a,$01,$5d
	fcb	$27,$72,$14,$64,$18,$27,$13,$15
	fcb	$16,$13,$13,$16,$01,$15,$33,$b0
	fcb	$a8,$26,$b1,$01,$5e,$00,$a2,$ff
	fcb	$86,$34,$00,$14,$74,$14,$28,$16
	fcb	$7a
	cstr	"RESET"
	fcb	$11
	fcb	$2c,$df,$0a

x_soft_emit:
	fcb	$00	; SOFT.EMIT
	fcb	$14,$1b,$74,$14,$47,$74,$74,$00
	fcb	$7a
	cstr	"DEFINE FUNCTION"
	fcb	$7e,$11,$01,$60,$14,$28,$16
	fcb	$1b,$14,$15,$3e,$2f,$6c,$13,$82
	fcb	$3d,$1b,$79,$14,$0e,$67,$78,$14
	fcb	$5f,$76,$33,$72,$75,$14,$15,$14
	fcb	$17,$5a,$4c,$08,$0f,$14,$67,$17
	fcb	$22,$18,$00,$1b,$76,$1c,$14,$67
	fcb	$17,$1b,$32,$50,$07,$14,$0f,$01
	fcb	$54,$32,$72,$14,$5f,$76,$1b,$72
	fcb	$22,$5d,$3d,$2f,$21,$22,$18,$18
	fcb	$14,$67,$17,$14,$0e,$4b,$4d,$32
	fcb	$7a
	cstr	"FULL"
	fcb	$7e,$7d
	fcb	$0f

Ldfaf:	fcb	$00
	fcb	$13,$7c,$1b,$41,$15,$13,$80,$17
	fcb	$30,$62,$13,$1b,$3d,$16,$1b,$17
	fcb	$a4,$0f,$1b,$42,$17,$01,$0a,$0f
	fcb	$2f,$3d,$15,$1a,$4c,$02,$47,$01
	fcb	$57

x_sizeram:
	stx	xsave	; SIZERAM
	jsr	Sc3fa
	jmp	Lcd08

Sdfd9:	fcb	$00
	fcb	$4c,$06,$11,$00,$80,$52,$03,$12
	fcb	$8d,$23,$11,$a5,$a5,$25,$5d,$41
	fcb	$15,$48,$23,$15,$48,$24,$39,$4c
	fcb	$04,$24,$0f,$0d,$14,$37,$15,$25
	fcb	$14,$37,$16,$01,$61,$14,$37,$15
	fcb	$22,$14,$37,$16,$25,$3e,$25,$1c
	fcb	$01,$32,$25,$2f,$3d,$16,$24,$2f
	fcb	$14,$a5,$01,$31,$0d

x_cold_start:
	jmp	Lc7a4	; COLD.START

x_can_list:
	fcb	$00	; CAN.LIST
	fcb	$4c,$2a,$43,$a9,$13,$b3,$14,$0c
	fcb	$a9,$54,$3b,$42,$17,$4c,$18,$32
	fcb	$23,$5d,$54,$3b,$15,$01,$11,$15
	fcb	$50,$05,$24,$40,$23,$55,$31,$56
	fcb	$24,$4c,$04,$3b,$15,$6e,$31,$56
	fcb	$0e,$52,$09,$43,$a9,$54,$3b,$15
	fcb	$6e,$31,$56,$00,$e9,$02,$e3,$02

Se053:	fcb	$00
	fcb	$11,$4f,$e0,$31,$32,$01,$63,$0d

x_hold:
	fcb	$00	; HOLD
	fcb	$34,$14,$68,$19,$14,$7f,$39,$14
	fcb	$68,$15,$18

x_langle_hash:
	fcb	$00	; <#
	fcb	$14,$37,$15,$14,$68,$16

x_hash_rangle:
	fcb	$00	; #>
	fcb	$0e,$14,$68,$15,$14,$37,$15,$1c
	fcb	$3e

x_sign:
	fcb	$00	; SIGN
	fcb	$29,$4c,$04,$14,$2d,$80

x_hash:
	fcb	$00	; #
	fcb	$14,$25,$17,$6a,$20,$2a,$1c,$51
	fcb	$03,$2c,$3d,$36,$3d,$80

x_hash_s:
	fcb	$00	; #S
	fcb	$01,$67,$5d,$3a,$28,$4d,$05

x_p_d_dot:
	fcb	$00	; (D.)
	fcb	$22,$1c,$01,$28,$01,$64,$01,$68
	fcb	$20,$01,$66,$01,$65

x_d_dot_r:
	fcb	$00	; D.R
	fcb	$23,$01,$69,$24,$1c,$3e,$01,$54
	fcb	$78

x_dot_r:
	fcb	$00	; .R
	fcb	$23,$68,$24,$01,$6a

x_dot:
	fcb	$00	; .
	fcb	$68,$33,$01,$6a,$7d,$00

Se0bc:	sta	z42
	lda	z37
	sec
	sbc	z42
	sta	z42+1
	lda	z38
	sbc	#$00
	sta	z42+2
	cmp	d02f6
	bne	Le0d5
	lda	z42+1
	cmp	d02f5
Le0d5:	rts

getmemt:	jsr	Se0bc
	ldy	z42+1
	lda	z42+2
	bcc	Le0e3
	sty	z37
	sta	z38
Le0e3:	rts

x_grab:
	lda	z01,x	; GRAB
	bne	Le0f8
	lda	z00,x
	jsr	getmemt
	bcc	Le0f8
	sty	z00,x
	sta	z01,x
	lda	#$01
	jmp	Lcd72

Le0f8:	jmp	Lcfda

x_tpsafe_query:
	lda	z01,x	; TPSAFE?
	bne	Le10e
	lda	z00,x
	jsr	Se0bc
	bcc	Le10e
	lda	z42+1
	pha
	lda	z42+2
	jmp	Lcd6a

Le10e:	jmp	Lcfda

x_letgo:
	fcb	$00	; LETGO
	fcb	$14,$39,$15,$15,$1a,$4c,$0a,$14
	fcb	$39,$1b,$15,$41,$14,$37,$16,$16
	fcb	$00

Le123:	jsr	dodoes
	fcb	$17,$41,$01,$6e,$1b,$4c,$10,$14
	fcb	$37,$1b,$15,$3f,$14,$39,$15,$1c
	fcb	$16,$14,$39,$16,$16,$32

x_t_bang:
	fcb	$00	; T!
	fcb	$14,$35,$15,$33,$1c,$3f,$1b,$14
	fcb	$37,$16,$1b,$14,$39,$16,$16,$33
	fcb	$1c,$2f,$3d,$16,$1b,$2d,$3d,$22
	fcb	$17,$32,$39,$4d,$0c,$0f
	fcb	$00

Le15c:	iny
	pla
	sta	z42
	pla
	sta	z42+1
	sec
	lda	z39
	sbc	(z42),y
	pha
	lda	z3a
	sbc	#$00
	jmp	Lcd64

Le170:	asl	z00,x
	rol	z01,x
Le174:	iny
	pla
	sta	z42
	pla
	sta	z42+1
	lda	z39
	adc	z00,x
	sta	z00,x
	lda	z3a
	adc	z01,x
	sta	z01,x
	sec
	lda	z00,x
	sbc	(z42),y
	sta	z00,x
	bcs	Le192
	dec	z01,x
Le192:	jmp	next

Le195:	iny
	pla
	sta	z42
	pla
	sta	z42+1
	lda	(z42),y
	pha
	iny
	lda	(z42),y
	jmp	Lcd64

Le1a5:	sec
	pla
	adc	z00,x
	sta	z42
	pla
	adc	z01,x
	sta	z42+1
	lda	(z42),y
	jmp	Lcd78

Le1b5:	asl	z00,x
	rol	z01,x
	sec
	pla
	adc	z00,x
	sta	z42
	pla
	adc	z01,x
	sta	z42+1
	lda	(z42),y
	pha
	iny
	lda	(z42),y
	jmp	Lcd6a

	fcb	$00,$a7,$01,$5b,$a8,$75,$36,$3e
	fcb	$33,$2a,$5a,$4c,$0e,$1a,$4e,$03
	fcb	$14,$0a,$14,$0b,$22,$3e,$1b,$13
	fcb	$17,$18,$0f,$a7,$01,$5d,$a8,$33
	fcb	$13,$0b,$18,$0d


Se1f1:	fcb	$00
	fcb	$7a,$0c,$2c
	fcb	" USE ARROWS"


x_secs:
	fcb	$00	; SECS
	fcb	$3c,$a5,$22,$1c,$70,$0a,$00,$01
	fcb	$5c,$14,$64,$14,$12,$45,$7a
	cstr	"PRESS KEY FOR DEFINITION"
	fcb	$75,$14,$64,$31,$46,$7e,$4f,$0e
	fcb	$16,$7a
	cstr	"ENTER 1-9 FOR SPEED"
	fcb	$4f,$84
	fcb	$0e,$7a
	cstr	"INSERT TEXT"
	fcb	$4f,$0d
	fcb	$14,$7a
	cstr	"ENDS CURRENT LINE"
	fcb	$4f,$80,$19,$7a
	cstr	"DISPLAYS PREVIOUS LINE"
	fcb	$4f
	fcb	$83,$15,$7a
	cstr	"DISPLAYS NEXT LINE"
	fcb	$4f,$07
	fcb	$11,$7a
	cstr	"ROTATE DISPLAY"
	fcb	$4f,$86,$11,$7a
	cstr	"LOCKS NEXT KEY"
	fcb	$4f,$8a,$0b,$7a
	cstr	"CAPITALS"
	fcb	$4f,$8f,$0e,$7a
	cstr	"PUNCTUATION"
	fcb	$14,$8b,$14,$8e,$5a,$4c,$12
	fcb	$7a
	cstr	"PROGRAM CONTROL"
	fcb	$14,$81,$14,$82,$5a,$4c,$0f
	fcb	$7a
	cstr	"MOVES CURSOR"
	fcb	$4f,$89
	fcb	$12,$7a
	cstr	"SEARCH FOR TEXT"
	fcb	$4f,$0b,$14,$7a
	cstr	"SELECT PERIPHERAL"
	fcb	$4f,$14,$02,$b5,$4f,$85,$0c,$7a
	cstr	"DELETE"
	fcb	$0c
	fcb	$f1,$e1,$14,$15,$14,$17,$5a,$4c
	fcb	$06,$0c,$45,$df,$52,$09,$14,$67
	fcb	$17,$4c,$04,$30,$01,$71,$0f,$01
	fcb	$5f,$33,$13,$0b,$18,$0d

Pe367:	fcb	$00
	literal	$02e9
	tag	c_at
	tag	80h
	tag	and
	tag	p_if
	fcb	$21
	literal	$0040
	tag	orblip
	literal	$0017
	literal	$0014
	literal	$0014
	tag	0
	tag	2over
	literal	$0010
	literal	$000b
	tag	6
	tag	0
	tag	p_do
	literal	$000a
	tag	squeak
	tag	p_loop
	tag	squeak
	tag	0
	literal	$0258
	literal	$02e9
	tag	set_delay_long
	literal	$02d1
	tag	c_at
	tag	80h
	tag	and
	tag	p_if
	fcb	$08
	literal	100
	literal	$0040
	tag	toggle
	tag	refresh
	literal	$02e3
	tag	c_at
	tag	80h
	tag	and
	tag	p_if
	fcb	$45
	tag	p_call
	fdb	Sdaa2
	tag	p_if
	fcb	$12
	tag	fast_cr
	tag	p_dot_quote
	cstr	"BAT LOW"
	tag	beep
	tag	3
	tag	secs
	tag	fast_cr
	tag	turn_off
	literal	$0065
	tag	c_at
	tag	80h
	tag	and
	tag	p_if
	fcb	$22
	literal	$0065
	tag	c_at
	literal	$0040
	tag	and
	tag	p_if
	fcb	$0c
	literal	$0065
	literal	$0040
	tag	toggle
	literal	$14
	literal	$021a
	tag	c_bang
	literal	$021a
	tag	dup
	tag	c_at
	tag	1_minus
	tag	query_dup
	tag	p_notif
	fcb	$05
	tag	turn_off
	literal	$0013
	tag	swap
	tag	c_bang
	literal	$1e00
	literal	$02e3
	tag	set_delay
	tag	p_semi_p

x_loc_nxt_cap:
	fcb	$00	; LOC.NXT.CAP
	fcb	$33,$14,$41,$14,$3c,$17,$42,$14
	fcb	$ff,$39,$54,$3b,$a4,$4c,$0c,$11
	fcb	$2b,$40,$17,$37,$39,$4c,$04,$0f
	fcb	$32,$55,$57

x_loc_prg:
	fcb	$00	; LOC.PRG
	fcb	$32,$1c,$14,$ff,$a4,$0f,$33,$54
	fcb	$01,$72,$4e,$05,$0f,$3b,$33,$55
	fcb	$57,$4c,$05,$38,$32,$52,$3b,$32
	fcb	$14,$11,$aa,$54,$40,$1b,$29,$4c
	fcb	$08,$22,$28,$22,$32,$55,$52,$1a
	fcb	$1b,$11,$44,$d6,$3d,$17,$1b,$01
	fcb	$38,$22,$37,$39,$4c,$05,$14,$40
	fcb	$52,$02,$35,$11,$24,$20,$17,$39
	fcb	$62,$4d,$25,$57,$22,$4c,$0a,$11
	fcb	$44,$d6,$3d,$17,$32,$32,$52,$02
	fcb	$38

	fcb	$00


chargen:
	fcb	$00,$00,$00,$00,$00	; $20 space
	fcb	$00,$de,$de,$00,$00	; $21 !
	fcb	$00,$06,$00,$06,$00	; $22 "
	fcb	$28,$fe,$28,$fe,$28	; $23 #
	fcb	$48,$54,$fe,$54,$24	; $24 $
	fcb	$46,$26,$10,$c8,$c4	; $25 %
	fcb	$6c,$92,$ac,$40,$a0	; $26 &
	fcb	$00,$00,$0e,$00,$00	; $27 '
	fcb	$00,$38,$44,$82,$00	; $28 (
	fcb	$00,$82,$44,$38,$00	; $29 )
	fcb	$54,$38,$7c,$38,$54	; $2a *
	fcb	$10,$10,$7c,$10,$10	; $2b +
	fcb	$00,$80,$60,$00,$00	; $2c ,
	fcb	$10,$10,$10,$10,$10	; $2d -
	fcb	$00,$c0,$c0,$00,$00	; $2e .
	fcb	$40,$20,$10,$08,$04	; $2f /
	fcb	$7c,$a2,$92,$8a,$7c	; $30 0
	fcb	$00,$84,$fe,$80,$00	; $31 1
	fcb	$c4,$a2,$92,$92,$8c	; $32 2
	fcb	$44,$82,$92,$92,$6c	; $33 3
	fcb	$30,$28,$24,$fe,$20	; $34 4
	fcb	$4e,$8a,$8a,$8a,$72	; $35 5
	fcb	$78,$94,$92,$92,$60	; $36 6
	fcb	$02,$e2,$12,$0a,$06	; $37 7
	fcb	$6c,$92,$92,$92,$6c	; $38 8
	fcb	$0c,$92,$92,$52,$3c	; $39 9
	fcb	$00,$6c,$6c,$00,$00	; $3a :
	fcb	$00,$b6,$76,$00,$00	; $3b ;
	fcb	$00,$10,$28,$44,$82	; $3c <
	fcb	$28,$28,$28,$28,$28	; $3d =
	fcb	$82,$44,$28,$10,$00	; $3e > 
	fcb	$04,$02,$b2,$0a,$04	; $3f ?
	fcb	$64,$92,$f2,$42,$3c	; $40 @
	fcb	$f8,$24,$22,$24,$f8	; $41 A
	fcb	$82,$fe,$92,$92,$6c	; $42 B
	fcb	$7c,$82,$82,$82,$44	; $43 C
	fcb	$82,$fe,$82,$82,$7c	; $44 D
	fcb	$fe,$92,$92,$92,$82	; $45 E
	fcb	$fe,$12,$12,$12,$02	; $46 F
	fcb	$7c,$82,$82,$a2,$e2	; $47 G
	fcb	$fe,$10,$10,$10,$fe	; $48 H
	fcb	$00,$82,$fe,$82,$00	; $49 I
	fcb	$60,$80,$82,$7e,$02	; $4a J
	fcb	$fe,$10,$28,$44,$82	; $4b K
	fcb	$fe,$80,$80,$80,$80	; $4c L
	fcb	$fe,$04,$18,$04,$fe	; $4d M
	fcb	$fe,$08,$10,$20,$fe	; $4e N
	fcb	$7c,$82,$82,$82,$7c	; $4f O
	fcb	$fe,$12,$12,$12,$0c	; $50 P
	fcb	$7c,$82,$a2,$42,$bc	; $51 Q
	fcb	$fe,$12,$32,$52,$8c	; $52 R
	fcb	$4c,$92,$92,$92,$64	; $53 S
	fcb	$02,$02,$fe,$02,$02	; $54 T
	fcb	$7e,$80,$80,$80,$7e	; $55 U
	fcb	$1e,$60,$80,$60,$1e	; $56 V
	fcb	$7e,$80,$70,$80,$7e	; $57 W
	fcb	$c6,$28,$10,$28,$c6	; $58 X
	fcb	$0e,$10,$e0,$10,$0e	; $59 Y
	fcb	$c2,$a2,$92,$8a,$86	; $5a Z
	fcb	$fe,$fe,$82,$82,$82	; $5b '['
	fcb	$04,$08,$10,$20,$40	; $5c '\'
	fcb	$82,$82,$82,$fe,$fe	; $5d ']'
	fcb	$20,$10,$08,$10,$20	; $5e ^
	fcb	$80,$80,$80,$80,$80	; $5f _
	fcb	$00,$01,$02,$04,$00	; $60 `
	fcb	$70,$88,$88,$78,$80	; $61 a
	fcb	$fe,$90,$88,$88,$70	; $62 b
	fcb	$70,$88,$88,$88,$40	; $63 c
	fcb	$70,$88,$88,$50,$fe	; $64 d
	fcb	$70,$a8,$a8,$a8,$30	; $65 e
	fcb	$10,$fc,$12,$04,$00	; $66 f
	fcb	$98,$a4,$a4,$78,$04	; $67 g
	fcb	$00,$fe,$08,$08,$f0	; $68 h
	fcb	$00,$00,$fa,$00,$00	; $69 i
	fcb	$40,$80,$88,$7a,$00	; $6a j
	fcb	$00,$fe,$20,$50,$88	; $6b k
	fcb	$00,$00,$fe,$00,$00	; $6c l
	fcb	$f8,$08,$f0,$08,$f0	; $6d m
	fcb	$f8,$10,$08,$08,$f0	; $6e n
	fcb	$70,$88,$88,$88,$70	; $6f o
	fcb	$84,$fc,$24,$24,$18	; $70 p
	fcb	$18,$24,$24,$f8,$84	; $71 q
	fcb	$00,$f8,$10,$08,$08	; $72 r
	fcb	$90,$a8,$a8,$a8,$40	; $73 s
	fcb	$08,$7c,$88,$40,$00	; $74 t
	fcb	$78,$80,$80,$40,$f8	; $75 u
	fcb	$18,$60,$80,$60,$18	; $76 v
	fcb	$78,$80,$60,$88,$78	; $77 w
	fcb	$88,$48,$f8,$90,$88	; $78 x
	fcb	$00,$4c,$90,$90,$7c	; $79 y
	fcb	$88,$c8,$a8,$98,$88	; $7a z
	fcb	$00,$10,$6c,$82,$82	; $7b {
	fcb	$00,$00,$ee,$00,$00	; $7c |
	fcb	$82,$82,$6c,$10,$00	; $7d }
	fcb	$02,$01,$02,$04,$02	; $7e ~
	fcb	$55,$aa,$55,$aa,$55	; $7f DEL
	fcb	$08,$04,$fe,$04,$08	; $80 up arrow
	fcb	$10,$38,$54,$10,$10	; $81 left arrow
	fcb	$10,$10,$54,$38,$10	; $82 right arrow
	fcb	$20,$40,$fe,$40,$20	; $83 down arrow
	fcb	$dc,$4a,$8a,$5c,$c0	; $84 AM
	fcb	$de,$4a,$8a,$44,$c0	; $85 PM
	fcb	$0f,$02,$04,$02,$0f	; $86 superscript M
	fcb	$10,$10,$54,$10,$10	; $87 division symbol
	fcb	$44,$28,$10,$28,$44	; $88 multiplication symbol
De665:	fcb	$ff,$ff,$ff,$ff,$ff	; $89 solid box
	fcb	$ff,$81,$81,$81,$ff	; $8a hollow box
	fcb	$70,$8a,$88,$7a,$80	; $8b a with umlaut
	fcb	$70,$8a,$88,$8a,$70	; $8c o with umlaut
	fcb	$78,$82,$80,$42,$f8	; $8d u with umlaut
	fcb	$f9,$12,$09,$0a,$f0	; $8e enye


; unshifed keyboard mapping
keymap:	fcb	$00,$31,$32,$33,$34,$35,$36,$37
	fcb	$38,$39,$30,$14,$80,$0b,$2e,$8f
	fcb	$6d,$71,$77,$65,$72,$74,$79,$75
	fcb	$69,$6f,$70,$81,$0e,$82,$16,$17
	fcb	$6e,$61,$73,$64,$66,$67,$68,$6a
	fcb	$6b,$6c,$15,$89,$83,$07,$84,$8a
	fcb	$62,$8b,$8c,$2c,$3f,$20,$8d,$8e
	fcb	$86,$7a,$78,$63,$76,$00,$85,$0d

; shifted keyboard mapping
	fcb	$00,$21,$22,$23,$24,$25,$26,$27
	fcb	$28,$29,$5f,$14,$80,$0b,$2e,$8f
	fcb	$4d,$51,$57,$45,$52,$54,$59,$55
	fcb	$49,$4f,$50,$81,$0e,$82,$16,$17
	fcb	$4e,$41,$53,$44,$46,$47,$48,$4a
	fcb	$4b,$4c,$15,$89,$83,$07,$84,$8a
	fcb	$42,$8b,$8c,$2c,$3f,$20,$8d,$8e
	fcb	$86,$5a,$58,$43,$56,$00,$85,$0d

; second shift keyboard mapping
	fcb	$00,$21,$22,$23,$24,$25,$26,$27
	fcb	$28,$29,$5f,$14,$80,$0b,$3a,$8f
	fcb	$2a,$25,$20,$20,$20,$20,$2b,$2d
	fcb	$20,$20,$3d,$81,$0e,$82,$16,$17
	fcb	$7c,$20,$5c,$7b,$7d,$5b,$5d,$3c
	fcb	$3e,$20,$15,$89,$83,$07,$84,$8a
	fcb	$40,$8b,$8c,$3b,$2f,$20,$8d,$8e
	fcb	$86,$20,$5e,$7e,$60,$00,$85,$0d

x_ram_n:
	fcb	$00	; RAM.N
	fcb	$2c,$10,$0f,$33,$22,$1a,$4c,$1a
	fcb	$33,$54,$14,$3b,$17,$42,$1b,$14
	fcb	$40,$4b,$4c,$07,$0f,$40,$32,$55
	fcb	$52,$02,$10,$4d,$11,$57,$42,$52
	fcb	$04,$33,$10,$0f,$00

x_dvcset:
	stx	xsave	; DVCSET
	jsr	Sc5a8
	jmp	Lcd08

x_tag_176:
	fcb	$00	; unknown tag $176
	fcb	$41,$2d,$62,$14,$35,$15,$3d,$1b
	fcb	$17,$01,$0a,$0f,$11,$28,$20,$79
	fcb	$78,$7d,$1b,$42,$17,$1b,$35,$39
	fcb	$4c,$09,$7a
	cstr	"OUT,"
	fcb	$52,$06,$7a
	cstr	"IN,"
	fcb	$14
	fcb	$10,$39,$4c,$07,$7a
	cstr	"ON"
	fcb	$52,$06,$7a
	cstr	"OFF"
	fcb	$7a
	cstr	",SLOT="
	fcb	$17
	fcb	$11,$fe,$ff,$6c,$5b,$76

x_cfile:
	fcb	$00	; CFILE
	fcb	$13,$01,$15

x_tag_82:
	fcb	$00	; unknown tag $82
	fcb	$14,$35,$15,$63,$14,$ff,$39,$2d
	fcb	$01,$2b,$3f,$00,$7a
	cstr	"T RAM"
	fcb	$33,$14,$44,$7b,$7a
	fcb	$01,$2c

x_tag_177:
	fcb	$00	; unknown tag $177
	fcb	$0f,$13,$f2,$17,$4e,$05,$33,$14
	fcb	$43,$7b,$7a
	cstr	"IN"
	fcb	$0c,$c8
	fcb	$e7,$14,$37,$15,$13,$f5,$15,$3e
	fcb	$01,$6c,$7a
	cstr	"FREE"

x_tag_178:
	fcb	$00	; unknown tag $178
	fcb	$0f,$32,$13,$f2,$1b,$01,$14,$1b
	fcb	$17,$1a,$4c,$0a,$14,$3b,$17,$50
	fcb	$05,$33,$14,$43,$7b,$7a,$02,$45
	fcb	$58,$0c,$c8,$e7,$18,$01,$81,$01
	fcb	$16,$01,$6c,$7a
	cstr	"FREE,SLOT="
	fcb	$14
	fcb	$3b,$17,$11,$fd,$ff,$6c,$40,$5b
	fcb	$76

x_tag_b6:
	fcb	$00	; unknown tag $b6
	fcb	$1b,$29,$4c,$03,$38,$00,$82,$3e
	fcb	$1b,$29,$4c,$08,$0f,$11,$01,$76
	fcb	$32,$52,$16,$1b,$4c,$0e,$01,$74
	fcb	$4c,$07,$11,$01,$78,$32,$52,$02
	fcb	$33,$52,$06,$0f,$11,$01,$77,$32

x_tag_179:
	fcb	$00	; unknown tag $179
	fcb	$1b,$1b,$82,$51,$11,$41,$2d,$62
	fcb	$14,$35,$15,$3d,$42,$14,$10,$01
	fcb	$13,$01,$75,$52,$1c,$82,$3e,$01
	fcb	$74,$0f,$14,$3b,$17,$13,$f2,$5d
	fcb	$17,$49,$23,$18,$24,$4c,$0a,$13
	fcb	$00,$17,$4e,$05,$14,$65,$32,$45
	fcb	$7f,$1b,$b6,$0f,$47,$7e,$32,$00
	fcb	$01,$5c,$34,$7c,$4c,$2d,$75,$1b
	fcb	$1b,$14,$0b,$48,$22,$14,$0d,$48
	fcb	$3a,$4c,$11,$14,$65,$17,$32,$39
	fcb	$4c,$03,$01,$57,$01,$5f,$33,$13
	fcb	$0b,$18,$0d,$b4,$40,$1b,$b6,$4c
	fcb	$06,$0f,$01,$79,$52,$02,$77,$0f
	fcb	$53,$2d,$42,$1b,$1b,$b6,$4c,$0d
	fcb	$1c,$42,$5b,$76,$7a,$01,$3d,$47
	fcb	$7e,$33,$52,$03,$0e,$32,$4d,$43
	fcb	$53,$46

De8de:	fcb	$00		; z00
	fdb	keymap		; z01
	fcb	$b8,$e3		; z03
	fcb	$b8,$e3		; z05
	fdb	chargen		; z07
	jmp	next1		; next
	jmp	(z00)		; z0c
	jmp	(tag_table_0)		; ivec1
	jmp	(tag_table_0+$100)	; ivect2
	fcb	$7b,$ff		; z15
	fcb	$00,$2e		; z17
	jmp	Lcb36		; jirq
	jmp	D2000		; z1c
	jmp	D2000		; z1f
	fcb	$65,$e6		; z22
	fcb	$fa		; z24
	fcb	$0a		; z25
	fdb	$5101		; v_key
	fdb	$0974		; v_emit
	fdb	$df28		; v_abort
	fdb	Sc601		; z2c

x_query_key_hit:
	fcb	$00	; ?KEY-HIT
	fcb	$7c,$1b,$4c,$03,$75,$0f,$00,$5b
	fcb	$76,$14,$3d,$76

x_never:
	fcb	$00	; NEVER
	fcb	$38

x_at_sa:
	fcb	$00	; @SA
	fcb	$22,$33,$59,$04,$79,$3d,$57,$79

x_typedrop:
	fcb	$00	; TYPEDROP
	tag	type
	tag	drop

x_menu_driver:
	fcb	$00	; MENU-DRIVER
	fcb	$33,$37,$13,$78,$18,$1b,$2e,$1d
	fcb	$3d,$23,$1b,$1b,$2f,$1d,$47,$4c
	fcb	$0a,$7e,$25,$0c,$13,$e9,$47,$42
	fcb	$52,$03,$0e,$33,$24,$0f,$7c,$1b
	fcb	$4c,$2d,$0f,$75,$b4,$2e,$1d,$3e
	fcb	$1b,$29,$4c,$06,$0f,$77,$33,$52
	fcb	$1e,$1f,$23,$1b,$1b,$2e,$1d,$47
	fcb	$4c,$10,$7c,$4c,$06,$25,$01,$0c
	fcb	$52,$03,$7e,$47,$2f,$1d,$47,$52
	fcb	$04,$0e,$77,$33,$24,$0f,$4d,$4d
	fcb	$0e,$0e

x_p_fileorg:
	fcb	$00	; (FILEORG)
	fcb	$13,$f2,$17,$4c,$06,$11,$00,$80
	fcb	$52,$03,$12,$8d

x_fileorg:
	fcb	$00	; FILEORG
	fcb	$14,$2c,$15,$47

x_used:
	fcb	$00	; USED
	fcb	$84,$2d,$3d

x_nfiles:
	fcb	$00	; NFILES
	fcb	$84,$2b,$3d

x_fspace:
	fcb	$00	; FSPACE
	fcb	$84,$14,$0a,$3d

x_filelen:
	fcb	$00	; FILELEN
	fcb	$13,$f2,$17,$4c,$07,$84,$2f,$3d
	fcb	$15,$52,$06,$14,$37,$15,$84,$3e

x_flim:
	fcb	$00	; FLIM
	fcb	$01,$7e,$b7,$15,$3d

x_fudge_flim:
	fcb	$00	; FUDGE-FLIM
	fcb	$86,$13,$f2,$17,$4e,$04,$14,$28
	fcb	$3d

x_avail:
	fcb	$00	; AVAIL
	fcb	$84,$01,$7f,$3d,$01,$80,$3e

x_query_room:
	fcb	$00	; ?ROOM
	fcb	$01,$81,$33,$66,$01,$17

x_fio_err:
	fcb	$00	; FIO-ERR
	fcb	$0f,$38

x_plus_used:
	fcb	$00	; +USED
	fcb	$b7,$19,$13,$f2,$17,$4e,$06,$01
	fcb	$80,$13,$f5,$16

x_rec_move:
	fcb	$00	; REC-MOVE
	fcb	$22,$5d,$18,$42,$22,$6f

x_rec_cnt:
	fcb	$00	; REC-CNT
	fcb	$81,$41,$17,$2b,$39,$4c,$19,$33
	fcb	$81,$1b,$15,$30,$af,$1c,$17,$42
	fcb	$af,$1b,$33,$4b,$4c,$07,$20,$42
	fcb	$20,$20,$53,$0d,$0e,$52,$02,$32

x_nrec:
	fcb	$00	; NREC
	fcb	$1b,$88,$51,$11,$81,$30,$3d,$22
	fcb	$42,$33,$59,$06,$1b,$17,$3d,$42
	fcb	$57,$32,$52,$02,$38

x_expand:
	fcb	$00	; EXPAND
	fcb	$1b,$b8,$4c,$0f,$1b,$23,$1c,$3d
	fcb	$1c,$86,$22,$3e,$6f,$24,$b9,$32
	fcb	$52,$02,$87

x_shrink:
	fcb	$00	; SHRINK
	fcb	$1b,$b7,$15,$4b,$4c,$04,$87,$52
	fcb	$0f,$1b,$23,$1c,$3d,$86,$1c,$3e
	fcb	$20,$22,$6f,$24,$63,$b9,$32

x_revise:
	fcb	$00	; REVISE
	fcb	$1b,$23,$1b,$29,$4c,$06,$64,$01
	fcb	$84,$52,$03,$01,$83,$1b,$4c,$04
	fcb	$25,$81,$19,$24,$0f

x_read:
	fcb	$00	; READ
	fcb	$ba,$4c,$0d,$79,$20,$67,$20,$22
	fcb	$1b,$23,$6f,$24,$32,$52,$02,$87

x_write:
	fcb	$00	; WRITE
	fcb	$ba,$4c,$19,$1c,$23,$1b,$17,$20
	fcb	$22,$3e,$1c,$22,$01,$85,$4c,$07
	fcb	$24,$01,$82,$32,$52,$04,$24,$0f
	fcb	$87,$52,$02,$87

x_lookup:
	fcb	$00	; LOOKUP
	fcb	$1b,$85,$15,$51,$0e,$01,$7e,$22
	fcb	$33,$59,$05,$1b,$15,$3d,$57,$32
	fcb	$52,$02,$38

x_query_file:
	fcb	$00	; ?FILE
	fcb	$33,$20,$20,$85,$15,$33,$59,$18
	fcb	$5d,$3b,$01,$88,$4c,$11,$30,$3d
	fcb	$79,$01,$3d,$4c,$0a,$0f,$0e,$32
	fcb	$32,$3b,$01,$88,$0f,$55,$57,$20
	fcb	$4c,$05,$60,$32,$52,$02,$87

x_make:
	fcb	$00	; MAKE
	fcb	$1b,$2e,$3d,$b8,$4c,$19,$86,$1b
	fcb	$13,$01,$16,$2f,$1c,$16,$41,$33
	fcb	$22,$16,$2f,$b9,$34,$01,$87,$0f
	fcb	$32,$85,$19,$32,$52,$02,$87

x_open:
	fcb	$00	; OPEN
	fcb	$01,$89,$1b,$4c,$05,$22,$13,$01
	fcb	$16

x_delete_file:
	fcb	$00	; DELETE-FILE
	fcb	$1b,$15,$01,$84,$0f,$34,$85,$19

x_delete:
	fcb	$00	; DELETE
	fcb	$ba,$1b,$4c,$08,$0f,$1b,$17,$42
	fcb	$63,$01,$85

x_insert:
	fcb	$00	; INSERT
	fcb	$88,$67,$40,$ba,$0f,$79,$3d,$22
	fcb	$5d,$42,$01,$85,$4c,$06,$01,$82
	fcb	$32,$52,$03,$0f,$87

x_make_room:
	fcb	$00	; MAKE-ROOM
	fcb	$32,$85,$19,$86,$22,$b9

Seb1f:	fcb	$00
	fcb	$14,$34,$17,$14,$5a,$49,$4c,$03
	fcb	$01,$70,$01,$7e,$33,$85,$15,$33
	fcb	$59,$05,$1c,$15,$af,$57,$60,$b7
	fcb	$15,$3d,$4c,$06,$33,$84,$16,$01
	fcb	$62,$12,$93,$15,$12,$bf,$3d,$13
	fcb	$f5,$16,$0d

x_tag_18f:
	fcb	$00	; unknown tag $18f
	fcb	$7e,$7a
	cstr	"SELECT FILE"

x_dot_no_room:
	fcb	$00	; .NO-ROOM
	fcb	$7e,$7a
	cstr	"NO ROOM"

x_file_tag:
	fcb	$00	; FILE-TAG
	fcb	$79,$11,$01,$7d,$32

x_query_visible:
	fcb	$00	; ?VISIBLE
	fcb	$41,$17,$32,$39,$28

x_e_l:
	fcb	$00	; E-L
	fcb	$42,$85,$15,$33,$59,$18,$3b,$01
	fcb	$88,$0f,$1b,$2f,$1d,$47,$4c,$0c
	fcb	$22,$40,$1b,$4c,$04,$60,$52,$02
	fcb	$55,$52,$02,$0f,$57,$4c,$04,$38
	fcb	$52,$03,$60,$32

x_dot_file:
	fcb	$00	; .FILE
	fcb	$33,$66,$13,$f3,$15,$1c,$01,$93
	fcb	$4c,$08,$60,$30,$3d,$01,$91,$52
	fcb	$0f,$4e,$0c,$7e,$7a
	cstr	"NO FILES"
	fcb	$33

x_open_file:
	fcb	$00	; OPEN-FILE
	fcb	$01,$94,$0e,$0f,$2f,$3e,$13,$01
	fcb	$16

x_tag_196:
	fcb	$00	; unknown tag $196
	fcb	$01,$95,$81,$01,$8c,$32

x_query_enough_room:
	fcb	$00	; ?ENOUGH-ROOM
	fcb	$4e,$22,$77,$01,$90,$7a
	cstr	", DELETE FILE"
	fcb	$32,$11,$01,$96
	fcb	$11,$01,$92,$13,$f3,$16,$11,$01
	fcb	$94,$83,$b5

x_query_sf:
	fcb	$00	; ?SF
	fcb	$41,$17,$2e,$39,$2f,$48

x_reloc:
	fcb	$00	; RELOC
	fcb	$30,$3d,$79,$3d,$1b,$41,$17,$23
	fcb	$1b,$30,$3d,$1b,$23,$22,$15,$3e
	fcb	$1a,$4c,$10,$25,$5d,$19,$41,$1b
	fcb	$15,$28,$4d,$06,$0e,$25,$25,$30
	fcb	$3e,$16,$24,$25,$30,$62,$13,$1b
	fcb	$3d,$5d,$16,$23,$1b,$11,$00,$40
	fcb	$01,$17,$4c,$04,$38,$52,$0f,$29
	fcb	$4c,$06,$14,$3b,$17,$52,$07,$14
	fcb	$3c,$17,$14,$50,$3a,$24,$41,$18
	fcb	$24,$1a,$4e,$03,$14,$c0

x_ks:
	fcb	$00	; KS
	fcb	$11,$01,$c8,$22,$01,$93,$0f,$01
	fcb	$cb,$47,$01,$57

x_snap_file:
	fcb	$00	; SNAP-FILE
	fcb	$01,$8f,$32,$11,$01,$c9,$11,$01
	fcb	$c8,$13,$f3,$16,$11,$01,$94,$83
	fcb	$00,$04,$0d,$80,$83,$89

x_eol:
	fcb	$00	; EOL
	fcb	$11,$60,$ec,$79,$20,$01,$3c,$1b
	fcb	$4c,$02,$60

x_lbuf:
	fcb	$00	; LBUF
	fcb	$13,$f7,$15

x_llen:
	fcb	$00	; LLEN
	fcb	$13,$f9,$17

x_ccnt:
	fcb	$00	; CCNT
	fcb	$13,$fa,$17

x_curpos:
	fcb	$00	; CURPOS
	fcb	$13,$fd,$17

x_bufpos:
	fcb	$00	; BUFPOS
	fcb	$01,$98,$8c,$3d

x_tag_8e:
	fcb	$00	; unknown tag $8e
	fcb	$1b,$64,$33,$59,$1c,$1b,$29,$4c
	fcb	$10,$14,$81,$76,$34,$13,$fd,$1e
	fcb	$8d,$17,$76,$14,$81,$76,$52,$08
	fcb	$8d,$17,$76,$32,$13,$fd,$1e,$57
	fcb	$0f

x_tag_8f:
	fcb	$00	; unknown tag $8f
	fcb	$12,$04,$17,$14,$fe,$39

x_tag_90:
	fcb	$00	; unknown tag $90
	fcb	$1b,$8f,$50,$03,$0f,$33,$12,$04
	fcb	$18

x_tag_bb:
	fcb	$00	; unknown tag $bb
	fcb	$33,$66,$8b,$67,$8c,$3e,$1b,$64
	fcb	$1b,$20,$01,$2b,$22,$33,$59,$04
	fcb	$1b,$8e,$57,$0f,$00,$8c,$14,$1a
	fcb	$51,$06,$8b,$14,$1a,$67,$bb,$00
	fcb	$7e,$33,$59,$25,$32,$8e,$7c,$4c
	fcb	$1f,$75,$4f,$86,$16,$75,$7c,$4c
	fcb	$0e,$0e,$75,$0f,$33,$12,$05,$18
	fcb	$0c,$ce,$ec,$55,$52,$03,$44,$44
	fcb	$52,$06,$0f,$0c,$ce,$ec,$55,$57
	fcb	$00,$12,$05,$17,$4c,$10,$01,$7a
	fcb	$4c,$07,$33,$12,$05,$18,$52,$06
	fcb	$1b,$44,$14,$86,$44,$0f,$00,$8c
	fcb	$3d,$1b,$29,$22,$8b,$4a,$28,$3a
	fcb	$28

x_tag_91:
	fcb	$00	; unknown tag $91
	fcb	$33,$12,$05,$18,$0f,$77

x_tag_92:
	fcb	$00	; unknown tag $92
	fcb	$4e,$05,$91,$24,$24,$0e,$00,$12
	fcb	$04,$17,$32,$39,$4e,$03,$33,$90
	fcb	$00,$8b,$01,$99,$4a,$92,$1b,$8d
	fcb	$8b,$8c,$3e,$42,$20,$01,$3e,$14
	fcb	$41,$7b,$32,$8e,$32,$13,$fa,$1e
	fcb	$00,$8c,$8b,$50,$0a,$33,$13,$fd
	fcb	$18,$2b,$01,$54,$52,$03,$32,$8e
	fcb	$01,$7a,$4d,$11,$8c,$14,$1a,$51
	fcb	$0b,$7f,$01,$98,$8c,$78,$8c,$0c
	fcb	$ce,$ec,$bb,$00,$8f,$33,$58,$07
	fcb	$8d,$18,$32,$8e,$52,$0b,$31,$58
	fcb	$06,$0c,$3b,$ed,$52,$03,$0f,$91
	fcb	$00,$8f,$2f,$58,$3e,$8b,$92,$8d
	fcb	$8b,$8c,$3e,$32,$66,$35,$01,$3f
	fcb	$34,$13,$fa,$1e,$35,$14,$42,$7b
	fcb	$14,$67,$17,$14,$1a,$1c,$3e,$1b
	fcb	$8c,$3d,$8b,$51,$0d,$8d,$3d,$40
	fcb	$17,$14,$19,$72,$14,$40,$7b,$52
	fcb	$02,$0f,$72,$33,$67,$1b,$0c,$18
	fcb	$ed,$92,$8c,$4c,$03,$1b,$8e,$0f
	fcb	$52,$2f,$31,$58,$23,$8b,$01,$99
	fcb	$51,$1b,$29,$4c,$09,$35,$0c,$3b
	fcb	$ed,$34,$8e,$52,$0e,$8c,$8b,$49
	fcb	$4c,$03,$32,$8e,$35,$0c,$3b,$ed
	fcb	$34,$8e,$52,$02,$91,$52,$0a,$0f
	fcb	$1b,$33,$67,$0c,$18,$ed,$92,$8e
	fcb	$00,$4f,$82,$0b,$32,$0c,$8b,$ed
	fcb	$1b,$0c,$02,$ed,$52,$1e,$4f,$81
	fcb	$0b,$34,$0c,$8b,$ed,$1b,$0c,$02
	fcb	$ed,$52,$11,$33,$12,$05,$18,$4f
	fcb	$07,$06,$0c,$53,$ed,$52,$05,$1b
	fcb	$0c,$76,$ed,$0f,$00,$14,$86,$58
	fcb	$19,$75,$14,$84,$58,$05,$30,$90
	fcb	$52,$0e,$14,$85,$58,$05,$2e,$90
	fcb	$52,$06,$32,$12,$05,$18,$44,$52
	fcb	$17,$14,$84,$58,$05,$31,$90,$52
	fcb	$0f,$14,$85,$58,$05,$2f,$90,$52
	fcb	$07,$0c,$fb,$ed,$0c,$31,$ed,$00
	fcb	$8c,$01,$99,$4b,$4c,$0a,$34,$8e
	fcb	$32,$91,$35,$76,$14,$81,$76,$8f
	fcb	$2f,$50,$06,$8c,$8b,$40,$67,$bb
	fcb	$8c,$8b,$66,$13,$fa,$18,$00,$1b
	fcb	$3c,$3a,$1b,$1f,$11,$9c,$58,$30
	fcb	$01,$2d,$0e

x_set_blips:
	fcb	$00	; SET-BLIPS
	fcb	$14,$cf,$01,$09,$11,$65,$e6,$14
	fcb	$22,$16,$8f,$4f,$04,$0b,$14,$10
	fcb	$01,$08,$11,$6a,$e6,$14,$22,$16
	fcb	$4f,$02,$0a,$35,$01,$08,$11,$33
	fcb	$e6,$14,$22,$16,$0f,$8b,$8c,$14
	fcb	$1a,$14,$67,$17,$3e,$3d,$4b,$14
	fcb	$aa,$62,$0c,$79,$ee,$00,$12,$04
	fcb	$18,$13,$fb,$16,$23,$33,$13,$fd
	fcb	$18,$13,$fa,$18,$13,$f9,$18,$13
	fcb	$f7,$16,$8b,$4c,$22,$25,$4c,$19
	fcb	$25,$40,$14,$0d,$5d,$51,$07,$0e
	fcb	$8b,$14,$1a,$52,$03,$3d,$8b,$67
	fcb	$0c,$d9,$ec,$25,$40,$bb,$52,$05
	fcb	$8b,$0c,$d9,$ec,$52,$02,$7e,$24
	fcb	$0f

x_expect:
	fcb	$00	; EXPECT
	fcb	$0c,$bc,$ee,$0c,$5a,$ee,$01,$9a
	fcb	$75,$1b,$13,$fb,$15,$47,$28,$4c
	fcb	$0a,$33,$0c,$79,$ee,$0c,$27,$ee
	fcb	$53,$15,$23,$01,$98,$8b,$24,$12
	fcb	$04,$17,$00,$23,$12,$06,$12,$01
	fcb	$17,$5d,$01,$33,$5d,$24,$01,$86
	fcb	$4e,$02,$33,$1b,$4e,$09,$01,$4a
	fcb	$13,$7b,$a5,$31,$0b,$0f,$13,$fe
	fcb	$17,$13,$fb,$15,$12,$04,$17

x_tag_bd:
	fcb	$00	; unknown tag $bd
	fcb	$92,$13,$ff,$19,$00,$13,$ff,$16
	fcb	$12,$02,$16,$13,$fb,$16,$12,$01
	fcb	$18,$33,$12,$04,$18,$33,$12,$05
	fcb	$18,$33,$13,$fe,$18

x_tag_93:
	fcb	$00	; unknown tag $93
	fcb	$13,$ff,$15,$00,$b8,$4e,$1a,$77
	fcb	$7e,$7a
	cstr	"ONLY "
	fcb	$01,$81,$01,$6c,$7a
	cstr	"BYTES LEFT"
	fcb	$00,$81,$01,$8c,$b5,$00,$1b,$28
	fcb	$93,$34,$48,$39,$4c,$07,$0c,$7f
	fcb	$ef,$0e,$52,$0b,$93,$88,$4c,$05
	fcb	$01,$87,$52,$02,$89,$0f,$00,$93
	fcb	$34,$50,$06,$0c,$7f,$ef,$52,$05
	fcb	$93,$01,$8d,$0f,$00,$1c,$22,$12
	fcb	$06,$14,$50,$20,$01,$86,$0f,$12
	fcb	$06,$22,$20,$af,$12,$56,$12,$68
	fcb	$17,$01,$3b,$4c,$05,$3d,$32,$52
	fcb	$02,$38,$00,$0f,$0c,$84,$ef,$33
	fcb	$12,$05,$18,$93,$23,$8c,$23,$7e
	fcb	$7a
	cstr	"SEARCH FOR? "
	fcb	$12,$56
	fcb	$14,$0c,$33,$33,$11,$01,$97,$33
	fcb	$bc,$0e,$12,$68,$18,$0f,$24,$13
	fcb	$fd,$18,$24,$13,$ff,$16,$8c,$93
	fcb	$0c,$ab,$ef,$4c,$07,$42,$13,$fe
	fcb	$18,$52,$33,$33,$93,$42,$88,$6b
	fcb	$33,$1c,$0c,$ab,$ef,$4c,$0e,$42
	fcb	$13,$fe,$18,$13,$ff,$16,$0f,$32
	fcb	$33,$32,$52,$04,$1b,$93,$48,$4d
	fcb	$1a,$0f,$4e,$12,$77,$7e,$7a
	cstr	"NOT FOUND"
	fcb	$33,$13,$fe,$18

x_edit_file:
	fcb	$00	; EDIT-FILE
	fcb	$0c,$45,$ef,$14,$50,$0c,$62,$ef
	fcb	$93,$29,$4c,$05,$33,$14,$43,$7b
	fcb	$0c,$31,$ed,$93,$0c,$1b,$ef,$bc
	fcb	$33,$14,$44,$7b,$12,$04,$18,$1b
	fcb	$12,$02,$15,$47,$28,$4c,$9e,$93
	fcb	$29,$4c,$04,$0f,$14,$83,$4f,$89
	fcb	$06,$0c,$c9,$ef,$52,$75,$93,$29
	fcb	$4c,$04,$0f,$14,$83,$33,$13,$fe
	fcb	$18,$1b,$23,$8f,$33,$58,$2c,$23
	fcb	$0c,$84,$ef,$24,$37,$58,$08,$34
	fcb	$93,$33,$4b,$bd,$52,$1b,$14,$83
	fcb	$58,$09,$32,$93,$42,$88,$4a,$bd
	fcb	$52,$0f,$0f,$32,$13,$ff,$19,$93
	fcb	$88,$50,$06,$33,$33,$93,$89,$8a
	fcb	$52,$35,$31,$58,$12,$23,$0c,$84
	fcb	$ef,$24,$37,$49,$13,$ff,$19,$33
	fcb	$33,$93,$89,$8a,$52,$21,$2f,$58
	fcb	$1e,$37,$58,$0e,$34,$93,$33,$4b
	fcb	$1b,$4c,$04,$0c,$9d,$ef,$bd,$52
	fcb	$0d,$0f,$33,$93,$88,$4a,$1b,$4c
	fcb	$04,$0c,$9d,$ef,$bd,$0e,$24,$0c
	fcb	$02,$ed,$81,$41,$17,$2b,$39,$4e
	fcb	$12,$7e,$77,$7a
	cstr	"CAN'T EDIT"
	fcb	$7e,$7d,$b5,$53,$bf,$0e,$0f

x_tag_19c:
	fcb	$00	; unknown tag $19c
	fcb	$82,$3d,$b6

x_tag_19d:
	fcb	$00	; unknown tag $19d
	fcb	$82,$3d,$01,$79

x_tag_19e:
	fcb	$00	; unknown tag $19e
	fcb	$01,$95,$32

x_move_it:
	fcb	$00	; MOVE-IT
	fcb	$13,$fb,$15,$10,$0f,$30,$1d,$12
	fcb	$06,$30,$1d,$14,$50,$67,$6f,$12
	fcb	$02,$15,$10,$0f,$1c,$12,$06,$22
	fcb	$30,$1d,$14,$50,$67,$6f,$14,$50
	fcb	$3e,$33,$66,$23,$14,$50,$3d,$22
	fcb	$14,$50,$3d,$22,$24,$1b,$28,$4d
	fcb	$2f,$0e,$0f

x_copy_file:
	fcb	$00	; COPY-FILE
	fcb	$01,$8f,$30,$11,$01,$92,$13,$f3
	fcb	$16,$11,$01,$9e,$11,$01,$94,$83
	fcb	$13,$f2,$17,$13,$fb,$16,$81,$1b
	fcb	$15,$7e,$7a
	cstr	"SELECT DESTINATION RAM"
	fcb	$33,$13,$01,$16,$32,$13
	fcb	$00,$18,$32,$11,$01,$9d,$11,$01
	fcb	$9c,$83,$33,$13,$00,$18,$13,$f2
	fcb	$17,$12,$02,$16,$01,$5e,$1b,$b8
	fcb	$4c,$14,$1b,$01,$8e,$22,$01,$9f
	fcb	$7a
	cstr	"COPY DONE"
	fcb	$52,$04,$0e,$01,$90
	fcb	$13,$fb,$15,$13,$f2,$18,$01,$5e

x_do_edit:
	fcb	$00	; DO-EDIT
	fcb	$23,$88,$4e,$06,$33,$33,$33,$89
	fcb	$8a,$14,$50,$11,$01,$97,$14,$38
	fcb	$24,$01,$9b

x_new_file:
	fcb	$00	; NEW-FILE
	fcb	$7e,$7a
	cstr	"TYPE FILE NAME, THEN ENTER"
	fcb	$12,$06,$14
	fcb	$50,$33,$33,$11,$01,$97,$33,$bc
	fcb	$0e,$1a,$4c,$0d,$01,$8a,$8a,$2b
	fcb	$81,$41,$18,$33,$01,$a1,$52,$02
	fcb	$91,$53,$39,$00

	cstr	"NEW FILE"

	cstr	"COPY FILE"

x_tag_1a3:
	fcb	$00	; unknown tag $1a3
	fcb	$11,$01,$92,$13,$f3,$16,$33,$58
	fcb	$08,$11,$06,$f2,$01,$91,$52,$0e
	fcb	$32,$58,$08,$11,$0f,$f2,$01,$91
	fcb	$52,$04,$3f,$01,$94

x_tag_1a4:
	fcb	$00	; unknown tag $1a4
	fcb	$4f,$00,$03,$01,$a2,$4f,$01,$04
	fcb	$01,$a0,$00,$3f,$01,$95,$34,$01
	fcb	$a1

x_tag_1a5:
	fcb	$00	; unknown tag $1a5
	tag	flame_on
	tag	1
Tf24d:	literal	$a401		; executer
	literal	$a301		; selecter
	tag	menu_driver
	tagrr	p_again,Tf24d

	fcb	$00

	fcb	$30,$55,$56
	fcb	$69,$5a,$3f,$a9,$04,$85,$5d,$86
	fcb	$5c,$a0,$08,$a6,$5c,$18,$36,$07
	fcb	$ca,$88,$d0,$fa,$c6,$5d,$d0,$f1
	fcb	$60,$a9,$07,$85,$5d,$18,$a9,$0e
	fcb	$65,$5a,$4a,$aa,$a5,$62,$90,$02
	fcb	$69,$07,$a8,$f8,$18,$b5,$42,$79
	fcb	$07,$00,$95,$42,$ca,$88,$c6,$5d
	fcb	$d0,$f3,$8a,$30,$09,$b5,$42,$69
	fcb	$00,$95,$42,$ca,$10,$f7,$d8,$60
	fcb	$a9,$07,$85,$5d,$18,$a9,$0e,$65
	fcb	$5a,$4a,$aa,$a5,$62,$90,$02,$69
	fcb	$07,$a8,$f8,$38,$b5,$42,$f9,$07
	fcb	$00,$95,$42,$ca,$88,$c6,$5d,$d0
	fcb	$f3,$8a,$30,$09,$b5,$42,$e9,$00
	fcb	$95,$42,$ca,$10,$f7,$d8,$60,$85
	fcb	$5d,$86,$62,$a0,$18,$a9,$00,$99
	fcb	$42,$00,$88,$10,$fa,$b5,$08,$29
	fcb	$80,$85,$61,$55,$00,$29,$80,$85
	fcb	$5e,$b5,$08,$29,$7f,$38,$e9,$40
	fcb	$85,$5f,$b5,$09,$29,$f0,$85,$60
	fcb	$55,$09,$95,$09,$b5,$00,$29,$7f
	fcb	$38,$e9,$40,$85,$5a,$b5,$01,$29
	fcb	$f0,$85,$5b,$55,$01,$95,$01,$26
	fcb	$5d,$a0,$06,$b5,$0f,$90,$03,$99
	fcb	$51,$00,$b0,$03,$99,$43,$00,$b5
	fcb	$07,$95,$0f,$ca,$88,$10,$ec,$a6
	fcb	$62,$20,$5d,$f2,$60,$a9,$ff,$85
	fcb	$5b,$a2,$43,$b5,$00,$a8,$d0,$1d
	fcb	$38,$a5,$60,$e9,$20,$85,$60,$a5
	fcb	$5f,$e9,$00,$85,$5f,$e8,$e0,$4b
	fcb	$d0,$07,$84,$5b,$84,$5f,$84,$5e
	fcb	$c8,$98,$4c,$70,$f3,$29,$f0,$f0
	fcb	$13,$18,$a5,$60,$69,$10,$85,$60
	fcb	$a5,$5f,$69,$00,$85,$5f,$ca,$20
	fcb	$5d,$f2,$a6,$5c,$a9,$01,$f0,$c3
	fcb	$86,$5c,$a5,$5f,$30,$08,$c9,$40
	fcb	$30,$04,$a9,$02,$85,$5b,$18,$69
	fcb	$40,$10,$04,$a9,$01,$85,$5b,$05
	fcb	$5e,$a6,$62,$95,$08,$e8,$a4,$5c
	fcb	$a5,$5b,$30,$0b,$05,$5e,$95,$07
	fcb	$a9,$00,$85,$60,$99,$00,$00,$a9
	fcb	$07,$85,$5d,$b9,$00,$00,$95,$08
	fcb	$e8,$c8,$c6,$5d,$d0,$f5,$b5,$01
	fcb	$05,$60,$95,$01,$4c,$09,$00,$86
	fcb	$62,$a0,$07,$38,$b5,$0f,$f5,$07
	fcb	$ca,$88,$d0,$f8,$b5,$07,$29,$7f
	fcb	$85,$42,$b5,$0f,$29,$7f,$e5,$42
	fcb	$b0,$10,$a0,$08,$b5,$16,$48,$b5
	fcb	$0e,$95,$16,$68,$95,$0e,$ca,$88
	fcb	$d0,$f2,$a6,$62,$a9,$00,$20,$d1
	fcb	$f2,$38,$a5,$60,$e5,$5b,$aa,$a5
	fcb	$5f,$e5,$5a,$d0,$1a,$8a,$4a,$4a
	fcb	$4a,$4a,$c9,$0d,$10,$11,$85,$5a
	fcb	$e6,$5a,$a5,$5e,$10,$06,$20,$a2
	fcb	$f2,$4c,$11,$f4,$20,$73,$f2,$a5
	fcb	$61,$85,$5e,$4c,$2f,$f3,$a9,$ff
	fcb	$20,$d1,$f2,$18,$a5,$60,$65,$5b
	fcb	$85,$60,$a5,$5f,$65,$5a,$85,$5f
	fcb	$a9,$0d,$85,$5a,$a5,$5a,$4a,$aa
	fcb	$b5,$51,$b0,$04,$4a,$4a,$4a,$4a
	fcb	$29,$0f,$85,$5b,$f0,$07,$20,$73
	fcb	$f2,$c6,$5b,$d0,$f9,$c6,$5a,$d0
	fcb	$e3,$4c,$2f,$f3,$a9,$01,$20,$d1
	fcb	$f2,$38,$a5,$60,$e5,$5b,$85,$60
	fcb	$a5,$5f,$e5,$5a,$85,$5f,$a9,$01
	fcb	$85,$5a,$a9,$ff,$85,$5b,$e6,$5b
	fcb	$20,$a2,$f2,$b0,$04,$20,$73,$f2
	fcb	$18,$b0,$f3,$a5,$5a,$4a,$aa,$a5
	fcb	$5b,$b0,$04,$0a,$0a,$0a,$0a,$15
	fcb	$51,$95,$51,$e6,$5a,$a5,$5a,$c9
	fcb	$0f,$d0,$d7,$a2,$08,$b5,$51,$95
	fcb	$43,$ca,$10,$f9,$4c,$2f,$f3

x_fstandtype:
	fcb	$00	; FSTANDTYPE
	fcb	$1d,$1b,$11,$00,$0f,$39,$4c,$05
	fcb	$0f,$33,$52,$07,$14,$7f,$39,$42
	fcb	$2d,$67,$00,$2e,$94,$31,$94,$5d
	fcb	$3a,$1a,$1a,$0e,$00,$51,$03,$01
	fcb	$1f,$61

x_f_plus:
	fcb	$00	; F+
	fcb	$0c,$ac,$f4,$4c,$0c,$5d,$3d,$32
	fcb	$50,$02,$22,$0c,$b6,$f4,$52,$04
	fcb	$0c,$b9,$f3

x_fnegate:
	fcb	$00	; FNEGATE
	fcb	$32,$94,$4e,$03,$37,$a6

x_f_minus:
	fcb	$00	; F-
	fcb	$01,$a6,$be

x_f_less_than:
	fcb	$00	; F<
	fcb	$01,$a7,$3c,$23,$0e,$0f,$24,$29

x_fabs:
	fcb	$00	; FABS
	fcb	$11,$7f,$ff,$39

x_tag_bf:
	fcb	$00	; F@
	fcb	$1b,$1b,$5d,$1f,$41,$2b,$6f

x_f_bang:
	fcb	$00	; F!
	fcb	$1f,$41,$22,$2b,$6f,$61

x_10exp:
	fcb	$00	; 10EXP
	fcb	$32,$94,$4c,$05,$0f,$33,$52,$0c
	fcb	$01,$a9,$3c,$11,$fc,$ff,$6c,$11
	fcb	$00,$04,$3e

x_f_times:
	fcb	$00	; F*
	fcb	$0c,$ac,$f4,$4c,$06,$0c,$b6,$f4
	fcb	$52,$04,$0c,$18,$f4

x_f_div:
	fcb	$00	; F/
	fcb	$32,$94,$32,$50,$03,$0f,$2f,$0c
	fcb	$ac,$f4,$4c,$06,$0c,$b6,$f4,$52
	fcb	$04,$0c,$4e,$f4

x_fround:
	fcb	$00	; FROUND
	fcb	$30,$94,$4c,$05,$0e,$32,$52,$38
	fcb	$30,$1d,$95,$5d,$51,$2f,$22,$1c
	fcb	$2f,$21,$3e,$5d,$4b,$4e,$02,$22
	fcb	$0f,$1b,$23,$3e,$24,$11,$00,$04
	fcb	$3d,$1b,$29,$4c,$04,$0f,$52,$13
	fcb	$2f,$6c,$2e,$3a,$3c,$30,$1d,$37
	fcb	$39,$3a,$22,$26,$33,$33,$33,$24
	fcb	$be,$24,$52,$04,$61,$32,$32

x_f_num:
	fcb	$00	; F#
	fcb	$1b,$42,$01,$12,$1b,$2c,$51,$21
	fcb	$1f,$3d,$2e,$3d,$17,$1c,$32,$39
	fcb	$4c,$05,$11,$fc,$ff,$6c,$14,$0f
	fcb	$39,$14,$68,$15,$14,$37,$15,$3e
	fcb	$1c,$3a,$4c,$05,$36,$3a,$80,$32
	fcb	$0f

x_fp_to_ascii:
	fcb	$00	; FP>ASC
	fcb	$01,$64,$31,$94,$1a,$4c,$09,$11
	fcb	$56,$f2,$3d,$17,$80,$52,$11,$40
	fcb	$1b,$4c,$08,$01,$ae,$40,$1b,$28
	fcb	$4d,$05,$14,$2e,$80,$01,$ae,$0f
	fcb	$1b,$37,$39,$4c,$05,$14,$2d,$52
	fcb	$02,$35,$80,$23,$0f,$01,$65,$24
	fcb	$95

x_f_dot:
	fcb	$00	; F.
	fcb	$01,$af,$42,$5d,$3e,$3f,$33,$66
	fcb	$23,$20,$1b,$17,$14,$2d,$50,$04
	fcb	$14,$2d,$76,$42,$1b,$15,$3c,$1c
	fcb	$16,$42,$20,$3f,$20,$1c,$4c,$29
	fcb	$1b,$29,$4c,$0c,$14,$2e,$76,$64
	fcb	$33,$54,$36,$76,$57,$52,$18,$33
	fcb	$59,$0f,$1b,$4c,$06,$40,$1c,$17
	fcb	$52,$02,$36,$76,$22,$42,$22,$57
	fcb	$1b,$4c,$04,$14,$2e,$76,$52,$03
	fcb	$0e,$32,$78,$24

x_f_dot_ext:
	fcb	$00	; F.EXT
	fcb	$1c,$4e,$04,$14,$2e,$76,$22,$3e
	fcb	$33,$59,$04,$36,$76,$57

x_tag_100:
	fcb	$00	; unknown tag $100
	fcb	$12,$69,$15,$17,$00,$34,$12,$6b
	fcb	$1e,$32,$12,$69,$19,$00,$01,$00
	fcb	$36,$14,$39,$5a,$60,$12,$6b,$17
	fcb	$62,$00,$33,$33,$33,$01,$00,$14
	fcb	$0f,$39,$1b,$4c,$06,$12,$6d,$15
	fcb	$3a,$3c,$be,$0c,$2c,$f6,$32,$12
	fcb	$6c,$1e

x_ascii_to_fp:
	fcb	$00	; ASC>FP
	fcb	$12,$6b,$18,$12,$69,$16,$33,$33
	fcb	$33,$5d,$12,$6c,$16,$01,$00,$1b
	fcb	$14,$2d,$48,$1b,$2c,$6c,$14,$40
	fcb	$3a,$12,$6e,$18,$22,$14,$2b,$48
	fcb	$3a,$4c,$04,$0c,$2c,$f6,$0c,$35
	fcb	$f6,$4c,$0e,$33,$33,$33,$11,$40
	fcb	$11,$01,$ab,$0c,$41,$f6,$53,$10
	fcb	$01,$00,$14,$2e,$48,$12,$6b,$17
	fcb	$62,$4c,$14,$0c,$2c,$f6,$11,$f0
	fcb	$ff,$12,$6d,$19,$0c,$35,$f6,$4c
	fcb	$06,$0c,$41,$f6,$53,$0e,$12,$69
	fcb	$15,$12,$6c,$17

x_tag_96:
	fcb	$00	; unknown tag $96
	fcb	$1b,$14,$88,$48,$1c,$14,$87,$48
	fcb	$3a,$1c,$14,$2b,$48,$3a,$1c,$14
	fcb	$2d,$48,$3a

x_tag_97:
	fcb	$00	; unknown tag $97
	fcb	$14,$67,$17,$6d,$00,$14,$19,$01
	fcb	$b2,$1b,$14,$0b,$4a,$14,$0a,$30
	fcb	$1d,$3e,$33,$67,$1f,$2d,$3d,$19
	fcb	$22,$33,$4b,$39

x_tag_98:
	fcb	$00	; unknown tag $98
	fcb	$12,$08,$0a,$12,$08,$42,$18,$12
	fcb	$08,$2d,$b2,$0f

x_tag_101:
	fcb	$00	; unknown tag $101
	fcb	$33,$12,$0d,$18,$12,$06,$15,$4c
	fcb	$0a,$12,$0f,$bf,$12,$06,$15,$32
	fcb	$52,$06,$33,$6d,$0c,$d0,$f6,$4c
	fcb	$16,$1b,$17,$96,$4c,$0b,$12,$0d
	fcb	$18,$42,$0c,$d0,$f6,$41,$52,$05
	fcb	$0f,$01,$1e,$32,$52,$04,$01,$1e
	fcb	$33,$00,$1b,$1b,$17,$96,$60,$3d
	fcb	$40,$42,$1b,$17,$36,$14,$39,$5a
	fcb	$28,$22,$14,$2e,$49,$39,$4d,$0d
	fcb	$1b,$23,$1c,$3e,$20,$98,$14,$0c
	fcb	$1c,$3e,$33,$59,$04,$35,$98,$57
	fcb	$33,$59,$06,$1b,$17,$98,$42,$57
	fcb	$0f,$98,$14,$0d,$98,$24,$00,$01
	fcb	$01,$60,$30,$48,$00,$0c,$5c,$f7
	fcb	$1a,$4e,$05,$61,$61,$77,$33,$00
	fcb	$12,$0d,$17,$96,$4c,$09,$76,$14
	fcb	$67,$17,$12,$0e,$18,$32,$0f,$00
	fcb	$36,$14,$39,$5a,$1c,$14,$2e,$48
	fcb	$3a,$12,$0c,$17,$31,$48,$39,$4c
	fcb	$0b,$7e,$36,$76,$14,$81,$76,$33
	fcb	$12,$0e,$18,$12,$06,$15,$97,$1c
	fcb	$4a,$22,$33,$49,$39,$4c,$05,$33
	fcb	$12,$06,$16,$97,$17,$22,$97,$18
	fcb	$01,$01,$0f,$23,$61,$61,$24,$12
	fcb	$0e,$17,$6d,$1b,$97,$48,$3d,$50
	fcb	$15,$32,$12,$0c,$18,$97,$17,$76
	fcb	$12,$0e,$17,$14,$67,$17,$66,$12
	fcb	$0e,$18,$0f,$52,$04,$97,$18,$77

x_tag_102:
	fcb	$00	; unknown tag $102
	fcb	$12,$0d,$17,$14,$2b,$58,$0b,$be
	fcb	$1b,$95,$11,$f6,$ff,$4b,$62,$52
	fcb	$29,$14,$2d,$58,$0c,$01,$a7,$1b
	fcb	$95,$11,$f6,$ff,$4b,$62,$52,$1a
	fcb	$14,$88,$58,$05,$01,$ab,$52,$12
	fcb	$14,$87,$58,$0c,$1b,$4c,$05,$01
	fcb	$ac,$52,$03,$61,$77,$52,$03,$61
	fcb	$77

x_tag_99:
	fcb	$00	; unknown tag $99
	fcb	$14,$0a,$11,$f5,$ff,$01,$ad,$1c
	fcb	$95,$1b,$11,$f6,$ff,$4a,$22,$2a
	fcb	$4b,$3a,$30,$94,$32,$4b,$3a,$4c
	fcb	$1a,$0f,$61,$7e,$7a
	cstr	"...RANGE ERROR"
	fcb	$33,$12,$0c,$18
	fcb	$52,$0a,$01,$b0,$0f,$14,$67,$17
	fcb	$12,$0e,$18,$00,$35,$35,$33,$6d
	fcb	$0c,$27,$f7,$1b,$17,$22,$42,$0c
	fcb	$27,$f7,$0f,$7e,$96,$22,$12,$0d
	fcb	$18,$1c,$3a,$4c,$0d,$01,$1e,$99
	fcb	$97,$12,$06,$16,$0c,$6d,$f7,$52
	fcb	$07,$33,$12,$0c,$18,$36,$76,$12
	fcb	$0f,$01,$aa,$35,$14,$3d,$33,$6d
	fcb	$0c,$27,$f7,$0f,$00,$23,$01,$01
	fcb	$60,$1a,$24,$12,$0d,$18,$4c,$18
	fcb	$30,$49,$4c,$03,$01,$1f,$12,$6f
	fcb	$bf,$01,$1f,$01,$02,$12,$6f,$01
	fcb	$aa,$31,$12,$0c,$18,$52,$03,$61
	fcb	$77,$61,$00,$96,$32,$58,$1f,$0c
	fcb	$5c,$f7,$14,$67,$17,$12,$0e,$17
	fcb	$48,$39,$4c,$0b,$01,$02,$2e,$21
	fcb	$35,$0c,$4c,$f8,$52,$06,$61,$61
	fcb	$0c,$7d,$f7,$52,$f3,$0f,$14,$71
	fcb	$58,$2e,$0c,$62,$f7,$4c,$27,$12
	fcb	$0d,$17,$1b,$14,$2b,$48,$22,$14
	fcb	$2d,$48,$3a,$4c,$05,$01,$20,$01
	fcb	$ab,$33,$33,$33,$11,$40,$21,$01
	fcb	$ac,$01,$02,$31,$12,$0c,$18,$35
	fcb	$14,$25,$0c,$4c,$f8,$52,$c1,$14
	fcb	$70,$58,$13,$0c,$62,$f7,$4c,$0c
	fcb	$01,$02,$31,$12,$0c,$18,$35,$1b
	fcb	$0c,$4c,$f8,$52,$ab,$14,$77,$58
	fcb	$07,$33,$12,$6f,$16,$52,$a1,$14
	fcb	$65,$58,$37,$01,$01,$23,$0f,$61
	fcb	$24,$32,$4b,$7e,$4c,$0b,$99,$0c
	fcb	$6d,$f7,$12,$6f,$bf,$99,$52,$1c
	fcb	$61,$32,$12,$0c,$18,$12,$6f,$bf
	fcb	$99,$12,$0c,$17,$4c,$0e,$12,$0d
	fcb	$17,$96,$28,$42,$12,$0c,$18,$0f
	fcb	$0c,$6d,$f7,$33,$12,$06,$16,$52
	fcb	$67,$14,$72,$58,$08,$14,$2b,$0c
	fcb	$85,$f8,$52,$5c,$14,$74,$58,$08
	fcb	$14,$2d,$0c,$85,$f8,$52,$51,$37
	fcb	$58,$13,$0c,$5c,$f7,$4c,$06,$61
	fcb	$7e,$99,$52,$07,$61,$61,$33,$12
	fcb	$0c,$18,$52,$3c,$14,$81,$58,$20
	fcb	$14,$67,$17,$4c,$18,$14,$81,$76
	fcb	$12,$06,$15,$1a,$4c,$0d,$97,$4b
	fcb	$4c,$09,$33,$12,$06,$16,$32,$12
	fcb	$0c,$18,$52,$02,$77,$52,$19,$14
	fcb	$82,$58,$12,$12,$0e,$17,$14,$67
	fcb	$17,$4b,$4c,$06,$14,$82,$76,$52
	fcb	$02,$77,$52,$04,$0c,$7d,$f7

x_tag_1b3:
	fcb	$00	; unknown tag $1b3
	fcb	$37,$1b,$12,$08,$18,$12,$0a,$18
	fcb	$33,$12,$0c,$18,$12,$0c,$17,$4e
	fcb	$0f,$7e,$36,$76,$14,$81,$76,$33
	fcb	$12,$0e,$18,$33,$12,$06,$16,$75
	fcb	$14,$79,$58,$03,$14,$2b,$14,$75
	fcb	$58,$03,$14,$2d,$14,$69,$58,$03
	fcb	$14,$88,$14,$6f,$58,$03,$14,$87
	fcb	$0c,$ab,$f8,$53,$2f

x_cemit:
	fcb	$00	; CEMIT
	fcb	$12,$0a,$1c,$74,$22,$1c,$42,$18
	fcb	$1b,$2f,$b2,$0f,$0a

x_calc:
	fcb	$00	; CALC
	fcb	$14,$43,$2f,$01,$37,$4c,$0d,$12
	fcb	$0a,$2f,$01,$4f,$0f,$11,$01,$b4
	fcb	$14,$28,$16,$14,$44,$2d,$01,$37
	fcb	$4c,$07,$12,$08,$2d,$01,$4f,$0f
	fcb	$01,$b3

x_tag_9a:
	fcb	$00	; unknown tag $9a
	fcb	$14,$0c

x_tag_9b:
	fcb	$00	; unknown tag $9b
	fcb	$14,$3c,$00

x_tag_1b6:
	jsr	Sffeb	; unkown tag $1b6
	fcb	$1f,$1c,$1f,$1e,$1f,$1e,$1f,$1f
	fcb	$1e,$1f,$1e,$1f

x_tag_9c:
	fcb	$00	; unknown tag $9c
	fcb	$12,$06,$3d


Sfa49:	fcb	$00
	fcb	$2c,$9c


x_tag_9d:
	fcb	$00	; unknown tag $9d
	fcb	$0c,$49,$fa,$42

x_tag_9e:
	fcb	$00	; unknown tag $9e
	fcb	$9d,$42

x_tag_103:
	fcb	$00	; unknown tag $103
	fcb	$14,$0d,$9c

x_tag_9f:
	fcb	$00	; unknown tag $9f
	fcb	$14,$27,$9c

x_tag_a0:
	fcb	$00	; unknown tag $a0
	fcb	$9c,$17

x_tag_a1:
	fcb	$00	; unknown tag $a1
	fcb	$9c,$18,$00,$9b,$6a,$9b,$6a,$9a
	fcb	$6a,$31,$6a,$0f,$11,$b5,$05,$69
	fcb	$2f,$62,$22,$1b,$11,$6e,$01,$51
	fcb	$05,$33,$32,$52,$1f,$1b,$13,$db
	fcb	$51,$08,$11,$6e,$01,$3e,$32,$52
	fcb	$12,$1b,$11,$48,$04,$51,$07,$13
	fcb	$db,$3e,$31,$52,$06,$11,$48,$04
	fcb	$3e,$30,$33,$23,$20,$3d,$22,$24
	fcb	$5d,$14,$3a,$3d,$4b,$4c,$18,$14
	fcb	$3b,$3d,$3e,$9a,$31,$54,$3b,$01
	fcb	$b6,$5d,$4a,$4e,$04,$3e,$52,$04
	fcb	$0f,$3b,$55,$57,$52,$0e,$0f,$1b
	fcb	$14,$1f,$51,$04,$33,$52,$05,$14
	fcb	$1f,$3e,$32


x_tag_104:
	fcb	$00	; unknown tag $104
	fcb	$a0,$68,$65
	

Lfacf:	fcb	$00
	fcb	$31,$a0,$1b,$1b
	fcb	$11,$6d,$01,$62,$22,$2f,$01,$2b
	fcb	$3d,$42,$33,$a0,$1b,$32,$4b,$4c
	fcb	$0b,$33,$54,$3b,$01,$b6,$3d,$57
	fcb	$60,$52,$0b,$4c,$04,$14,$1f,$3d
	fcb	$22,$2f,$6b,$28,$3e,$32,$a0,$3d
	fcb	$68,$31,$ac,$30,$01,$04,$9a,$ac
	fcb	$2f,$01,$04,$9b,$ac,$2e,$01,$04
	fcb	$9b,$ac,$2d,$01,$04


Sfb11:	fcb	$00
	fcb	$0c,$62
	fcb	$fa,$2c,$33,$54,$3b,$a1,$57


Sfb1b:	fcb	$00
	fcb	$36,$14,$39,$5a


x_tag_a2:
	fcb	$00	; unknown tag $a2
	fcb	$14,$0a,$69,$5b,$76,$5b,$76

x_tag_105:
	fcb	$00	; unknown tag $105
	fcb	$14,$0a,$69,$5b,$1b,$4c,$04,$76
	fcb	$52,$03,$7d,$0f,$5b,$76,$00

	cstr	"TUEWEDTHUFRISATSUNMON"
	fcb	$00

	fcb	$11,$10
	fcb	$0e,$6a,$20,$0f,$14,$18,$6a,$20
	fcb	$0f,$2c,$6a,$0e,$30,$62,$42,$11
	fcb	$38,$fb,$3d,$30,$78,$7d,$2f,$a0
	fcb	$1a,$4e,$02,$9a,$01,$05,$14,$3a
	fcb	$1b,$76,$2e,$a0,$a2,$76,$2d,$a0
	fcb	$a2,$7d,$00

	cstr	"JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC"	
	fcb	$00

	fcb	$31,$a0,$14,$50,$3d,$14,$64
	fcb	$6b

x_s_dot_t:
	fcb	$00	; S.T
	fcb	$9f,$5e,$0c,$11,$fb,$33,$b3,$9f
	fcb	$5e,$0c,$4e,$fb,$14,$84,$30,$a0
	fcb	$4c,$02,$42,$76,$7d,$33,$a0,$30
	fcb	$62,$42,$11,$7c,$fb,$3d,$30,$78
	fcb	$7d,$32,$a0,$42,$01,$05,$7d,$0c
	fcb	$a1,$fb,$1b,$14,$50,$51,$07,$7a
	fcb	$02,$32,$30,$52,$05,$7a,$02,$31
	fcb	$39,$a2


Sfbe5:	fcb	$00
	fcb	$7e,$7d,$7d,$0c,$4e
	fcb	$fb,$30,$a0,$4c,$05,$14,$50,$52
	fcb	$03,$14,$41,$76,$14,$4d,$76,$7d
	fcb	$33,$a0,$42,$01,$05,$14,$2f,$1b
	fcb	$76,$32,$a0,$42,$01,$05,$76,$0c
	fcb	$a1,$fb,$a2,$00

x_tag_1b8:
	jsr	Sffeb	; unknown tag $1b8
	asl	z07
	ora	#$0a
	fcb	$0c,$0d,$0f,$12,$13,$15,$16,$18
	fcb	$19

Sfc1f:	fcb	$00
	fcb	$9d,$17,$3d,$14,$0d,$6b
	fcb	$1b,$9d,$18,$01,$b8,$b3

Sfc2c:	fcb	$00
	fcb	$01
	fcb	$1a,$1b,$14,$41,$48,$1c,$14,$50
	fcb	$48,$3a,$9d,$17,$2d,$48,$39,$1c
	fcb	$0c,$1b,$fb,$22,$35,$48,$3a,$9d
	fcb	$17,$2d,$49,$39,$3a,$4c,$08,$76
	fcb	$32,$0c,$1f,$fc,$52,$03,$0f,$77
	fcb	$00,$01,$03,$14,$1e,$9e,$15,$01
	fcb	$86,$4c,$02,$0f


Sfc62:	fcb	$00
	fcb	$34,$1b,$88
	fcb	$1a,$4c,$22,$33,$54,$3b,$9e,$16
	fcb	$0c,$56,$fc,$9f,$5e,$01,$27,$57
	fcb	$5d,$ad,$01,$26,$4e,$05,$14,$bf
	fcb	$01,$09,$13,$e9,$41,$5f,$13,$e9
	fcb	$01,$06,$52,$0c,$0e,$33,$13,$e9
	fcb	$1b,$6e,$18,$14,$bf,$01,$09


Sfc95:	fcb	$00
	fcb	$7e,$01,$03,$14,$1a,$78,$00,$0c
	fcb	$56,$fc,$9f,$5e,$ad,$01,$26,$0c
	fcb	$49,$fa,$17,$14,$32,$48,$3a,$1b
	fcb	$4c,$04,$0c,$95,$fc


Sfcb3:	fcb	$00
	fcb	$9e,$15
	fcb	$1b,$33,$4b,$4c,$04,$40,$52,$04
	fcb	$77,$0f,$33,$9e,$16,$0c,$9c,$fc
	fcb	$9e,$15,$28,$3a,$4d,$16


Sfccc:	fcb	$00
	fcb	$9e
	fcb	$15,$1b,$88,$40,$51,$0e,$42,$9e
	fcb	$16,$0c,$9c,$fc,$9e,$15,$88,$4b
	fcb	$3a,$52,$03,$77,$42,$4d,$16


Sfce5:	fcb	$00
	tag	p_call
	fdb	Sfa49
	tag	c_bang
	literal	$83
	tag	p_call
	fdb	Se1f1
	tag	rec_cnt
	tag	tag_9e
	tag	bang
	tag	rec_cnt
tfcf3:	tagrf	p_if,tfd36
	tag	p_if_its
	fcb	$81
	frel	tfcfd
	tag	cr
	tag	s_dot_t
	tagrf	p_else,tfd31
tfcfd:	tag	p_if_its
	fcb	$82
	frel	tfd05
	tag	p_call
	fdb	Sfc95
	tagrf	p_else,tfd31
tfd05:	tag	p_if_its
	fcb	$80
	frel	tfd0d
	tag	p_call
	fdb	Sfccc
	tagrf	p_else,tfd31
tfd0d:	tag	p_if_its
	fcb	$83
	frel	tfd15
	tag	p_call
	fdb	Sfcb3
	tagrf	p_else,tfd31
tfd15:	tag	p_if_its
	fcb	$85
	frel	tfd30
	tag	fast_cr
	tag	p_dot_quote
	cstr	"DELETED"
	tag	tag_9e
	tag	at
	tag	dup
	tag	delete
	tag	drop
	tag	p_call
	fdb	Sfc62
	tag	1_minus
	tag	tag_9e
	tag	bang
	tagrf	p_else,tfd31
tfd30:	tag	beep
tfd31:	tag	drop
	tag	key
	tag	0
	tagrf	p_else,tfd42
tfd36:	tag	cr
	tag	p_dot_quote
	cstr	"NO ALARMS"
tfd42:	tagrr	p_until,tfcf3


x_tag_a3:
	fcb	$00	; unknown tag $a3
	tag	dup
	tag	charbuf
	tag	c_at
	tag	p_call
	fdb	Sfb1b
	tag	times
	tag	ascii_to_bin
	tag	swap
	tag	1_plus
	tag	charbuf
	tag	c_at
	tag	p_call
	fdb	Sfb1b
	tagrf	p_if,tfd5e
	tag	ascii_to_bin
	tag	swap
	literal	10
	tag	times
	tag	plus
	tagrf	p_else,tfd5f
tfd5e:	tag	drop
tfd5f:


Sfd5f:	fcb	$00
	tag	6
	tag	tag_a3
	tag	tag_9a
	tag	mod
	tag	4
	tag	tag_a1
	tag	9
	tag	tag_a3
	tag	5
	tag	tag_a1
	tag	tag_9a
	tag	tag_a3
	tag	6
	tag	tag_a1
	literal	15
	tag	charbuf
	tag	c_at
	literal	'P'
	tag	equal_to
	tag	3
	tag	tag_a1
	literal	18
	tag	tag_a3
	tag	1_minus
	tag	0
	tag	tag_a1
	literal	21
	tag	tag_a3
	tag	1_minus
	tag	1
	tag	tag_a1
	literal	24

Lfd85:	tag	tag_a3
	literal	$14
	tag	plus
	literal	$64
	tag	mod
	tag	2
	tag	tag_a1
	tag	p_call
	fdb	Lfacf


x_e_dot_t:
	fcb	$00	; E.T
	tag	get_local
	tag	2dup
	tag	p_call
	fdb	Sfb11
	tag	p_call
	fdb	Sfbe5
	tag	6
	tag	smart_posn
	tag	0
	tag	tag_9d
	tag	c_bang
	tag	key
tfda0:	tag	p_if_its
	fcb	$81
	frel	tfda9
	tag	minus_1
	tag	p_call
	fdb	Sfc1f
	tagrf	p_else,tfdbb
tfda9:	tag	p_if_its
	fcb	$82
	frel	tfdb2
	tag	1
	tag	p_call
	fdb	Sfc1f
	tagrf	p_else,tfdbb
tfdb2:	tag	p_if_its
	fcb	$0d
	frel	tfdb7
	tagrf	p_else,tfdbb
tfdb7:	tag	dup
	tag	p_call
	fdb	Sfc2c
tfdbb:	literal	$0d
	tag	equal_to
	tagrr	p_until,tfda0
	tag	p_call
	fdb	Sfd5f
	tag	tag_9f
	tag	2bang


x_set_time:
	fcb	$00	; STM
	tag	e_dot_t
	tag	tag_9f
	tag	2at
	literal	$7f7f
	literal	d58fc
	tag	bang
	literal	d0379
	tag	2bang
	literal	$10
	literal	d58fb
	tag	c_bang
	tag	0
	literal	d58fc
	tag	bang


Sfddf:	fcb	$00
	tag	p_dot_quote
	cstr	", TYPE ENTER"
	tag	e_dot_t
	tag	fast_cr
	tag	p_dot_quote
	cstr	"MESSAGE:"
	tag	tag_103
	literal	$1a
	tag	2dup
	tag	blanks
	tag	0
	tag	0
	literal	$9701
	tag	0
	tag	expect
	tag	fdrop
	literal	De665
	literal	z22
	tag	bang
	tag	tag_103
	literal	$1e
	tag	rec_cnt
	tag	insert
	tag	query_enough_room
	tag	p_call
	fdb	Sfc62


x_show_time:
	fcb	$00	; SHOW.TIME
	fcb	$14	; ??? literal, value is next two tags
tfe1c:	tag	plus
	tag	6
	tag	tag_9c
	tag	c_bang
	literal	d02df
	tag	to_r
	tag	6
tfe24:	tag	tag_a0
	tag	dup
	tag	tag_9b
	tagrf	p_less_if,tfe2f
	literal	$0a
	tag	smart_posn
	tag	tag_a2
	tagrf	p_else,tfe38
tfe2f:	tag	drop
	tag	get_local
	tag	2dup
	tag	tag_9f
	tag	2bang
	tag	r
	tag	2bang
	tag	s_dot_t
tfe38:	tag	r
	tag	2at
	tag	1
	tag	0
	tag	d_plus
	tag	r
	tag	2bang
	literal	D02dd
	tag	set_timer
	tag	1
	tag	6
	tag	tag_9c
	tag	plus_c_bang
	literal	d02dd
	tag	wait
	literal	d0379
	tag	c_at
	literal	vtime+1
	tag	c_at
	tag	minus
	tag	5
	tag	greater_than
	tagrr	p_until,tfe24
	tag	r_to
	tag	drop
	tagrr	p_again,tfe1c


x_tag_1bc:
	fcb	$00	; unknown tag $1bc
	tag	p_if_its
	fcb	$00
	frel	tfe60
	tag	p_call
	fdb	Sfddf
tfe60:	tag	p_if_its
	fcb	$01
	frel	tfe68
	literal	z32
	tag	p_call
	fdb	Sfce5
tfe68:	tag	p_if_its
	fcb	$02
	frel	tfe70
	literal	z33
	tag	p_call
	fdb	Sfce5
tfe70:	tag	p_if_its
	fcb	$03
	frel	tfe75
	tag	show_time
tfe75:	tag	p_if_its
	fcb	$04
	frel	tfe7a
	tag	set_time
tfe7a:	tag	drop
	tag	0

	fcb	$00


Dfe7d:	cstr	"SET ALARM"
	cstr	"REVIEW"
	cstr	"ACKNOWLEDGE"
	cstr	"TIME"
	cstr	"SET TIME"


x_tag_1bd:
	fcb	$00	; unknown tag $1bd
	literal	Dfe7d
	tag	at_sa
	tag	type


x_tag_1be:
	fcb	$00	; unknown tag $1be
	tag	5
	tagrf	p_less_if,tfeb9
	literal	$bd01
	tag	1
	tagrf	p_else,tfeba
tfeb9:	tag	0
tfeba:
	fcb	$00


Dfebb:	fcb	$01,$ff


x_tag_1bf:
	fcb	$00	; unknown tag $1bf
	tag	flame_on
	literal	Dfebb
	tag	count
	tag	2dup
	tag	open
	tagrf	p_if,tfecc
	tag	2drop
	tagrf	p_else,Tfed4
Tfecc:	tag	make
	tagrf	p_if,Tfed4
	tag	9
	tag	cfile
	tag	2_plus
	tag	c_bang
Tfed4:	tag	1
Tfed5:	literal	$bc01		; executer
	literal	$be01		; selecter
	tag	menu_driver
	tagrr	p_again,Tfed5


Lfede:	fcb	$00
	tag	p_dot_quote
	cstr	"RESTART"
	tag	key
	tag	hard_clr


x_intaps:
	jsr	Sffee	; INTAPS

	fcb	$01,$b5,$01,$bf,$01,$a5,$01,$ca


; main manu executer
x_tag_1c1:
	fcb	$00	; unknown tag $1c1
	tag	0
	tag	3
	tag	query_range
	tag	p_if
	fcb	$05
	tag	intaps
	tag	flee
	tag	3
	tag	minus
	tag	loc_prg
	tag	p_if
	fcb	$09
	tag	p_if
	fcb	$05
	tag	flee_crom
	tag	p_else
	fcb	$03
	tag	flee_cap
	tag	1
	fcb	$00


Dff10:	cstr	"CALCULATOR"
	cstr	"CLOCK/CONTROLLER"
	cstr	"FILE SYSTEM"
	cstr	"RUN SNAP PROGRAMS"

x_tag_1c2:
	fcb	$00	; unknown tag $1c2
	literal	Dff10
	tag	at_sa
	tag	type


x_tag_1c3:
	fcb	$00	; unknown tag $1c3
	tagrf	p_if,tff5c
	tag	drop
	literal	ctrid
	tag	count
	tag	plus
	tagrf	p_else,tff5f
tff5c:	literal	romid
tff5f:	tag	count
	tag	typedrop


; main menu selecter
x_tag_1c4:
	fcb	$00	; unknown tag $1c4
	tag	0
	tag	3
	tag	query_range
	tagrf	p_if,tff6f
	tag	drop
	literal	$c201
	tag	1
	tagrf	p_else,tff7a
tff6f:	tag	3
	tag	minus
	tag	loc_prg
	tag	dup
	tagrf	p_if,tff7a
	literal	$c301
	tag	swap
tff7a:


x_tag_1c5:
	fcb	$00	; unknown tag $1c5
	tag	1		; 1 d0216 C!
	literal	d0216
	tag	c_bang
	tag	0
	tag	query_room	; ?ROOM ?ENOUGH-ROOM 1
	tag	query_enough_room
	tag	1
tff83:	literal	$c101		; BEGIN tag 1c1 ; executer
	literal	$c401		; tag 1c4   	; selecter
	tag	menu_driver	; MENU-DRIVER REPEAT
	tagrr	p_again,tff83


	fcb	$00,$00,$00,$00,$00,$00,$00
	fcb	$00,$00,$00,$00,$00,$00,$00,$00
	fcb	$00,$00,$00,$00,$00

	cstr	"THE REST IS SILENCE " ; Alas, poor Hamlet!

	fcb	$00,$00,$00

	fdb	Lcfd5
	fdb	Lcfda
	fdb	Lcd78
	fdb	Lcd72
	fdb	Lcd8c
	fdb	x_2drop
	fdb	Lcd6a
	fdb	x_drop
	fdb	Lcd64

x_scomp		jmp	scomp
x_ucomp:	jmp	ucomp
x_sleep:	jmp	sleep
x_setup:	jmp	setup
x_dodoes:	jmp	dodoes
x_dolatch:	jmp	dolatch
		jmp	Le123
		jmp	Le15c
		jmp	Le174
		jmp	Le170
		jmp	Le195
Sffeb:		jmp	Le1a5
Sffee:		jmp	Le1b5
v_getmem:	jmp	getmem
v_getmemt:	jmp	getmemt
v_postecb:	jmp	postecb

		fdb	jnmi
		fdb	reset
		fdb	jirq
