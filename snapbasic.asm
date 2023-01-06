; SnapBASIC for HHC

	cpu	6502

; counted string, first byte is count of characters that follow
cstr	macro	str
	fcb	end-start
start:	fcb	str
end:
	endm

; string with MSB of first character ste
mstr	macro	str
	fcb	charfromstr(str, 0)+$80
	if	strlen(str) > 1
	fcb	substr(str, 1, strlen(str)-1)
	endif
	endm

; Inserts a tag by number into a SNAP word being defined.
ntag	macro	tnum
	if	tnum<$100
	fcb	tnum
	else
	fcb	tnum>>8,tnum&$ff
	endif
	endm

t_lit	equ	$11
t_clit3	equ	$12
t_clit2	equ	$13
t_clit	equ	$14

literal	macro	num
	if	(num >= $0000) && (num <= $00ff)
	fcb	t_clit,num
	elseif	(num >= $0200) && (num <= $02ff)
	fcb	t_clit2,num-$0200
	elseif	(num >= $0300) && (num <= $03ff)
	fcb	t_clit3,num-$0300
	else
	fcb	t_lit,num&$ff,num>>8
	endif
	endm

Z00	equ	$00
Z01	equ	$01
Z02	equ	$02
Z03	equ	$03
next	equ	$09
Z15	equ	$15
Z16	equ	$16
Z39	equ	$39
Z41	equ	$41
S42	equ	$42
Z43	equ	$43
Z44	equ	$44
Z45	equ	$45
Z46	equ	$46
Z47	equ	$47
Z48	equ	$48
Z49	equ	$49
Z4a	equ	$4a
Z4b	equ	$4b
Z4e	equ	$4e
Z4f	equ	$4f
Z51	equ	$51
Z52	equ	$52
Z53	equ	$53
Z54	equ	$54
Z55	equ	$55
Z56	equ	$56
Z57	equ	$57
Z5e	equ	$5e
Z5f	equ	$5f
Z60	equ	$60
Z62	equ	$62
S75	equ	$75
Z76	equ	$76
Z79	equ	$79
Z7a	equ	$7a
Zf6	equ	$f6
D0101	equ	$0101
D0102	equ	$0102
D0103	equ	$0103
D0104	equ	$0104
D0105	equ	$0105
D0106	equ	$0106
D0107	equ	$0107
D0108	equ	$0108
D0109	equ	$0109
D010a	equ	$010a

tvect0	equ	$021b
tvect0_bank	equ	tvect0+2
tvect3 	equ	tvect0+(3*3)

D0278	equ	$0278
	
Xc000	equ	$c000
Xc02a	equ	$c02a
Xc02e	equ	$c02e
Dc128	equ	$c128
Dc129	equ	$c129
Dc2cc	equ	$c2cc
Dc2cd	equ	$c2cd
Dc2d8	equ	$c2d8
Dc2d9	equ	$c2d9
Dc2da	equ	$c2da
Dc2db	equ	$c2db
Xffc6	equ	$ffc6
Xffc8	equ	$ffc8
Sffeb	equ	$ffeb
Sffee	equ	$ffee

	org	$4000
		fcb	$26

		fcb	"COPYRIGHT FRIENDS AMIS INC. HarmB 1982"
		fcb	$c0

; $4028

romvect:	fdb	tag_table_2

romext:		fcb	$02	; uses long tag table 2 (will also add table 3)

cspeed:		fcb	$84	; shows in menu, and is a "slow ROM"

romid:		cstr	"SnapBASIC"

		fcb	"Utrecht"

short_extrinsic_tag_table:
		fdb	x_tag_c0
		fdb	x_tag_c1
		fdb	x_tag_c2
		fdb	x_tag_c3
		fdb	x_tag_c4
		fdb	x_tag_c5
		fdb	x_tag_c6
		fdb	x_tag_c7
		fdb	x_tag_c8
		fdb	x_tag_c9
		fdb	x_tag_ca
v_tag_cb:	fdb	x_tag_cb
		fdb	x_tag_cc
		fdb	x_tag_cd
		fdb	x_tag_ce
		fdb	x_tag_cf
		fdb	x_tag_d0
		fdb	x_tag_d1
		fdb	x_tag_d2
		fdb	x_tag_d3
		fdb	x_tag_d4
		fdb	x_tag_d5
		fdb	x_tag_d6
v_tag_d7:	fdb	x_tag_d7
v_tag_d8:	fdb	x_tag_d8
		fdb	x_tag_d9
		fdb	x_tag_da
		fdb	x_tag_db
		fdb	x_tag_dc
		fdb	x_tag_dd
		fdb	x_tag_de
		fdb	x_tag_df
		fdb	x_tag_e0
		fdb	x_tag_e1
		fdb	x_tag_e2
		fdb	x_tag_e3
		fdb	x_tag_e4
		fdb	x_tag_e5
		fdb	x_tag_e6
		fdb	x_tag_e7
		fdb	x_tag_e8
		fdb	x_tag_e9
		fdb	x_tag_ea
		fdb	x_tag_eb
		fdb	x_tag_ec
		fdb	x_tag_ed
		fdb	x_tag_ee
		fdb	x_tag_ef
		fdb	x_tag_f0
		fdb	x_tag_f1
		fdb	x_tag_f2
		fdb	x_tag_f3
		fdb	x_tag_f4
		fdb	x_tag_f5
		fdb	x_tag_f6
		fdb	x_tag_f7
		fdb	x_tag_f8
		fdb	x_tag_f9
		fdb	x_tag_fa
		fdb	x_tag_fb
		fdb	x_tag_fc
		fdb	x_tag_fd
		fdb	x_tag_fe
		fdb	x_tag_ff

tag_table_2:
		fdb	x_tag_200
		fdb	x_tag_201
v_tag_202:	fdb	x_tag_202
		fdb	x_tag_203
		fdb	x_tag_204
v_tag_205:	fdb	x_tag_205
		fdb	x_tag_206
		fdb	x_tag_207
		fdb	x_tag_208
v_tag_209:	fdb	x_tag_209
		fdb	x_tag_20a
		fdb	x_tag_20b
		fdb	x_tag_20c
		fdb	x_tag_20d
		fdb	x_tag_20e
		fdb	x_tag_20f
		fdb	x_tag_210
		fdb	x_tag_211
		fdb	x_tag_212
		fdb	x_tag_213
		fdb	x_tag_214
		fdb	x_tag_215
		fdb	x_tag_216
		fdb	x_tag_217
		fdb	x_tag_218
		fdb	x_tag_219
		fdb	x_tag_21a
		fdb	x_tag_21b
		fdb	x_tag_21c
		fdb	x_tag_21d
		fdb	x_tag_21e
		fdb	x_tag_21f
		fdb	x_tag_220
		fdb	x_tag_221
		fdb	x_tag_222
		fdb	x_tag_223
		fdb	x_tag_224
		fdb	x_tag_225
		fdb	x_tag_226
		fdb	x_tag_227
		fdb	x_tag_228
		fdb	x_tag_229
		fdb	x_tag_22a
		fdb	x_tag_22b
		fdb	x_tag_22c
		fdb	x_tag_22d
		fdb	x_tag_22e
		fdb	x_tag_22f
		fdb	x_tag_230
		fdb	x_tag_231
		fdb	x_tag_232
		fdb	x_tag_233
		fdb	x_tag_234
		fdb	x_tag_235
		fdb	x_tag_236
		fdb	x_tag_237
		fdb	x_tag_238
		fdb	x_tag_239
		fdb	x_tag_23a
		fdb	x_tag_23b
		fdb	x_tag_23c
		fdb	x_tag_23d
		fdb	x_tag_23e
		fdb	x_tag_23f
		fdb	x_tag_240
		fdb	x_tag_241
		fdb	x_tag_242
		fdb	x_tag_243
		fdb	x_tag_244
		fdb	x_tag_245
		fdb	x_tag_246
		fdb	x_tag_247
		fdb	x_tag_248
		fdb	x_tag_249
		fdb	x_tag_24a
		fdb	x_tag_24b
		fdb	x_tag_24c
		fdb	x_tag_24d
		fdb	x_tag_24e
		fdb	x_tag_24f
		fdb	x_tag_250
		fdb	x_tag_251
		fdb	x_tag_252
		fdb	x_tag_253
		fdb	x_tag_254
		fdb	x_tag_255
		fdb	x_tag_256
		fdb	x_tag_257
		fdb	x_tag_258
		fdb	x_tag_259
		fdb	x_tag_25a
		fdb	x_tag_25b
		fdb	x_tag_25c
v_tag_25d:	fdb	x_tag_25d
		fdb	x_tag_25e
v_tag_25f:	fdb	x_tag_25f
		fdb	x_tag_260
		fdb	x_tag_261
		fdb	x_tag_262
		fdb	x_tag_263
		fdb	x_tag_264
		fdb	x_tag_265
		fdb	x_tag_266
		fdb	x_tag_267
		fdb	x_tag_268
		fdb	x_tag_269
		fdb	x_tag_26a
		fdb	x_tag_26b
		fdb	x_tag_26c
		fdb	x_tag_26d
		fdb	x_tag_26e
		fdb	x_tag_26f
		fdb	x_tag_270
		fdb	x_tag_271
		fdb	x_tag_272
		fdb	x_tag_273
		fdb	x_tag_274
		fdb	x_tag_275
		fdb	x_tag_276
		fdb	x_tag_277
		fdb	x_tag_278
		fdb	x_tag_279
		fdb	x_tag_27a
		fdb	x_tag_27b
		fdb	x_tag_27c
		fdb	x_tag_27d
		fdb	x_tag_27e
		fdb	x_tag_27f
		fdb	x_tag_280
		fdb	x_tag_281
		fdb	x_tag_282
		fdb	x_tag_283
		fdb	x_tag_284
		fdb	x_tag_285
		fdb	x_tag_286
		fdb	x_tag_287
		fdb	x_tag_288
		fdb	x_tag_289
		fdb	x_tag_28a
		fdb	x_tag_28b
		fdb	x_tag_28c
		fdb	x_tag_28d
		fdb	x_tag_28e
		fdb	x_tag_28f
		fdb	x_tag_290
		fdb	x_tag_291
		fdb	x_tag_292
		fdb	x_tag_293
		fdb	x_tag_294
		fdb	x_tag_295
		fdb	x_tag_296
		fdb	x_tag_297
		fdb	x_tag_298
		fdb	x_tag_299
		fdb	x_tag_29a
		fdb	x_tag_29b
		fdb	x_tag_29c
		fdb	x_tag_29d
		fdb	x_tag_29e
		fdb	x_tag_29f
		fdb	x_tag_2a0
		fdb	x_tag_2a1
		fdb	x_tag_2a2
		fdb	x_tag_2a3
		fdb	x_tag_2a4
		fdb	x_tag_2a5
		fdb	x_tag_2a6
		fdb	x_tag_2a7
		fdb	x_tag_2a8
		fdb	x_tag_2a9
		fdb	x_tag_2aa
		fdb	x_tag_2ab
		fdb	x_tag_2ac
		fdb	x_tag_2ad
		fdb	x_tag_2ae
		fdb	x_tag_2af
		fdb	x_tag_2b0
		fdb	x_tag_2b1
		fdb	x_tag_2b2
		fdb	x_tag_2b3
		fdb	x_tag_2b4
		fdb	x_tag_2b5
		fdb	x_tag_2b6
		fdb	x_tag_2b7
		fdb	x_tag_2b8
		fdb	x_tag_2b9
		fdb	x_tag_2ba
		fdb	next
v_tag_2bc:	fdb 	x_tab_2bc
		fdb	x_tag_2bd
		fdb	x_tag_2be
		fdb	x_tag_2bf
		fdb	x_tag_2c0
		fdb	x_tag_2c1
		fdb	x_tag_2c2
		fdb	x_tag_2c3
		fdb	x_tag_2c4
		fdb	x_tag_2c5
		fdb	x_tag_2c6
		fdb	x_tag_2c7
		fdb	x_tag_2c8
		fdb	x_tag_2c9
		fdb	x_tag_2ca
		fdb	x_tag_2cb
		fdb	x_tag_2cc
		fdb	x_tag_2cd
		fdb	x_tag_2ce
		fdb	x_tag_2cf
		fdb	x_tag_2d0
		fdb	x_tag_2d1
		fdb	x_tag_2d2
		fdb	x_tag_2d3
		fdb	x_tag_2d4
		fdb	x_tag_2d5
		fdb	x_tag_2d6
		fdb	x_tag_2d7
		fdb	x_tag_2d8
		fdb	x_tag_2d9
		fdb	x_tag_2da
		fdb	x_tag_2db
		fdb	x_tag_2dc
		fdb	x_tag_2dd
		fdb	x_tag_2de
		fdb	x_tag_2df
		fdb	x_tag_2e0
		fdb	x_tag_2e1
		fdb	x_tag_2e2
		fdb	x_tag_2e3
		fdb	x_tag_2e4
		fdb	x_tag_2e5
		fdb	x_tag_2e6
		fdb	x_tag_2e7
		fdb	x_tag_2e8
		fdb	x_tag_2e9
		fdb	x_tag_2ea
		fdb	x_tag_2eb
		fdb	x_tag_2ec
		fdb	x_tag_2ed
		fdb	x_tag_2ee
		fdb	x_tag_2ef
		fdb	x_tag_2f0
		fdb	x_tag_2f1
		fdb	x_tag_2f2
		fdb	x_tag_2f3
		fdb	x_tag_2f4
		fdb	x_tag_2f5
		fdb	x_tag_2f6
		fdb	x_tag_2f7
		fdb	x_tag_2f8
		fdb	x_tag_2f9
		fdb	x_tag_2fa
		fdb	x_tag_2fb
		fdb	x_tag_2fc
		fdb	x_tag_2fd
		fdb	x_tag_2fe
		fdb	x_tag_2ff
	
tag_table_3:
		fdb	x_tag_300
		fdb	x_tag_301
		fdb	x_tag_302
		fdb	x_tag_303
		fdb	x_tag_304
		fdb	x_tag_305
		fdb	x_tag_306
		fdb	x_tag_307
		fdb	x_tag_308
		fdb	x_tag_309
		fdb	x_tag_30a
		fdb	x_tab_30b
		fdb	x_tag_30c
		fdb	x_tag_30d
		fdb	x_tag_30e
		fdb	x_tag_30f
		fdb	x_tag_310
		fdb	x_tag_311
		fdb	x_tag_312
		fdb	x_tag_313
		fdb	x_tag_314
		fdb	x_tag_315
		fdb	x_tag_316
		fdb	x_tag_317
		fdb	x_tag_318
		fdb	x_tag_319
		fdb	x_tag_31a
		fdb	x_tag_31b
		fdb	x_tag_31c
		fdb	x_tag_31d
		fdb	x_tag_31e
		fdb	x_tag_31f
		fdb	x_tag_320
		fdb	x_tag_321
		fdb	x_tag_322
		fdb	x_tag_323
		fdb	x_tag_324
		fdb	x_tag_325
		fdb	x_tag_326
		fdb	x_tag_327
		fdb	x_tag_328
		fdb	x_tag_329
		fdb	x_tag_32a
		fdb	x_tag_32b
		fdb	x_tag_32c
		fdb	x_tag_32d
		fdb	x_tag_32e
		fdb	x_tag_32f
		fdb	x_tag_330
		fdb	x_tag_331
		fdb	x_tag_332
		fdb	x_tag_333
		fdb	x_tag_334
		fdb	x_tag_335
		fdb	x_tag_336
		fdb	x_tag_337
		fdb	x_tag_338
		fdb	x_tag_339
		fdb	x_tag_33a
		fdb	x_tag_33b
		fdb	x_tag_33c
		fdb	x_tag_33d
		fdb	x_tag_33e
		fdb	x_tag_33f
		fdb	x_tag_340

; the following entries might really just be data rather than tags
		fdb	x_tag_341
		fdb	x_tag_342
		fdb	x_tag_343

D4345:	fcb	$00,$01,$01,$01,$04,$d4,$02
	fcb	$0b,$02,$c3,$04,$d4,$02,$0c,$02
	fcb	$c5,$02,$c3,$02,$c4,$03,$02,$12
	fcb	$01,$03,$02,$02,$01,$02,$cb,$01
	fcb	$01,$01,$01,$05,$02,$1c,$02,$1f
	fcb	$05,$02,$1d,$02,$1f,$05,$02,$1c
	fcb	$02,$1f,$05,$02,$1e,$02,$1f,$05
	fcb	$02,$6a,$02,$6b,$01,$01,$01,$01
	fcb	$06,$02,$67,$d1,$02,$68,$01,$01
	fcb	$01,$01,$03,$02,$63,$01,$02,$ca
	fcb	$03,$02,$09,$03,$02,$09,$0d,$cc
	fcb	$d4,$d5,$d7,$02,$50,$02,$52,$02
	fcb	$53,$02,$63,$09,$02,$50,$02,$52
	fcb	$02,$53,$02,$63,$01,$01,$01,$03
	fcb	$02,$07,$04,$02,$08,$d7,$04,$02
	fcb	$08,$d7,$03,$02,$06,$05,$02,$07
	fcb	$02,$03,$06,$02,$07,$02,$03,$d7
	fcb	$05,$02,$07,$02,$03,$03,$02,$07
	fcb	$03,$02,$69,$05,$02,$69,$02,$04
	fcb	$03,$02,$06,$03,$02,$06,$04,$02
	fcb	$08,$d8,$04,$02,$08,$d8,$03,$02
	fcb	$06,$05,$02,$07,$02,$03,$05,$02
	fcb	$07,$02,$03,$05,$02,$07,$02,$03
	fcb	$01,$03,$02,$04,$01,$01,$01,$01
	fcb	$03,$02,$03,$01,$01,$03,$02,$06
	fcb	$03,$02,$06,$03,$02,$0a,$03,$d7
	fcb	$d2,$01,$01,$03,$02,$12,$03,$02
	fcb	$0f,$03,$02,$12,$03,$02,$0d,$03
	fcb	$02,$12,$01,$01,$03,$02,$0c,$01
	fcb	$02,$cc,$03,$02,$19,$05,$02,$16
	fcb	$02,$6a,$0f,$02,$50,$02,$53,$02
	fcb	$52,$02,$51,$02,$b6,$02,$b7,$02
	fcb	$b1,$05,$02,$4d,$d3,$d5,$06,$02
	fcb	$a3,$02,$a2,$cc,$03,$02,$02,$03
	fcb	$02,$02,$03,$02,$02,$01,$03,$02
	fcb	$89,$01,$03,$02,$21,$05,$02,$17
	fcb	$02,$21,$01,$03,$02,$21,$01,$01
	fcb	$01,$01,$01,$03,$02,$2a,$05,$02
	fcb	$36,$02,$2d,$03,$02,$2b,$01,$03
	fcb	$02,$2e,$05,$02,$6a,$02,$2e,$03
	fcb	$02,$2e,$03,$02,$2e,$03,$02,$2e
	fcb	$05,$02,$2e,$02,$b9,$05,$02,$2e
	fcb	$02,$b9,$01,$01,$01,$03,$02,$37
	fcb	$01,$03,$02,$51,$05,$02,$49,$02
	fcb	$36,$05,$02,$53,$02,$54,$01,$05
	fcb	$02,$16,$02,$3d,$03,$02,$25,$05
	fcb	$02,$47,$02,$3f,$06,$02,$47,$02
	fcb	$3f,$cc,$07,$02,$47,$02,$3a,$02
	fcb	$6a,$03,$02,$47,$01,$01,$05,$02
	fcb	$46,$02,$49,$03,$02,$53,$07,$02
	fcb	$4f,$02,$48,$02,$50,$03,$02,$78
	fcb	$01,$01,$01,$01,$01,$01,$01,$01
	fcb	$01,$01,$01,$01,$03,$02,$2c,$01
	fcb	$1c,$02,$58,$02,$55,$02,$5a,$c0
	fcb	$c1,$c2,$02,$61,$02,$62,$02,$5c
	fcb	$02,$5b,$02,$39,$02,$29,$02,$57
	fcb	$02,$05,$02,$5d,$01,$01,$01,$01
	fcb	$01,$01,$01,$01,$01,$01,$03,$02
	fcb	$4c,$05,$02,$4c,$02,$63,$01,$03
	fcb	$02,$68,$03,$02,$6a,$01,$05,$02
	fcb	$6c,$02,$69,$01,$0b,$02,$6d,$02
	fcb	$56,$02,$6e,$02,$70,$02,$71,$01
	fcb	$03,$02,$6f,$03,$02,$73,$01,$03
	fcb	$02,$72,$01,$01,$01,$01,$06,$02
	fcb	$aa,$d2,$02,$75,$02,$cb,$03,$02
	fcb	$6a,$03,$02,$17,$03,$02,$19,$01
	fcb	$01,$01,$01,$01,$01,$01,$06,$02
	fcb	$75,$d5,$d3,$d4,$02,$c3,$02,$c4
	fcb	$01,$01,$05,$02,$50,$02,$53,$0b
	fcb	$02,$6a,$02,$6b,$02,$50,$02,$52
	fcb	$02,$53,$05,$02,$8a,$02,$87,$05
	fcb	$02,$6a,$02,$6b,$03,$02,$8a,$03
	fcb	$02,$b8,$03,$02,$b8,$01,$01,$01
	fcb	$03,$02,$6a,$03,$02,$6c,$01,$03
	fcb	$02,$2e,$01,$05,$02,$2e,$02,$b9
	fcb	$05,$02,$2e,$02,$b9,$01,$01,$01
	fcb	$07,$cc,$02,$0b,$02,$75,$d4,$01
	fcb	$01,$06,$02,$18,$cb,$02,$4e,$03
	fcb	$02,$a8,$05,$02,$ab,$02,$a8,$0b
	fcb	$02,$b5,$02,$b2,$02,$ae,$02,$b4
	fcb	$02,$4d,$0a,$c3,$02,$4d,$02,$b2
	fcb	$02,$b4,$02,$b0,$03,$02,$a4,$0a
	fcb	$02,$b1,$02,$b0,$02,$b4,$cb,$02
	fcb	$4d,$02,$d3,$09,$02,$b1,$d3,$d2
	fcb	$d5,$d4,$02,$b0,$0b,$02,$aa,$02
	fcb	$a3,$02,$ac,$02,$ae,$02,$75,$08
	fcb	$02,$b5,$02,$b2,$cb,$02,$a9,$07
	fcb	$02,$b3,$02,$ae,$02,$b4,$01,$01
	fcb	$01,$01,$04,$d4,$02,$0b,$03,$02
	fcb	$69,$07,$02,$aa,$02,$ad,$02,$b5
	fcb	$01,$07,$02,$aa,$cc,$cb,$02,$b3
	fcb	$06,$d3,$02,$75,$d4,$d2,$08,$02
	fcb	$4e,$d3,$d7,$d2,$d4,$d5,$03,$02
	fcb	$ae,$05,$02,$6a,$02,$b7,$01,$03
	fcb	$02,$b6,$03,$02,$5b

x_tag_c0:
	lda	(Z15),Y
	inc	Z15
	bne	L4641
	inc	Z16
L4641:	tay
	lda	(Z39),Y
	pha
	iny
	lda	(Z39),Y
	jmp	(Xffc8)

x_tag_c1:
	lda	(Z15),Y
	inc	Z15
	bne	L4653
	inc	Z16
L4653:	tay
	lda	Z00,X
	sta	(Z39),Y
	iny
	lda	Z01,X
	sta	(Z39),Y
	jmp	(Xffc6)

x_tag_c2:
	lda	(Z15),Y
	inc	Z15
	bne	L4668
	inc	Z16
L4668:	tay
	lda	Z00,X
	adc	(Z39),Y
	sta	(Z39),Y
	iny
	lda	Z01,X
	adc	(Z39),Y
	sta	(Z39),Y
	jmp	(Xffc6)

x_tag_c3:
	fcb	$00
	fcb	$d4,$02,$0b

x_tag_c4:
	fcb	$00
	fcb	$01,$1f,$c3

x_tag_c5:
	fcb	$00
	fcb	$d4,$02,$0c

x_tag_c6:
	fcb	$00
	fcb	$c5,$28

x_tag_c7:
	fcb	$00
	fcb	$c3,$28

x_tag_c8:
	fcb	$00
	fcb	$c4,$28

x_tag_c9:
	fcb	$00
	fcb	$02,$12,$28

x_tag_ca:
	fcb	$00
	fcb	$4b,$28,$00

x_tag_cb:
	stx	Z62
	ldy	#$20
	lda	#$00
L469c:	sta	Z41,Y
	dey
	bne	L469c
	lda	v_tag_cb
	adc	#$82
	sta	Z56
	lda	v_tag_cb+1
	adc	#$00
	sta	Z57
	lda	Z01,X
	and	#$80
	sta	Z5e
	bpl	L46c3
	sec
	tya
	sbc	Z00,X
	sta	Z00,X
	tya
	sbc	Z01,X
	sta	Z01,X
L46c3:	lda	#$55
	sta	Z52
	ldy	#$09
L46c9:	lda	#$00
	sta	Z53
	sec
L46ce:	lda	Z00,X
	sbc	(Z56),Y
	sta	Z54
	dey
	lda	Z01,X
	sbc	(Z56),Y
	iny
	bcc	L46e6
	sta	Z01,X
	lda	Z54
	sta	Z00,X
	inc	Z53
	bcs	L46ce
L46e6:	ldx	Z55
	asl	Z52
	lda	Z53
	bcc	L46f5
	inx
	stx	Z55
	asl
	asl
	asl
	asl
L46f5:	ora	Z43,X
	sta	Z43,X
	ldx	Z62
	dey
	dey
	bpl	L46c9
	sec
	txa
	sbc	#$0e
	sta	Z62
	lda	#$40
	sta	Z60
	lda	#$00
	sta	Z56
	sta	Z57
	lda	Dc128
	ldy	Dc129
	jmp	(v_tag_202)

	fcb	$00,$01,$00,$0a,$00,$64,$03,$e8
	fcb	$27,$10

x_tag_cc:
	stx	Z62
	ldy	#$20
	lda	#$00
L4728:	sta	Z41,Y
	dey
	bne	L4728
	lda	Z00,X
	and	#$7f
	sec
	sbc	#$40
	sta	Z5f
	lda	Z01,X
	and	#$f0
	sta	Z60
	ldy	#$03
L473f:	cpy	#$10
	beq	L479f
	lda	Z5f
	bmi	L479f
	tya
	lsr
	clc
	adc	Z62
	tax
	tya
	lsr
	lda	Z00,X
	bcs	L4757
	lsr
	lsr
	lsr
	lsr
L4757:	and	#$0f
	sta	Z51
	lda	Z52
	asl
	rol	Z53
	bmi	L4788
	sta	Z54
	ldx	Z53
	stx	Z55
	asl
	rol	Z53
	bmi	L4788
	asl
	rol	Z53
	bmi	L4788
	clc
	adc	Z51
	bcc	L477c
	inc	Z53
	bmi	L4788
	clc
L477c:	adc	Z54
	sta	Z52
	lda	Z53
	adc	Z55
	sta	Z53
	bpl	L4791
L4788:	ldx	Z62
	lda	#$49
	ldy	#$51
	jmp	(v_tag_205)

L4791:	sec
	lda	Z60
	sbc	#$10
	sta	Z60
	bcs	L479c
	dec	Z5f
L479c:	iny
	bne	L473f
L479f:	ldx	Z62
	lda	Z00,X
	bpl	L47b2
	sec
	lda	#$00
	sbc	Z52
	sta	Z52
	lda	#$00
	sbc	Z53
	sta	Z53
L47b2:	clc
	txa
	adc	#$06
	tax
	lda	Z52
	sta	Z00,X
	lda	Z53
	sta	Z01,X
	jmp	next

x_tag_cd	equ	*-1
	fcb	$26,$26,$cb,$27,$27,$00

x_tag_ce:
	lda	Z00,X
	adc	Z02,X
	sta	Z02,X
	lda	Z01,X
	adc	Z03,X
	sta	Z03,X
	bvc	L47dd
	lda	#$4f
	ldy	#$56
	jmp	(v_tag_205)

L47dd:	jmp	(Xffc6)

x_tag_cf:
	sec
	lda	Z02,X
	sbc	Z00,X
	sta	Z02,X
	lda	Z03,X
	sbc	Z01,X
	sta	Z03,X
	bvc	L47f6
	lda	#$4f
	ldy	#$56
	jmp	(v_tag_205)

L47f6:	jmp	(Xffc6)

x_tag_d0:
	fcb	$00
	fcb	$5d,$a6,$23,$64,$22,$64,$ab,$1c
	fcb	$29,$3a,$4c,$06,$11,$4f,$56,$02
	fcb	$5d,$24,$29,$4c,$02,$63

x_tag_d1:
	fcb	$00
	fcb	$24,$1b,$79,$3d,$23

x_tag_d2:
	fcb	$00
	fcb	$02,$1c,$02,$1f

x_tag_d3:
	fcb	$00
	fcb	$02,$1d,$02,$1f

x_tag_d4:
	fcb	$00
	fcb	$37,$a6,$02,$1c,$02,$1f

x_tag_d5:
	fcb	$00
	fcb	$1b,$4c,$05,$02,$1e,$02,$1f,$11
	fcb	$49,$51,$02,$5d

x_tag_d6:
	fcb	$00
	fcb	$2f,$1d,$5d,$3d,$14,$ff,$67,$1b
	fcb	$20,$3e,$1c,$26,$02,$6a,$0e,$23
	fcb	$c1,$28,$5d,$3d,$c0,$26,$50,$04
	fcb	$0f,$52,$07,$c0,$26,$20,$20,$02
	fcb	$6b,$27,$02,$6b,$24,$00

x_tag_d7:
	lda	Z00,X
	sta	S42
	lda	Z01,X
	sta	Z43
	inx
	inx
	ldy	#$07
L4867:	lda	(S42),Y
	dex
	sta	Z00,X
	dey
	bpl	L4867
	jmp	next

x_tag_d8:
	lda	Z00,X
	sta	S42
	lda	Z01,X
	sta	Z43
	inx
	inx
	ldy	#$00
L487e:	lda	Z00,X
	inx
	sta	(S42),Y
	iny
	cpy	#$08
	bne	L487e
	jmp	(v_tag_25f)

x_tag_d9:
	fcb	$00
	fcb	$11
	fdb	D4345
	fcb	$c1,$18,$34,$c1,$1a

x_tag_da:
	fcb	$00
	fcb	$24,$79,$43,$c0,$12,$3d,$1c,$41
	fcb	$22,$16,$1b,$15,$3d,$23

x_tag_db:
	fcb	$00
	fcb	$24,$79,$23,$79,$43,$25,$43,$14
	fcb	$39,$15,$3d,$15,$3d,$1b,$15,$4c
	fcb	$06,$11,$52,$44,$02,$5d,$c0,$24
	fcb	$22,$16,$79,$24,$20,$23,$30,$39
	fcb	$d1,$04,$02,$08,$01,$03,$42,$3d
	fcb	$17,$1b,$23,$22,$1b,$02,$67,$33
	fcb	$54,$22,$42,$1b,$02,$67,$62,$57
	fcb	$24,$02,$67,$02,$68

x_tag_dc:
	fcb	$00
	fcb	$02,$be,$24,$0f,$23,$02,$5e

x_tag_dd:
	lda	(Z15),Y
	pha
	iny
	lda	(Z15),Y
	sta	Z16
	pla
	sta	Z15
	lda	D0278
	bmi	L48fc
	jmp	next

L48fc:	jmp	(v_tag_25f)

x_tag_de:
	fcb	$00
	fcb	$14,$dd,$25,$02,$bf,$24,$0f,$23
	fcb	$02,$5e

x_tag_df:
	fcb	$00
	fcb	$02,$63,$2d,$23,$dc

x_tag_e0:
	fcb	$00
	fcb	$02,$63,$24,$1b,$2f,$3d,$23,$15
	fcb	$2d,$23,$01,$0e,$2f,$3d,$15,$26
	fcb	$02,$5e

x_tag_e1:
	fcb	$00
	fcb	$14,$e0,$25,$02,$bf,$0f,$01,$19
	fcb	$e5,$ff

x_tag_e2:
	fcb	$00
	fcb	$01,$0e,$2f,$3d,$11,$fe,$01,$1c
	fcb	$ca,$4c,$06,$11,$52,$54,$02,$5d
	fcb	$1b,$15,$2d,$3e,$4c,$09,$1b,$15
	fcb	$14,$ff,$39,$3d,$53,$18,$01,$0f
	fcb	$24,$0f,$c0,$16,$4c,$04,$25,$02
	fcb	$bc,$02,$5e,$00

x_tag_e3:
	stx	Z62
L495d:	tsx
	cpx	#$fd
	bne	L496b
L4962:	lda	#$4e
	ldy	#$58
	ldx	Z62
	jmp	(v_tag_205)

L496b:	lda	D0101,X
	cmp	#$10
	beq	L4983
	cmp	#$0a
	beq	L4983
	cmp	#$06
	bne	L4962
	txa
	adc	#$05
	bcs	L4962
	tax
	txs
	bcc	L495d
L4983:	jmp	(v_tag_209)

x_tag_e4:
	stx	Z62
	lda	(Z15),Y
	sta	S42
	iny
	lda	(Z15),Y
	sta	Z43
	lda	Z15
	adc	#$02
	sta	Z15
	bcc	L499b
	inc	Z16
L499b:	tsx
	cpx	#$fd
	bne	L49a9
L49a0:	lda	#$4e
	ldy	#$58
	ldx	Z62
	jmp	(v_tag_205)

L49a9:	lda	D0102,X
	cmp	Z43
	bne	L49ba
	lda	D0101,X
	cmp	S42
	bne	L49ba
	jmp	(v_tag_209)

L49ba:	txa
	clc
	adc	D0101,X
	bcs	L49a0
	tax
	txs
	bne	L499b

x_tag_e5:
	fcb	$00
	fcb	$02,$63,$27,$02,$50,$79,$22,$02
	fcb	$50,$1b,$3c,$14,$10,$3a,$02,$50
	fcb	$2b,$62,$c0,$02,$3d,$02,$50,$22
	fcb	$aa,$22,$26,$26,$01,$20,$d4,$01
	fcb	$0e,$d7,$d5,$cc,$42,$32,$66,$63
	fcb	$23,$02,$53,$1b,$23,$01,$aa,$02
	fcb	$53,$02,$52,$26,$02,$53,$02,$53
	fcb	$26

x_tag_e6:
	fcb	$00
	fcb	$02,$63,$27,$02,$50,$79,$22,$02
	fcb	$50,$1b,$3c,$14,$0a,$3a,$02,$50
	fcb	$43,$c0,$00,$3d,$02,$50,$23,$1c
	fcb	$3e,$25,$01,$2b,$42,$32,$66,$63
	fcb	$23,$02,$53,$1b,$23,$16,$02,$53
	fcb	$02,$52,$26,$02,$53,$02,$53,$26
	fcb	$00

x_tag_e7:
	lda	#$4c
	sta	S42
	lda	Z00,X
	sta	Z43
	lda	Z01,X
	sta	Z44
	inx
	inx
	jsr	S42
	jmp	next

x_tag_e8	equ	*-1
	fcb	$25,$02,$4c,$01,$19,$98,$fe

x_tag_e9:
	fcb	$00
	fcb	$25,$02,$4c,$24,$1b,$15,$43,$3d
	fcb	$41,$23,$01,$19,$b2,$fe,$00

x_tag_ea:
	ldy	#$00
	lda	#$cb
	sta	Z76
	jsr	S75
	lda	(S42),Y
	dex
	dex
	sta	Z00,X
	iny
	lda	(S42),Y
	sta	Z01,X
	jmp	next

x_tag_eb:
	ldy	#$02
	lda	#$cd
	sta	Z76
	jsr	S75
	jmp	(v_tag_d7)

x_tag_ec:
	ldy	#$10
	lda	#$cd
	sta	Z76
	jsr	S75
	jmp	(v_tag_d7)

x_tag_ed:
	ldy	#$04
	lda	#$c9
	sta	Z76
	jsr	S75
	ror
	tay
	dex
	dex
	lda	(S42),Y
	sta	Z00,X
	lda	#$00
	sta	Z01,X
	jmp	next

x_tag_ee:
	ldy	#$08
	lda	#$cb
	sta	Z76
	jsr	S75
	lda	#$c3
	sta	Z76
	jsr	S75
	jmp	(Xc02a)

x_tag_ef:
	ldy	#$0a
	lda	#$cb
	sta	Z76
	jsr	S75
	lda	#$c3
	sta	Z76
	jsr	S75
	jmp	(v_tag_d7)

x_tag_f0:
	ldy	#$0c
	lda	#$cb
	sta	Z76
	jsr	S75
	lda	#$c3
	sta	Z76
	jsr	S75
	jmp	(Xc02e)

x_tag_f1:
	ldy	#$12
	lda	#$cb
	sta	Z76
	jsr	S75
	lda	(S42),Y
	sta	Z44
	iny
	lda	(S42),Y
	sta	Z45
	ora	Z44
	bne	L4af9
	lda	#$55
	ldy	#$44
	jmp	(v_tag_205)

L4af9:	jmp	(Z44)

x_tag_f2	equ	*-1
	fcb	$24,$1b,$42,$23,$17,$1b,$43,$3d
	fcb	$c0,$06,$3d,$23,$02,$69,$25,$15
	fcb	$c0,$14,$3d,$24,$41,$17

x_tag_f3:
	fcb	$00
	fcb	$24,$1b,$42,$23,$17,$43,$c0,$0e
	fcb	$3d,$02,$04,$23,$02,$69,$25,$15
	fcb	$c0,$14,$3d,$24,$41,$17,$00

x_tag_f4:
x_tag_f5:
	ldy	#$00
	lda	#$c9
	sta	Z76
	jsr	S75
	bcc	L4b37
	inc	Z43
L4b37:	tay
	lda	Z00,X
	sta	(S42),Y
	iny
	lda	Z01,X
	sta	(S42),Y
	inx
	inx
	lda	D0278
	bmi	L4b4b
	jmp	next

L4b4b:	jmp	(v_tag_25f)

x_tag_f6:
	ldy	#$02
	lda	#$cd
	sta	Z76
	jsr	S75
	jmp	(v_tag_d8)

x_tag_f7:
	ldy	#$10
	lda	#$cd
	sta	Z76
	jsr	S75
	jmp	(v_tag_d8)

x_tag_f8:
	ldy	#$04
	lda	#$c9
	sta	Z76
	jsr	S75
	ror
	tay
	lda	Z00,X
	sta	(S42),Y
	inx
	inx
	lda	D0278
	bmi	L4b7f
	jmp	next

L4b7f:	jmp	(v_tag_25f)

x_tag_f9:
	ldy	#$08
	lda	#$cb
	sta	Z76
	jsr	S75
	lda	Z01,X
	sta	Z4e
	lda	Z00,X
	sta	Z4f
	inx
	inx
	lda	#$c3
	sta	Z76
	jsr	S75
	lda	Z4f
	sta	(Z00,X)
	inc	Z00,X
	bne	L4ba6
	inc	Z01,X
L4ba6:	lda	Z4e
	sta	(Z00,X)
	inx
	inx
	lda	D0278
	bmi	L4bb4
	jmp	next

L4bb4:	jmp	(v_tag_25f)

x_tag_fa:
	txa
	sta	Z4e
	adc	#$08
	tax
	ldy	#$0a
	lda	#$cb
	sta	Z76
	jsr	S75
	lda	#$c3
	sta	Z76
	jsr	S75
	lda	Z00,X
	sta	S42
	lda	Z01,X
	sta	Z43
	inx
	inx
	stx	Z62
	lda	Z4e
	tax
	ldy	#$00
L4bde:	lda	Z00,X
	inx
	sta	(S42),Y
	iny
	cpy	#$08
	bne	L4bde
	ldx	Z62
	lda	D0278
	bmi	L4bf2
	jmp	next

L4bf2:	jmp	(v_tag_25f)

x_tag_fb:
	lda	Z00,X
	sta	Z4e
	inx
	inx
	ldy	#$0c
	lda	#$cb
	sta	Z76
	jsr	S75
	lda	#$c3
	sta	Z76
	jsr	S75
	lda	Z4e
	sta	(Z00,X)
	inx
	inx
	lda	D0278
	bmi	L4c19
	jmp	next

L4c19:	jmp	(v_tag_25f)

x_tag_fc:
	fcb	$00
	fcb	$24,$1b,$42,$23,$17,$1b,$43,$3d
	fcb	$c0,$06,$3d,$23,$25,$41,$18,$c0
	fcb	$14,$3e,$24,$16,$c1,$28,$02,$5e

x_tag_fd:
	fcb	$00
	fcb	$20,$c1,$28,$24,$1b,$42,$23,$17
	fcb	$43,$20,$20,$26,$c0,$0e,$3d,$02
	fcb	$04,$24,$c0,$14,$3e,$1c,$16,$24
	fcb	$22,$41,$18,$02,$5e

x_tag_fe:
x_tag_ff:
	fcb	$00
	fcb	$24,$79,$3d,$23,$00

x_tag_202:
	sta	Z52
	dey
	sty	Z53
	ldy	#$fe
	lda	(Z52),Y
	sta	Z54
	iny
	lda	(Z52),Y
	sta	Z55
	jmp	(Z54)

x_tag_203:
	lda	#$00
	sta	Z46
	sta	Z47
	lda	(S42),Y
	sta	Z44
	iny
	lda	(S42),Y
	sta	Z45
	ora	Z44
	bne	L4c88
	pla
	pla
	lda	#$55
	ldy	#$44
	jmp	(v_tag_205)

L4c88:	dex
	dex
	ldy	#$00
	lda	(Z44),Y
	sta	S42
	dec	Z45
	ldy	#$ff
	lda	(Z44),Y
	sta	Z49
	dey
	lda	(Z44),Y
	sta	Z48
L4c9d:	inx
	inx
	lda	Z00,X
	cmp	Z48
	rol
	eor	#$01
	ror
	lda	Z49
	sbc	Z01,X
	bcs	L4cb4
	lda	#$4f
	ldy	#$44
	jmp	(v_tag_205)

L4cb4:	dey
	lda	(Z44),Y
	sta	Z49
	dey
	lda	(Z44),Y
	sta	Z48
	lda	Z00,X
	clc
	adc	Z46
	sta	Z46
	lda	Z01,X
	adc	Z47
	sta	Z47
	stx	Z62
	lda	#$00
	sta	Z4a
	ldx	#$11
	bne	L4ce7
L4cd5:	bcc	L4ce4
	sta	Z4b
	clc
	lda	Z4a
	adc	Z48
	sta	Z4a
	lda	Z4b
	adc	Z49
L4ce4:	ror
	ror	Z4a
L4ce7:	ror	Z47
	ror	Z46
	dex
	bne	L4cd5
	ldx	Z62
	dec	S42
	bne	L4c9d
	sec
	tya
	ldy	Z45
	sbc	Z48
	bcs	L4cfd
	dey
L4cfd:	clc
	adc	Z44
	bcc	L4d03
	iny
L4d03:	sec
	sbc	Z46
	sta	Z00,X
	tya
	sbc	Z47
	sta	Z01,X
	rts

x_tag_204:
	lda	Z00,X
	sta	S42
	lda	Z01,X
	sta	Z43
	inx
	inx
	lda	#$c3
	sta	Z76
	jsr	S75
	jmp	next

	fcb	$a9,$43,$a0,$58

x_tag_205:
	ldx	#$fd
	sta	Z00,X
	sty	Z01,X
	jmp	(v_tag_25d)

x_tag_206:
	lda	(Z39),Y
	sta	S42
	iny
	lda	(Z39),Y
	sta	Z43
	ldy	#$00
	lda	(Z15),Y
	inc	Z15
	bne	L4d42
	inc	Z16
L4d42:	asl
	rts

x_tag_207:
	lda	#$c9
	sta	Z76
	jsr	S75
	bcc	L4d4f
	inc	Z43
L4d4f:	tay
	rts

x_tag_208:
	dex
	dex
	lda	#$00
	sta	Z44
	lda	#$c9
	sta	Z76
	jsr	S75
	rol	Z44
	asl
	rol	Z44
	asl
	rol	Z44
	adc	S42
	sta	Z00,X
	lda	Z43
	adc	Z44
	sta	Z01,X
	rts

x_tag_209:
	inc	D0107,X
	bne	L4d87
	inc	D0108,X
	bne	L4d87
	txa
	clc
	adc	D0101,X
	tax
	txs
	ldx	Z62
	jmp	next

L4d87:	ldy	D0105,X
	sty	Z79
	ldy	D0106,X
	sty	Z7a
	cmp	#$10
	bne	L4dae
	txa
	adc	#$08
	ldx	Z62
	dex
	dex
	sta	Z00,X
	lda	#$01
	sta	Z01,X
	lda	#$d1
	sta	Z76
	jsr	S75
	stx	Z62
	tsx
	bne	L4dbf
L4dae:	ldy	#$00
	lda	D0109,X
	adc	(Z79),Y
	sta	(Z79),Y
	iny
	lda	D010a,X
	adc	(Z79),Y
	sta	(Z79),Y
L4dbf:	lda	D0103,X
	sta	Z15
	lda	D0104,X
	sta	Z16
	ldx	Z62
	ldy	#$16
	lda	(Z39),Y
	bne	L4ddc
	lda	D0278
	bmi	L4dd9
	jmp	next

L4dd9:	jmp	(v_tag_25f)

L4ddc:	dex
	dex
	lda	Z15
	sta	Z00,X
	lda	Z16
	sta	Z01,X
	jmp	(v_tag_2bc)

x_tag_20a:
	fcb	$00
	fcb	$d7,$14,$79,$15,$d7,$d2,$14,$79
	fcb	$15,$01,$aa,$0d

x_tag_20b:
	fcb	$00
	fcb	$3c,$29,$23,$0e,$0f,$24

x_tag_20c:
	fcb	$00
	fcb	$3a,$3a,$3a,$28

x_tag_20d:
	fcb	$00
	fcb	$02,$12,$33,$4b

x_tag_20e:
	fcb	$00
	fcb	$02,$0f,$28

x_tag_20f:
	fcb	$00
	fcb	$02,$12,$29

x_tag_210:
	fcb	$00
	fcb	$02,$0d,$28

x_tag_211:
	fcb	$00
	fcb	$02,$12,$28,$28

x_tag_212:
	fcb	$00
	fcb	$20,$c1,$28,$20,$5d,$22,$3e,$23
	fcb	$67,$33,$23,$a9,$59,$16,$1b,$17
	fcb	$3b,$17,$3e,$1a,$4c,$0c,$55,$24
	fcb	$0f,$29,$4c,$04,$34,$52,$02,$32
	fcb	$23,$42,$57,$0f,$24,$1a,$4e,$02
	fcb	$25,$24,$0f,$22,$c1,$28

x_tag_213:
	fcb	$00
	fcb	$4a,$28

x_tag_214:
	fcb	$00
	fcb	$02,$0c,$28

x_tag_215:
	fcb	$00
	fcb	$28,$28

x_tag_216:
	fcb	$00
	fcb	$1b,$23,$14,$50,$01,$b2,$0f,$1b
	fcb	$c1,$2a,$17,$01,$1a,$14,$45,$50
	fcb	$39,$1b,$95,$23,$11,$80,$0f,$39
	fcb	$1b,$28,$4c,$05,$0f,$11,$00,$01
	fcb	$32,$c2,$2a,$c0,$2a,$14,$50,$01
	fcb	$b2,$0f,$1b,$c0,$2a,$48,$3e,$c1
	fcb	$2a,$cc,$24,$3d,$11,$00,$04,$3d
	fcb	$1b,$11,$00,$08,$01,$17,$4e,$06
	fcb	$11,$41,$45,$02,$5d,$2f,$6c,$3c
	fcb	$3a,$c0,$2a,$24,$3e

x_tag_217:
	fcb	$00
	fcb	$14,$16,$11,$fe,$ff,$14,$0a,$32
	fcb	$11,$f4,$ff,$33,$33,$02,$19

x_tag_218:
	fcb	$00
	fcb	$1b,$4e,$06,$11,$49,$51,$02,$5d
	fcb	$1b,$1b,$23,$42,$02,$6a,$22,$6f
	fcb	$c1,$28,$c0,$26,$25,$3d,$c0,$26
	fcb	$54,$37,$3b,$46,$57,$37,$c0,$26
	fcb	$24,$3d,$18,$c0,$26,$02,$16,$63

x_tag_219:
	fcb	$00
	fcb	$33,$66,$33,$c1,$44,$11,$02,$b7
	fcb	$14,$28,$1b,$01,$14,$16,$26,$40
	fcb	$26,$26,$02,$50,$26,$26,$02,$53
	fcb	$02,$b6,$27,$27,$1b,$95,$27,$5a
	fcb	$4e,$15,$24,$32,$66,$5d,$6b,$22
	fcb	$1c,$50,$02,$38,$22,$1c,$3e,$02
	fcb	$50,$42,$02,$b1,$52,$06,$24,$0e
	fcb	$33,$02,$50,$14,$0c,$24,$01,$ad
	fcb	$14,$37,$15,$01,$14,$01,$b0,$01
	fcb	$15,$24,$33,$66,$1b,$4e,$03,$1c
	fcb	$3d,$5d,$22,$3e,$1b,$29,$4c,$0e
	fcb	$c2,$2a,$0e,$c0,$32,$c0,$2a,$01
	fcb	$17,$c1,$44,$52,$04,$0f,$01,$b1
	fcb	$02,$52,$4c,$11,$c0,$2a,$7a,$01
	fcb	$45,$02,$52,$33,$01,$6b,$c0,$2a
	fcb	$3e,$24,$3d,$23,$02,$51,$24,$1b
	fcb	$29,$c2,$44,$01,$54,$01,$15,$c0
	fcb	$2a,$1c,$3e

x_tag_21a:
	fcb	$00
	fcb	$1b,$29,$23,$64,$23,$02,$4d,$01
	fcb	$1f,$25,$32,$39,$4c,$08,$01,$1f
	fcb	$01,$20,$d3,$01,$1f,$24,$01,$12
	fcb	$1a,$4c,$07,$23,$01,$1e,$d3,$53
	fcb	$16,$61,$24,$4c,$06,$02,$4d,$01
	fcb	$1f,$d5

x_tag_21b:
	fcb	$00
	fcb	$01,$1f,$1b,$4c,$30,$1b,$37,$39
	fcb	$4c,$24,$01,$1f,$01,$1e,$cc,$1b
	fcb	$23,$cb,$01,$20,$d4,$02,$b5,$0e
	fcb	$0f,$01,$1f,$01,$a9,$02,$a3,$d3
	fcb	$02,$a2,$25,$32,$39,$4c,$03,$01
	fcb	$a6,$24,$0f,$52,$06,$02,$a3,$d3
	fcb	$02,$a2,$52,$0d,$61,$1b,$37,$39
	fcb	$1c,$28,$3a,$02,$b5,$61,$02,$4e
	fcb	$00

x_tag_21c:
	lda	Dc2cc
	ldy	Dc2cd
	jmp	(v_tag_202)

x_tag_21d:
	lda	Dc2d8
	ldy	Dc2d9
	jmp	(v_tag_202)

x_tag_21e:
	lda	Dc2da
	ldy	Dc2db
	jmp	(v_tag_202)

x_tag_21f:
	lda	Z01,X
	and	#$0f
	bne	L500d
	lda	Z00,X
	beq	L5001
	and	#$fe
	beq	L5001
	lda	#$49
	ldy	#$51
	jmp	(v_tag_205)

L5001:	ldy	#$08
L5003:	sta	Z00,X
	inx
	dey
	bne	L5003
	txa
	sbc	#$07
	tax
L500d:	jmp	(Xc000)

x_tag_220:
	fcb	$00
	fcb	$32,$02,$89

x_tag_221:
	fcb	$00
	fcb	$1b,$c2,$42,$a9,$54,$3b,$17,$14
	fcb	$7f,$39,$76,$57

x_tag_222:
	fcb	$00
	fcb	$68,$01,$69,$02,$21,$02,$5e

x_tag_223:
	fcb	$00
	fcb	$02,$17,$1c,$c1,$26,$02,$21,$c1
	fcb	$28,$02,$5e

x_tag_224:
	fcb	$00
	fcb	$4c,$0a,$7a
	cstr	"TRUE "
	fcb	$52,$08,$7a
	cstr	"FALSE"
	fcb	$2e,$c2,$42,$02,$5e

x_tag_225:
	fcb	$00
	fcb	$1a,$4c,$05,$02,$21,$52,$02,$0f
	fcb	$c1,$28,$02,$5e

x_tag_226:
	fcb	$00
	fcb	$14,$1b,$76,$14,$4a,$76,$32,$76

x_tag_227:
	fcb	$00
	fcb	$7e,$33,$c1,$42

x_tag_228:
	fcb	$00
	fcb	$14,$15,$c0,$42,$1c,$6b,$3e,$1b
	fcb	$c2,$42,$01,$54

x_tag_229:
	fcb	$00
	fcb	$13,$d8,$16,$a5,$1b,$c0,$3c,$b2
	fcb	$4e,$06,$11,$49,$4f,$02,$5d,$0a

x_tag_22a:
	fcb	$00
	fcb	$27,$0f,$33,$12,$06,$18,$12,$07
	fcb	$14,$4f,$6f,$0c,$06,$03

x_tag_22b:
	fcb	$00
	fcb	$02,$2a,$14,$31,$17,$14,$3d,$17
	fcb	$01,$75,$01,$0a,$0f,$1b,$14,$31
	fcb	$18,$11,$fe,$58,$18

x_tag_22c:
	fcb	$00
	fcb	$1b,$11,$f0,$ff,$39,$4c,$06,$11
	fcb	$41,$54,$02,$5d,$1b,$02,$2d,$1b
	fcb	$13,$c1,$3d,$23,$1c,$14,$41,$58
	fcb	$06,$2d,$25,$18,$52,$14,$14,$81
	fcb	$58,$06,$33,$25,$18,$52,$0b,$1c
	fcb	$01,$37,$4e,$06,$11,$41,$54,$02
	fcb	$5d,$25,$17,$14,$35,$15,$3d,$42
	fcb	$1b,$14,$10,$45,$02,$2b,$17,$14
	fcb	$10,$39,$4e,$0a,$14,$ff,$25,$18
	fcb	$11,$4f,$4d,$02,$5d,$24,$0e,$37
	fcb	$4b,$4c,$08,$c0,$3a,$34,$c1,$3a
	fcb	$02,$36

x_tag_22d:
	fcb	$00
	fcb	$1b,$11,$f0,$ff,$39,$4c,$06,$11
	fcb	$41,$54,$02,$5d,$13,$c1,$3d,$14
	fcb	$ff,$22,$18

x_tag_22e:
	fcb	$00
	fcb	$4e,$06,$11,$46,$49,$02,$5d

x_tag_22f:
	fcb	$00
	fcb	$81,$02,$2e,$20,$c1,$28,$20,$01
	fcb	$87,$02,$2e

x_tag_230:
	fcb	$00
	fcb	$81,$02,$2e,$23,$14,$ff,$02,$6a
	fcb	$1b,$14,$ff,$24,$01,$86,$02,$2e
	fcb	$1b,$c2,$26,$26,$02,$69,$27

x_tag_231:
	fcb	$00
	fcb	$81,$02,$2e,$1b,$29,$28,$02,$2e
	fcb	$01,$8d,$02,$2e

x_tag_232:
	fcb	$00
	fcb	$81,$02,$2e,$20,$c1,$28,$20,$89
	fcb	$02,$2e

x_tag_233:
	fcb	$00
	fcb	$20,$c1,$28,$5d,$01,$8b,$4c,$04
	fcb	$0e,$52,$09,$01,$8a,$02,$2e,$2b
	fcb	$81,$41,$18

x_tag_234:
	fcb	$00
	fcb	$81,$02,$2e,$02,$b9,$23,$1b,$29
	fcb	$4c,$05,$1c,$25,$3e,$66,$22,$1b
	fcb	$28,$25,$28,$39,$4c,$06,$24,$0e
	fcb	$34,$52,$07,$1b,$24,$01,$17,$02
	fcb	$2e,$02,$5b,$3d,$22,$01,$85,$02
	fcb	$2e

x_tag_235:
	fcb	$00
	fcb	$22,$81,$02,$2e,$1b,$02,$b9,$01
	fcb	$17,$02,$2e,$02,$5b,$3d,$18

x_tag_236:
	fcb	$00
	fcb	$c0,$3a,$58,$02,$00,$c1,$3a,$13
	fcb	$78,$37,$1c,$18,$6e,$c0,$40,$c1
	fcb	$3e,$02,$37

x_tag_237:
	fcb	$00
	fcb	$13,$78,$c0,$3a,$01,$4d,$4e,$16
	fcb	$13,$78,$17,$14,$87,$48,$4e,$0e
	fcb	$13,$78,$c0,$3a,$01,$4d,$4e,$06
	fcb	$11,$49,$4f,$02,$5d

x_tag_238:
	fcb	$00
	fcb	$13,$0d,$17,$c0,$46,$3a,$c0,$3e
	fcb	$c0,$40,$48,$3a,$4c,$04,$02,$39
	fcb	$00,$c0,$3e,$1b,$42,$14,$0f,$39
	fcb	$c1,$3e,$14,$39,$15,$14,$54,$3d
	fcb	$3d,$17

x_tag_239:
	fcb	$00
	fcb	$14,$65,$14,$40,$45,$13,$0d,$17
	fcb	$14,$66,$17,$3a,$c0,$46,$3a,$4c
	fcb	$13,$13,$c1,$17,$23,$13,$78,$6e
	fcb	$33,$13,$c1,$18,$01,$51,$24,$13
	fcb	$c1,$18,$00,$13,$78,$1b,$0a,$42
	fcb	$17,$02,$37

x_tag_23a:
	fcb	$00
	fcb	$1b,$79,$14,$22,$58,$17,$1b,$17
	fcb	$14,$22,$50,$0b,$1b,$42,$1c,$12
	fcb	$56,$1c,$3e,$6f,$52,$05,$32,$c2
	fcb	$38,$00,$52,$04,$4e,$02,$00,$53
	fcb	$1e

x_tag_23b:
	fcb	$00
	fcb	$02,$51,$02,$51,$c0,$38,$9c,$79
	fcb	$1b,$35,$48,$22,$14,$2c,$48,$3a
	fcb	$28,$4d,$0a,$40,$17,$4c,$10,$7e
	fcb	$7a
	cstr	"Rest Ignored"

x_tag_23c:
	fcb	$00
	fcb	$32,$c1,$3c,$c0,$1e,$31,$3e,$4c
	fcb	$04,$7a,$01,$3f,$33,$c1,$1e,$25
	fcb	$3f,$02,$50,$01,$0e,$02,$50,$02
	fcb	$49,$0f,$7e

x_tag_23d:
	fcb	$00
	fcb	$02,$54,$c0,$1e,$4c,$06,$11,$44
	fcb	$45,$02,$5d,$7e,$7a
	cstr	"Error, Retype line"
	fcb	$02,$53,$01,$0f,$24,$0f,$02,$53
	fcb	$23

x_tag_23e:
	fcb	$00
	fcb	$32,$c1,$1e

x_tag_23f:
	fcb	$00
	fcb	$02,$16,$1a,$28,$4c,$03,$02,$3d
	fcb	$c2,$38,$c0,$1e,$4c,$05,$c0,$38
	fcb	$c2,$18

x_tag_240:
	fcb	$00
	fcb	$32,$c1,$3c,$02,$25,$31,$c1,$1e

x_tag_241:
	fcb	$00
	fcb	$02,$47,$02,$3f

x_tag_242:
	fcb	$00
	fcb	$02,$47,$02,$3f,$cc

x_tag_243:
	fcb	$00
	fcb	$02,$47,$1b,$17,$14,$22,$48,$4c
	fcb	$09,$32,$c2,$38,$42,$02,$3a,$52
	fcb	$0c,$1b,$79,$1b,$28,$22,$14,$2c
	fcb	$48,$3a,$4d,$08,$1c,$3e,$40,$1b
	fcb	$c2,$38,$c0,$1e,$4c,$05,$c0,$38
	fcb	$c2,$18,$1b,$02,$6a,$22,$5d,$26
	fcb	$1b,$c2,$26,$6f,$02,$69,$27

x_tag_244:
	fcb	$00
	fcb	$02,$47,$1b,$79,$1b,$28,$1c,$14
	fcb	$2c,$48,$3a,$22,$35,$48,$3a,$4d
	fcb	$0c,$40,$1c,$3e,$c2,$38,$c0,$1e
	fcb	$4c,$05,$c0,$38,$c2,$18,$17,$01
	fcb	$1a,$1b,$14,$46,$48,$1c,$14,$4e
	fcb	$48,$3a,$22,$36,$48,$3a,$28

x_tag_245:
	fcb	$00
	fcb	$c0,$1a,$42,$1b,$02,$bd,$17,$14
	fcb	$ff,$49,$4c,$0c,$42,$02,$ba,$1c
	fcb	$51,$04,$0f,$02,$5d,$53,$12,$1b
	fcb	$c1,$1a,$02,$bd,$41,$c1,$18

x_tag_246:
	fcb	$00
	fcb	$11,$44,$41,$c0,$18,$17,$28,$4c
	fcb	$05,$02,$45,$53,$08,$0f,$c0,$18
	fcb	$12,$06,$14,$50,$6f,$33,$c1,$38

x_tag_247:
	fcb	$00
	fcb	$c0,$1e,$4c,$03,$02,$46,$c0,$38
	fcb	$9c,$79,$1b,$35,$48,$22,$14,$2c
	fcb	$48,$3a,$28,$4d,$0a,$40,$1b,$17
	fcb	$28,$4c,$1a,$c0,$1e,$4c,$0a,$12
	fcb	$06,$3e,$c2,$18,$02,$46,$52,$0b
	fcb	$0f,$7e,$7a,$02,$3f,$3f,$02,$49
	fcb	$0f,$7e,$53,$2c,$1b,$12,$06,$3e
	fcb	$c1,$38

x_tag_248:
	fcb	$00
	fcb	$0f,$02,$53,$14,$28,$16

x_tag_249:
	fcb	$00
	fcb	$11,$02,$48,$14,$28,$1b,$15,$02
	fcb	$50,$16,$12,$06,$14,$50,$33,$33
	fcb	$11,$02,$4f,$33,$bc,$0f,$23,$3d
	fcb	$33,$22,$18,$33,$c1,$38,$33,$c1
	fcb	$42,$24,$11,$33,$42,$15,$47,$1b
	fcb	$14,$8b,$50,$18,$c0,$20,$4e,$03
	fcb	$01,$57,$02,$53,$01,$0f,$02,$53
	fcb	$24,$0f,$23,$11,$80,$8b,$13,$78
	fcb	$16,$02,$5e

x_tag_24a:
	fcb	$00
	fcb	$75,$02,$78

x_tag_24b:
	fcb	$00
	fcb	$22,$18

x_tag_24c:
	fcb	$00
	fcb	$22,$1c,$15,$40,$1c,$40,$01,$17
	fcb	$4c,$0c,$24,$0e,$27,$0e,$1b,$15
	fcb	$42,$43,$3d,$23,$00,$43,$3d,$15

x_tag_24d:
	fcb	$00
	fcb	$33,$33,$33,$11,$40,$01

x_tag_24e:
	fcb	$00
	fcb	$33,$33,$33,$33

x_tag_24f:
	fcb	$00
	fcb	$1b,$2c,$48,$c1,$46,$14,$8b,$1c
	fcb	$48,$1c,$14,$0d,$48,$3a,$1c,$37
	fcb	$48,$3a,$22,$14,$83,$48,$3a

x_tag_250:
	fcb	$00
	fcb	$11,$fe,$ff,$c2,$36,$c0,$36,$16

x_tag_251:
	fcb	$00
	fcb	$31,$c2,$36

x_tag_252:
	fcb	$00
	fcb	$c0,$36,$15

x_tag_253:
	fcb	$00
	fcb	$c0,$36,$15,$31,$c2,$36

x_tag_254:
	fcb	$00
	fcb	$14,$ff,$01,$0c

x_tag_255:
	fcb	$00
	fcb	$33,$13,$01,$16,$c0,$00,$c0,$22
	fcb	$1c,$3e,$01,$32,$c0,$22,$3f,$c1
	fcb	$24,$c0,$14,$c1,$26,$d9,$33,$c1
	fcb	$28

x_tag_256:
	fcb	$00
	fcb	$c0,$2c,$16,$31,$c2,$2c

x_tag_257:
	fcb	$00
	fcb	$11,$c7,$40,$15,$2f,$3e,$14,$2a
	fcb	$16,$11,$02,$38,$14,$26,$16,$11
	fcb	$02,$29,$14,$28,$16,$32,$c1,$3c
	fcb	$33,$c1,$3a,$14,$41,$32,$02,$2c
	fcb	$14,$81,$33,$02,$2c,$13,$0c,$32
	fcb	$45

x_tag_258:
	fcb	$00
	fcb	$14,$37,$15,$5d,$22,$3e,$13,$f5
	fcb	$15,$1c,$01,$17,$4e,$09,$33,$10
	fcb	$33,$13,$f2,$18,$38,$8a,$1b,$3f
	fcb	$14,$37,$16,$1b,$14,$39,$16,$20
	fcb	$01,$32,$1b,$1b,$c1,$34,$c1,$36
	fcb	$11,$7c,$01,$3e,$1b,$c1,$2e,$c1
	fcb	$2c

x_tag_259:
	fcb	$00
	fcb	$7e,$14,$ff,$01,$0c,$02,$01,$11
	fcb	$2c,$40,$79,$01,$8a,$8a,$11,$cc
	fcb	$01,$02,$58,$02,$5c,$02,$5b,$11
	fcb	$49,$42,$15,$11,$00,$01,$3d,$01
	fcb	$81,$11,$00,$01,$3e,$66,$5d,$01
	fcb	$85,$8a,$1c,$c1,$20,$3d,$c1,$22
	fcb	$11,$02,$5a,$13,$80,$16,$11,$35
	fcb	$42,$14,$39,$15,$14,$16,$a9,$54
	fcb	$1b,$15,$c0,$20,$3d,$3b,$16,$41
	fcb	$31,$56,$0f,$02,$57,$02,$55,$11
	fcb	$02,$39,$14,$26,$16,$dc

x_tag_25a:
	fcb	$00
	fcb	$01,$7e,$01,$8c,$01,$57

x_tag_25b:
	fcb	$00
	fcb	$81,$30,$3d,$79,$3d

x_tag_25c:
	fcb	$00
	fcb	$81,$01,$7e,$50,$02,$00,$81,$31
	fcb	$01,$7e,$1b,$31,$01,$83,$8a,$16
	fcb	$32,$85,$19,$41,$1b,$13,$01,$16
	fcb	$81,$15,$3f,$14,$50,$67,$1b,$33
	fcb	$4b,$4c,$24,$23,$81,$41,$1b,$12
	fcb	$06,$25,$6f,$25,$63,$01,$85,$0f
	fcb	$01,$7e,$13,$01,$16,$12,$06,$81
	fcb	$1b,$15,$3d,$1b,$25,$01,$85,$0f
	fcb	$25,$6f,$24,$3d,$53,$30,$0f,$01
	fcb	$8c,$01,$7e,$13,$01,$16

x_tag_25d:
	fcb	$00
	fcb	$33,$02,$36,$13,$c1,$1b,$17,$14
	fcb	$ff,$50,$06,$14,$81,$33,$02,$2c
	fcb	$32,$c1,$3c,$11,$02,$29,$14,$28
	fcb	$16,$42,$17,$14,$ff,$50,$06,$14
	fcb	$41,$32,$02,$2c,$11,$3d,$40,$13
	fcb	$1b,$16,$33,$c1,$28,$c0,$1c,$1a
	fcb	$4c,$12,$27,$01,$0d,$60,$26,$c0
	fcb	$34,$c1,$36,$12,$54,$16,$14,$ff
	fcb	$01,$0c,$00,$7e,$7a,$05,$2a,$2a
	fcb	$2a,$2a,$20,$1f,$31,$78,$7a
	cstr	" ERROR "
	fcb	$02,$60

x_tag_25e:
	fcb	$00
	fcb	$27,$0e,$13,$78,$17,$37,$39,$4c
	fcb	$62,$13,$78,$42,$17,$14,$8b,$50
	fcb	$3d,$02,$39,$0f,$11,$42,$72,$12
	fcb	$54,$16,$c0,$1c,$1a,$4c,$0a,$01
	fcb	$0e,$41,$15,$26,$33,$c1,$1c,$00
	fcb	$32,$c1,$3c,$7e,$7a
	cstr	" Break"
	fcb	$02,$54,$25,$c0
	fcb	$2e,$3e,$14,$fc,$01,$17,$4c,$05
	fcb	$01,$0d,$02,$c0,$25,$c1,$52,$02
	fcb	$d5,$27,$0e,$02,$c0,$c0,$40,$42
	fcb	$14,$0f,$39,$1b,$c0,$3e,$50,$03
	fcb	$0f,$00,$02,$39,$14,$39,$15,$14
	fcb	$54,$3d,$c0,$40,$3d,$18,$c1,$40
	fcb	$53,$66

x_tag_25f:
	fcb	$00
	fcb	$02,$5e

x_tag_260:
	fcb	$00
	fcb	$02,$d5,$02,$d0

x_tag_261:
	fcb	$00
	fcb	$75,$02,$5a,$00

x_tag_262:
	jmp	(Xc000)

x_tag_263:
	fcb	$00
	fcb	$01,$0e,$11,$50,$01,$51,$06,$11
	fcb	$43,$58,$02,$5d

x_tag_264:
	fcb	$00
	fcb	$25,$02,$4c,$24,$0f,$23

x_tag_265:
	fcb	$00
	fcb	$02,$63,$25,$02,$4c,$24,$1b,$15
	fcb	$43,$3d,$41,$23,$2d,$23,$01,$0e
	fcb	$2f,$3d,$15,$26

x_tag_266:
	fcb	$00
	fcb	$24,$79,$1c,$c1,$1c,$3d,$23

x_tag_267:
	fcb	$00
	fcb	$c0,$24,$16,$31,$02,$68

x_tag_268:
	fcb	$00
	fcb	$1b,$02,$6a,$0f,$63,$c2,$24

x_tag_269:
	fcb	$00
	fcb	$c0,$28,$1f,$c1,$28

x_tag_26a:
	fcb	$00
	fcb	$c0,$24,$c0,$26,$3e,$1c,$01,$17
	fcb	$4c,$03,$02,$6c,$c0,$24,$c0,$26
	fcb	$3e,$22,$01,$17,$4c,$06,$11,$4f
	fcb	$4d,$02,$5d,$c0,$26

x_tag_26b:
	fcb	$00
	fcb	$c0,$26,$22,$1b,$c2,$26,$6f

x_tag_26c:
	fcb	$00
	fcb	$32,$01,$08,$02,$6d,$c0,$08,$c0
	fcb	$06,$02,$71,$c0,$10,$c0,$0e,$59
	fcb	$08,$3b,$02,$70,$02,$71,$31,$56
	fcb	$c0,$28,$1a,$4c,$0d,$1b,$3f,$15
	fcb	$1c,$2f,$3e,$15,$02,$72,$15,$53
	fcb	$0d,$c0,$2c,$c1,$2a,$c0,$14,$33
	fcb	$26,$c0,$14,$1b,$c1,$32,$25,$1b
	fcb	$c0,$26,$01,$17,$4c,$58,$1b,$c0
	fcb	$26,$01,$17,$1c,$17,$37,$39,$28
	fcb	$39,$4c,$04,$42,$53,$0e,$1b,$24
	fcb	$3e,$24,$3d,$23,$5d,$1b,$c0,$26
	fcb	$01,$17,$1c,$17,$37,$39,$28,$28
	fcb	$39,$4c,$04,$42,$53,$0f,$1b,$23
	fcb	$30,$1d,$1b,$23,$3e,$1b,$23,$6f
	fcb	$24,$3d,$24,$02,$56,$27,$1b,$02
	fcb	$56,$26,$c0,$2c,$c0,$2e,$3e,$14
	fcb	$f8,$4b,$4c,$10,$25,$c0,$26,$23
	fcb	$c1,$26,$02,$6e,$c0,$26,$c1,$32
	fcb	$24,$c1,$26,$53,$5d,$0f,$27,$0e
	fcb	$c0,$2a,$c0,$2c,$3e,$4c,$03,$02
	fcb	$6e,$c1,$26,$02,$6d,$14,$fe,$01
	fcb	$09

x_tag_26d:
	fcb	$00
	fcb	$c0,$26,$c0,$14,$59,$05,$3b,$37
	fcb	$46,$57

x_tag_26e:
	fcb	$00
	fcb	$c0,$08,$c0,$06,$02,$6f,$c0,$10
	fcb	$c0,$0e,$59,$08,$3b,$02,$70,$02
	fcb	$6f,$31,$56,$c0,$28,$1a,$4c,$0c
	fcb	$1b,$3f,$1b,$15,$02,$73,$22,$19
	fcb	$15,$53,$0c,$c0,$2a,$c1,$2c

x_tag_26f:
	fcb	$00
	fcb	$59,$15,$3b,$15,$4c,$0f,$3b,$41
	fcb	$17,$4c,$0a,$3b,$15,$c0,$14,$3d
	fcb	$02,$73,$3b,$19,$30,$56

x_tag_270:
	fcb	$00
	fcb	$15,$1b,$4c,$1a,$32,$1c,$15,$33
	fcb	$54,$22,$3f,$22,$1c,$15,$42,$62
	fcb	$57,$22,$3f,$22,$1c,$15,$62,$1c
	fcb	$22,$3e,$30,$3d,$00,$1b

x_tag_271:
	fcb	$00
	fcb	$59,$0d,$3b,$15,$c0,$14,$3d,$3b
	fcb	$41,$17,$02,$72,$30,$56

x_tag_272:
	fcb	$00
	fcb	$23,$1b,$c0,$14,$01,$17,$28,$1c
	fcb	$c0,$26,$01,$17,$39,$4c,$0b,$24
	fcb	$a9,$59,$05,$3b,$37,$45,$57,$52
	fcb	$03,$24,$0e

x_tag_273:
	fcb	$00
	fcb	$1b,$c0,$32,$01,$17,$1c,$c0,$26
	fcb	$01,$17,$28,$3a,$4c,$03,$38,$00
	fcb	$23,$c0,$2c,$c0,$2a,$3e,$01,$12
	fcb	$41,$11,$fc,$ff,$39,$1b,$c0,$2a
	fcb	$3d,$c0,$2c,$2f,$3e,$67,$22,$01
	fcb	$12,$41,$11,$fc,$ff,$39,$22,$25
	fcb	$1c,$15,$01,$17,$4c,$05,$1c,$3e
	fcb	$52,$1a,$25,$1c,$2f,$3d,$15,$01
	fcb	$17,$1c,$c0,$2c,$2f,$3e,$48,$3a
	fcb	$4c,$08,$24,$0f,$60,$41,$15,$63
	fcb	$00,$1c,$3d,$53,$32

x_tag_274:
	fcb	$00
	fcb	$01,$a9,$00

x_tag_275:
	stx	Z62
	lda	Z00,X
	asl
	bpl	L58a5
	and	#$7f
	beq	L5886
	jmp	next

L5886:	lda	Z01,X
	lsr
	lsr
	lsr
	lsr
	cmp	#$0c
	bcc	L5893
	jmp	next

L5893:	lsr
	php
	clc
	adc	#$02
	adc	Z62
	tax
	plp
	bcc	L58a5
	lda	Z00,X
	and	#$f0
	sta	Z00,X
	inx
L58a5:	clc
	lda	Z62
	adc	#$08
	sta	S42
	lda	#$00
L58ae:	cpx	S42
	beq	L58b9
	sta	Z00,X
	inx
	bne	L58ae
	beq	L58ae
L58b9:	ldx	Z62
	jmp	next

x_tag_276	equ	*-1
	fcb	$02,$aa,$2e,$1d,$37,$39,$3a,$d2
	fcb	$02,$75

x_tag_277:
	fcb	$00
	fcb	$cb

x_tag_278:
	fcb	$00
	fcb	$23,$02,$69,$32,$02,$6a,$24,$1c
	fcb	$18,$32,$1b,$c2,$26

x_tag_279:
	fcb	$00
	fcb	$02,$17,$5d,$3d,$c1,$26

x_tag_27a:
	fcb	$00
	fcb	$2c,$1d,$23,$02,$19,$25,$1c,$3e
	fcb	$33,$66,$23,$5d,$1c,$25,$3d,$22
	fcb	$6f,$0f,$1b,$35,$c0,$44,$4c,$07
	fcb	$27,$1b,$26,$0e,$14,$2a,$22,$40
	fcb	$24,$33,$59,$05,$42,$5d,$18,$57
	fcb	$0e,$24,$1b,$c2,$26

x_tag_27b:
	fcb	$00
	fcb	$6b

x_tag_27c:
	fcb	$00
	fcb	$66

x_tag_27d:
	fcb	$00
	fcb	$67

x_tag_27e:
	fcb	$00
	fcb	$39

x_tag_27f:
	fcb	$00
	fcb	$3a

x_tag_280:
	fcb	$00
	fcb	$a6

x_tag_281:
	fcb	$00
	fcb	$67,$32,$66,$3d,$40,$17,$22,$c1
	fcb	$28

x_tag_282:
	fcb	$00
	fcb	$01,$20,$01,$20,$d5,$02,$75,$d3
	fcb	$d4

x_tag_283:
	fcb	$00
	fcb	$01,$20,$01,$20,$c3,$4c,$03,$01
	fcb	$1f,$61

x_tag_284:
	fcb	$00
	fcb	$01,$20,$01,$20,$c4,$4c,$03,$01
	fcb	$1f,$61

x_tag_285:
	fcb	$00
	fcb	$1b,$29,$4c,$03,$1c,$3d,$67,$33
	fcb	$66

x_tag_286:
	fcb	$00
	fcb	$1b,$29,$4c,$03,$1c,$3d,$1c,$67
	fcb	$33,$66,$23,$3d,$25,$3e,$24

x_tag_287:
	fcb	$00
	fcb	$32,$66,$02,$50,$22,$26,$c1,$28
	fcb	$20,$c1,$28,$1c,$22,$02,$53,$33
	fcb	$59,$1e,$5d,$27,$5d,$26,$22,$01
	fcb	$3b,$4c,$0e,$25,$3d,$20,$1c,$3d
	fcb	$23,$3e,$33,$66,$24,$22,$52,$07
	fcb	$0e,$1b,$25,$3d,$40,$33,$57,$0f
	fcb	$22,$3e,$24,$3e,$42,$24,$0f

x_tag_288:
	fcb	$00
	fcb	$2e,$1d,$67,$33,$66,$02,$50,$14
	fcb	$ff,$02,$52,$3e,$67,$1b,$2e,$1d
	fcb	$3d,$14,$ff,$67,$1b,$02,$6a,$26
	fcb	$25,$1c,$3e,$02,$52,$3e,$23,$26
	fcb	$c1,$28,$0f,$02,$53,$5d,$02,$6b
	fcb	$3d,$27,$02,$6b,$24,$02,$6b,$27
	fcb	$22

x_tag_289:
	fcb	$00
	fcb	$1c,$23,$2d,$1d,$2d,$1d,$26,$02
	fcb	$87,$23,$02,$69,$27,$24,$20,$24
	fcb	$1c,$4c,$04,$02,$8a,$00,$0e

x_tag_28a:
	fcb	$00
	fcb	$33,$66,$23,$40,$33,$66,$1c,$67
	fcb	$5d,$24,$3d,$67,$5d,$3e,$2f,$1d
	fcb	$3d,$1b,$02,$6a,$26,$20,$1c,$3e
	fcb	$23,$30,$1d,$20,$02,$6b,$3d,$24
	fcb	$02,$6b,$27,$22

x_tag_28b:
	fcb	$00
	fcb	$1b,$29,$4c,$06,$64,$02,$8a,$52
	fcb	$0f,$23,$40,$1c,$67,$33,$66,$22
	fcb	$1c,$3e,$24,$67,$23,$3d,$24

x_tag_28c:
	fcb	$00
	fcb	$02,$b8,$1b,$14,$0f,$3d,$1c,$2f
	fcb	$3d,$14,$0b,$6f,$14,$0f,$1b,$c2
	fcb	$26

x_tag_28d:
	fcb	$00
	fcb	$02,$b8,$1b,$2f,$3d,$1c,$14,$16
	fcb	$6f,$1b,$15,$11,$31,$32,$50,$06
	fcb	$11,$30,$30,$1c,$16,$1b,$2a,$3d
	fcb	$17,$14,$85,$50,$13,$1b,$42,$1b
	fcb	$17,$14,$2e,$3e,$14,$0a,$69,$22
	fcb	$36,$3d,$20,$18,$42,$1c,$1e,$2b
	fcb	$1b,$c2,$26

x_tag_28e:
	fcb	$00
	fcb	$01,$c7,$40,$03,$14,$15,$92,$65
	fcb	$35,$90

x_tag_28f:
	fcb	$00
	fcb	$33

x_tag_290:
	fcb	$00
	fcb	$32

x_tag_291:
	fcb	$00
	fcb	$33,$66,$14,$ff,$67,$23,$02,$69
	fcb	$25,$02,$6a,$1b,$25,$35,$01,$31
	fcb	$24,$1b,$c2,$26

x_tag_292:
	fcb	$00
	fcb	$81,$22,$01,$7e,$13,$01,$16,$1b
	fcb	$28,$3e,$11,$ff,$7f,$39,$02,$6c
	fcb	$c0,$24,$c0,$26,$3e,$33,$66,$3e
	fcb	$01,$81,$37,$3e,$67,$c0,$26,$c0
	fcb	$24,$3e,$66,$1b,$c2,$22,$1b,$c2
	fcb	$24,$c0,$10,$c0,$08,$59,$0a,$3b
	fcb	$15,$4c,$04,$1b,$3b,$19,$31,$56
	fcb	$c0,$26,$1c,$5d,$01,$85,$0f,$1b
	fcb	$33,$4b,$4c,$05,$01,$32,$52,$02
	fcb	$0e,$1c,$4e,$02,$38,$3d,$13,$01
	fcb	$16,$c0,$24,$c0,$26,$3e

x_tag_293:
	fcb	$00
	fcb	$01,$89,$1b,$4c,$02,$60,$22,$c1
	fcb	$28

x_tag_294:
	fcb	$00
	fcb	$81,$02,$2e,$0f,$88

x_tag_295:
	fcb	$00
	fcb	$0f,$81

x_tag_296:
	fcb	$00
	fcb	$81,$02,$2e,$1b,$02,$b9,$01,$17
	fcb	$02,$2e,$02,$5b,$3d,$17

x_tag_297:
	fcb	$00
	fcb	$81,$02,$2e,$0f,$02,$b9

x_tag_298:
	fcb	$00
	fcb	$0f,$c0,$42

x_tag_299:
	fcb	$00
	fcb	$64

x_tag_29a:
	fcb	$00
	fcb	$17

x_tag_29b:
	fcb	$00
	fcb	$01,$1e,$01,$1e,$02,$75,$d4,$02
	fcb	$0b,$23,$cc,$24,$3e

x_tag_29c:
	fcb	$00
	fcb	$4e,$06,$11,$49,$51,$02,$5d,$17
	fcb	$22,$c1,$28

x_tag_29d:
	fcb	$00
	fcb	$60,$22,$c1,$28

x_tag_29e:
	fcb	$00
	fcb	$02,$18,$1a,$4c,$08,$33,$4b,$4c
	fcb	$02,$cb,$52,$03,$02,$4e

x_tag_29f:
	fcb	$00
	fcb	$1b,$3c,$29,$23,$01,$a9,$24,$02
	fcb	$a8,$02,$a9

x_tag_2a0:
	fcb	$00
	fcb	$01,$a9,$01,$1e,$02,$ab,$d2,$33
	fcb	$02,$a8,$02,$aa,$d4,$01,$1f,$61
	fcb	$02,$a9

x_tag_2a1:
	fcb	$00
	fcb	$01,$c7,$40,$45,$14,$70,$99,$99
	fcb	$99,$99,$02,$ae,$02,$b5,$01,$1e
	fcb	$01,$c7,$3f,$f6,$36,$61,$97,$72
	fcb	$36,$76,$d3,$02,$b2,$23,$01,$c7
	fcb	$40,$01,$57,$07,$96,$00,$00,$00
	fcb	$25,$cb,$01,$c7,$3f,$93,$26,$79
	fcb	$48,$96,$61,$92,$02,$b3,$01,$1e
	fcb	$01,$c7,$3f,$93,$16,$22,$77,$60
	fcb	$00,$00,$02,$ae,$4e,$06,$61,$02
	fcb	$4d,$52,$53,$01,$1e,$d3,$01,$1e
	fcb	$30,$02,$b4,$bf,$a7,$48,$36,$34
	fcb	$96,$66,$12,$3f,$d2,$80,$59,$18
	fcb	$24,$11,$70,$bf,$f1,$28,$28,$34
	fcb	$70,$40,$96,$01,$20,$d3,$26,$26
	fcb	$01,$1f,$27,$27,$01,$20,$d3,$d2
	fcb	$01,$1f,$2f,$02,$b4,$bf,$c2,$08
	fcb	$44,$80,$44,$22,$04,$3f,$e2,$33
	fcb	$44,$85,$28,$22,$07,$bf,$f4,$61
	fcb	$61,$68,$03,$74,$29,$40,$01,$00
	fcb	$00,$00,$00,$00,$00,$24,$32,$39
	fcb	$4c,$05,$01,$a6,$01,$1f,$d5

x_tag_2a2:
	fcb	$00
	fcb	$32,$94,$32,$4b,$4c,$02,$00,$01
	fcb	$c7,$40,$32,$35,$78,$47,$13,$52
	fcb	$25,$01,$20,$c3,$02,$b5,$01,$1e
	fcb	$01,$c7,$c0,$32,$35,$55,$00,$00
	fcb	$00,$00,$c3,$4c,$05,$61,$02,$4e
	fcb	$00,$33,$33,$33,$11,$3f,$25,$02
	fcb	$ae,$28,$4c,$05,$61,$02,$4d,$00
	fcb	$01,$1e,$01,$c7,$3f,$f8,$68,$58
	fcb	$89,$63,$80,$65,$d3,$02,$b2,$23
	fcb	$01,$c7,$40,$01,$15,$10,$00,$00
	fcb	$00,$00,$25,$cb,$01,$c7,$3f,$c2
	fcb	$92,$54,$64,$97,$02,$28,$02,$b3
	fcb	$01,$1e,$01,$1e,$d3,$01,$1f,$01
	fcb	$20,$30,$02,$b4,$3f,$e3,$32,$87
	fcb	$36,$46,$51,$64,$40,$11,$40,$08
	fcb	$29,$97,$56,$28,$40,$25,$04,$46
	fcb	$48,$89,$50,$59,$d3,$01,$1f,$30
	fcb	$02,$b4,$40,$01,$00,$00,$00,$00
	fcb	$00,$00,$40,$21,$12,$09,$40,$81
	fcb	$09,$66,$40,$31,$00,$89,$29,$77
	fcb	$90,$12,$01,$20,$d4,$d5,$02,$aa
	fcb	$d2,$01,$1e,$d2,$25,$32,$39,$4c
	fcb	$14,$25,$29,$4c,$05,$02,$ad,$52
	fcb	$0b,$01,$c7,$40,$03,$16,$22,$77
	fcb	$66,$01,$68,$d3,$24,$31,$01,$2b
	fcb	$02,$b0

x_tag_2a3:
	fcb	$00
	fcb	$02,$a4,$01,$c7,$40,$02,$30,$25
	fcb	$85,$09,$29,$94,$d3

x_tag_2a4:
	fcb	$00
	fcb	$1b,$3c,$33,$4b,$28,$02,$b5,$1b
	fcb	$95,$42,$23,$33,$02,$b1,$02,$ad
	fcb	$02,$ae,$4e,$07,$24,$40,$23,$32
	fcb	$02,$b0,$01,$1e,$02,$4d,$d2,$01
	fcb	$1f,$01,$a6,$02,$4d,$d2,$01,$a6
	fcb	$01,$1f,$d5,$01,$1e,$01,$1e,$d3
	fcb	$01,$1e,$2f,$02,$b4,$bf,$f7,$14
	fcb	$33,$38,$21,$53,$23,$40,$06,$25
	fcb	$03,$65,$11,$27,$91,$c0,$11,$36
	fcb	$82,$37,$02,$41,$50,$40,$08,$51
	fcb	$67,$31,$98,$72,$39,$01,$20,$d3
	fcb	$01,$1f,$2e,$02,$b4,$40,$01,$00
	fcb	$00,$00,$00,$00,$00,$c0,$11,$32
	fcb	$10,$47,$83,$50,$16,$40,$14,$79
	fcb	$25,$25,$60,$43,$87,$c0,$16,$49
	fcb	$06,$68,$27,$40,$94,$40,$12,$94
	fcb	$15,$75,$01,$72,$32,$d5,$01,$c7
	fcb	$3f,$f8,$68,$58,$89,$63,$80,$65
	fcb	$d2,$d3,$24,$cb,$d2

x_tag_2a5:
	fcb	$00
	fcb	$01,$1e,$d3

x_tag_2a6:
	fcb	$00
	fcb	$01,$1e,$02,$0b,$02,$b5,$32,$94
	fcb	$4e,$69,$1b,$95,$42,$23,$33,$02
	fcb	$b1,$01,$1e,$02,$aa,$d3,$01,$c7
	fcb	$3f,$f5,$80,$66,$10,$00,$00,$00
	fcb	$d2,$01,$20,$01,$c7,$3f,$f1,$75
	fcb	$24,$10,$00,$00,$00,$d2,$01,$c7
	fcb	$3f,$e8,$64,$62,$00,$00,$00,$00
	fcb	$01,$1f,$d5,$d4,$01,$20,$01,$20
	fcb	$d5,$d2,$01,$20,$01,$20,$d5,$01
	fcb	$1f,$01,$c7,$3f,$f2,$50,$00,$00
	fcb	$00,$00,$00,$d3,$d2,$01,$1f,$01
	fcb	$20,$d5,$01,$20,$d4,$02,$aa,$d3
	fcb	$d2,$24,$1b,$32,$39,$4c,$07,$42
	fcb	$23,$02,$ad,$d3,$24,$31,$01,$2b
	fcb	$02,$b0

x_tag_2a7:
	fcb	$00
	fcb	$1b,$37,$39,$4c,$0d,$01,$a9,$14
	fcb	$39,$15,$14,$48,$3d,$01,$aa,$52
	fcb	$02,$61,$14,$39,$15,$14,$48,$3d
	fcb	$23,$25,$15,$3c,$33,$4b,$4e,$06
	fcb	$33,$02,$ac,$52,$0f,$25,$d7,$14
	fcb	$71,$02,$ac,$02,$ae,$4c,$05,$61
	fcb	$33,$02,$ac,$01,$c7,$40,$41,$68
	fcb	$07,$00,$00,$00,$00,$d3,$14,$70
	fcb	$02,$ac,$01,$20,$01,$20,$d5,$02
	fcb	$75,$d3,$d4,$01,$1e,$24,$01,$aa
	fcb	$37,$02,$ac,$d5

x_tag_2a8:
	fcb	$00
	fcb	$12,$69,$16,$01,$c7,$40,$51,$02
	fcb	$94,$19,$99,$99,$99,$02,$ae,$02
	fcb	$b5,$01,$1e,$01,$c7,$3f,$f3,$18
	fcb	$30,$98,$86,$18,$38,$d3,$02,$b2
	fcb	$12,$69,$1c,$32,$39,$01,$13,$cb

x_tag_2a9:
	fcb	$00
	fcb	$01,$c7,$40,$03,$14,$15,$92,$00
	fcb	$00,$00,$01,$1f,$01,$c7,$3f,$96
	fcb	$53,$58,$97,$93,$23,$85,$02,$b3
	fcb	$01,$c7,$3f,$93,$16,$22,$77,$60
	fcb	$00,$00,$02,$ae,$4c,$48,$01,$1e
	fcb	$01,$1e,$01,$1e,$d3,$01,$1e,$2c
	fcb	$02,$b4,$bf,$37,$37,$06,$62,$77
	fcb	$50,$71,$3f,$61,$60,$47,$84,$46
	fcb	$32,$38,$bf,$82,$50,$51,$87,$08
	fcb	$83,$47,$3f,$a2,$75,$57,$31,$64
	fcb	$21,$29,$bf,$c1,$98,$41,$26,$98
	fcb	$23,$22,$3f,$d8,$33,$33,$33,$33
	fcb	$32,$76,$bf,$f1,$66,$66,$66,$66
	fcb	$66,$67,$d3,$d3,$d2,$12,$69,$15
	fcb	$4c,$03,$01,$a6

x_tag_2aa:
	fcb	$00
	fcb	$33,$33,$33,$11,$3f,$f5

x_tag_2ab:
	fcb	$00
	fcb	$01,$c7,$40,$01,$57,$07,$96,$32
	fcb	$67,$95

x_tag_2ac:
	fcb	$00
	fcb	$11,$83,$64,$11,$14,$74,$11,$40
	fcb	$92

x_tag_2ad:
	fcb	$00
	fcb	$01,$c7,$3f,$f3,$16,$22,$77,$66
	fcb	$01,$68

x_tag_2ae:
	fcb	$00
	fcb	$01,$20,$01,$a9,$d4,$02,$0b

x_tag_2af:
	fcb	$00
	fcb	$02,$69,$24,$79,$5d,$3d,$23

x_tag_2b0:
	fcb	$00
	fcb	$31,$94,$4c,$03,$0f,$00,$2f,$6c
	fcb	$22,$3c,$3d,$3c

x_tag_2b1:
	fcb	$00
	fcb	$31,$94,$4c,$03,$0f,$00,$12,$ff
	fcb	$3d,$2f,$6c,$3c,$22,$11,$80,$0f
	fcb	$39,$3d

x_tag_2b2:
	fcb	$00
	fcb	$02,$aa,$2e,$1d,$37,$39,$3a,$d2
	fcb	$cc

x_tag_2b3:
	fcb	$00
	fcb	$01,$20,$d3,$26,$26,$d3,$26,$26
	fcb	$01,$1e,$02,$75,$01,$1e,$27,$27
	fcb	$d4,$26,$26,$d4,$27,$27,$d2,$27
	fcb	$27,$d4

x_tag_2b4:
	fcb	$00
	fcb	$23,$02,$4e,$25,$4c,$0f,$01,$20
	fcb	$d3,$27,$22,$40,$1c,$2b,$3d,$26
	fcb	$d7,$d2,$53,$0f,$01,$1f,$61,$24
	fcb	$0f

x_tag_2b5:
	fcb	$00
	fcb	$4c,$06,$11,$41,$45,$02,$5d

x_tag_2b6:
	fcb	$00
	fcb	$32,$66,$33,$c1,$44,$1b,$02,$6a
	fcb	$1b,$c1,$2a,$3d,$40,$c1,$32,$02
	fcb	$69,$c0,$2a

x_tag_2b7:
	fcb	$00
	fcb	$14,$81,$58,$02,$00,$c0,$32,$c0
	fcb	$2a,$01,$17,$4c,$07,$32,$c1,$44
	fcb	$0f,$52,$04,$c0,$2a,$18,$32,$c2
	fcb	$2a

x_tag_2b8:
	fcb	$00
	fcb	$14,$1b,$02,$b6,$ad,$9f,$5f,$11
	fcb	$02,$b7,$14,$28,$1b,$01,$14,$16
	fcb	$01,$b7,$01,$15

x_tag_2b9:
	fcb	$00
	fcb	$81,$1b,$15,$3d,$02,$5b,$3e

x_tag_2ba:
	fcb	$00
	fcb	$c0,$20,$15,$40,$00
	cstr	"New File"

x_tag_307:
	jsr	Sffeb
	fcb	$02,$08,$01,$03,$02,$02,$02,$02
	fcb	$08,$02,$02

x_tag_308:
	jsr	Sffeb
	NOP
	fcb	$eb,$ed,$f2,$ee,$ef,$f0,$f3,$ec
	fcb	$f1

x_tag_309:
	jsr	Sffeb
	sbc	Zf6,X
	SED
	
	fcb	$fc,$f9,$fa,$fb,$fd,$f7,$f4

	mstr	"ABS"
	fcb	$81,$01,$01
	mstr	"FIX"
	fcb	$81,$01,$01
	mstr	"ROUND"
	fcb	$81,$01,$01
	mstr	"FLOAT"
	fcb	$81,$01,$00
	mstr	"CHR$"
	fcb	$83,$01,$00
	mstr	"STR$"
	fcb	$83,$01,$01
	mstr	"STRF$"
	fcb	$83,$08,$01
	fcb	$00,$00,$00,$00,$00,$00,$00
	mstr	"MOD"
	fcb	$25,$80,$02,$00,$00
	mstr	"MAX"
	fcb	$25,$80,$02,$00,$00
	mstr	"MIN"
	fcb	$25,$80,$02,$00,$00
	mstr	"BAND"
	fcb	$80,$02,$00,$00
	mstr	"BOR"
	fcb	$80,$02,$00,$00
	mstr	"BXOR"
	fcb	$80,$02,$00,$00
	mstr	"CHAR"
	fcb	$80,$02,$03,$00
	mstr	"MOD"
	fcb	$81,$02,$01,$01
	mstr	"MAX"
	fcb	$81,$02,$01,$01
	mstr	"MIN"
	fcb	$81,$02,$01,$01
	mstr	"LEFT$"
	fcb	$83,$02,$03,$00
	mstr	"RIGHT$"
	fcb	$83,$02,$03,$00
	mstr	"SEARCH"
	fcb	$80,$03,$03,$03,$00
	mstr	"INSERT$"
	fcb	$83,$03,$03,$03,$00
	mstr	"SUB$"
	fcb	$83,$03,$03,$03,$00
	mstr	"ERASE$"
	fcb	$83,$03,$03,$00,$00
	mstr	"MID$"
	fcb	$83,$03,$03,$00,$00
	mstr	"DATE$"
	fcb	$83,$00
	mstr	"TIME$"
	fcb	$83,$00
	mstr	"PI"
	fcb	$81,$00
	mstr	"FALSE"
	fcb	$82,$00
	mstr	"TRUE"
	fcb	$82,$00
	mstr	"SPC$"
	fcb	$83,$01,$00
	mstr	"FREE"
	fcb	$80,$01,$00
	mstr	"EXIST"
	fcb	$82,$01,$03
	mstr	"FREC"
	fcb	$80,$01,$00
	mstr	"FADR"
	fcb	$80,$01,$00
	mstr	"FGET"
	fcb	$80,$01,$00
	mstr	"FLEN"
	fcb	$80,$01,$00
	mstr	"POS"
	fcb	$80,$01,$00
	mstr	"ABS%"
	fcb	$80,$01,$00
	mstr	"PEEK"
	fcb	$80,$01,$00
	mstr	"INT"
	fcb	$80,$01,$01
	mstr	"ASC"
	fcb	$80,$01,$03
	mstr	"LEN"
	fcb	$80,$01,$03
	mstr	"VAL"
	fcb	$81,$01,$03
	mstr	"SIN"
	fcb	$81,$01,$01
	mstr	"COS"
	fcb	$81,$01,$01
	mstr	"TAN"
	fcb	$81,$01,$01
	mstr	"EXP"
	fcb	$81,$01,$01
	mstr	"LN"
	fcb	$81,$01,$01
	mstr	"LOG"
	fcb	$81,$01,$01
	mstr	"SQR"
	fcb	$81,$01,$01
	mstr	"SQRT"
	fcb	$81,$01,$01
	mstr	"RND"
	fcb	$81,$01,$01

x_tag_30e:
	fcb	$00
	fcb	$c0,$20,$3d

x_tag_30f:
	fcb	$00
	fcb	$43,$14,$0c,$3d,$03,$0e,$15,$03
	fcb	$0e

x_tag_310:
	fcb	$00
	fcb	$14,$38,$03,$0e

x_tag_311:
	fcb	$00
	fcb	$31,$03,$0e

x_tag_312:
	fcb	$00
	fcb	$43,$43,$c0,$20,$1b,$14,$0a,$3d
	fcb	$15,$3d,$3d

x_tag_2d3:
	fcb	$00
	fcb	$03,$12,$15

x_tag_2bd:
	fcb	$00
	fcb	$03,$12,$41,$15,$03,$0e

x_tag_313:
	fcb	$00
	fcb	$23,$33,$02,$ba,$5d,$3e,$34,$4a
	fcb	$4c,$12,$5d,$3d,$01,$12,$22,$1c
	fcb	$02,$d3,$25,$01,$17,$4c,$02,$20
	fcb	$0f,$53,$15,$1b,$02,$d3,$25,$48
	fcb	$4c,$06,$60,$33,$24,$0f,$00,$1c
	fcb	$02,$d3,$24,$1c,$58,$04,$0e,$33
	fcb	$00,$22,$01,$17,$4e,$02,$22,$0f
	fcb	$34

x_tag_2d4:
	fcb	$00
	fcb	$40,$c0,$20,$15,$c0,$20,$15,$33
	fcb	$54,$1c,$3b,$02,$bd,$01,$17,$4c
	fcb	$04,$0f,$3b,$55,$57,$60,$40

x_tag_314:
	fcb	$00
	fcb	$23,$1b,$25,$3d,$22,$c0,$26,$30
	fcb	$1d,$3e,$6f,$24,$63,$1b,$c2,$26
	fcb	$03,$10,$14,$0a,$03,$0e,$54,$1b
	fcb	$3b,$19,$31,$56,$0f

x_tag_315:
	fcb	$00
	fcb	$23,$42,$1b,$03,$12,$25,$1c,$41
	fcb	$19,$15,$34,$48,$4d,$0b,$0f,$24
	fcb	$0f

x_tag_316:
	fcb	$00
	fcb	$03,$0a,$33,$c1,$52,$33,$c1,$1c
	fcb	$11,$fe,$01,$c1,$68,$c0,$88,$02
	fcb	$bd,$c0,$88,$42,$02,$bd,$1c,$3e
	fcb	$1b,$23,$03,$14,$c0,$88,$c0,$8e
	fcb	$4e,$13,$c0,$88,$03,$12,$2f,$03
	fcb	$14,$34,$c0,$20,$19,$2f,$14,$0a
	fcb	$03,$0e,$19,$40,$24,$63,$03,$15

x_tag_317:
	fcb	$00
	fcb	$1b,$15,$1b,$14,$ff,$39,$23,$2d
	fcb	$48,$25,$14,$10,$48,$3a,$24,$14
	fcb	$0a,$48,$3a,$28

x_tag_318:
	fcb	$00
	fcb	$01,$0e,$11,$fe,$01,$58,$05,$11
	fcb	$fe,$01,$00,$03,$17,$4c,$04,$41
	fcb	$53,$0e,$1b,$1b,$17,$3d,$11,$fe
	fcb	$01,$58,$02,$00,$03,$17,$4d,$0b
	fcb	$0f,$41,$53,$20

x_tag_2d5:
	fcb	$00
	fcb	$32,$c1,$3c,$02,$54,$03,$18,$1b
	fcb	$2f,$3e,$15,$23,$33,$02,$bd,$40
	fcb	$25,$01,$17,$25,$3f,$02,$ba,$02
	fcb	$bd,$01,$17,$39,$4e,$07,$33,$c1
	fcb	$52,$24,$0e,$00,$7a
	cstr	" in line "
	fcb	$24
	fcb	$02,$d4,$02,$d3,$7a,$01,$23,$01
	fcb	$6c,$1b,$11,$fe,$01,$49,$c0,$70
	fcb	$39,$4c,$12,$1b,$41,$15,$02,$d4
	fcb	$02,$d3,$7a,$01,$23,$01,$6c,$1b
	fcb	$17,$3d,$53,$19,$0f

x_tag_319:
	fcb	$00
	fcb	$2d,$03,$0e,$15

x_tag_31a:
	fcb	$00
	fcb	$03,$19,$02,$bd,$15,$11,$03,$0c
	fcb	$48,$4c,$0a,$2f,$03,$0e,$15,$03
	fcb	$19,$02,$bd,$16

x_tag_31b:
	fcb	$00
	fcb	$03,$1a,$2d,$03,$0e,$16,$03,$19
	fcb	$c0,$20,$15,$51,$0f,$11,$03,$0c
	fcb	$03,$19,$02,$bd,$1b,$15,$2f,$03
	fcb	$0e,$16,$16

x_tag_30c:
	fcb	$00
	fcb	$32,$c1,$3c,$03,$19,$02,$d3,$7a
	fcb	$01,$23,$01,$6c,$03,$19,$42,$03
	fcb	$1b,$24,$3f,$23

x_tab_2bc:
	fcb	$00
	fcb	$02,$d4,$42,$03,$1b,$02,$5e

x_tag_31c:	fcb	$00
	fcb	$c0,$16,$4c,$04,$1b,$03,$1b,$02
	fcb	$bd

x_tag_2be:
	fcb	$00
	fcb	$03,$13,$4c,$06,$11,$47,$4f,$02
	fcb	$5d,$03,$1c

x_tag_2bf:
	fcb	$00
	fcb	$1b,$23,$41,$15,$02,$be,$c0,$16
	fcb	$4e,$19,$25,$16,$03,$11,$15,$25
	fcb	$41,$1b,$c0,$20,$3e,$03,$11,$16
	fcb	$16,$24,$40,$18,$27,$0e,$24,$40
	fcb	$23,$00,$60,$1b,$42,$25,$50,$06
	fcb	$11,$47,$4f,$02,$5d,$1b,$24,$16

x_tag_2d0:
	fcb	$00
	fcb	$33,$c1,$1c,$33,$c1,$52,$01,$0d
	fcb	$02,$c0

x_tag_2d2:
	fcb	$00
	fcb	$32,$c1,$3c,$7e,$7a
	cstr	"Stopped"
	fcb	$02,$d5,$25
	fcb	$c1,$52,$02,$c0

x_tag_2c2:
	fcb	$00
	fcb	$32,$c1,$70

x_tag_2c3:
	fcb	$00
	fcb	$33,$c1,$70

x_tag_31d:
	fcb	$00
	fcb	$c0,$52,$1a,$4c,$05,$24,$0f,$23
	fcb	$00,$11,$43,$43,$02,$5d

x_tag_30a:
	fcb	$00
	fcb	$03,$1a,$c0,$20,$1b,$2b,$3d,$15
	fcb	$3e,$23,$03,$11,$15,$1a,$4c,$1c
	fcb	$03,$0e,$1b,$3f,$15,$25,$3e,$42
	fcb	$02,$d4,$02,$d3,$22,$1b,$15,$03
	fcb	$11,$32,$2f,$1d,$30,$3e,$1e,$16
	fcb	$16,$53,$1f,$24,$0f,$c0,$20,$1b
	fcb	$2b,$3d,$16

x_tag_2cb:
	fcb	$00
	fcb	$7e,$02,$55,$d9,$02,$ba,$33,$4b
	fcb	$4c,$12,$1b,$4c,$05,$02,$be,$52
	fcb	$03,$03,$1c,$01,$0e,$41,$15,$01
	fcb	$0d,$26,$00,$03,$0d

x_tag_2cd:
	fcb	$00
	fcb	$c0,$16,$4e,$0c,$32,$c1,$16,$03
	fcb	$0a,$25,$02,$d4,$42,$03,$1b

x_tag_2ce:
	fcb	$00
	fcb	$c0,$16,$4c,$06,$33,$c1,$16,$03
	fcb	$1a

x_tag_2d1:
	fcb	$00
	fcb	$03,$0a,$01,$7e,$13,$01,$16,$c0
	fcb	$00,$c0,$22,$1c,$3e,$63,$01,$85
	fcb	$0f,$01,$57

x_tag_31e:
	fcb	$00
	fcb	$1c,$16,$41

x_tag_2cc:
	fcb	$00
	fcb	$11,$fe,$01,$c1,$68,$27,$01,$0d
	fcb	$26,$34,$c1,$82,$33,$c1,$52,$33
	fcb	$c1,$1c,$33,$13,$01,$16,$c0,$20
	fcb	$32,$03,$1e,$33,$03,$1e,$33,$03
	fcb	$1e,$33,$03,$1e,$c0,$20,$03,$1e

; $6572
	fcb	$14,$38,$41,$1b,$2f,$3d,$23,$03
	fcb	$1e,$14,$0b,$33,$54,$25,$03,$1e
	fcb	$57,$24,$42,$23,$14,$0b,$33,$54
	fcb	$25,$03,$1e,$57,$11,$02,$d0,$03
	fcb	$1e,$34,$03,$1e,$14,$38,$03,$1e
	fcb	$37,$1c,$18,$42,$c1,$26,$03,$0b
	fcb	$24,$0f,$02,$55,$00,$00,$00,$33
	fcb	$01,$00,$32,$02,$00,$31,$03,$00
	fcb	$30,$04,$00,$2f,$05,$00,$2e,$06
	fcb	$00,$2d,$07,$00,$2c,$08,$00,$2b
	fcb	$09,$00,$2a,$ff,$ff,$34,$20,$00
	fcb	$35,$30,$00,$36,$80,$00,$37,$d7
	fcb	$02,$a5,$12,$3d,$3e,$41,$3c,$41
	fcb	$41,$2b,$2d,$2a,$2f,$5e,$3b,$3a
	fcb	$2c,$28,$29,$23,$00,$39,$46,$4b
	fcb	$46,$60,$46,$67,$65,$7b,$65,$81
	fcb	$65,$a1,$65,$a9,$65,$bd,$65,$cf
	fcb	$65,$db,$65,$ef,$65,$f4,$65,$fb
	fcb	$65,$02,$66,$0c,$66,$3b,$66,$41
	fcb	$66,$4d,$66,$55,$66,$59,$66,$52
	fcb	$54,$62,$66,$5b,$48,$6e,$66,$63
	fcb	$54,$cf,$66,$da,$66,$66,$67,$a3
	fcb	$67,$a6,$67,$a9,$67,$b9,$67,$da
	fcb	$67,$fa,$67,$11,$68,$25,$68,$42
	fcb	$68,$c1,$6a,$a4,$6b,$cf,$6c,$5f
	fcb	$54,$7b,$68,$a8,$68,$bf,$68,$ce
	fcb	$68,$d6,$68,$e2,$68,$f5,$68,$00
	fcb	$69,$14,$69,$46,$69,$b3,$69,$e0
	fcb	$69,$ed,$69,$fd,$69,$07,$6a,$5c
	fcb	$6a,$65,$6a,$05,$69,$b8,$65,$5b
	fcb	$54,$9c,$6a,$ad,$6a,$20,$eb,$ff
	fcb	$00,$06,$06,$06,$06,$06,$06,$08
	fcb	$09,$0a,$0b,$0c,$00,$0e,$0e,$04
	fcb	$02,$00,$24,$79,$5d,$3d,$23,$00
	fcb	$1b,$23,$12,$56,$c0,$66,$3e,$67
	fcb	$c0,$64,$1b,$30,$1d,$3d,$c0,$66
	fcb	$c0,$64,$3e,$6f,$1b,$c2,$66,$24
	fcb	$1c,$3e,$4c,$04,$32,$c1,$50,$00
	fcb	$32,$c5,$4c,$04,$c0,$64,$18,$00
	fcb	$c5,$c0,$64,$22,$6f,$c0,$64,$17
	fcb	$14,$7f,$39,$c0,$64,$18,$00,$68
	fcb	$01,$69,$c7,$00,$1b,$12,$56,$c0
	fcb	$66,$3e,$67,$33,$66,$22,$1c,$3e
	fcb	$4c,$04,$32,$c1,$50,$00,$32,$c8
	fcb	$1a,$4c,$07,$22,$c0,$66,$18,$c2
	fcb	$66,$00,$c8,$c0,$66,$22,$1b,$23
	fcb	$6f,$c0,$66,$17,$14,$7f,$39,$c0
	fcb	$66,$18,$24,$c2,$66,$00,$c0,$66
	fcb	$c1,$64,$00,$c0,$9e,$15,$31,$c2
	fcb	$9e,$00,$c0,$9e,$17,$32,$c2,$9e
	fcb	$00,$c0,$9e,$23,$03,$20,$24,$c1
	fcb	$9e,$00,$b5,$00,$85,$42,$b5,$01
	fcb	$85,$43,$a0,$00,$b1,$42,$10,$19
	fcb	$d6,$02,$d0,$15,$a5,$42,$95,$02
	fcb	$a5,$43,$95,$03,$98,$95,$01,$c8
	fcb	$b1,$42,$10,$fb,$94,$00,$4c,$09
	fcb	$00,$e6,$42,$d0,$dd,$e6,$43,$d0
	fcb	$d9,$00,$42,$22,$03,$0f,$cf,$00
	fcb	$02,$51,$02,$51,$c0,$9e,$02,$50
	fcb	$1f,$02,$50,$00,$c0,$9e,$c0,$86
	fcb	$22,$01,$17,$00,$d1,$d2,$28,$00
	fcb	$1b,$3c,$13,$22,$13,$25,$5a,$60
	fcb	$00,$1f,$23,$11,$e5,$5f,$14,$0a
	fcb	$24,$32,$01,$3b,$00,$1f,$23,$11
	fcb	$f2,$5f,$14,$0a,$24,$32,$01,$3b

x_tag_323:
	fcb	$00
	fcb	$1b,$2b,$01,$2b,$c3,$c0,$9c,$4a
	fcb	$4c,$07,$14,$60,$d5,$14,$29,$c6
	fcb	$d5,$e9,$2b,$01,$2b,$c3,$32,$3a
	fcb	$c1,$9c,$32

x_tag_324:
	fcb	$00
	fcb	$c0,$9c,$4c,$09,$14,$60,$d5,$14
	fcb	$29,$c6,$52,$04,$32,$c1,$9c,$d5
	fcb	$32

x_tag_325:
	fcb	$00
	fcb	$1b,$2b,$01,$2b,$c3,$01,$12,$43
	fcb	$c0,$9c,$4a,$4c,$07,$14,$60,$d5
	fcb	$14,$29,$c6,$d5,$e9,$2b,$01,$2b
	fcb	$c3,$c1,$9c,$32,$00

x_tag_326:
	jsr	Sffee
	fcb	$03,$23,$03,$24,$03,$25,$00,$33
	fcb	$d5,$33,$c1,$9c,$47,$28,$4d,$02
	fcb	$fd,$00,$e9,$14,$60,$58,$06,$14
	fcb	$28,$c6,$52,$19,$14,$68,$58,$06
	fcb	$14,$2d,$c6,$52,$10,$14,$70,$58
	fcb	$0a,$c4
	cstr	"NOT "
	fcb	$c7
	fcb	$52,$03,$0f,$33,$1a,$4c,$04,$fd
	fcb	$53,$26,$e9,$1b,$4c,$59,$e9,$14
	fcb	$3c,$58,$0a,$c4
	cstr	" OR "
	fcb	$c7,$52,$44,$14,$44,$58,$0b
	fcb	$c4
	cstr	" XOR "
	fcb	$c7
	fcb	$52,$36,$14,$4c,$58,$0b,$c4
	cstr	" AND "
	fcb	$c7,$52,$28
	fcb	$2b,$01,$2b,$30,$58,$08,$c4,$02
	fcb	$3e,$3d,$c7,$52,$1b,$2e,$58,$08
	fcb	$c4,$02,$3c,$3d,$c7,$52,$11,$2d
	fcb	$58,$08,$c4,$02,$3c,$3e,$c7,$52
	fcb	$07,$11,$d4,$64,$3d,$17,$c6,$d9
	fcb	$2b,$01,$2b,$c3,$c1,$9c,$c0,$9c
	fcb	$01,$12,$43,$c1,$9c,$00,$1c,$33
	fcb	$30,$5a,$22,$2b,$48,$3a,$4c,$05
	fcb	$d0,$c7,$52,$2f,$1c,$14,$0a,$48
	fcb	$4c,$0e,$60,$43,$42,$11,$fc,$5f
	fcb	$cf,$5d,$26,$3d,$42,$52,$07,$d0
	fcb	$5d,$40,$26,$3d,$40,$17,$1a,$4c
	fcb	$10,$14,$29,$c6,$33,$54,$da,$14
	fcb	$2c,$c6,$57,$14,$28,$c0,$64,$18
	fcb	$27,$c7,$00,$dc,$db,$00,$fc,$db
	fcb	$00,$d7,$c0,$8e,$4c,$05,$c0,$94
	fcb	$c1,$26,$02,$17,$c7,$c1,$28,$db
	fcb	$00,$14,$22,$c6,$1b,$17,$1c,$3d
	fcb	$5d,$3e,$4c,$11,$54,$3b,$17,$1b
	fcb	$14,$22,$50,$04,$14,$22,$c6,$c6
	fcb	$34,$56,$52,$02,$0e,$14,$22,$c6
	fcb	$db,$00,$1b,$23,$14,$16,$3e,$11
	fcb	$9d,$7c,$cf,$22,$1c,$c7,$25,$14
	fcb	$28,$48,$24,$14,$29,$48,$3a,$4e
	fcb	$07,$c2,$64,$35,$c6,$52,$02,$0f
	fcb	$cb,$00,$c0,$8e,$4c,$11,$1b,$14
	fcb	$35,$48,$1c,$14,$36,$48,$3a,$4c
	fcb	$06,$11,$42,$55,$02,$5d,$e1,$da
	fcb	$00,$c0,$64,$42,$17,$48,$c0,$66
	fcb	$c0,$64,$3e,$30,$48,$39,$4c,$05
	fcb	$c0,$64,$c1,$66,$00,$1b,$15,$03
	fcb	$13,$4c,$11,$7a
	cstr	"***UNDEF :"
	fcb	$0f
	fcb	$34,$52,$05,$42,$c0,$8c,$62,$22
	fcb	$16,$00,$e6,$03,$21,$33,$33,$26
	fcb	$ce,$1b,$03,$21,$d8,$0f,$60,$cd
	fcb	$dc,$27,$0e,$1f,$23,$c0,$9e,$23
	fcb	$d2,$28,$1b,$23,$4c,$0b,$e6,$3c
	fcb	$13,$41,$13,$44,$5a,$24,$0f,$23
	fcb	$24,$4c,$0a,$3c,$03,$21,$14,$2c
	fcb	$c9,$cb,$53,$2a,$24,$c1,$9e,$24
	fcb	$01,$0c,$00,$e1,$c0,$8c,$4c,$05
	fcb	$c0,$9e,$41,$e4,$c0,$9e,$41,$15
	fcb	$fc,$c0,$8e,$4c,$18,$34,$c0,$9e
	fcb	$40,$1e,$c0,$9e,$40,$17,$03,$21
	fcb	$c0,$9e,$41,$15,$02,$be,$c0,$98
	fcb	$3d,$c0,$9e,$16,$2f,$c2,$9e,$00
	fcb	$e1,$c0,$9e,$15,$42,$02,$d4,$02
	fcb	$d3,$fc,$c0,$8e,$4c,$06,$c0,$98
	fcb	$c0,$9e,$19,$2f,$c2,$9e,$00,$36
	fcb	$e3,$e2,$14,$2c,$c9,$ce,$03,$21
	fcb	$cb,$e5,$ce,$03,$21,$00,$36,$e3
	fcb	$e1,$e5,$ce,$03,$21,$00,$36,$e3
	fcb	$e1,$e6,$d8,$0f,$22,$03,$21,$cd
	fcb	$dc,$00,$e1,$e5,$c0,$8e,$4c,$0d
	fcb	$14,$ba,$c0,$92,$3d,$15,$14,$8a
	fcb	$c0,$92,$3d,$16,$00,$e2,$c4,$05
	fcb	$20,$54,$4f,$20,$23,$c7,$da,$00
	fcb	$e2,$14,$23,$c6,$00,$e1,$e6,$1b
	fcb	$03,$21,$d8,$0f,$60,$cd,$dc,$14
	fcb	$2c,$c6,$da,$00,$e1,$33,$33,$26
	fcb	$cd,$cd,$dc,$32,$c2,$9e,$27,$0e
	fcb	$1f,$23,$c0,$9e,$23,$d2,$28,$1b
	fcb	$23,$4c,$08,$e6,$14,$db,$48,$24
	fcb	$0f,$23,$24,$4c,$0b,$14,$db,$03
	fcb	$21,$14,$2c,$c9,$cb,$53,$25,$24
	fcb	$c1,$9e,$24,$01,$0c,$00,$14,$31
	fcb	$e3,$e1,$33,$d5,$33,$d5,$33,$c1
	fcb	$72,$1b,$23,$d4,$4c,$12,$03,$21
	fcb	$c0,$72,$1a,$4c,$02,$c9,$cb,$14
	fcb	$3b,$c1,$72,$da,$d3,$52,$1a,$1b
	fcb	$03,$1f,$02,$28,$4c,$12,$03,$21
	fcb	$14,$2c,$1b,$c0,$72,$50,$04,$c9
	fcb	$52,$03,$c1,$72,$d3,$52,$02,$33
	fcb	$cb,$4c,$07,$24,$0f,$d1,$e6,$53
	fcb	$36,$d9,$1a,$0f,$d9,$1a,$4c,$07
	fcb	$c1,$9e,$01,$0c,$52,$02,$0f,$25
	fcb	$03,$1f,$02,$27,$c0,$72,$28,$28
	fcb	$39,$4c,$08,$24,$03,$21,$31,$c2
	fcb	$9e,$00,$24,$0f,$c0,$72,$1a,$4c
	fcb	$02,$c9,$00,$14,$31,$e1,$cd,$26
	fcb	$1c,$32,$48,$1c,$14,$de,$48,$39
	fcb	$4c,$04,$0e,$52,$0b,$da,$c4
	cstr	" STEP "
	fcb	$c7,$da
	fcb	$c4
	cstr	" TO "
	fcb	$c7,$da
	fcb	$c4,$01,$3d,$c7,$27,$d0,$c7,$00
	fcb	$e1,$cd,$14,$10,$50,$04,$32,$52
	fcb	$02,$33,$cd,$dc,$00,$e2,$31,$c2
	fcb	$9e,$c4
	cstr	" THEN "
	fcb	$ca,$cb,$e8,$00,$e1,$cd,$c0
	fcb	$9e,$1c,$40,$ca,$c2,$9e,$00,$23
	fcb	$14,$34,$e2,$35,$c9,$cb,$c0,$8e
	fcb	$4c,$23,$25,$14,$35,$50,$0c,$11
	fcb	$02,$64,$03,$21,$14,$50,$14,$c8
	fcb	$52,$0a,$11,$02,$65,$03,$21,$14
	fcb	$52,$14,$ca,$c0,$92,$3d,$15,$22
	fcb	$c0,$90,$3d,$16,$24,$e1,$cc,$c0
	fcb	$8c,$4c,$04,$c0,$9e,$e4,$cc,$c0
	fcb	$8e,$4c,$0b,$1b,$02,$be,$c0,$98
	fcb	$3d,$c0,$9e,$3f,$16,$fc,$40,$1b
	fcb	$33,$4b,$4c,$07,$14,$2c,$c9,$cb
	fcb	$53,$21,$0f,$00,$14,$31,$e3,$e2
	fcb	$14,$2c,$c6,$da,$00,$c0,$86,$23
	fcb	$e1,$2a,$cd,$d0,$c0,$9e,$1b,$15
	fcb	$40,$3d,$c1,$86,$5d,$40,$ca,$cb
	fcb	$3d,$40,$17,$30,$c2,$9e,$33,$54
	fcb	$cd,$03,$21,$2b,$cd,$dc,$14,$2c
	fcb	$c6,$57,$14,$28,$c0,$64,$18,$c4
	fcb	$02,$29,$3d,$ca,$cb,$e6,$0f,$da
	fcb	$24,$c1,$86,$00,$25,$17,$58,$09
	fcb	$27,$0f,$42,$79,$22,$17,$47,$00
	fcb	$24,$30,$3d,$23,$00,$25,$17,$3c
	fcb	$31,$3a,$58,$09,$27,$0f,$42,$79
	fcb	$22,$17,$47,$00,$24,$30,$3d,$23
	fcb	$00,$ce,$1b,$4e,$02,$00,$1b,$23
	fcb	$1f,$23,$11,$7b,$71,$11,$58,$00
	fcb	$24,$31,$01,$3b,$4c,$06,$2b,$3d
	fcb	$22,$52,$1e,$1b,$03,$1f,$01,$a6
	fcb	$1c,$03,$1f,$63,$3a,$4c,$07,$0f
	fcb	$14,$68,$32,$52,$0c,$1b,$03,$1f
	fcb	$28,$1b,$4c,$05,$60,$14,$70,$22
	fcb	$4c,$05,$c0,$a0,$52,$a1,$d6,$4c
	fcb	$07,$60,$cd,$14,$dd,$52,$98,$1b
	fcb	$3c,$13,$74,$13,$a7,$5a,$4c,$0c
	fcb	$60,$13,$74,$3e,$14,$0a,$22,$14
	fcb	$dd,$52,$84,$0f,$32,$11,$d4,$64
	fcb	$11,$a7,$64,$54,$1c,$3b,$41,$17
	fcb	$50,$08,$0e,$3b,$15,$14,$de,$33
	fcb	$55,$30,$56,$4c,$6a,$14,$cb,$58
	fcb	$03,$52,$64,$14,$cd,$58,$03,$52
	fcb	$5e,$14,$cc,$58,$03,$52,$58,$11
	fcb	$02,$15,$58,$03,$52,$51,$11,$02
	fcb	$14,$58,$03,$52,$4a,$14,$11,$58
	fcb	$06,$cc,$14,$de,$52,$41,$14,$14
	fcb	$58,$06,$cd,$14,$de,$52,$38,$14
	fcb	$13,$58,$09,$cd,$13,$00,$3a,$14
	fcb	$de,$52,$2c,$14,$12,$58,$09,$cd
	fcb	$12,$00,$3a,$14,$de,$52,$20,$11
	fcb	$01,$c7,$58,$0a,$c0,$9e,$14,$df
	fcb	$2b,$c2,$9e,$52,$12,$11,$02,$af
	fcb	$58,$0a,$c0,$9e,$14,$e0,$cd,$c2
	fcb	$9e,$52,$04,$24,$0f,$00,$24,$03
	fcb	$21,$53,$e0,$00,$1b,$03,$21,$d8
	fcb	$4c,$0c,$60,$cd,$26,$da,$c4,$01
	fcb	$3d,$c7,$27,$dc,$00,$d4,$1c,$03
	fcb	$1f,$02,$28,$3a,$1c,$03,$1f,$02
	fcb	$27,$3a,$4c,$05,$14,$27,$f3,$00
	fcb	$11,$01,$18,$58,$05,$14,$42,$f6
	fcb	$00,$14,$c1,$58,$0d,$da,$14,$23
	fcb	$c6,$14,$2c,$c9,$32,$c2,$9e,$e8
	fcb	$00,$11,$02,$36,$58,$0a,$da,$14
	fcb	$23,$c6,$14,$2c,$c9,$e8,$00,$11
	fcb	$01,$48,$58,$04,$36,$f9,$00,$ff
	fcb	$2f,$19,$f9,$ff,$30,$1a,$fb,$ff
	fcb	$31,$1b,$e2,$ff,$32,$1c,$f9,$ff
	fcb	$33,$1d,$e2,$ff,$34,$1e,$f9,$ff
	fcb	$35,$1f,$f9,$ff,$3e,$2b,$ef,$ff
	fcb	$3c,$2a,$ed,$ff,$40,$2a,$ec,$ff
	fcb	$4a,$2c,$ee,$fe,$e5,$01,$f4,$fe
	fcb	$e6,$00,$f4,$fe,$e3,$32,$e1,$fe
	fcb	$e4,$32,$f5,$fe,$da,$3e,$fa,$fe
	fcb	$db,$38,$f2,$fe,$dd,$35,$eb,$fe
	fcb	$e2,$37,$e1,$ff,$2c,$2e,$f0,$ff
	fcb	$2d,$2f,$f1,$ff,$55,$43,$e1,$fe
	fcb	$e7,$18,$e2,$ff,$26,$20,$e1,$ff
	fcb	$4b,$21,$f9,$fe,$e0,$36,$eb,$fe
	fcb	$d9,$2d,$e1,$11,$02,$66,$58,$09
	fcb	$14,$33,$e1,$32,$c2,$9e,$e8,$00
	fcb	$11,$53,$59,$02,$5d

x_tag_322:
	fcb	$00
	fcb	$27,$32,$23,$26,$fe,$fe,$28,$f7
	fcb	$fe,$ff,$29,$f7,$ff,$d1,$44,$e1
	fcb	$ff,$cb,$3b,$e2,$ff,$cd,$3f,$e1
	fcb	$ff,$ce,$40,$e1,$ff,$c8,$24,$e1
	fcb	$ff,$c9,$24,$e2,$ff,$ca,$24,$f9
	fcb	$ff,$c1,$17,$e2,$fe,$dc,$35,$e2
	fcb	$fe,$df,$36,$e2,$11,$02,$c2,$58
	fcb	$0a,$14,$25,$e1,$c4
	cstr	"ON"
	fcb	$ca,$00,$11,$02,$c3,$58,$0b,$14
	fcb	$25,$e1,$c4
	cstr	"OFF"
	fcb	$ca
	fcb	$00,$e7,$27,$33,$24,$0f,$23,$26
	fcb	$00,$e6,$11,$02,$d0,$58,$10,$c0
	fcb	$8e,$4c,$08,$11,$02,$5a,$c0,$9e
	fcb	$3f,$16,$14,$3a,$e1,$00,$11,$02
	fcb	$d2,$58,$10,$c0,$8e,$4c,$08,$11
	fcb	$02,$5a,$c0,$9e,$3f,$16,$14,$39
	fcb	$e1,$00,$fe,$de,$35,$ea,$fe,$e1
	fcb	$36,$ea,$fe,$e8,$35,$f8,$fe,$e9
	fcb	$36,$f8,$03,$22,$24,$4c,$0a,$c0
	fcb	$8e,$4c,$06,$11,$42,$55,$02,$5d

x_tag_30d:
	fcb	$00
	fcb	$7e,$7a
	cstr	"--NONE--"
	fcb	$02,$c0

x_tag_327:
	fcb	$00
	fcb	$1b,$29,$4c,$06,$11,$4c,$49,$02
	fcb	$5d,$03,$13

x_tag_328:
	fcb	$00
	fcb	$03,$27,$29,$3e,$c1,$80,$03,$27
	fcb	$33,$4b,$3d,$c1,$7e,$c0,$80,$c0
	fcb	$7e,$02,$13,$c0,$20,$15,$32,$4b
	fcb	$39

x_tag_329:
	fcb	$00
	fcb	$c1,$88,$03,$16

x_tag_2c5:
	fcb	$00
	fcb	$27,$01,$0d,$26,$03,$27,$4c,$03
	fcb	$03,$0d,$03,$29

x_tag_2c6:
	fcb	$00
	fcb	$27,$01,$0d,$26,$03,$28,$4c,$0d
	fcb	$c0,$80,$42,$c0,$7e,$54,$c0,$7e
	fcb	$03,$29,$57,$00,$03,$0d

x_tag_32a:
	fcb	$00
	fcb	$03,$1a,$11,$e7,$64,$13,$1b,$1b
	fcb	$01,$14,$16,$12,$06,$2f,$35,$01
	fcb	$31,$68,$01,$69,$2f,$1c,$3e,$33
	fcb	$66,$9c,$1b,$c1,$64,$c1,$66,$c7
	fcb	$35,$c9,$cb,$1b,$02,$bd,$c1,$9e
	fcb	$42,$02,$bd,$40,$c1,$86,$c0,$86
	fcb	$c0,$9e,$01,$17,$4e,$0c,$e8,$d2
	fcb	$28,$4c,$07,$14,$3a,$c9,$cb,$53
	fcb	$09,$01,$15

x_tag_32b:
	fcb	$00
	fcb	$2c,$58,$07,$02,$8f,$02,$52,$52
	fcb	$3b,$14,$0d,$58,$07,$02,$90,$02
	fcb	$52,$52,$31,$37,$58,$06,$02,$90
	fcb	$32,$52,$29,$14,$81,$58,$07,$02
	fcb	$8f,$02,$52,$52,$1f,$14,$82,$58
	fcb	$07,$02,$8f,$02,$52,$52,$15,$14
	fcb	$83,$58,$06,$02,$90,$31,$52,$0c
	fcb	$14,$8b,$58,$06,$02,$90,$2f,$52
	fcb	$03,$38,$2b,$02,$53,$3a,$02,$50

x_tag_32c:
	fcb	$00
	fcb	$1b,$c0,$8c,$4c,$07,$42,$c0,$8c
	fcb	$62,$52,$03,$02,$d3,$03,$2a,$7e
	fcb	$c0,$50,$1b,$4c,$05,$33,$14,$43
	fcb	$7b,$12,$06,$c0,$66,$1c,$3e,$02
	fcb	$21,$4c,$08,$33,$14,$44,$7b,$33
	fcb	$c1,$50,$02,$5e

x_tag_32d:
	fcb	$00
	fcb	$22,$54,$3b,$03,$2c,$57,$7e,$c0
	fcb	$8e,$c0,$8c,$3a,$4e,$03,$02,$c0

x_tag_2c8:
	fcb	$00
	fcb	$c0,$20,$15,$32,$4b,$4c,$07,$33
	fcb	$02,$ba,$03,$2d,$00,$03,$0d

x_tag_2c9:
	fcb	$00
	fcb	$03,$27,$4c,$04,$40,$03,$0d,$02
	fcb	$d3,$c1,$82,$02,$51,$37,$02,$50

x_tag_2ca:
	fcb	$00
	fcb	$03,$28,$4c,$09,$c0,$7e,$c0,$80
	fcb	$42,$03,$2d,$00,$03,$0d

x_tag_2cf:
	fcb	$00
	fcb	$1b,$33,$4b,$4e,$06,$11,$4c,$49
	fcb	$02,$5d,$11,$ff,$7f,$c0,$20,$15
	fcb	$01,$2b,$1c,$51,$06,$11,$4c,$49
	fcb	$02,$5d,$c1,$8c,$03,$0a,$02,$c8
	fcb	$02,$ba,$33,$54,$3b,$42,$c0,$8c
	fcb	$62,$3b,$03,$12,$16,$57,$33,$c1
	fcb	$8c,$00,$39,$46,$4b,$46,$60,$46
	fcb	$1f,$71,$17,$76,$ff,$75,$28,$71
	fcb	$3e,$71,$96,$7d,$cb,$6f,$6f,$7a
	fcb	$7f,$75,$cf,$75,$33,$74,$db,$79
	fcb	$7c,$78,$39,$72,$0c,$71,$15,$71
	fcb	$59,$75,$75,$75,$37,$6f,$73,$6f
	fcb	$81,$6f,$ba,$6f,$95,$6f,$a9,$6f
	fcb	$c2,$6f,$22,$70,$38,$71,$e6,$71
	fcb	$67,$72,$1a,$6f,$74,$72,$77,$72
	fcb	$7a,$72,$7f,$73,$05,$74,$1e,$74
	fcb	$40,$74,$fa,$74,$0a,$75,$25,$75
	fcb	$37,$75,$4a,$75,$7d,$72,$a1,$72
	fcb	$ae,$72,$b8,$72,$3d,$73,$51,$73
	fcb	$60,$73,$6c,$73,$c8,$79,$89,$6f
	fcb	$db,$71,$fa,$75,$79,$75,$7c,$75
	fcb	$97,$72,$00,$c0,$20,$3d

x_tag_320:
	fcb	$00
	fcb	$27,$24,$79,$1b,$40,$2b,$01,$17
	fcb	$4c,$06,$22,$79,$3c,$20,$3a,$22
	fcb	$23,$20,$20,$26

x_tag_31f:
	fcb	$00
	fcb	$03,$20,$48,$00,$27,$01,$0d,$26
	fcb	$32,$c1,$3c,$7e,$7a,$05,$2a,$2a
	fcb	$2a,$2a,$20,$12,$06,$c0,$38,$a9
	fcb	$54,$3b,$17,$14,$15,$51,$05,$14
	fcb	$28,$3b,$18,$57,$12,$06,$c0,$38
	fcb	$02,$21,$7d,$7a,$03,$3c,$2d,$2d
	fcb	$1f,$31,$78,$7a
	cstr	"-ERROR"
	fcb	$02,$54,$02,$c0,$00
	fcb	$24,$79,$22,$23,$c0,$74,$48,$4e
	fcb	$05,$11,$53,$59,$d5,$00,$24,$79
	fcb	$22,$23,$c0,$74,$48,$00,$01,$0e
	fcb	$11,$30,$01,$51,$05,$11,$43,$58
	fcb	$d5,$00,$11,$d4,$64,$79,$14,$39
	fcb	$15,$14,$72,$3d,$32,$01,$3b,$4c
	fcb	$04,$42,$52,$02,$33,$00,$c0,$38
	fcb	$a0,$01,$1a,$1b,$c0,$38,$a1,$1b
	fcb	$28,$28,$c2,$38,$c1,$72,$00,$da
	fcb	$c0,$72,$35,$3e,$4d,$05,$00,$c0
	fcb	$72,$4c,$04,$34,$c2,$38,$00,$86
	fcb	$62,$a0,$64,$b1,$39,$85,$42,$c8
	fcb	$b1,$39,$85,$43,$c8,$b1,$39,$85
	fcb	$44,$a2,$16,$86,$45,$a2,$00,$86
	fcb	$46,$e6,$45,$a0,$ff,$a5,$44,$85
	fcb	$47,$bd,$9d,$7c,$29,$7f,$c8,$d1
	fcb	$42,$d0,$1d,$e8,$bd,$9d,$7c,$10
	fcb	$13,$8a,$a6,$62,$38,$e5,$46,$ca
	fcb	$ca,$95,$00,$a9,$00,$95,$01,$a5
	fcb	$45,$6c,$be,$ff,$c6,$47,$d0,$de
	fcb	$e8,$bd,$9d,$7c,$10,$fa,$29,$7f
	fcb	$d0,$c5,$a6,$62,$d0,$eb,$00,$d8
	fcb	$c0,$72,$36,$14,$39,$5a,$22,$14
	fcb	$2e,$48,$3a,$4c,$3a,$11,$3d,$40
	fcb	$13,$1b,$1b,$01,$14,$16,$c0,$38
	fcb	$40,$9c,$02,$16,$40,$c2,$38,$01
	fcb	$1e,$01,$a9,$01,$c7,$40,$43,$27
	fcb	$67,$00,$00,$00,$00,$c3,$23,$01
	fcb	$1e,$01,$1e,$02,$75,$c5,$24,$39
	fcb	$4c,$06,$cc,$14,$15,$52,$03,$14
	fcb	$16,$c1,$74,$01,$15,$00,$c0,$72
	fcb	$14,$41,$14,$5a,$5a,$4c,$4d,$0f
	fcb	$c0,$38,$40,$1b,$9c,$c1,$64,$33
	fcb	$42,$da,$c0,$72,$14,$41,$14,$5a
	fcb	$5a,$22,$36,$14,$39,$5a,$60,$3a
	fcb	$28,$4d,$11,$42,$c0,$72,$14,$25
	fcb	$58,$04,$33,$52,$13,$14,$24,$58
	fcb	$04,$30,$52,$0c,$14,$3f,$58,$04
	fcb	$31,$52,$05,$0f,$40,$db,$32,$c1
	fcb	$6c,$c1,$66,$c9,$1a,$4c,$07,$c1
	fcb	$74,$3d,$c1,$38,$00,$0f,$14,$14
	fcb	$c1,$74,$00,$1b,$14,$3f,$50,$07
	fcb	$14,$27,$c1,$74,$0f,$00,$14,$22
	fcb	$50,$11,$14,$13,$c1,$74,$c0,$38
	fcb	$9c,$02,$3a,$1c,$3e,$40,$1b,$c2
	fcb	$38,$00,$d9,$1a,$4c,$27,$2f,$58
	fcb	$14,$d8,$d9,$31,$58,$04,$2d,$52
	fcb	$0a,$32,$58,$04,$2e,$52,$04,$0f
	fcb	$db,$2f,$52,$0e,$31,$58,$0b,$d8
	fcb	$d9,$32,$50,$04,$30,$52,$03,$31
	fcb	$db,$c1,$74,$00,$11,$43,$48,$d5
	fcb	$00,$c0,$8a,$4c,$05,$11,$43,$4f
	fcb	$d5,$00,$c0,$8a,$28,$4c,$05,$11
	fcb	$43,$4f,$d5,$00,$c0,$2c,$18,$32
	fcb	$c2,$2c,$02,$5e,$00,$1b,$14,$ff
	fcb	$39,$40,$2b,$01,$17,$4c,$05,$02
	fcb	$56,$52,$02,$c3,$00,$03,$20,$c6
	fcb	$02,$5e,$00,$32,$11,$d4,$64,$11
	fcb	$a7,$64,$54,$1c,$3b,$15,$48,$4c
	fcb	$08,$0e,$3b,$41,$17,$c3,$33,$55
	fcb	$30,$56,$4c,$23,$1b,$11,$00,$ff
	fcb	$39,$33,$58,$06,$dd,$14,$c3,$52
	fcb	$16,$31,$58,$06,$dd,$13,$c3,$52
	fcb	$0e,$30,$58,$06,$dd,$12,$c3,$52
	fcb	$06,$0f,$dd,$11,$02,$56,$00,$48
	fcb	$00,$c5,$00,$48,$00,$c9,$00,$4b
	fcb	$00,$c4,$00,$00,$00,$02,$0d,$02
	fcb	$13,$c7,$00,$00,$00,$02,$0e,$4a
	fcb	$00,$c3,$00,$00,$00,$02,$0f,$ca
	fcb	$00,$c8,$00,$00,$00,$02,$10,$49
	fcb	$00,$c6,$00,$49,$00,$02,$11,$ce
	fcb	$00,$d2,$00,$3a,$00,$d6,$00,$cf
	fcb	$00,$d4,$00,$a6,$00,$02,$20,$d0
	fcb	$00,$d3,$00,$39,$00,$00,$00,$d5
	fcb	$00,$d5,$00,$00,$00,$00,$00,$02
	fcb	$1a,$02,$1b,$00,$00,$00,$00,$02
	fcb	$22,$02,$23,$02,$24,$02,$25,$00
	fcb	$20,$43,$43,$30,$1d,$3d,$43,$3d
	fcb	$15,$1b,$00,$22,$11,$73,$71,$f7
	fcb	$4c,$03,$c6,$00,$11,$54,$4d,$d5

x_tag_32f:
	fcb	$00

x_tag_330:
	fcb	$00
	fcb	$0f,$33

x_tag_331:
	fcb	$00
	fcb	$dd,$cb,$0f,$32

x_tag_332:
	fcb	$00
	fcb	$dd,$cb,$0f,$32

x_tag_333:
	fcb	$00
	fcb	$dd,$cd

x_tag_334:
	fcb	$00
	fcb	$dd,$cd

x_tag_335:
	fcb	$00
	fcb	$dd,$cc,$0f,$33

x_tag_336:
	fcb	$00
	fcb	$dd,$02,$14,$0f,$31

x_tag_337:
	fcb	$00
	fcb	$dd,$02,$15,$0f,$31,$00,$09,$00
	fcb	$03,$31,$03,$37,$00,$00,$03,$35
	fcb	$09,$00,$03,$36,$00,$00,$03,$30
	fcb	$03,$32,$09,$00,$00,$00,$00,$00
	fcb	$00,$00,$00,$00,$09,$00,$11,$1a
	fcb	$72,$f7,$4c,$04,$47,$0f,$00,$11
	fcb	$41,$53,$d5,$00,$09,$00,$03,$33
	fcb	$03,$30,$00,$00,$03,$31,$09,$00
	fcb	$03,$32,$00,$00,$03,$2f,$03,$34
	fcb	$09,$00,$00,$00,$00,$00,$00,$00
	fcb	$00,$00,$09,$00,$11,$48,$72,$f7
	fcb	$4c,$03,$47,$00,$11,$41,$53,$d5
	fcb	$00,$32,$d0,$00,$31,$d0,$00,$30
	fcb	$d0,$00,$23,$1c,$1b,$25,$3d,$c0
	fcb	$26,$30,$1d,$3e,$6f,$25,$c2,$26
	fcb	$03,$10,$22,$54,$25,$3b,$19,$31
	fcb	$56,$24,$0f,$00,$1c,$42,$43,$e0
	fcb	$3d,$1b,$15,$e0,$22,$00,$c0,$66
	fcb	$31,$4b,$c0,$64,$15,$11,$c6,$4e
	fcb	$48,$39,$00,$c0,$64,$37,$01,$13
	fcb	$c0,$66,$c1,$76,$00,$1b,$03,$07
	fcb	$1b,$23,$c0,$66,$3d,$02,$6a,$0f
	fcb	$14,$0c,$fb,$c0,$66,$ed,$c0,$64
	fcb	$22,$c0,$66,$6f,$14,$22,$fb,$25
	fcb	$ed,$24,$01,$32,$0f,$00

x_tag_338:
	lda	Z00,X
	sta	S42
	lda	Z01,X
	sta	Z43
	ldy	#$64
	lda	(Z39),Y
	sta	Z44
	iny
	lda	(Z39),Y
	sta	Z45
	ldy	#$66
	lda	(Z39),Y
	sta	Z46
	lda	#$ff
	sta	Z47
L72f7:	lda	Z43
	cmp	Z03,X
	bne	L7301
	lda	S42
	cmp	Z02,X
L7301:	bcs	L7322
	ldy	#$00
	lda	(S42),Y
	bpl	L731a
	inc	Z47
	ldy	Z46
	lda	(S42),Y
	bpl	L731a
L7311:	dey
	bmi	L732b
	lda	(S42),Y
	cmp	(Z44),Y
	beq	L7311
L731a:	inc	S42
	bne	L72f7
	inc	Z43
	bne	L72f7
L7322:	ldy	Z47
	iny
	lda	#$00
	sta	Z00,X
	beq	L7333
L732b:	ldy	Z47
	lda	S42
	sta	Z00,X
	lda	Z43
L7333:	sta	Z01,X
	sty	Z02,X
	lda	#$00
	sta	Z03,X
	jmp	next

	fcb	$27,$d6,$0f,$14,$0e,$c1,$74,$c0
	fcb	$64,$c0,$66,$26,$c0,$6a,$c0,$6c
	fcb	$26,$26,$f6,$00,$27,$d6,$10,$27
	fcb	$c1,$6c,$c1,$6a,$27,$c1,$66,$c1
	fcb	$64,$26,$00,$c0,$6e,$c0,$64,$c0
	fcb	$66,$3d,$18,$32,$c2,$66,$00,$c1
	fcb	$6a,$c0,$6a,$1b,$42,$03,$0f,$22
	fcb	$03,$0f,$03,$38,$4e,$04,$c0,$6a
	fcb	$f0,$00,$ef,$d8,$db,$c0,$72,$14
	fcb	$28,$50,$53,$dc,$ee,$4c,$13,$f1
	fcb	$33,$d7,$0e,$4c,$06,$f9,$e1,$42
	fcb	$53,$07,$c1,$6e,$f2,$f3,$2a,$f4
	fcb	$00,$11,$7b,$61,$11,$fc,$5f,$03
	fcb	$38,$1a,$4c,$1d,$14,$0a,$c1,$6a
	fcb	$c0,$66,$3d,$79,$14,$7f,$39,$c1
	fcb	$6c,$f1,$79,$a9,$54,$d6,$0e,$f9
	fcb	$3b,$17,$d0,$57,$f2,$01,$12,$00
	fcb	$0f,$f1,$33,$d7,$0e,$4c,$05,$fa
	fcb	$42,$53,$06,$c1,$6e,$f2,$f3,$2f
	fcb	$c0,$6c,$3d,$f4,$00,$c0,$78,$4c
	fcb	$24,$2b,$42,$03,$0f,$c0,$7a,$2b
	fcb	$03,$0f,$3d,$03,$38,$4c,$15,$14
	fcb	$14,$03,$0f,$14,$13,$03,$0f,$3e
	fcb	$2b,$01,$2b,$c0,$6e,$3e,$3d,$2b
	fcb	$c1,$6a,$00,$0f,$c0,$6c,$f4,$00
	fcb	$e4,$c0,$6a,$14,$0a,$3e,$4c,$09
	fcb	$c0,$6a,$03,$08,$c6,$c3,$52,$07
	fcb	$13,$74,$3d,$3c,$02,$56,$c0,$6c
	fcb	$00,$d6,$14,$e4,$c0,$6a,$14,$0a
	fcb	$48,$c0,$6a,$2a,$48,$3a,$4c,$05
	fcb	$11,$41,$53,$d5,$dc,$00,$dd,$02
	fcb	$af,$1b,$c3,$c0,$2c,$22,$1b,$c2
	fcb	$2c,$6f,$00,$33,$23,$f6,$c0,$7c
	fcb	$42,$1b,$14,$0b,$4b,$4c,$05,$11
	fcb	$43,$58,$d5,$c1,$7c,$d7,$07

; 7455
	fcb	$4c
	fcb	$04,$dc,$53,$05,$d7,$08,$d7,$4a
	fcb	$3a,$4c,$07,$24,$42,$23,$dc,$53
	fcb	$12,$c0,$74,$14,$0f,$58,$06,$f9
	fcb	$d6,$10,$52,$6e,$14,$13,$58,$05
	fcb	$cd,$30,$52,$66,$14,$14,$58,$04
	fcb	$e5,$52,$5f,$14,$4f,$58,$07,$dd
	fcb	$02,$8d,$30,$52,$55,$14,$4e,$58
	fcb	$07,$dd,$02,$8c,$30,$52,$4b,$14
	fcb	$50,$58,$07,$dd,$02,$8e,$32,$52
	fcb	$41,$14,$51,$58,$07,$dd,$02,$8f
	fcb	$31,$52,$37,$14,$52,$58,$07,$dd
	fcb	$02,$90,$31,$52,$2d,$14,$15,$58
	fcb	$0b,$24,$32,$39,$4c,$02,$63,$c7
	fcb	$33,$52,$1d,$14,$16,$58,$15,$24
	fcb	$32,$39,$4c,$03,$01,$a6,$dd,$01
	fcb	$c7,$c0,$2c,$01,$aa,$2b,$c2,$2c
	fcb	$32,$52,$05,$11,$53,$50,$d5,$33
	fcb	$23,$24,$32,$39,$4c,$16,$1b,$33
	fcb	$58,$05,$dd,$63,$52,$0e,$32,$58
	fcb	$06,$dd,$01,$a6,$52,$06,$31,$58
	fcb	$03,$dd,$28,$dc,$00,$e7,$d7,$0b
	fcb	$4c,$0b,$e1,$dc,$e7,$14,$0b,$de
	fcb	$0f,$32,$53,$0c,$00,$e8,$c0,$74
	fcb	$2a,$14,$0a,$5a,$4c,$11,$1b,$23
	fcb	$14,$0a,$48,$4c,$03,$e1,$32,$dc
	fcb	$e8,$df,$24,$de,$53,$16,$0f,$00
	fcb	$e9,$c0,$74,$2c,$2b,$5a,$4c,$09
	fcb	$23,$dc,$e9,$df,$24,$de,$53,$0d
	fcb	$0f,$00,$ea,$c0,$74,$32,$2d,$5a
	fcb	$4c,$0a,$23,$dc,$ea,$df,$24,$de
	fcb	$0f,$31,$00,$0f,$00,$eb,$d7,$47
	fcb	$4c,$0a,$e2,$dc,$eb,$e2,$31,$2a
	fcb	$de,$53,$0b,$00,$ec,$d7,$48,$1b
	fcb	$23,$d7,$49,$3a,$4c,$10,$e2,$dc
	fcb	$ec,$e2,$31,$24,$4c,$04,$2c,$52
	fcb	$02,$2b,$de,$53,$16,$24,$0f,$00
	fcb	$d3,$33,$d0,$00,$dc,$d3,$00,$dc
	fcb	$d4,$00,$03,$0a,$1b,$c1,$7e,$03
	fcb	$13,$22,$c1,$88,$4e,$03,$03,$16
	fcb	$33,$c1,$52,$33,$c1,$1c,$11,$fe
	fcb	$01,$c1,$68,$c0,$76,$2f,$3d,$02
	fcb	$6a,$0f,$c0,$88,$02,$bd,$14,$0a
	fcb	$e0,$c0,$76,$ed,$23,$c0,$84,$25
	fcb	$c0,$76,$6f,$c0,$88,$03,$12,$14
	fcb	$0c,$e0,$2f,$ed,$c0,$7e,$1c,$16
	fcb	$41,$24,$c0,$20,$3e,$22,$16,$32
	fcb	$c0,$20,$19,$c0,$88,$c0,$76,$03
	fcb	$15,$00,$d7,$0d,$d7,$12,$3a

x_tag_339:
	fcb	$00
	fcb	$02,$69,$33,$33,$d6

x_tag_2e6:
	fcb	$00
	fcb	$e6,$23,$c0,$6c,$c0,$6a,$26,$d6
	fcb	$01,$f9,$25,$d0,$24,$30,$48,$c0
	fcb	$8a,$28,$39,$4c,$04,$dd,$03,$39
	fcb	$24,$03,$09,$c6,$24,$c3,$00,$d4
	fcb	$d6,$0e,$fa,$00,$c0,$2c,$33,$c3
	fcb	$c0,$38,$9c,$1b,$79,$1b,$c3,$28
	fcb	$4d,$04,$22,$3e,$1b,$40,$c2,$38
	fcb	$22,$18,$dc,$00,$14,$3c,$48,$23
	fcb	$d7,$11,$4c,$0b,$fa,$d7,$12,$4e
	fcb	$03,$d6,$0e,$dc,$52,$03,$25,$c7
	fcb	$24,$4c,$08,$14,$c1,$c3,$14,$3c
	fcb	$c3,$00,$dd,$02,$36

x_tag_2c1:
	fcb	$00
	fcb	$64,$30,$6b,$03,$26,$c1,$a0

x_tag_33a:
	fcb	$00
	fcb	$dc,$d7,$12,$1b,$23,$4e,$0a,$c8
	fcb	$c0,$2c,$c0,$84,$3e,$c1,$76,$cb
	fcb	$24

x_tag_2c7:
	fcb	$00
	fcb	$22,$7e,$1b,$01,$6c,$03,$2e,$0f
	fcb	$1b,$11,$a2,$6e,$13,$1b,$1b,$01
	fcb	$14,$16,$32,$c1,$8a,$03,$3a,$4c
	fcb	$02,$0f,$01,$15,$1c,$3d,$1b,$29
	fcb	$4c,$06,$11,$4c,$49,$02,$5d,$53
	fcb	$26

x_tag_2d9:
	fcb	$00
	fcb	$d4,$d6,$0e,$f9,$e3,$dd,$02,$2f

x_tag_2da:
	fcb	$00
	fcb	$d4,$d6,$0e,$dc,$e6,$dd,$02,$30
	fcb	$30,$c0,$6c,$d0,$c0,$6a,$03,$09
	fcb	$c6,$c3

x_tag_2db:
	fcb	$00
	fcb	$d4,$dd,$02,$31

x_tag_2dc:
	fcb	$00
	fcb	$d4,$d6,$0e,$f9,$e3,$dd,$02,$32

x_tag_2dd:
	fcb	$00
	fcb	$d3,$e3,$dd,$02,$33

x_tag_2de:
	fcb	$00
	fcb	$f8,$dd,$02,$34

x_tag_2df:
	fcb	$00
	fcb	$f8,$dd,$02,$35

x_tag_2d7:
	fcb	$00
	fcb	$d4,$dd,$02,$c1

x_tag_2e5:
	fcb	$00
	fcb	$d7,$34,$4c,$06,$dd,$02,$c2,$52
	fcb	$04,$dd,$02,$c3,$dc

x_tag_2e0:
	fcb	$00
	fcb	$dd,$02,$26

x_tag_2e1:
	fcb	$00
	fcb	$f8,$dd,$02,$4b

x_tag_2e2:
	fcb	$00
	fcb	$d1,$d4,$d7,$0e,$4c,$06,$fa,$dd
	fcb	$02,$c6,$00,$dd,$02,$c5

x_tag_2e3:
	fcb	$00
	fcb	$d1,$f8,$dd,$02,$c7

x_tag_2e4:
	fcb	$00
	fcb	$14,$3c,$c4,$cc,$4c,$05,$dd,$02
	fcb	$c8,$00,$d4,$d7,$0e,$4c,$06,$fa
	fcb	$dd,$02,$ca,$00,$d1,$dd,$02,$c9

x_tag_2e7:
	fcb	$00
	fcb	$14,$3c,$c4,$33,$32,$26,$d7,$0e
	fcb	$4c,$0c,$dd,$02,$28,$dc,$27,$0e
	fcb	$32,$33,$26,$52,$38,$d7,$0c,$4c
	fcb	$08,$dc,$24,$0f,$32,$23,$52,$2d
	fcb	$cc,$4c,$10,$27,$1c,$39,$4c,$05
	fcb	$11,$43,$4f,$d5,$4e,$04,$dd,$02
	fcb	$27,$00,$33,$c1,$7c,$d3,$14,$0c
	fcb	$de,$0f,$d7,$0e,$d7,$0c,$3a,$cc
	fcb	$3a,$4e,$05,$11,$43,$4f,$d5,$27
	fcb	$0e,$33,$33,$26,$53,$46

x_tag_33b:
	fcb	$00
	fcb	$02,$e7

x_tag_2ec:
	fcb	$00
	fcb	$14,$3a,$c4,$e6,$dd,$02,$4a,$30
	fcb	$c0,$6c,$d0,$c0,$6a,$03,$09,$c6
	fcb	$c3

x_tag_2e8:
	fcb	$00
	fcb	$dd,$fe,$c5

x_tag_2e9:
	fcb	$00
	fcb	$d2,$dd,$ff,$c5

x_tag_33c:
	fcb	$00
	fcb	$e6,$c0,$6c,$32,$58,$06,$dd,$02
	fcb	$41,$52,$17,$33,$58,$06,$dd,$02
	fcb	$42,$52,$0f,$30,$58,$06,$dd,$02
	fcb	$43,$52,$07,$31,$58,$04,$dd,$02
	fcb	$44,$c0,$6a,$03,$09,$c6,$c3,$d7
	fcb	$0e,$4c,$04,$dc,$53,$2c

x_tag_2ea:
	fcb	$00
	fcb	$14,$3a,$c4,$d7,$13,$4c,$06,$cd
	fcb	$dd,$02,$40,$dc,$dd,$02,$3c,$d7
	fcb	$0e,$d7,$0c,$3a,$4c,$02,$dc,$03
	fcb	$3c,$dd,$02,$3b

x_tag_2eb:
	fcb	$00
	fcb	$dd,$02,$3e,$03,$3c

x_tag_2ed:
	fcb	$00
	fcb	$dd,$d9

x_tag_2ee:
	fcb	$00
	fcb	$d4,$d6,$4b,$dc,$d6,$11,$fa,$dd
	fcb	$02,$2c

x_tag_2ef:
	fcb	$00
	fcb	$d6,$11,$fa,$dd,$02,$2d

x_tag_2f0:
	fcb	$00
	fcb	$f8,$dd,$01,$48

x_tag_2fd:
	fcb	$00
	fcb	$d1,$dd,$03,$1d

x_tag_2d8:
	fcb	$00
	fcb	$d4,$dd,$e7

x_tag_2f1:
	fcb	$00
	fcb	$32,$c2,$44,$e6,$23,$c0,$6a,$23
	fcb	$d6,$01,$f9,$25,$d0,$d6,$4b,$f9
	fcb	$25,$d0,$d7,$4c,$4c,$04,$f9,$52
	fcb	$04,$32,$c7,$33,$25,$d0,$24,$32
	fcb	$58,$05,$dd,$e5,$52,$0d,$33,$58
	fcb	$05,$dd,$e6,$52,$06,$0f,$11,$41
	fcb	$53,$d5,$24,$c3

x_tag_2f2:
	fcb	$00
	fcb	$34,$c2,$44,$d7,$14,$4c,$1a,$e6
	fcb	$c0,$6a,$31,$51,$10,$dd,$e4,$14
	fcb	$0a,$c0,$6a,$32,$50,$04,$0f,$14
	fcb	$10,$c3,$c3,$00,$11,$52,$43,$d5
	fcb	$dd,$e3

x_tag_2f3:
	fcb	$00
	fcb	$d2,$dd,$02,$66,$c0,$2c,$23,$33
	fcb	$c3,$d6,$35,$dc,$02,$f5,$c0,$2c
	fcb	$25,$3e,$40,$24,$18

x_tag_2f4:
	fcb	$00
	fcb	$d4,$d7,$35,$4c,$05,$dd,$e8,$52
	fcb	$0d,$d7,$36,$4c,$05,$dd,$e9,$52
	fcb	$05,$11,$43,$4f,$d5,$c0,$2c,$23
	fcb	$33,$02,$56,$33,$dc,$d6,$15,$dc
	fcb	$02,$56,$42,$d7,$0e,$28,$4d,$0a
	fcb	$24,$16,$00,$d7,$15,$c0,$8a,$39
	fcb	$4c,$17,$d8,$db,$c0,$72,$1b,$14
	fcb	$3a,$48,$22,$28,$3a,$4c,$0a,$41
	fcb	$c3,$33,$02,$56,$02,$56,$dc,$00
	fcb	$23,$d4,$24,$c3

x_tag_2f5:
	fcb	$00
	fcb	$14,$dc,$cf

x_tag_2f6:
	fcb	$00
	fcb	$14,$df,$cf

x_tag_2f7:
	fcb	$00
	fcb	$d2,$dd,$e2

x_tag_2f8:
	fcb	$00
	fcb	$e6,$c0,$6a,$2f,$2c,$5a,$4e,$05
	fcb	$11,$43,$4f,$d5,$dd,$db,$c3,$c3
	fcb	$c0,$6e,$c3,$d7,$0e,$4c,$04,$dc
	fcb	$53,$18

x_tag_2f9:
	fcb	$00
	fcb	$dd,$02,$d2

x_tag_2fa:
	fcb	$00
	fcb	$dd,$02,$d0

x_tag_2fb:
	fcb	$00
	fcb	$cc,$4c,$05,$33,$c7,$52,$02,$d4
	fcb	$dd,$02,$cb

x_tag_2fc:
	fcb	$00
	fcb	$d1,$dd,$02,$cc

x_tag_2fe:
	fcb	$00
	fcb	$d2,$ef,$ee,$4e,$05,$11,$44,$46
	fcb	$d5,$2b,$42,$03,$0f,$2b,$03,$0f
	fcb	$3e,$c1,$7a,$dc,$f1,$33,$42,$dc
	fcb	$d6,$14,$ef,$2b,$f0,$dc,$d7,$0e
	fcb	$28,$4d,$0b,$c1,$6e,$f2,$f3,$2a
	fcb	$f4,$dd,$da,$c3,$c0,$2c,$33,$02
	fcb	$56,$23,$33,$c3,$14,$14,$03,$0f
	fcb	$14,$13,$03,$0f,$3e,$2b,$01,$2b
	fcb	$1b,$c0,$6e,$3e,$22,$54,$2b,$03
	fcb	$09,$c6,$3b,$40,$c3,$34,$56,$dc
	fcb	$d6,$01,$32,$c1,$78,$f9,$e1,$dd
	fcb	$00,$c0,$2c,$25,$3e,$24,$16

x_tag_2ff:
	fcb	$00
	fcb	$c0,$8a,$4c,$05,$dd,$02,$cd,$00
	fcb	$32,$c1,$16,$03,$0a

x_tag_300:
	fcb	$00
	fcb	$dd,$02,$ce

x_tag_301:
	fcb	$00
	fcb	$d1,$d4,$dd,$02,$cf

x_tag_302:
	fcb	$00
	fcb	$d3,$e2,$dd,$01,$18,$c0,$2c,$33
	fcb	$02,$56,$c0,$74,$23,$dc,$24,$14
	fcb	$35,$58,$05,$02,$f5,$52,$1c,$14
	fcb	$36,$58,$05,$02,$f6,$52,$14,$14
	fcb	$4d,$58,$0c,$d7,$15,$4c,$05,$02
	fcb	$f5,$52,$02,$c8,$52,$05,$11,$53
	fcb	$59,$d5,$c0,$2c,$1c,$3e,$22,$16

x_tag_303:
	fcb	$00
	fcb	$dd,$02,$55

x_tag_304:
	fcb	$00
	fcb	$dd,$02,$d1

x_tag_305:
	fcb	$00
	fcb	$d1,$01,$8b,$02,$2e,$01,$0e,$3f
	fcb	$c1,$68,$88,$33,$59,$21,$3b,$01
	fcb	$6c,$3b,$02,$30,$20,$c1,$28,$1b
	fcb	$63,$c2,$26,$14,$50,$67,$12,$06
	fcb	$5d,$3d,$23,$22,$6f,$33,$24,$18
	fcb	$33,$c1,$38,$02,$d6,$57,$02,$c0
	fcb	$00,$c0,$94,$3d,$1b,$c0,$22,$22
	fcb	$01,$17,$4c,$06,$11,$4f,$4d,$02
	fcb	$5d,$c1,$94,$00,$30,$1d,$43,$20
	fcb	$1c,$3d,$1b,$15,$1b,$17,$28,$c0
	fcb	$94,$40,$17,$28,$39,$4c,$03,$34
	fcb	$f5,$c0,$94,$23,$22,$41,$15,$1b
	fcb	$17,$28,$3d,$1c,$3e,$c0,$94,$22
	fcb	$1b,$f5,$6f,$3d,$24,$c0,$9a,$3d
	fcb	$22,$16

x_tag_321:
	fcb	$00
	fcb	$c0,$8e,$4e,$03,$0f,$00,$11,$a2
	fcb	$6e,$13,$1b,$1b,$01,$14,$16,$1b
	fcb	$14,$ff,$39,$40,$2b,$01,$17,$4c
	fcb	$02,$3c,$1b,$14,$c0,$3e,$14,$40
	fcb	$01,$17,$4c,$1c,$14,$c0,$3e,$1b
	fcb	$43,$c0,$90,$3d,$15,$4c,$04,$0f
	fcb	$52,$0b,$11,$3d,$40,$c0,$90,$ce
	fcb	$11,$46,$43,$ca,$01,$15,$00,$13
	fcb	$00,$3e,$1b,$14,$bc,$01,$17,$4c
	fcb	$19,$1b,$43,$c0,$92,$3d,$15,$4c
	fcb	$04,$0f,$52,$0b,$11,$bd,$40,$c0
	fcb	$92,$ce,$11,$00,$44,$ca,$01,$15
	fcb	$00,$0f,$01,$15,$00,$22,$1a,$4c
	fcb	$0a,$33,$54,$1b,$17,$14,$7f,$39
	fcb	$3d,$57,$79,$40,$a9,$5d,$22,$01
	fcb	$17,$4c,$12,$79,$1b,$40,$2b,$01
	fcb	$17,$4c,$06,$22,$79,$3c,$20,$3a
	fcb	$03,$21,$53,$15,$0e

x_tag_306:
	fcb	$00
	fcb	$d1,$d6,$13,$02,$50,$02,$50,$02
	fcb	$ce,$11,$00,$80,$c1,$8e,$11,$02
	fcb	$5a,$1f,$c1,$84,$31,$c1,$76,$c0
	fcb	$8e,$cb,$0f,$03,$0b,$11,$3d,$40
	fcb	$13,$1b,$1b,$01,$14,$16,$02,$55
	fcb	$01,$15,$33,$02,$92,$0f,$01,$7e
	fcb	$13,$01,$16,$33,$c1,$76,$33,$c1
	fcb	$88,$02,$ba,$32,$54,$c0,$88,$02
	fcb	$bd,$17,$14,$ff,$58,$22,$c0,$88
	fcb	$1b,$02,$bd,$42,$79,$c1,$76,$c1
	fcb	$84,$14,$2c,$c0,$84,$c0,$76,$3d
	fcb	$40,$18,$c0,$8e,$42,$1b,$c1,$8e
	fcb	$cb,$c1,$88,$03,$16,$52,$08,$03
	fcb	$1f,$fe,$4c,$03,$03,$16,$11,$82
	fcb	$7c,$c1,$1c,$32,$c2,$88,$57,$c0
	fcb	$76,$1b,$c1,$1a,$4c,$08,$33,$02
	fcb	$ba,$02,$bd,$40,$18,$02,$ba,$02
	fcb	$bd,$33,$02,$bd,$3e,$23,$11,$ff
	fcb	$7f,$c0,$8e,$3e,$c0,$20,$19,$03
	fcb	$0b,$c0,$00,$1b,$c1,$96,$c1,$94
	fcb	$11,$00,$40,$c0,$96,$3e,$c1,$9a
	fcb	$11,$00,$40,$c0,$94,$14,$2c,$1b
	fcb	$f5,$6f,$37,$c0,$96,$14,$2b,$3d
	fcb	$18,$02,$53,$02,$53,$14,$10,$67
	fcb	$1b,$c0,$94,$18,$c0,$94,$42,$22
	fcb	$6f,$14,$11,$f5,$c0,$94,$1b,$c1
	fcb	$90,$1b,$37,$3d,$c1,$92,$11,$f8
	fcb	$01,$1b,$f5,$01,$32,$14,$39,$15
	fcb	$14,$16,$a9,$54,$3b,$15,$c0,$00
	fcb	$3e,$c0,$94,$16,$31,$f5,$31,$56
	fcb	$11,$b9,$7f,$c0,$94,$1b,$c0,$9a
	fcb	$3d,$c0,$92,$41,$16,$11,$2d,$00
	fcb	$1b,$f5,$6f,$c0,$94,$40,$c0,$9a
	fcb	$3d,$c0,$92,$16,$11,$02,$59,$03
	fcb	$21,$14,$c2,$c0,$92,$3d,$15,$14
	fcb	$c0,$c0,$92,$3d,$16,$2a,$14,$be
	fcb	$c0,$92,$3d,$16,$14,$c4,$c0,$92
	fcb	$3d,$15,$14,$bc,$c0,$92,$3d,$16
	fcb	$33,$11,$76,$01,$c0,$92,$3d,$16
	fcb	$c0,$94,$c0,$9a,$3d,$14,$38,$c0
	fcb	$90,$3d,$16,$11,$01,$0d,$c0,$94
	fcb	$33,$1c,$18,$42,$16,$30,$f5,$c0
	fcb	$94,$1b,$c0,$9a,$3d,$33,$02,$bd
	fcb	$3e,$c1,$98,$25,$c2,$9a,$23,$c0
	fcb	$94,$41,$14,$d9,$03,$21,$c0,$1a
	fcb	$4c,$0b,$c0,$20,$15,$02,$bd,$c0
	fcb	$98,$3d,$52,$02,$33,$22,$16,$02
	fcb	$c8,$c0,$96,$c1,$24,$24,$c1,$26
	fcb	$33,$02,$bd,$24,$c0,$24,$1c,$3e
	fcb	$1b,$c1,$1a,$22,$6f,$c0,$20,$c1
	fcb	$18,$c0,$26,$c0,$24,$3e,$c0,$1a
	fcb	$c0,$18,$3e,$67,$1b,$33,$4b,$4c
	fcb	$1e,$23,$c0,$24,$c0,$18,$25,$6f
	fcb	$c0,$1a,$1b,$25,$3d,$c0,$24,$c0
	fcb	$1a,$3e,$6f,$24,$1b,$c2,$18,$1b
	fcb	$c2,$1a,$c2,$24,$53,$2b,$0f,$32
	fcb	$f5,$31,$81,$41,$18,$c0,$94,$1b
	fcb	$c0,$22,$3e,$01,$85,$0f,$c0,$18
	fcb	$1b,$c0,$1a,$3e,$01,$85,$0f,$7e
	fcb	$7a
	cstr	"Size = "
	fcb	$02,$b9,$01,$6c,$75,$7e,$01
	fcb	$57,$7e,$12,$06,$c0,$66,$1c,$3e
	fcb	$78,$77,$7e,$12,$54,$15,$1f,$31
	fcb	$78,$0f,$13,$78,$17,$37,$39,$4d
	fcb	$16,$02,$5a,$00

	mstr	"PAREN"
	mstr	"CALL"
	mstr	"FWRITE"
	mstr	"FREAD"
	mstr	"FDEL"
	mstr	"FINS"
	mstr	"FOPEN"
	mstr	"FREVISE"
	mstr	"FPUT"
	mstr	"HOME"
	mstr	"POKE"
	mstr	"DEL"
	mstr	"AUTO"
	mstr	"LIST"
	mstr	"HISTORY"
	mstr	"LET"
	mstr	"PRINT"
	mstr	"REM"
	mstr	"DATA"
	mstr	"INPUT"
	mstr	"READ"
	mstr	"GET"
	mstr	"RESTORE"
	mstr	"ATTACH"
	mstr	"DETACH"
	mstr	"SQUEAK"
	mstr	"FOR"
	mstr	"NEXT"
	mstr	"ONERR"
	mstr	"ON"
	mstr	"GOTO"
	mstr	"GOSUB"
	mstr	"RETURN"
	mstr	"DIM"
	mstr	"STOP"
	mstr	"END"
	mstr	"RUN"
	mstr	"NEW"
	mstr	"CONT"
	mstr	"DEF"
	mstr	"TRON"
	mstr	"TROFF"
	mstr	"RESEQ"
	mstr	"IF"
	mstr	"CLEAR"
	mstr	"BYE"
	mstr	"LOAD"
	mstr	"BURN"
	mstr	"AND"
	mstr	"OR"
	mstr	"XOR"
	mstr	"NOT"
	mstr	"TO"
	mstr	"STEP"
	mstr	"THEN"
	mstr	"DATE$"
	mstr	"TIME$"
	mstr	"PI"
	mstr	"FALSE"
	mstr	"TRUE"

	fcb	$80,$00,$33,$c1
	fcb	$7c,$c0,$74,$14,$17,$3e,$1b,$36
	fcb	$01,$17,$4c,$11,$d7,$28,$d7,$29
	fcb	$3a,$4e,$04,$23,$dc,$24,$a5,$3d
	fcb	$3c,$47,$52,$04,$0f,$02,$e6,$d7
	fcb	$0d,$4c,$04,$dc,$53,$26,$d6,$12
	fcb	$dc,$03,$0b

x_tab_30b:
	fcb	$00
	fcb	$33,$c1,$8c,$33,$c1,$78,$14,$22
	fcb	$c0,$20,$3d,$14,$39,$15,$14,$16
	fcb	$a9,$54,$1b,$15,$c0,$20,$3d,$3b
	fcb	$16,$41,$31,$56,$0f

x_tag_33d:
	fcb	$00
	fcb	$02,$52,$37,$48,$1b,$02,$53,$14
	fcb	$83,$48,$3a,$4c,$82,$c0,$82,$33
	fcb	$4b,$4e,$0f,$4c,$06,$02,$ba,$40
	fcb	$52,$02,$33,$02,$d3,$c1,$82,$52
	fcb	$02,$0f,$c0,$82,$03,$13,$29,$3e
	fcb	$33,$02,$ba,$40,$5a,$4e,$06,$34
	fcb	$c1,$82,$0f,$00,$1b,$23,$1b,$02
	fcb	$d3,$03,$2a,$c0,$50,$4c,$08,$33
	fcb	$14,$43,$7b,$33,$c1,$50,$33,$02
	fcb	$50,$12,$06,$14,$50,$c0,$66,$12
	fcb	$06,$3e,$32,$11,$03,$2b,$33,$bc
	fcb	$0e,$3d,$33,$22,$18,$02,$52,$2b
	fcb	$39,$33,$14,$44,$7b,$4c,$0c,$33
	fcb	$c1
D7e4c:	fcb	$38,$02,$52,$2f,$39,$4e,$03,$02
	fcb	$d6,$02,$53,$30,$39,$1a,$4c,$14
	fcb	$40,$43,$40,$24,$3d,$1b,$29,$4c
	fcb	$05,$0f,$34,$52,$03,$02,$d3,$c1
	fcb	$82,$53,$68,$24,$0f

x_tag_2c4:
	fcb	$00
	fcb	$27,$0e,$03,$3d,$02,$c0

x_tag_32e:
	fcb	$00
	fcb	$33,$c1,$8e,$c0,$34,$c1,$36,$c0
	fcb	$2e,$1b,$c1,$2c,$1b,$02,$50,$c1
	fcb	$84,$01,$0e,$02,$50,$33,$02,$36
	fcb	$02,$49,$02,$51,$02,$51

x_tag_2d6:
	fcb	$00
	fcb	$11,$a2,$6e,$13,$1b,$1b,$01,$14
	fcb	$16,$33,$c1,$44,$d8,$c0,$72,$4c
	fcb	$3c,$db,$c0,$2e,$c1,$2c,$dc,$d7
	fcb	$15,$1b,$c1,$8a,$4c,$13,$03,$3a
	fcb	$4c,$0c,$03,$27,$4c,$06,$0f,$03
	fcb	$0d,$52,$03,$03,$29,$01,$15,$00
	fcb	$c8,$dd,$02,$c4,$c0,$44,$4c,$05
	fcb	$11,$43,$4f,$d5,$01,$15,$c0,$2e
	fcb	$01,$0e,$41,$15,$c0,$68,$01,$0f
	fcb	$26,$02,$27,$00,$01,$15

x_tag_2c0:
	fcb	$00
	fcb	$27,$0e,$01,$0e,$c1,$68,$11,$3d
	fcb	$40,$13,$1b,$16,$32,$c1,$3c,$7e
	fcb	$33,$14,$44,$7b,$7a,$01,$7d,$02
	fcb	$54,$03,$2e,$02,$50,$02,$d6,$03
	fcb	$3d,$53,$1b

x_tag_33e:
	fcb	$00
	fcb	$41,$17,$35,$48

x_tag_33f:
	fcb	$00
	fcb	$11,$03,$3e,$13,$f3,$16,$33,$58
	fcb	$08,$11
x_tag_341:
	fcb	$cb,$5f,$01,$91,$52,$04,$40,$01
	fcb	$94

x_tag_340:
	fcb	$00
	fcb	$12,$36,$17,$14,$5a,$50,$05,$13
	fcb	$1e,$02

x_tag_342:
	cli
	fcb	$33,$02,$c1,$1a

x_tag_343:
	lsr	D7e4c
	fcb	$7a
	cstr	"New Program Name :"	
	fcb	$02,$49,$0f,$12
	fcb	$06,$17,$28,$4c,$04,$77,$53,$1f
	fcb	$33,$1f,$23,$12,$06,$1b,$37,$24
	fcb	$32,$01,$3b,$0f,$01,$8a,$8a,$02
	fcb	$5c,$02,$5b,$c1,$20,$c0,$20,$14
	fcb	$3f,$01,$85,$8a,$35,$81,$41,$18
	fcb	$81,$1b,$15,$3d,$c1,$22,$02,$cc
	fcb	$52,$2a,$40,$01,$95,$02,$5c,$02
	fcb	$5b,$c1,$20,$81,$1b,$15,$3d,$c1
	fcb	$22,$03,$0b,$c0,$22,$c0,$14,$01
	fcb	$17,$4c,$0d,$c0,$22,$c0,$14,$1b
	fcb	$c1,$22,$1c,$3e,$01,$85,$8a,$03
	fcb	$0a,$02,$55,$37,$01,$81,$ca,$8a
	fcb	$02,$57,$33,$02,$92,$02,$54,$01
	fcb	$0d,$02,$c0

x_tag_201:
	fcb	$00
	fcb	$13,$78,$6e,$14,$34,$17,$12,$36
	fcb	$18,$13,$23,$17,$1b,$13,$26,$18
	fcb	$13,$1d,$18

	literal	short_extrinsic_tag_table
	literal	tvect0				; tvect0
	fcb	$16				; !

	literal	tag_table_3
	literal	tvect3				; tvect3
	fcb	$16				; !

	fcb	$14
	fcb	$6c,$14,$75,$18,$11,$00,$40,$14
	fcb	$75,$42,$16

x_tag_200:
	fcb	$00
	ntag	$201
	ntag	$32		; 1
	literal	$4003		; tag1 - executer (byte-reversed)
	literal	$3f03		; tag2 - selecter
	ntag	$83		; MENU-DRIVER

	fcb	"VreeswykHollandl"
