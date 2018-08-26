; SnapFORTH for HHC

	cpu	6502

	include	"hhc.inc"
	include	"hhc_tags.inc"

wordt	macro	link,str,len,type,val,imm
	ifb	link
	fdb	prevword
	else
	fdb	link
	endif
prevword set *-2
	fcb	strlen(str)+$80+(imm<<6)
	if	strlen(str)>len
	mstr	substr(str, 0, len)
	else
	mstr	str
	endif
	fcb	type
	fdb	val
	endm

wordl	macro	link,str,type,val
	wordt	link,str,strlen(str),type,val,0
	endm

word5	macro	link,str,type,val
	wordt	link,str,5,type,val,0
	endm

word6	macro	link,str,type,val
	wordt	link,str,6,type,val,0
	endm

wordi1	macro	link,str,type,val
	wordt	link,str,1,type,val,1
	endm

wordi5	macro	link,str,type,val
	wordt	link,str,5,type,val,1
	endm

Z00	equ	$00
Z01	equ	$01
Z02	equ	$02
Z03	equ	$03
L09	equ	$09
Z20	equ	$20
Z25	equ	$25		; number base
Z42	equ	$42
Z43	equ	$43
Z44	equ	$44
Z45	equ	$45
Z46	equ	$46
Z47	equ	$47
Z62	equ	$62
Z83	equ	$83
Z88	equ	$88
Zfe	equ	$fe
Zff	equ	$ff
D02f3	equ	$02f3
tostate	equ	$039f
D0306	equ	$0306
D03a0	equ	$03a0
D03a2	equ	$03a2
D03a1	equ	$03a1
x_find	equ	$03a6
D03e8	equ	$03e8
x_expnd	equ	$040e
x_to	equ	$047e
L0485	equ	$0485
L048d	equ	$048d
L048f	equ	$048f
L049d	equ	$049d

Xffb8	equ	$ffb8
Xffba	equ	$ffba
Xffbe	equ	$ffbe
Xffc8	equ	$ffc8

x_scomp		equ	$ffca
x_ucomp		equ	$ffcd
x_sleep		equ	$ffd0
x_setup		equ	$ffd3
x_dodoes	equ	$ffd6
x_dolatch	equ	$ffd9
Sffe2		equ	$ffe2
Sffe5		equ	$ffe5
x_getmem	equ	$fff1
x_getmemt	equ	$fff4
x_postecb	equ	$fff7

		org	$4000


		cstr	"Copyright FRIENDS AMIS, INC. 1982"
		cstr	"& FTU"

romvect:	fdb	tag_table_8

romext:		fcb	$08	; uses long tag table 8

cspeed:		fcb	$84	; shows in menu, and is a "slow ROM"

romid:		cstr	"SnapFORTH"

; tag table 8 (long tags $800..$8ff)
tag_table_8:
	tt_start    $800
	
	def_tgn	$800,tag_800
	def_tgn	$801,quit		; QUIT
	def_tgn	$802,p_number		; (NUMBER)
	def_tgn	$803,p_literal		; (LITERAL)
	def_tgn $804,tag_804
	def_tgn	$805,pp_quit		; ((QUIT))
	def_tgn	$806,find		; FIND
	def_tgn	$807,expnd		; EXPND
	def_tgn	$808,to			; TO
	def_tgn	$809,execto		; EXECTO
	def_tgn	$80a,ur_at		; UR@

; SnapFORTH capsule dictionary variables
; See SnapFORTH Referene Guide Volume II page G-4
	def_tgn	$80b,dp			; DP
	def_tgn	$80c,hdp		; HDP
	def_tgn	$80d,hdp0		; HDP0
	def_tgn	$80e,context		; CONTEXT
	def_tgn	$80f,current		; CURRENT
	def_tgn	$810,tib		; TIB
	def_tgn	$811,tiblen		; TIBLEN
	def_tgn $812,in			; IN
	def_tgn	$813,lastin		; LASTIN
	def_tgn	$814,state		; STATE
	def_tgn	$815,csp		; CSP
	def_tgn	$816,v_link		; V-LINK
	def_tgn	$817,l1			; L1
	def_tgn	$818,l2			; L2
	def_tgn	$819,l3			; L3
	def_tgn	$81a,l4			; L4
	def_tgn	$81b,o			; O
	def_tgn	$81c,maxsz		; MAXSZ
	def_tgn	$81d,width		; WIDTH
	def_tgn	$81e,tag_81e
	def_tgn	$81f,tag_81f
	def_tgn	$820,tag_820
	def_tgn	$821,tag_821
	def_tgn $822,p_num		; (NUM)
	def_tgn	$823,p_lit		; (LIT)
	def_tgn	$824,p_quit		; (QUIT)
	def_tgn	$825,fence		; FENCE
	def_tgn	$826,areapnt		; AREAPNT
	def_tgn	$827,con_link		; CON-LINK
	def_tgn	$828,fwd		; FWD
	def_tgn	$829,pct_high		; %HIGH
	def_tgn	$82a,tag_82a
	def_tgn	$82b,tag_82b
	def_tgn	$82c,tag_82c
	def_tgn	$82d,quote_v		; 'V
	def_tgn	$82e,tag_82e
	def_tgn	$82f,h_to_t		; H>T
	def_tgn	$830,t_to_h		; T>H
	def_tgn	$831,pct_var		; %VAR
	def_tgn	$832,lp_lp		; ((
	def_tgn	$833,plus_to		; +TO
	def_tgn	$834,from		; FROM
	def_tgn	$835,rp_rp		; ))
	def_tgn	$836,tag_836
	def_tgn	$837,u_gt		; U>
	def_tgn	$838,0_gt		; 0>
	def_tgn	$839,umin		; UMIN
	def_tgn	$83a,umax		; UMAX
	def_tgn	$83b,d_dot		; D.
	def_tgn	$83c,u_dot		; U.
	def_tgn	$83d,b_dot		; B.
	def_tgn	$83e,h_dot		; H.
	def_tgn	$83f,decimal		; DECIMAL
	def_tgn	$840,g_dot		; G.
	def_tgn	$841,semit		; SEMIT
	def_tgn	$842,stype		; STYPE
	def_tgn	$843,sp_bang		; SP!
	def_tgn	$844,query_s		; ?S
	def_tgn	$845,dot_s		; .S
	def_tgn	$846,query		; ?
	def_tgn	$847,c_query		; C?
	def_tgn	$848,dump		; DUMP
	def_tgn	$849,here		; HERE
	def_tgn	$84a,minus_word		; -WORD
	def_tgn	$84b,tag_84b
	def_tgn	$84c,tag_84c
	def_tgn	$84d,query_pairs	; ?PAIRS
	def_tgn	$84e,bang_csp		; !CSP
	def_tgn	$84f,query_csp		; ?CSP
	def_tgn	$850,query_comp		; ?COMP
	def_tgn	$851,query_exec		; ?EXEC
	def_tgn	$852,allot		; ALLOT
	def_tgn	$853,tag_853
	def_tgn	$854,f_comma		; F,
	def_tgn	$855,tag_855
	def_tgn	$856,tag_856
	def_tgn	$857,tag_857
	def_tgn	$858,comma		; ,
	def_tgn	$859,c_comma		; C,
	def_tgn	$85a,tag_85a
	def_tgn	$85b,tag_85b
	def_tgn	$85c,tag_85c
	def_tgn	$85d,inch		; INCH
	def_tgn	$85e,word		; WORD
	def_tgn	$85f,minus_find		; -FIND
	def_tgn	$860,tag_860
	def_tgn	$861,tag_861
	def_tgn	$862,tag_862
	def_tgn	$863,quote_x		; 'X
	def_tgn	$864,query_def		; ?DEF
	def_tgn	$865,tag_865
	def_tgn	$866,_tag_		; TAG
	def_tgn	$867,tag_867
	def_tgn	$868,compile		; COMPILE
	def_tgn	$869,_literal_		; LITERAL
	def_tgn	$86a,pfa		; PFA
	def_tgn	$86b,last		; LAST
	def_tgn	$86c,nfa		; NFA
	def_tgn	$86d,lfa		; LFA
	def_tgn	$86e,latest		; LATEST
	def_tgn	$86f,hex		; HEX
	def_tgn	$870,octal		; OCTAL
	def_tgn	$871,convert		; CONVERT
	def_tgn	$872,tag_872
	def_tgn	$873,number		; NUMBER
	def_tgn	$874,dconvert		; DCONVERT
	def_tgn	$875,fconvert		; FCONVERT
	def_tgn	$876,s_quote		; S"
	def_tgn	$877,tag_877
	def_tgn	$878,cfa		; CFA
	def_tgn	$879,tag_879
	def_tgn	$87a,tt_dot_origin	; TT.ORIGIN
	def_tgn	$87b,stag_num		; STAG#
	def_tgn	$87c,ltag_num		; LTAG#
	def_tgn	$87d,ext_num		; EXT#
	def_tgn	$87e,num_shorts		; #SHORTS
	def_tgn	$87f,num_longs		; #LONGS
	def_tgn	$880,tag_880
	def_tgn	$881,tag_881
	def_tgn	$882,create		; CREATE <BUILDS
	def_tgn	$883,right_square	; ]
	def_tgn	$884,left_square	; [
	def_tgn	$885,p_create		; (CREATE)
	def_tgn	$886,tag_886
	def_tgn	$887,tag_887
	def_tgn	$888,tag_888
	def_tgn	$889,tag_889
	def_tgn	$88a,tag_88a
	def_tgn	$88b,tag_88b
	def_tgn	$88c,smudge		; SMUDGE
	def_tgn	$88d,tag_88d
	def_tgn	$88e,eq_eq		; ==
	def_tgn	$88f,code		; CODE
	def_tgn	$890,codec		; CODEC
	def_tgn	$891,tag_891
	def_tgn	$892,tag_892
	def_tgn	$893,createc		; CREATEC <BUILDSC
	def_tgn	$894,tag_894
	def_tgn	$895,tag_895
	def_tgn	$896,tag_896
	def_tgn	$897,expct		; EXPCT
	def_tgn	$898,_query_		; QUERY
	def_tgn	$899,interpret		; INTERPRET
	def_tgn	$89a,tag_89a
	def_tgn	$89b,tag_89b
	def_tgn	$89c,tag_89c
	def_tgn	$89d,tag_89d
	def_tgn	$89e,tag_89e
	def_tgn	$89f,tag_89f
	def_tgn	$8a0,p_load		; (LOAD)
	def_tgn	$8a1,then		; ENDIF THEN
	def_tgn	$8a2,tag_8a2
	def_tgn	$8a3,tag_8a3

L417e:	lda	#$02
	jsr	x_setup
	stx	Z62
	lda	(Z44),y
	sta	D03e8
	tay
L418b:	lda	(Z44),y
	cmp	#'a'		; is it lower case?
	bcc	L4199
	cmp	#'z'+1
	bcs	L4199
	sbc	#$1f		; yes, convert to upper case
	sta	(Z44),y
L4199:	dey
	bne	L418b
	lda	Z43
	beq	L41e1
	sec
	lda	Z44
	sbc	#$02
	sta	Z44
	bcs	L41bb
	dec	Z45
	bcc	L41bb
L41ad:	ldy	#$01
	lda	(Z42),y
	beq	L41e1
	tax
	dey
	lda	(Z42),y
	sta	Z42
	stx	Z43
L41bb:	ldy	#$02
	lda	(Z42),y
	eor	#$ff
	and	#$1f
	bne	L41ad
L41c5:	iny
	lda	(Z42),y
	eor	(Z44),y
	asl
	bne	L41ad
	bcc	L41c5
	ldx	Z62
	dex
	dex
	tya
	adc	Z42
	sta	Z00,x
	lda	Z43
	adc	#$00
	sta	Z01,x
	lda	#$01
	skip2
L41e1:	ldx	Z62
	jmp	(Xffbe)

P41e6:	lda	#$03
	jsr	x_setup
	stx	Z62
	ldx	#$00
	beq	L41f7
L41f1:	inc	Z46
	bne	L41f7
	inc	Z47
L41f7:	lda	(Z46,x)
	bpl	L41fd
	lda	#' '
L41fd:	cmp	Z42
	beq	L41f1
	cmp	#$0d		; carriage return
	beq	L41f1
L4205:	lda	(Z46,x)
	bpl	L421a
	eor	#$80
	tax
	lda	#$20
L420e:	iny
	cpy	#$51
	bcs	L4253
	sta	(Z44),y
	dex
	bne	L420e
	beq	L4229
L421a:	cmp	#$0d		; carriage return
	beq	L4229
	iny
	cpy	#$51
	bcs	L4253
	sta	(Z44),y
	cmp	#$00
	beq	L4241
L4229:	inc	Z46
	bne	L422f
	inc	Z47
L422f:	lda	(Z46,x)
	beq	L4241
	bpl	L4237
	lda	#$20
L4237:	cmp	Z42
	bne	L4205
	inc	Z46
	bne	L4241
	inc	Z47
L4241:	tya
	sta	(Z44,x)
	ldx	Z62
	sec
	lda	Z46
	sbc	Zfe,x
	pha
	lda	Z47
	sbc	Zff,x
	jmp	(Xffc8)
L4253:	jmp	T471e

P4256:	iny
	sty	tostate
	jmp	L09

P425d:	lda	D03a0
	sta	Z42
	lda	D03a1

T4265:	sta	Z43
	lda	tostate
	beq	L4290
	bmi	L4281
	lda	Z00,x
	sta	(Z42),y
	iny
	lda	Z01,x
	sta	(Z42),y
	inx
	inx
	lda	#$00
	sta	tostate
	jmp	L09
L4281:	clc
	lda	Z00,x
	adc	(Z42),y
	sta	(Z42),y
	iny
	lda	Z01,x
	adc	(Z42),y
	jmp	L049d
L4290:	lda	(Z42),y
	pha
	iny
	lda	(Z42),y
	jmp	(Xffc8)

P4299:	pla
	sta	Z42
	pla
	ldy	#$01
	jmp	L048d


; EXECTO
x_execto:
	lda	#$01
	JSR	x_setup
	JMP	L048f

; UR@
x_ur_at:
	fcb	$00
	literal	D03a0		; D03a0
	tag	at		; @
	tag	exit

; DP (SnapFORTH capsule dictionary variable)
x_dp:
	ldy	#$04
	bne	L42f1		; always taken

; HDP (SnapFORTH capsule dictionary variable)
x_hdp:
	ldy	#$06
	bne	L42f1		; always taken

; HDP0 (SnapFORTH capsule dictionary variable)
x_hdp0:
	ldy	#$08
	bne	L42f1		; always taken

; CONTEXT (SnapFORTH capsule dictionary variable)
x_context:
	ldy	#$0a
	bne	L42f1		; always taken

; CURRENT (SnapFORTH capsule dictionary variable)
x_current:
	ldy	#$0c
	bne	L42f1		; always taken

; TIB (SnapFORTH capsule dictionary variable)
x_tib:
	ldy	#$0e
	bne	L42f1		; always taken

; TIBLEN (SnapFORTH capsule dictionary variable)
x_tiblen:
	ldy	#$10
	bne	L42f1		; always taken

; IN (SnapFORTH capsule dictionary variable)
x_in:
	ldy	#$12
	bne	L42f1		; always taken

; LASTIN (SnapFORTH capsule dictionary variable)
x_lastin:
	ldy	#$14
	bne	L42f1		; always taken

; STATE (SnapFORTH capsule dictionary variable)
x_state:
	ldy	#$16
	bne	L42f1		; always taken

; CSP (SnapFORTH capsule dictionary variable)
x_csp:
	ldy	#$18
	bne	L42f1		; always taken

; V-LINK (SnapFORTH capsule dictionary variable)
x_v_link:
	ldy	#$1a
	bne	L42f1		; always taken

; L1 (SnapFORTH capsule dictionary variable)
x_l1:
	ldy	#$1c
	bne	L42f1		; always taken

; L2 (SnapFORTH capsule dictionary variable)
x_l2:
	ldy	#$1e
	bne	L42f1		; always taken

; L3 (SnapFORTH capsule dictionary variable)
x_l3:
	ldy	#$20
	bne	L42f1		; always taken

; L4 (SnapFORTH capsule dictionary variable)
x_l4:
	ldy	#$22
	bne	L42f1		; always taken

; O (SnapFORTH capsule dictionary variable)
x_o:
	ldy	#$24
L42f1:	jmp	L0485

; MAXSZ (SnapFORTH capsule dictionary variable)
x_maxsz:
	ldy	#$26
	bne	L42f1		; always taken

; WIDTH (SnapFORTH capsule dictionary variable)
x_width:
	ldy	#$28
	bne	L42f1		; always taken

; unknown (SnapFORTH capsule dictionary variable)
x_tag_81e:
	ldy	#$2a
	bne	L42f1		; always taken

; unknown (SnapFORTH capsule dictionary variable)
x_tag_81f:
	ldy	#$2c
	bne	L42f1		; always taken

; unknown (SnapFORTH capsule dictionary variable)
x_tag_820:
	ldy	#$2e
	bne	L42f1		; always taken

; unknown (SnapFORTH capsule dictionary variable)
x_tag_821:
	ldy	#$30
	bne	L42f1		; always taken

; (NUM) (SnapFORTH capsule dictionary variable)
x_p_num:
	ldy	#$32
	bne	L42f1		; always taken

; (LIT) (SnapFORTH capsule dictionary variable)
x_p_lit:
	ldy	#$34
	bne	L42f1		; always taken

; (QUIT) (SnapFORTH capsule dictionary variable)
x_p_quit:
	ldy	#$36
	bne	L42f1		; always taken

; FENCE (SnapFORTH capsule dictionary variable)
x_fence:
	ldy	#$38
	bne	L42f1		; always taken

; AREAPNT (SnapFORTH capsule dictionary variable)
x_areapnt:
	ldy	#$3a
	bne	L42f1		; always taken

; CON-LINK (SnapFORTH capsule dictionary variable)
x_con_link:
	ldy	#$3c
	bne	L42f1		; always taken

; FWD (SnapFORTH capsule dictionary variable)
x_fwd:
	ldy	#$3e
	bne	L42f1		; always taken

; %HIGH (SnapFORTH capsule dictionary variable)
x_pct_high:
	ldy	#$40
	bne	L42f1		; always taken

; unknown (SnapFORTH capsule dictionary variable)
x_tag_82a:
	ldy	#$42
	bne	L42f1		; always taken

; unknown (SnapFORTH capsule dictionary variable)
x_tag_82b:
	ldy	#$44
	bne	L42f1		; always taken

; unknown (SnapFORTH capsule dictionary variable)
x_tag_82c:
	ldy	#$46
	bne	L42f1		; always taken

	fcb	$75,$00
	fcb	$3b,$00,$50,$01,$ff,$ff,$ff,$ff
	fcb	$91,$00,$91,$00,$06,$03,$63,$00
	fcb	$00,$00,$00,$00,$00,$00,$00,$00
	fcb	$c6,$00,$00,$00,$00,$00,$00,$00
	fcb	$00,$00,$00,$00,$00,$02,$1f,$00
	fcb	$00,$00,$00,$00,$00,$00,$00,$00
	fcb	$08,$02,$08,$03,$08,$05,$00,$00
	fcb	$00,$00,$6c,$44,$00,$00,$00,$00
	fcb	$00,$00,$00,$00,$00,$00,$00,$00
	fcb	$00,$00,$00,$00,$00,$00,$00,$00
	fcb	$00,$00,$00,$00,$00,$00,$00,$00
	fcb	$00,$00,$00,$00,$00,$00,$00,$00
	fcb	$00,$00,$00,$00,$00,$00,$00,$00
	fcb	$00,$00,$00,$00,$00,$00,$00,$75
	fcb	$00,$00,$00,$d0,$00,$c0,$00,$00
	fcb	$07,$07,$00,$00,$00,$40,$00,$01
	fcb	$00,$9b,$00

	fcb	$c5
	mstr	"FORTH"

	fcb	$02,$8e,$00

; vocabulary
	jsr	L5712		; dovec
	fdb	Z83		; highest
	fcb	$81,$a0		; dummy
	fcb	$00,$00		; parent
	fcb	$81,$a0		; dummy
	fcb	$00,$00		; v-link

	fcb	$b6,$00

	fcb	$c9
	mstr	"ASSEMBLE"	; and "R" , but only first eight matched

	fcb	$02,$a9,$00

; vocabulary for assembler
	jsr	L5712		; dovec
	fdb	D7fe2		; highest
	fcb	$81,$a0		; dummy
	fcb	$91,$00		; parent
	fcb	$81,$a0		; dummy
	fcb	$91,$00		; vlink

	fcb	$d8,$66

	fcb	$c7
	mstr	"FORWARD"

	fcb	$02,$c3,$00

; vocabulary for forward references
	jsr	L5712		; dovec
	fcb	$00,$00		; highest
	fcb	$81,$a0		; dummy
	fcb	$00,$00		; parent
	fcb	$81,$a0		; dummy
	fcb	$ac,$00		; vlink

	fcb	$00,$04
	fcb	$0a,$0c,$1a,$71,$75,$83,$8c,$91
	fcb	$9b,$a7,$b0,$b4,$c1,$ce,$00,$00
	fcb	$09,$00,$2a,$00,$18,$44,$08,$00
	fcb	$2b,$00,$1e,$44,$07,$00,$2c,$00
	fcb	$24,$44,$06,$00,$2d,$00,$2a,$44
	fcb	$05,$00,$2e,$00,$30,$44,$04,$00
	fcb	$2f,$00,$36,$44,$03,$00,$30,$00
	fcb	$3c,$44,$02,$00,$31,$00,$42,$44
	fcb	$01,$00,$32,$00,$48,$44,$00,$00
	fcb	$33,$00,$4e,$44,$ff,$ff,$34,$00
	fcb	$54,$44,$20,$00,$35,$00,$5a,$44
	fcb	$30,$00,$36,$00,$60,$44,$80,$00
	fcb	$37,$00,$66,$44,$d7,$02,$a5

; WHO
x_who:	fcb	$00
	tag	p_dot_quote
	cstr	"JWA V.D. Vuurst"

; SET
; Set a compiler option
x_set:	fcb	$00
	tag	ur_at,2_plus		; UR@ 2+
	tag	quote_v,set_bits	; 'V SET.BITS

; CLR
; Clear a compiler option
x_clr:	fcb	$00
	tag	ur_at,2_plus		; UR@ 2+
	tag	quote_v,clr_bits	; 'V CLR.BITS

x_tag_82e:
	fcb	$00
	tag	r_to,count,swap,to_r	; R> COUNT SWAP >R
	tag	ur_at,2_plus,c_at,and	; UR@ 2+ C@ AND

; H>T
x_h_to_t:
	fcb	$00
	tag	o,plus		; O +

; T>H
x_t_to_h:
	fcb	$00
	tag	o,minus		; O -
	tag	exit

; %VAR
; Returns state of "TO" variables, 0 = FROM, 1 = TO, -1 = +TO
x_pct_var:
	lda	tostate
	pha
	bpl	L44ab
	dey
L44ab:	tya
	jmp	(Xffc8)

; ((
x_lp_lp:
	pha
	lda	tostate
	pha
	fcb	$24	; bit zero-page opcode to skip one byte

; +TO
x_plus_to:
	dey
x_from:
	sty	tostate
	jmp	L09

; ))
x_rp_rp:
	pla
	sta	tostate
	pla
	jmp	L09

x_tag_836:
	ldy	#$06
	lda	D03a0
	sta	Z42
	lda	D03a1
	sta	Z42+1
	lda	Z02,x
	cmp	(Z42),y
	iny
	lda	Z03,x
	sbc	(Z42),y
	bcc	L44e8
	lda	Z02,x
	cmp	Z00,x
	lda	Z03,x
	sbc	Z01,x
	bcs	L44e8
	jmp	(Xffb8)
L44e8:	jmp	(Xffba)

; U>
x_u_gt:
	fcb	$00
	tag	swap,u_less_than	; SWAP U<

; 0>
x_0_gt:
	fcb	$00
	tag	0,greater_than		; 0 >

; UMIN
x_umin:
	fcb	$00
	tag	2dup,u_gt		; 2DUP U>
	tagrf	p_if,R44F9		; (IF)
	tag	swap			; SWAP
R44F9:	tag	drop			; DROP

; UMAX
x_umax:
	fcb	$00
	tag	2dup,u_less_than	; 2DUP U<
	tagrf	p_if,R4501		; (IF)
	tag	swap			; SWAP
R4501:	tag	drop			; DROP

; D.
x_d_dot:
	fcb	$00
	tag	0,d_dot_r,space		; 0 D.R SPACE

; U.
x_u_dot:
	fcb	$00
	tag	0,d_dot			; 0 D.

T450b:
	fcb	$00
	literal	$ff			; $FF
	tag	and			; AND
	literal	$10
	tag	div_mod			; /MOD
	tag	bin_to_ascii,emit	; B>A EMIT
	tag	bin_to_ascii,emit	; B>A EMIT

; B.
x_b_dot:
	fcb	$00
	tag	p_call			; (CALL)
	fdb	T450b			; T450b
	tag	space			; SPACE

; H.
x_h_dot:
	fcb	$00
	tag	dup,flip,p_call		; DUP FLIP (CALL)
	fdb	T450b			; T450b
	tag	b_dot			; B.

; G.
x_g_dot:
	fcb	$00
	literal	12
	literal	$fb00
	tag	fround,over,10exp	; FROUND OVER 10EXP
	tag	dup,to_r,1_plus
	literal	11
	tag	u_gt,dup,to_r		; U> DUP >R
	tagrf	p_if,L4541		; IF
	tag	swap			;   SWAP $0f80 AND $40 OR SWAP
	literal	$0f80
	tag	and
	literal	$40
	tag	or,swap
					; THEN
L4541:	tag	f_dot,r_to		; F. R>
	tagrf	p_if,L4555		; IF
	literal	$45
	tag	emit,r			;   EMIT R
	literal	$25			;   $25
	tag	save,decimal,0,dot_r	;   SAVE DECIMAL 0 .R
	tag	crestore		;   CRESTORE
					; THEN
L4555:	tag	r_to,2drop		; R> 2DROP

; SEMIT
x_semit:
	fcb	$00
	literal	$7f			; $7F AND DUP 20H
	tag	and,dup,20h
	tagrf	p_less_if,L4562		; <IF
	tag	drop			;   DROP
	literal	$2e
					; THEN
L4562:	tag	emit			; EMIT

; STYPE
x_stype:
	fcb	$00
	tag	bounds
	tagrf	p_query_do,L456c
	tag	i,c_at,semit		; I C@ SEMIT
	tag	p_loop			; (LOOP)
L456c:

; SP!
x_sp_bang:
	fcb	$00
	literal	$ff			; $FF SET.SP
	tag	set_sp

; ?S
x_query_s:
	fcb	$00
	tag	sp_at			; SP@ $FF SWAP - 2/
	literal	$ff
	tag	swap,minus,2_div

; .S
x_dot_s:
	fcb	$00
	tag	space,query_s		; SPACE ?S
	tag	query_dup		; ?DUP
	tagrf	p_if,L485a              ; IF
	tag	0,swap			;   0 SWAP
	tag	p_do			;   (DO)
	tag	i,pick,u_dot		;     I PICK U.
	tag	minus_1			;     -1
	tag	p_plus_loop		;   (+LOOP)
	tag	exit                    ;   EXIT
	                                ; THEN
L485a:	tag	p_dot_quote		; ."
	cstr	"EMPTY"

; ?
x_query:
	fcb	$00
	tag	at,dot			; @ .

; C?
x_c_query:
	fcb	$00
	tag	c_at,dot		; C@ .

; DUMP
x_dump:
	fcb	$00
	tag	0,to_r			; 0 >R
					; BEGIN
L459c:	tag	cr			;   CR
	tag	dup,2dup,h_dot,space	;   DUP 2DUP H. SPACE
	tag	4,bounds		;   4 BOUNDS
	tag	p_do			;   (DO)
	tag	i,c_at,b_dot		;     I C@ B.
	tag	p_loop			;   (LOOP)
	tag	space,4,stype,r		;   SPACE 4 STYPE R
	tagrf	p_if,L45b8		;   IF
	tag	query_key_hit		;     ?KEY-HIT
	tagrf	p_if,L45b8		;     IF
	tag	r_to,falsify,to_r	;       R> FALSIFY >R
					;     THEN
					;   THEN
L45b8:	tag	r,query_dup		;   R ?DUP
	tagrf	p_notif,L45c6		;   NOTIF
	tag	key			;     KEY
	literal	$86			;     $86
	tagrf	p_case,L45c6		;     CASE
	tag	r_to,drop,key		;       R> DROP KEY
	tag	dup,to_r		;       DUP >R
					;     ENDCASE
					;   THEN
L45c6:	literal	$0d
	tagrf	p_case,L45cd		;   CASE
	tag	r_to,2drop,exit		;     R> 2DROP EXIT
					;   ENDCASE
L45cd:	tag	80H
	tagrf	p_case,L45d4
	tag	4,minus
	tagrf	p_else,L45e5

L45d4:	literal $81
	tagrf	p_case,L45db
	tag	1_minus
	tagrf	p_else,L45e5

L45db:	literal $82
	tagrf	p_case,L45e2
	tag	1_plus
	tagrf	p_else,L45e5

L45e2:	tag	drop,4,plus		;   DROP 4 +

L45e5:	tagrr	p_again,L459c		; AGAIN

; HERE
x_here:
	fcb	$00
	fcb	$08,$34,$08,$0b

; -WORD
x_tag_84b:
	fcb	$00
	fcb	$12,$9e,$17,$08,$04,$7e,$7a
	cstr	"ERROR: "
	fcb	$24
	fcb	$79,$78,$7d,$08,$10,$08,$12,$08
	fcb	$13,$af,$08,$42,$77,$08,$01

x_tag_84c:
	fcb	$00
	fcb	$4e,$05,$01,$19,$dc,$ff,$24,$79
	fcb	$3d,$23,$00,$8a,$a2,$ff,$c5,$32
	fcb	$b0,$29,$c9,$40,$b0,$13,$00,$08
	fcb	$4b
	cstr	"STACK UNDERFLOW"
	fcb	$00
	fcb	$08,$4b
	cstr	"STACK OVERFLOW"
	fcb	$00
	fcb	$08,$4b
	cstr	"SYSTEM ERROR"

; ?PAIRS
x_query_pairs:
	fcb	$00
	fcb	$48,$08,$4c
	cstr	"ILLEGAL CONSTRUCTION"

; !CSP
x_bang_csp:
	fcb	$00
	fcb	$1f,$08,$08,$08,$15

; ?CSP
x_query_csp:
	fcb	$00
	fcb	$1f,$08,$15,$08,$4d

; ?COMP
x_query_comp:
	fcb	$00
	tag	state
	ntag	$84c
	cstr	"CAN'T EXECUTE"

; ?EXEC
x_query_exec:
	fcb	$00
	tag	state
	tag	not
	ntag	$84c
	cstr	"CAN'T COMPILE"

; null character
L46a4:	fcb	$00
	fcb	$27,$0e

; ALLOT
x_allot:
	fcb	$00
	fcb	$08,$0b,$3d,$08,$0c,$1c,$37,$3d
	fcb	$3e,$08,$1c,$01,$17,$4e,$05,$1b
	fcb	$0c,$80,$59,$08,$08,$08,$0b

x_tag_853:
	fcb	$00
	fcb	$08,$28,$28,$08,$4c
	cstr	"FORWARD NOT ALLOWED"

; F,
x_f_comma:
	fcb	$00
	fcb	$08,$53,$08,$49,$01,$aa,$2b,$08
	fcb	$52

x_tag_855:
	fcb	$00
	fcb	$08,$49,$16,$31,$08,$52

x_tag_856:
	fcb	$00
	fcb	$08,$49,$18,$32,$08,$52

x_tag_857:
	fcb	$00
	fcb	$08,$28,$1a,$4c,$1a,$08,$0d,$3d
	fcb	$22,$08,$29,$3d,$1c,$18,$42,$08
	fcb	$49,$1c,$16,$41,$16,$11,$e0,$4e
	fcb	$33,$08,$08,$08,$28,$00,$0f

; ,
x_comma:
	fcb	$00
	fcb	$33,$08,$57,$08,$55

; C,
x_c_comma:
	fcb	$00
	fcb	$31,$08,$57,$08,$56,$00

T471e:	ldx	Z62
	fcb	$00
	fcb	$08,$4b
	cstr	"LINE TOO LONG"
	fcb	$00

S4732:	jsr	x_dodoes
	fcb	$79,$08,$08
	fcb	$08,$2c,$79,$08,$08,$08,$2b,$17
	fcb	$08,$08,$08,$2a

	fcb	$00

xa_mode_immediate:
	jsr	S4732
	fcb	$09,$01,$01

xa_mode_accumulator:
	jsr	S4732
	fcb	$09,$02
	fcb	$00

S4751:
	jsr	S4732
	fcb	$05,$04,$01

xa_mode_indexed_by_x:
	jsr	S4732
	fcb	$15,$08,$01

xa_mode_indexed_by_y:
	jsr	S4732
	fcb	$19,$20,$02

xa_mode_indexed_by_x_indirect:
	jsr	S4732
	fcb	$01,$40,$01

xa_mode_indirect_indexed_by_y:
	jsr	S4732
	fcb	$11,$80,$01

xa_mode_indirect:
	jsr	S4732
	fcb	$00,$00,$02

xa_mode_immediate_low_byte:
	fcb	$00
	fcb	$14,$ff
	fcb	$39,$0c,$45,$47

xa_mode_immediate_high_byte:
	fcb	$00
	fcb	$08,$28,$4c
	fcb	$08,$32,$08,$08,$08,$29,$52,$02
	fcb	$3c,$0c,$75,$47

xa_top:	fcb	$00
	fcb	$33,$0c,$57
	fcb	$47

xa_sec:	fcb	$00
	fcb	$31,$0c,$57,$47,$00,$4c
	fcb	$1b,$0c,$51,$47,$08,$4b
	cstr	"ILLEGAL ADDRESS-MODE"

	fcb	$00
	fcb	$08,$2c,$2e,$3e
	fcb	$0c,$96,$47,$08,$56

	fcb	$00

S47be:	jsr	x_dodoes
	fcb	$08,$2c,$08,$2b,$14,$0c,$39
	fcb	$4c,$1e,$30,$1d,$14,$ff,$08,$37
	fcb	$08,$28,$3a,$4c,$13,$32,$08,$33
	fcb	$08,$2a,$2b,$3d,$08,$2b,$2b,$48
	fcb	$4c,$06,$2b,$08,$33,$08,$2b,$22
	fcb	$79,$08,$2b,$39,$28,$0c,$96,$47
	fcb	$17,$1b,$32,$39,$08,$2b,$39,$4c
	fcb	$03,$2b,$3e,$3d,$08,$56,$08,$2a
	fcb	$1a,$4c,$1b,$40,$4c,$05,$08,$58
	fcb	$52,$14,$1b,$14,$ff,$08,$37,$08
	fcb	$28,$28,$39,$08,$2b,$32,$4b,$39
	fcb	$0c,$96,$47,$08,$59,$0c,$51,$47
	fcb	$00

S4821:	jsr	x_dodoes
	fcb	$17,$0c,$b3,$47
	fcb	$00

xa_op_clc:
	jsr	S4821
	fcb	$18

xa_op_sec:
	jsr	S4821
	fcb	$38

xa_op_cli:
	jsr	S4821
	fcb	$58

xa_op_sei:
	jsr	S4821
	fcb	$78

xa_op_nop:
	jsr	S4821
	fcb	$ea

xa_op_clv:
	jsr	S4821
	fcb	$b8

xa_op_cld:
	jsr	S4821
	fcb	$d8

xa_op_sed:
	jsr	S4821
	fcb	$f8

xa_op_dex:
	jsr	S4821
	fcb	$ca

xa_op_inx:
	jsr	S4821
	fcb	$e8

xa_op_dey:
	jsr	S4821
	fcb	$88

xa_op_iny:
	jsr	S4821
	fcb	$c8

xa_op_tax:
	jsr	S4821
	fcb	$aa

xa_op_txa:
	jsr	S4821
	fcb	$8a

xa_op_tay:
	jsr	S4821
	fcb	$a8

xa_op_tya:
	jsr	S4821
	fcb	$98

xa_op_txs:
	jsr	S4821
	fcb	$9a

xa_op_tsx:
	jsr	S4821
	fcb	$ba

xa_op_php:
	jsr	S4821
	fcb	$08

xa_op_plp:
	jsr	S4821
	fcb	$28

xa_op_pha:
	jsr	S4821
	fcb	$48

xa_op_pla:
	jsr	S4821
	fcb	$68

xa_op_rts:
	jsr	S4821
	fcb	$60

xa_op_rti:
	jsr	S4821
	fcb	$40

xa_op_ora:
	jsr	S47be
	fcb	$fd,$00

xa_op_and:
	jsr	S47be
	fcb	$fd,$20

xa_op_eor:
	jsr	S47be
	fcb	$fd,$40

xa_op_adc:
	jsr	S47be
	fcb	$fd,$60

xa_op_sta:
	jsr	S47be
	fcb	$fc,$80

xa_op_lda:
	jsr	S47be
	fcb	$fd,$a0

xa_op_cmp:
	jsr	S47be
	fcb	$fd,$c0

xa_op_sbc:
	jsr	S47be
	fcb	$fd,$e0

xa_op_asl:
	jsr	S47be
	fcb	$1e,$01

xa_op_rol:
	jsr	S47be
	fcb	$1e,$21

xa_op_lsr:
	jsr	S47be
	fcb	$1e,$41

xa_op_ror:
	jsr	S47be
	fcb	$1e,$61

xa_op_dec:
	jsr	S47be
	fcb	$1c,$c1

xa_op_inc:
	jsr	S47be
	fcb	$1c,$e1

L48cf:
	jsr	S47be
	fcb	$1d,$a1

xa_op_ldy:
	jsr	S47be
	fcb	$1d,$9f

xa_op_cpx:
	jsr	S47be
	fcb	$05,$df

xa_op_cpy:
	jsr	S47be
	fcb	$05,$bf

L48e3:
	jsr	S47be
	fcb	$0c,$81

xa_op_sty:
	jsr	S47be
	fcb	$0c,$7f

xa_op_bit:
	jsr	S47be
	fcb	$04,$1f

L48f2:
	fcb	$00
	fcb	$08,$2c,$14,$15,$48
	fcb	$0c,$96,$47,$08,$2c,$14,$19,$48
	fcb	$4c,$04,$0c,$57,$47

xa_op_ldx:
	fcb	$00
	fcb	$0c,$f2
	fcb	$48,$0c,$cf,$48

xa_op_stx:
	fcb	$00
	fcb	$0c,$f2,$48
	fcb	$0c,$e3,$48

xa_op_jmp:
	fcb	$00
	fcb	$14,$4c,$08,$2c
	fcb	$4e,$06,$0c,$51,$47,$35,$3d,$0c
	fcb	$b3,$47,$08,$58

xa_op_jsr:
	fcb	$00
	fcb	$35,$0c,$b3
	fcb	$47,$08,$58,$00,$11,$00,$01,$01
	fcb	$17,$08,$4c
	cstr	"BRANCH OUT OF RANGE"

L4947:
	fcb	$00
	fcb	$1b,$37,$3d,$0c,$2b,$49

	fcb	$00

S494f:
	jsr	x_dodoes
	fcb	$17,$08,$56,$08,$28,$4e
	fcb	$0a,$08,$49,$08,$2f,$42,$3e,$0c
	fcb	$47,$49,$32,$08,$57,$08,$56,$0c
	fcb	$51,$47,$00

xa_op_bpl:
	jsr	S494f
	fcb	$10

xa_op_bmi:
	jsr	S494f
	fcb	$30

xa_op_bbc:
	jsr	S494f
	fcb	$50

xa_op_bvs:
	jsr	S494f
	fcb	$70

xa_op_bcc:
	jsr	S494f
	fcb	$90

xa_op_bcs:
	jsr	S494f
	fcb	$b0

xa_op_bne:
	jsr	S494f
	fcb	$d0

xa_op_beq:
	jsr	S494f
	fcb	$f0

xa_if:
	fcb	$00
	fcb	$08,$49,$32,$20
	fcb	$08,$55

xa_then:
	fcb	$00
	fcb	$32,$08,$4d,$42,$1b
	fcb	$17,$4c,$09,$08,$49,$08,$2f,$22
	fcb	$16,$52,$0b,$08,$49,$1c,$42,$3e
	fcb	$0c,$47,$49,$22,$18

xa_else:
	fcb	$00
	fcb	$08,$49
	fcb	$32,$32,$0c,$13,$49,$aa,$0c,$92
	fcb	$49

xa_begin:
	fcb	$00
	fcb	$08,$49,$31

xa_until:
	fcb	$00
	fcb	$08,$56
	fcb	$31,$08,$4d,$08,$49,$42,$3e,$0c
	fcb	$47,$49,$08,$56

xa_again:
	fcb	$00
	fcb	$31,$08,$4d
	fcb	$08,$2f,$0c,$13,$49

xa_while:
	fcb	$00
	fcb	$0c,$8b
	fcb	$49

xa_repeat:
	fcb	$00
	fcb	$aa,$0c,$cc,$49,$0c,$92
	fcb	$49,$00

S49e2:	jsr	x_dodoes
	fcb	$17,$11,$00
	fcb	$ff,$3a,$0c,$6f,$47

	fcb	$00

xa_puttru:
	jsr	S49e2
	fcb	$b8

xa_putfls:
	jsr	S49e2
	fcb	$ba

xa_cput:
	jsr	S49e2
	fcb	$bc

xa_cpush:
	jsr	S49e2
	fcb	$be

xa_popput:
	jsr	S49e2
	fcb	$c0

xa_2pop:
	jsr	S49e2
	fcb	$c2

xa_put:
	jsr	S49e2
	fcb	$c4

xa_pop:
	jsr	S49e2
	fcb	$c6

xa_push:
	jsr	S49e2
	fcb	$c8

; ASS
x_ass:
	fcb	$00
	tag	p_call
	fdb	S4751
	tag	ur_at
	literal	$ac
	tag	plus
	tag	to
	tag	context
	tag	exit

	jsr	x_dodoes

x_tag_804:
	fcb	$00
	fcb	$1b,$10,$0f,$13,$f2,$18

x_tag_85a:
	fcb	$00
	fcb	$32,$08,$19,$1b,$08,$1a,$01,$17
	fcb	$4e,$04,$0f,$38,$00,$08,$18,$12
	fcb	$9e,$17,$58,$05,$08,$0d,$52,$04
	fcb	$08,$04,$33,$1b,$23,$3d,$22,$4c
	fcb	$05,$1b,$79,$52,$0a,$08,$10,$22
	fcb	$5d,$22,$14,$0d,$08,$07,$3d,$23
	fcb	$79,$22,$08,$10,$14,$50,$01,$2e
	fcb	$08,$10,$3d,$33,$22,$18,$12,$9e
	fcb	$17,$08,$04,$27,$3e,$08,$08,$08
	fcb	$19,$32

x_tag_85b:
	fcb	$00
	fcb	$33,$01,$19,$b3,$ff,$00,$08,$4c
	cstr	"DEVICE INPUT"

x_tag_85c:
	fcb	$00
	fcb	$33,$08,$10,$16,$33,$33,$33,$1f
	fcb	$42,$1b,$08,$18,$01,$4d,$4e,$09
	fcb	$1c,$11,$00,$87,$48,$0c,$7b,$4a
	fcb	$0a,$0f,$14,$7f,$39,$14,$0d,$58
	fcb	$04,$0f,$32,$00,$14,$0a,$58,$03
	fcb	$52,$15,$2a,$58,$02,$35,$1b,$35
	fcb	$51,$04,$0f,$38,$00,$1c,$08,$10
	fcb	$3d,$16,$42,$14,$4f,$67,$53,$39
	fcb	$00,$14,$31,$17,$08,$2e,$20,$3a
	fcb	$11,$fe,$58,$18,$14,$65,$14,$40
	fcb	$45,$08,$17,$47

; INCH
x_inch:
	fcb	$00
	fcb	$08,$10,$08,$12,$3d,$17,$1b,$4e
	fcb	$11,$08,$17,$4c,$0c,$0c,$cc,$4a
	fcb	$4c,$07,$08,$08,$08,$12,$14,$0d
	fcb	$00,$32,$08,$33,$08,$12

; WORD
x_word:
	fcb	$00
	fcb	$08,$12,$08,$08,$08,$13,$08,$10
	fcb	$08,$12,$3d,$08,$49,$30,$1d,$08
	fcb	$07,$08,$33,$08,$12,$32,$08,$49
	fcb	$15,$32,$50,$10,$08,$17,$4c,$0c
	fcb	$0c,$cc,$4a,$4c,$07,$33,$08,$08
	fcb	$08,$12,$38,$4d,$2b,$0f

; -WORD
x_minus_word:
	fcb	$00
	fcb	$35,$08,$5e

; -FIND
x_minus_find:
	fcb	$00
	fcb	$08,$4a,$08,$49,$08,$0e,$08,$06
	fcb	$1a,$4e,$07,$08,$49,$08,$0f,$08
	fcb	$06

x_tag_860:
	fcb	$00
	fcb	$08,$4b
	cstr	"CAN'T FIND"

x_tag_861:
	fcb	$00
	fcb	$4e,$03,$08,$60

x_tag_862:
	fcb	$00
	fcb	$08,$5f,$08,$61

; ?DEF
x_query_def:
	fcb	$00
	fcb	$08,$5f,$1b,$4c,$03,$0e,$32

x_tag_865:
	fcb	$00
	fcb	$1f,$17,$40,$2b,$01,$17,$00,$08
	fcb	$2e,$02,$08,$4c
	cstr	"INTERNAL"

; TAG
x__tag_:
	fcb	$00
	fcb	$08,$65,$4c,$0d,$1f,$17,$2d,$4b
	fcb	$4c,$04,$0c,$6b,$4b,$08,$55,$00
	fcb	$08,$56

x_tag_867:
	fcb	$00
	fcb	$14,$0c,$08,$56,$08,$58

; COMPILE
x_compile:
	fcb	$00
	fcb	$08,$50,$24,$79,$14,$0c,$50,$08
	fcb	$1b,$15,$08,$67,$41,$52,$0a,$1b
	fcb	$40,$15,$08,$65,$22,$08,$66,$3d
	fcb	$23

; value SET.CONSTANT name
; Tell compiler to compile all references to the constant value to the
; specified name.
x_set_constant:
	fcb	$00,$08,$53,$08,$63,$08,$0c
	fcb	$3f,$22,$1c,$16,$3f,$22,$1c,$16
	fcb	$3f,$08,$27,$1c,$16,$1b,$08,$08
	fcb	$08,$27,$08,$08,$08,$0c,$33,$08
	fcb	$52

; LITERAL
x__literal_:
	fcb	$00
	fcb	$08,$14,$4c,$40,$08,$28,$4e,$37
	fcb	$08,$27,$5d,$41,$15,$48,$4e,$06
	fcb	$15,$1b,$28,$4d,$09,$1a,$4c,$08
	fcb	$2f,$3d,$15,$08,$66,$0f,$00,$1f
	fcb	$42,$17,$33,$58,$07,$08,$68,$14
	fcb	$08,$56,$00,$31,$58,$07,$08,$68
	fcb	$13,$08,$56,$00,$30,$58,$07,$08
	fcb	$68,$12,$08,$56,$00,$0f,$08,$68
	fcb	$11,$08,$58

; DLITERAL
x_dliteral:
	fcb	$00
	fcb	$08,$53,$08,$14
	fcb	$4c,$06,$22,$08,$69,$08,$69

; FLITERAL
x_fliteral:
	fcb	$00
	fcb	$08,$53,$08,$14,$4c,$07,$08,$68
	fcb	$01,$c7,$08,$54

; '
x_squote:
	fcb	$00
	fcb	$08,$62,$08
	fcb	$69

; 'X
x_quote_x:
	fcb	$00
	fcb	$08,$62,$79,$28,$08,$61,$15,$08
	fcb	$69

; [COMPILE]
x_lb_compile:
	fcb	$00
	fcb	$08,$62,$08,$50,$79,$1a
	fcb	$4e,$05,$15,$08,$66,$00,$31,$08
	fcb	$4d,$15,$08,$67

; MYSELF
x_myself:
	fcb	$00
	fcb	$08,$6b,$08
	fcb	$6a,$01,$19,$e9,$ff

; NFA    convert PFA to NFA
x_nfa:
	lda	#$01
	JSR	x_setup
	DEC	Z42+1
	ldy	#$ff
L4c5f:	dey
	lda	(Z42),y
	bpl	L4c5f
	CLC
	tya
L4c66:	ADC	Z42
	pha
	lda	Z42+1
	ADC	#$00
	jmp	(Xffc8)

; PFA    convert LFA to PFA
x_pfa:
	lda	#$01
	JSR	x_setup
	ldy	#$02
L4c77:	iny
	lda	(Z42),y
	bpl	L4c77
	tya
	CLC
	ADC	#$01
	bne	L4c66

; LFA   convert PFA to LFA
x_lfa:
	fcb	$00
	tag	nfa
	tag	2_minus

; LATEST
; Leaves the LFA of the last symbol in the CURRENT vocabulary.
x_latest:
	fcb	$00
	tag	current
	tag	at

; LAST
; Leaves the LFA of the last symbol defined.
x_last:
	fcb	$00
	tag	tag_81e
	tag	query_dup
	tagrf	p_if,L4c94
	tag	hdp0
	tag	plus
	tag	exit
L4c94:	tag	latest

; HEX
x_hex:
	fcb	$00
	literal	16
	literal	z25
	tag	c_bang

; DECIMAL
x_decimal:
	fcb	$00
	literal	10
	literal	z25
	tag	c_bang

; OCTAL
x_octal:
	fcb	$00
	tag	8
	literal	z25
	tag	c_bang

x_tag_872:
	fcb	$00
	fcb	$1b,$17,$1b,$14,$2d,$48,$1b,$23
	fcb	$22,$14,$2b,$48,$3a,$3d,$33,$33
	fcb	$20,$79,$01,$1a,$36,$3e,$2a,$1c
	fcb	$51,$0c,$1b,$14,$11,$51,$05,$0f
	fcb	$34,$52,$03,$2c,$3e,$33,$14,$25
	fcb	$17,$40,$5a,$4c,$13,$33,$2e,$21
	fcb	$14,$25,$17,$ab,$65,$33,$2e,$21
	fcb	$14,$25,$17,$62,$65,$53,$2d,$11
	fcb	$fc,$ff,$48,$aa,$24,$4c,$03,$01
	fcb	$22,$aa

L4cf2:
	fcb	$00
	fcb	$23,$25,$37,$01,$b2
	fcb	$1c,$24,$1b,$17,$1b,$14,$2d,$48
	fcb	$22,$14,$2b,$48,$3a,$3d,$3e,$48
	fcb	$23,$1b,$17,$01,$1a,$14,$45,$48
	fcb	$4c,$17,$24,$38,$23,$42,$14,$25
	fcb	$01,$14,$08,$3f,$08,$71,$01,$16
	fcb	$23,$2f,$6c,$22,$3c,$3d,$3c,$24
	fcb	$24

; (NUMBER)
x_p_number:
	fcb	$00
	fcb	$14,$25,$17,$14,$0a,$48,$4c,$10
	fcb	$1b,$23,$0c,$f2,$4c,$4e,$06,$24
	fcb	$0f,$31,$22,$00,$0f,$61,$24,$08
	fcb	$72,$1a,$4e,$04,$40,$60,$33,$22

L4d4a:
	fcb	$00,$79,$1c,$3d,$23,$33,$25,$18
	fcb	$08,$22,$47,$24,$48

; NUMBER
x_number:
	fcb	$00
	tag	p_call
	fdb	L4d4a
	tag	tag_861

; CONVERT
x_convert:
	fcb	$00
	tag	tag_872
	tag	drop
	tag	1_minus
	tag	swapdrop

; DCONVERT
x_dconvert:
	fcb	$00
	tag	tag_872
	tagrf	p_notif,L4d69
	tag	1_minus
L4d69:

; FCONVERT
x_fconvert:
	fcb	$00
	tag	p_call
	fdb	L4cf2
	tag	drop

	fcb	$00
	fcb	$08,$13,$08
	fcb	$08,$08,$12,$08,$4a,$08,$49,$41
	fcb	$17

; &?
x_amp_query:
	fcb	$00
	fcb	$0c,$6e,$4d,$08,$69

; ^?
x_caret_query:
	fcb	$00
	fcb	$0c,$6e,$4d,$14,$1f,$39,$08,$69

; S"
x_s_quote:
	fcb	$00
	fcb	$14,$22,$08,$5e,$08,$49,$17,$42
	fcb	$08,$52

; ."
x_dot_quote:
	fcb	$00
	fcb	$08,$14,$4c,$08,$08
	fcb	$68,$7a,$08,$76,$52,$09,$14,$22
	fcb	$08,$5e,$08,$49,$79,$78

x_tag_877:
	fcb	$00
	fcb	$08,$0a,$14,$4a,$3d,$23,$79,$08
	fcb	$65,$4c,$10,$30,$62,$1b,$24,$3d
	fcb	$17,$23,$13,$1b,$3d,$15,$1c,$17
	fcb	$52,$17,$1b,$14,$c0,$51,$08,$11
	fcb	$00,$c0,$24,$38,$52,$09,$14,$c0
	fcb	$3e,$13,$1b,$15,$24,$17,$23,$22
	fcb	$43,$3d,$60,$24

; CFA   convert PFA to CFA
x_cfa:
	fcb	$00
	fcb	$79,$4e,$09,$08,$77,$4c,$05,$15
	fcb	$08,$2f,$00,$15

x_tag_879:
	fcb	$00
	fcb	$27,$0f,$11,$00,$40,$11,$ff,$7f
	fcb	$5a,$4e,$03,$08,$2f,$08,$6b,$08
	fcb	$6a,$79,$4e,$07,$08,$77,$0f,$15
	fcb	$52,$04,$15,$08,$30,$42,$16,$00

S4e0c:	JSR	x_dodoes
	fcb	$17,$08,$0a,$15,$3d,$08,$09,$00

; TT.ORIGIN
x_tt_dot_origin:
	JSR	S4e0c
	fcb	$00

; STAG#
x_stag_num:
	JSR	S4e0c
	fcb	$02

; LTAG#
x_ltag_num:
	JSR	S4e0c
	fcb	$04

; EXT#
x_ext_num:
	JSR	S4e0c
	fcb	$06

; #SHORTS
x_num_shorts:
	jsr	S4e0c
	fcb	$08

; #LONGS
x_num_longs:
	JSR	S4e0c
	fcb	$0a

x_tag_880:
	JSR	S4e0c
	fcb	$0c

; SHORT.TAGS
x_short_tags:
	fcb	$00
	fcb	$33,$08,$08,$08,$80

; LONG.TAGS
x_long_tags:
	fcb	$00
	fcb	$32,$08,$08,$08,$80,$00,$13,$33
	fcb	$13,$1b,$54,$08,$0a,$11,$2d,$fe
	fcb	$3d,$3b,$3d,$15,$1a,$4c,$09,$3b
	fcb	$16,$14,$3b,$17,$3b,$41,$18,$30
	fcb	$56,$00,$3b,$30,$62,$08,$0a,$14
	fcb	$48,$3d,$3d,$08,$1b,$28,$28,$1c
	fcb	$41,$18,$16,$08,$0a,$15,$3b,$43
	fcb	$08,$0a,$14,$63,$3d,$3d,$16,$00
	fcb	$08,$7a,$08,$7e,$4c,$0d,$1b,$08
	fcb	$7f,$43,$3d,$32,$33,$54,$0c,$5b
	fcb	$4e,$57,$08,$7d,$08,$7f,$14,$ff
	fcb	$3d,$3c,$14,$ff,$39,$a9,$59,$09
	fcb	$1b,$0c,$5b,$4e,$13,$00,$3d,$57
	fcb	$0f,$0c,$3f,$4e,$00,$54,$13,$00
	fcb	$3b,$30,$3d,$3b,$1c,$30,$01,$2e
	fcb	$19,$30,$56

x_tag_881:
	fcb	$00
	fcb	$08,$7e,$28,$08,$7f,$11,$01,$01
	fcb	$4a,$39,$08,$7f,$28,$3a,$08,$2e
	fcb	$08,$28,$3a,$28

; CAPINIT
x_capinit:
	fcb	$00
	fcb	$08,$2e,$08
	fcb	$08,$61,$08,$14,$28,$28,$08,$81
	fcb	$39,$4c,$08,$08,$7d,$08,$56,$32
	fcb	$08,$56,$00,$08,$4b
	cstr	"UNDEFINED"

; ]
x_right_square:
	fcb	$00
	fcb	$14,$c0,$08,$08,$08,$14

; [
x_left_square:
	fcb	$00
	fcb	$33,$08,$08,$08,$14

; TABLES
x_tables:
	fcb	$00
	fcb	$08,$53
	fcb	$08,$82,$08,$49,$08,$0a,$16,$33
	fcb	$08,$55,$14,$c0,$08,$55,$1c,$3c
	fcb	$08,$55,$22,$08,$55,$1c,$08,$55
	fcb	$1b,$08,$55,$1c,$28,$08,$55,$3d
	fcb	$43,$08,$49,$1b,$08,$08,$08,$7a
	fcb	$1c,$08,$52,$11,$e0,$4e,$1c,$16
	fcb	$1b,$41,$20,$3f,$01,$2e,$33,$08
	fcb	$55,$08,$81,$4c,$56,$08,$83,$08
	fcb	$7d,$30,$62,$13,$1b,$3d,$08,$49
	fcb	$40,$08,$7a,$41,$16,$08,$7e,$4c
	fcb	$18,$08,$7f,$43,$08,$69,$13,$1b
	fcb	$08,$69,$1b,$08,$69,$11,$ae,$4e
	fcb	$08,$49,$2e,$1b,$08,$52,$01,$2e
	fcb	$08,$7f,$11,$00,$01,$4b,$4c,$1d
	fcb	$1b,$08,$7f,$40,$3c,$14,$ff,$39
	fcb	$30,$62,$3d,$08,$69,$1b,$08,$69
	fcb	$11,$a7,$4e,$08,$49,$14,$0e,$1b
	fcb	$08,$52,$01,$2e,$0f,$33,$08,$59
	fcb	$08,$84,$0c,$79,$4e,$08,$79,$20
	fcb	$d6,$ff,$08,$0a,$16

; (CREATE)
x_p_create:
	fcb	$00
	fcb	$08,$0c,$3f,$20,$1c,$16,$40,$22
	fcb	$1c,$18,$08,$2e,$01,$4c,$1a,$08
	fcb	$64,$4c,$14,$7e,$7a
	cstr	"REDEFINING "
	fcb	$08,$49,$79,$78,$77,$52,$03
	fcb	$08,$4a,$33,$08,$49,$17,$08,$1d
	fcb	$67,$54,$40,$3b,$08,$49,$3d,$17
	fcb	$01,$1a,$1c,$18,$34,$56,$40,$08
	fcb	$49,$17,$14,$1f,$67,$37,$3a,$1c
	fcb	$18,$08,$0c,$2f,$3e,$37,$01,$13
	fcb	$3f,$08,$6e,$1c,$16,$1b,$08,$08
	fcb	$08,$0c,$1b,$08,$0f,$16,$08,$0d
	fcb	$3e,$08,$08,$08,$1e,$33,$08,$52

; TAG
x_tag:
	fcb	$00,$33,$08,$85

x_tag_886:
	fcb	$00
	fcb	$08,$80,$4e,$2a,$08,$7b,$14,$c0
	fcb	$08,$7e,$3d,$4a,$4c,$0a,$08,$7b
	fcb	$32,$08,$33,$08,$7b,$52,$17,$32
	fcb	$08,$08,$08,$80,$7e,$7a
	cstr	"OUT OF SHORTS"
	fcb	$77,$08,$80,$4c
	fcb	$30,$08,$7c,$1b,$08,$7d,$3c,$08
	fcb	$7f,$3d,$4a,$08,$4c
	cstr	"TAGTABLE OVERFLOW"
	fcb	$1b
	fcb	$42,$08,$81,$4c,$08,$1b,$08,$7d
	fcb	$3c,$42,$48,$3d,$08,$08,$08,$7c
	fcb	$1b,$1b,$14,$ff,$08,$37,$4c,$02
	fcb	$3c,$0c,$03,$50

x_tag_887:
	fcb	$00
	fcb	$08,$5f,$4c,$1e,$1b,$79,$4e,$19
	fcb	$08,$77,$0f,$1b,$15,$11,$e0,$4e
	fcb	$50,$0f,$08,$49,$22,$16,$08,$6d
	fcb	$08,$0d,$3e,$08,$08,$08,$1e,$00
	fcb	$0e,$08,$13,$08,$08,$08,$12,$08
	fcb	$49,$08,$86,$1b,$14,$ff,$4b,$4c
	fcb	$06,$08,$7d,$3c,$52,$06,$08,$7f
	fcb	$3d,$14,$c0,$3e,$43,$08,$7a,$3d
	fcb	$16

; SHORT
x_short:
	fcb	$00
	fcb	$08,$80,$0c,$33,$4e,$08
	fcb	$86,$0f,$08,$08,$08,$80

; LONG
x_long:
	fcb	$00
	fcb	$08
	fcb	$80,$0c,$39,$4e,$08,$86,$0f,$08
	fcb	$08,$08,$80

x_tag_888:
	fcb	$00
	fcb	$08,$4a,$08,$49,$08,$0a,$14,$c6
	fcb	$3d,$08,$06

x_tag_889:
	fcb	$00
	fcb	$08,$88,$4c,$70,$79,$20,$48,$08
	fcb	$4c
	cstr	"PATCH WRONG TYPE"
	fcb	$5d,$16,$40,$08,$6d,$1b
	fcb	$15,$08,$0a,$14,$c6,$3d,$1b,$15
	fcb	$2f,$1d,$3e,$4c,$04,$15,$53,$08
	fcb	$16,$1b,$08,$0f,$0c,$8f,$58,$1b
	fcb	$08,$0d,$3e,$08,$08,$08,$1e,$3f
	fcb	$08,$0c,$1c,$16,$2c,$3e,$1b,$41
	fcb	$79,$1c,$15,$20,$41,$15,$2e,$1d
	fcb	$3d,$20,$33,$58,$05,$22,$16,$52
	fcb	$14,$32,$58,$0b,$1c,$08,$2f,$42
	fcb	$3e,$0c,$47,$49,$52,$05,$30,$50
	fcb	$02,$3c,$22,$18,$15,$1a,$28,$4d
	fcb	$29,$0f,$00,$08,$13,$08,$08,$08
	fcb	$12,$08,$85

x_tag_88a:
	fcb	$00
	fcb	$08,$49,$08,$2f,$31,$08,$89

x_tag_88b:
	fcb	$00
	fcb	$08,$6b,$30,$3d,$1b,$17,$1b,$08
	fcb	$08,$08,$21,$37,$39,$32,$3a,$22
	fcb	$18

; SMUDGE
x_smudge:
	fcb	$00
	fcb	$08,$21,$1a,$4c,$0b,$08,$6b,$30
	fcb	$3d,$18,$33,$08,$08,$08,$21

x_tag_88d:
	fcb	$00
	fcb	$08,$49,$08,$08,$08,$1f,$08,$0c
	fcb	$08,$0d,$3e,$08,$08,$08,$20,$08
	fcb	$4e

; value == name
; Define name to push the constant value using normal literals.
x_eq_eq:
	fcb	$00
	fcb	$08,$53,$08,$1e,$22,$32,$08,$89
	fcb	$08,$08,$08,$1e

; LABEL
x_label:
	fcb	$00
	fcb	$08,$49,$08
	fcb	$2f,$08,$8e,$0c,$12,$4a

; CODE
x_code:
	fcb	$00
	fcb	$08,$8d,$0c,$12,$4a,$08,$87,$08
	fcb	$8b

; CODEC
x_codec:
	fcb	$00
	fcb	$08,$8d,$0c,$12,$4a,$08,$8a,$08
	fcb	$8b

; ENDCODE
x_endcode:	fcb	$00
	fcb	$08,$4f,$08,$8c,$08,$0f
	fcb	$08,$08,$08,$0e

; 'V
x_quote_v:
	fcb	$00
	fcb	$08,$62,$08,$78,$08,$69

x_tag_891:
	fcb	$00
	fcb	$08,$51,$08,$8d,$08,$2e,$10,$4c
	fcb	$0a,$08,$49,$40,$17,$4e,$04,$34
	fcb	$08,$52,$08,$83,$08,$0f,$08,$08
	fcb	$08,$0e

; : (colon)
x_colon:
	fcb	$00
	fcb	$08,$91,$08,$87,$33
	fcb	$08,$56,$08,$8b

; :C
x_colon_c:
	fcb	$00
	fcb	$08,$91,$08
	fcb	$8a,$33,$08,$56,$08,$8b

; :P
x_colon_p:
	fcb	$00
	fcb	$08
	fcb	$91,$08,$49,$08,$2f,$32,$08,$89
	fcb	$33,$08,$56,$08,$8b

; ;P
x_semi_p:
	fcb	$00
	fcb	$08,$4f
	fcb	$08,$68,$0d,$08,$84,$08,$8c

; ;
x_semi:
	fcb	$00
	fcb	$08,$4f,$08,$68,$00,$08,$84,$08
	fcb	$8c

; ;CODE
x_semi_code:
	fcb	$00
	fcb	$08,$4f,$08,$68,$08,$79
	fcb	$08,$84,$0c,$12,$4a,$00,$08,$2e
	fcb	$04,$08,$61,$08,$53,$08,$13,$08
	fcb	$08,$08,$12,$08,$88,$7e,$7a
	cstr	"FORWARD "
	fcb	$08,$49,$79,$78,$4c,$1d,$1b,$17
	fcb	$23,$25,$32,$48,$08,$14,$3a,$4e
	fcb	$04,$0c,$e0,$4e,$08,$6d,$2a,$3e
	fcb	$1b,$15,$08,$0c,$2c,$3e,$20,$16
	fcb	$52,$35,$31,$08,$14,$28,$3e,$23
	fcb	$08,$13,$08,$08,$08,$12,$08,$1e
	fcb	$08,$0f,$08,$0a,$14,$c6,$3d,$08
	fcb	$08,$08,$0f,$11,$e0,$4e,$25,$08
	fcb	$85,$08,$6b,$41,$35,$45,$08,$08
	fcb	$08,$0f,$08,$08,$08,$1e,$11,$fe
	fcb	$ff,$08,$33,$08,$0c,$33,$08,$0c
	fcb	$2c,$3e,$16,$08,$0c,$2e,$3e,$08
	fcb	$0d,$3e,$08,$08,$08,$28,$33,$08
	fcb	$08,$08,$29,$08,$0c,$2c,$3e,$08
	fcb	$08,$08,$0c,$33,$08,$52,$33,$24
	fcb	$32,$50,$04,$08,$69,$00,$08,$67

x_tag_892:
	fcb	$00
	fcb	$08,$87,$35,$08,$56,$08,$55

; CREATE <BUILDS
x_create:
	fcb	$00
	fcb	$11,$20,$4a,$08,$92

; CREATEC <BUILDSC
x_createc:
	fcb	$00
	fcb	$08,$8a,$35,$08,$56,$11,$20,$4a
	fcb	$08,$55

; IMMEDIATE
x_immediate:
	fcb	$00
	fcb	$08,$6b,$41,$14,$40
	fcb	$45

; value CONSTANT name
; Defines a tag that pushes a constant onto the stack.
x_constant:
	fcb	$00
	fcb	$11,$e8,$ff,$08,$92,$08
	fcb	$55

; VARIABLE
x_variable:
	fcb	$00
	fcb	$0c,$6b,$4b,$11,$99,$42
	fcb	$08,$92,$34,$08,$55

; AREA aaa
; Allocate a Temporary Storage Area (TSA) named "aaa".
; Use before defining variables, and follow by ENDAREA.
; The defined area name will allocate the TSA, returning a boolean for
; success.
; Note: the maximum size of a TSA is 250 bytes.
x_area:
	fcb	$00
	fcb	$11,$dc
	fcb	$ff,$08,$92,$08,$49,$08,$08,$08
	fcb	$26,$32,$08,$56

; ENDAREA
; Stop defining variables in a TSA.
x_endarea:
	fcb	$00		; effectively a NOP?


x_tag_894:
	fcb	$00
	fcb	$08,$92,$08,$26,$17,$3d,$1b,$14
	fcb	$fd,$4a,$08,$4c,$0d,$41,$52,$45	; ".J.L.ARE"
	fcb	$41,$20,$54,$4f,$20,$4c,$41,$52	; "A TO LAR"
	fcb	$47,$45,$1b,$08,$26,$18,$40,$08	; "GE..&.@."
	fcb	$56

; n STRING ccc
; Allocate a string variable with room for n characters, named "ccc", in a TSA.
x_string:
	fcb	$00
	fcb	$42,$11,$df,$ff,$08,$94

; VAR ccc
; Allocate a one-word variable named "ccc" in a TSA.
x_var:
	fcb	$00
	fcb	$32,$0c,$30,$53

; CVAR ccc
; Allocate a one byte variable named "ccc" in a TSA.
x_cvar:
	fcb	$00
	fcb	$33,$0c
	fcb	$30,$53

; DVAR ccc
; Allocate a two-word variable (4 bytes) named "ccc" in a TSA.
x_dvar:
	fcb	$00
	fcb	$30,$0c,$30,$53

; FVAR ccc
; Allocate a floating point variable (8 bytes) named "ccc" in a TSA.
x_fvar:
	fcb	$00
	fcb	$2c,$0c,$30,$53

; n CVECTOR ccc
; Allocate a vector of n bytes named "ccc" in a TSA.
x_cvector:
	fcb	$00
	literal	Sffe2
	tag	tag_894

; n VECTOR ccc
; Allocated a vector of n words named "ccc" in a TSA.
x_vector:
	fcb	$00
	tag	2_times
	literal	Sffe5
	tag	tag_894

; JUMP-TAB
x_jmp_tab:
	fcb	$00
	fcb	$08,$82,$0c,$e3,$52,$33
	fcb	$54,$08,$63,$08,$55,$57,$08,$79
	fcb	$20,$d6,$ff,$08,$68,$01,$34,$08
	fcb	$49,$22,$3e,$08,$55

; STRING"
x_string_quote:
	fcb	$00
	tag	here
	tag	h_to_t
	tag	s_quote
	tag	eq_eq

; CTABLE
x_ctable:
	fcb	$00
	fcb	$0f
	fcb	$11,$eb,$ff,$08,$92

; TABLE
x_table:
	fcb	$00
	fcb	$0f,$11
	fcb	$ee,$ff,$08,$92

x_tag_895:
	fcb	$00
	fcb	$14,$65,$14,$40,$45,$12,$05,$17
	fcb	$4e,$32,$0f,$8f,$33,$50,$0f,$14
	fcb	$82,$58,$0b,$8d,$17,$35,$14,$7f
	fcb	$5a,$4e,$03,$0f,$35,$8b,$4c,$1b
	fcb	$4f,$80,$06,$8c,$63,$42,$8e,$42
	fcb	$4f,$83,$10,$33,$13,$17,$1b,$01
	fcb	$14,$18,$8b,$8c,$3e,$40,$8e,$01
	fcb	$16,$40,$1b,$01,$97

x_tag_896:
	fcb	$00
	fcb	$0f,$14,$28,$16

; EXPCT
x_expct:
	fcb	$00
	fcb	$14,$28,$15,$11,$08,$96,$14,$28
	fcb	$16,$20,$20,$40,$33,$33,$11,$08
	fcb	$95,$33,$bc,$0e,$0e,$33,$8d,$18

; QUERY
x__query_:
	fcb	$00
	fcb	$08,$10,$08,$11,$08,$97,$33,$08
	fcb	$08,$08,$12

; (LITERAL)
x_p_literal:
	fcb	$00
	fcb	$33,$58,$04,$08,$69,$00,$32,$58
	fcb	$05,$0c,$12,$4c,$00,$31,$58,$05
	fcb	$0c,$1e,$4c,$00,$08,$60,$00

; CEXECUTE
x_cexecute:
	lda	Z00,x
	sta	Z42
	lda	Z00+1,x
	sta	Z42+1
	inx
	inx
	jmp	(Z42)

; INTERPRET
x_interpret	equ	*-1
	fcb	$08,$32,$08,$5f,$4c,$47,$1b,$42
	fcb	$15,$1c,$08,$6c,$17,$08,$14,$4b
	fcb	$20,$17,$33,$58,$0e,$4c,$08,$08
	fcb	$35,$47,$08,$32,$52,$03,$08,$66
	fcb	$52,$29,$32,$58,$06,$0f,$08,$69
	fcb	$52,$21,$31,$48,$08,$4c,$0e,$49	; "R!1H.L.I"
	fcb	$4c,$4c,$45,$47,$41,$4c,$20,$53	; "LLEGAL S"
	fcb	$59,$4d,$42,$4f,$4c,$4c,$0a,$08	; "YMBOLL.."
	fcb	$35,$0c,$0b,$54,$08,$32,$52,$03
	fcb	$08,$67,$52,$17,$1f,$23,$08,$49
	fcb	$0c,$4a,$4d,$4c,$08,$08,$23,$47
	fcb	$24,$0f,$52,$07,$24,$01,$0c,$0c
	fcb	$2f,$52,$53,$60

; CLEANUP
x_cleanup:
	fcb	$00
	fcb	$08,$43,$27
	fcb	$01,$0d,$26,$11,$18,$46,$14,$2a
	fcb	$16,$33,$08,$08,$08,$14,$33,$08
	fcb	$08,$08,$17,$33,$08,$08,$08,$28
	fcb	$08,$21,$4c,$11,$08,$8c,$08,$1f
	fcb	$08,$08,$08,$0b,$08,$20,$08,$0d
	fcb	$3d,$0c,$49,$57

; ((QUIT))
x_pp_quit:
	fcb	$00
	fcb	$0c,$7c,$54,$7d,$08,$34,$08,$14
	fcb	$4e,$05,$7a,$02,$6f,$6b,$7e,$08
	fcb	$98,$08,$99,$53,$10

; QUIT
x_quit:
	fcb	$00
	fcb	$12,$9e,$17,$08,$04,$12,$9c,$15
	fcb	$30,$3d,$79,$3d,$30,$3d,$12,$a0
	fcb	$16,$0c,$85,$56,$08,$34,$08,$24
	fcb	$47,$00,$01,$7e,$81,$58,$02,$00
	fcb	$81,$1b,$15,$1b,$23,$14,$72,$67
	fcb	$23,$1b,$13,$f7,$25,$01,$2e,$25
	fcb	$3d,$22,$1b,$1b,$25,$3d,$2f,$1d
	fcb	$1c,$3e,$6f,$13,$f7,$1c,$25,$01
	fcb	$2e,$25,$3d,$22,$27,$22,$3e,$1a
	fcb	$28,$4d,$26,$0e,$01,$7e,$13,$01
	fcb	$16,$00,$01,$85,$1b,$4e,$04,$81
	fcb	$01,$8c,$8a

; 700TAGS
x_700tags:
	fcb	$00
	fcb	$08,$0a,$14,$75
	fcb	$3d,$08,$0a,$16

T5527:	fcb	$00,$0c,$dc,$54
	fcb	$14,$3b,$17,$01,$7e,$33,$08,$04
	fcb	$14,$53,$1f,$32,$01,$8b,$32,$58
	fcb	$0c,$81,$41,$17,$28,$81,$15,$11
	fcb	$2a,$01,$48,$39,$4e,$13,$1f,$32
	fcb	$01,$8a,$8a,$81,$2e,$3d,$11,$25
	fcb	$01,$0c,$14,$55,$33,$81,$41,$18
	fcb	$0f,$81,$01,$7e,$48,$4e,$0b,$0c
	fcb	$dc,$54,$1c,$4e,$05,$11,$2a,$01
	fcb	$3d,$1c,$08,$04,$11
	fdb	L417e
	fcb	$12
	fcb	$a6,$11,$1b,$01,$01,$2e,$1b,$12
	fcb	$9c,$16,$1b,$30,$3d,$79,$3d,$30
	fcb	$3d,$12,$a0,$16,$13,$01,$16,$12
	fcb	$9e,$18,$00

D558e:	cstr	"NEW FILE"

x_tag_89a:
	fcb	$00
	fcb	$1b,$41,$17,$14,$e0,$48,$22,$30
	fcb	$3d,$79,$3d,$17,$14,$10,$48,$39

; selecter for menu
x_tag_89b:
	fcb	$00
	literal	ts_tag_89a		; tag 89a (byte-reversed)
	literal D02f3
	ntag	$16			; !
	ntag	$33			; 0
	tagrf	p_case,R55b8		; (CASE)
	literal	D558e
	ntag	$191			; FILE-TAG
	fcb	$00

R55b8:	fcb	$40			; 1-
	ntag	$194			; .FILE

; executer for menu
x_tag_89c:
	fcb	$00
	ntag	$1a			; ?DUP
	tagrf	p_if,R55ca		; (IF)
	ntag	$40			; 1-
	ntag	$195			; OPEN-FILE
	ntag	$0c			; (CALL) T5527
	fdb	T5527
	ntag	$0c			; (CALL) T5685
	fdb	T5685
	tagrf	p_else,R5643		; (ELSE)
R55ca:	fcb	$7e			; CR
	fcb	$7a			; (.")
	cstr	"Enter Filename"
	literal	D0306			; D0306
	fcb	$14,$50,$33,$33,$11,$01,$97
	fcb	$33,$bc,$0e,$1b,$4e,$05,$0e,$77
	fcb	$53,$22,$01,$8a,$8a,$0c,$27,$55
	fcb	$08,$0a,$1b,$30,$3e,$11,$d3,$01
	fcb	$0c,$14,$55,$11,$38,$43,$1c,$14
	fcb	$d0,$01,$2e,$11,$18,$44,$11,$08
	fcb	$44,$54,$1b,$1b,$3b,$17,$3d,$19
	fcb	$57,$81,$1b,$15,$3d,$1b,$08,$08
	fcb	$08,$0d,$08,$08,$08,$0c,$0c,$79
	fcb	$4e,$08,$7a,$11,$e0,$4e,$1c,$16
	fcb	$1b,$41,$14,$7e,$01,$2e,$33,$08
	fcb	$58,$3f,$1b,$1b,$16,$14,$10,$22
	fcb	$40,$18,$14,$e0,$81,$41,$18
R5643:	literal	$a081
	literal	D03a2
	fcb	$08,$0a,$14,$b0
	fcb	$3d,$1c,$16,$41,$16,$08,$0a,$14
	fcb	$91,$3d,$1b,$08,$08,$08,$0f,$08
	fcb	$08,$08,$0e,$0c,$3f,$4e,$12,$06
	fcb	$08,$08,$08,$10,$14,$63,$08,$08
	fcb	$08,$11,$08,$10,$08,$11,$01,$32
	fcb	$11,$08,$01,$13,$80,$16,$08,$01

; SnapFORTH capsule entry point
x_tag_800:
	fcb	$00
	ntag	$32		; 1
	literal	ts_tag_89c	; tag1 - executer (byte-reversed)
	literal	ts_tag_89b	; tag2 - selecter
	ntag	$83		; MENU-DRIVER

T5685:	fcb	$00
	fcb	$08,$0a,$3f,$1b,$15,$48,$4e
	fcb	$11,$7a
	cstr	"ILLEGAL FILE"
	fcb	$08
	fcb	$00

; COLD
x_cold:
	fcb	$00
	fcb	$2b,$13,$80,$16,$12,$9c
	fcb	$15,$01,$8c,$08,$00

; ID.
x_id_dot:
	fcb	$00
	fcb	$08,$49
	fcb	$14,$40,$14,$5e,$01,$31,$1b,$41
	fcb	$22,$08,$6a,$1c,$3e,$08,$49,$22
	fcb	$01,$2e,$08,$49,$79,$14,$1f,$39
	fcb	$7d,$08,$42

; VLIST
x_vlist:
	fcb	$00
	fcb	$08,$0e,$32,$22
	fcb	$15,$22,$1c,$4e,$03,$0e,$00,$1c
	fcb	$0c,$aa,$56,$1a,$4e,$03,$01,$7a
	fcb	$1b,$4c,$0e,$75,$14,$86,$58,$03
	fcb	$38,$75,$14,$0d,$50,$03,$0e,$00
	fcb	$53,$21

; VOCABULARY
x_vocabulary:
	fcb	$00
	tag	create			; <BUILDS
	tag	p_call			; (CALL) x_immediate
	fdb	x_immediate
	tag	here,dup,4,plus		; HERE DUP 4 +
	tag	tag_855			; tag_855 $a081
	literal	$a081
	tag	dup,tag_855,current	; DUP tag_855 CURRENT
	tag	tag_855,tag_855,v_link	; tag_855 tag_855 V-LINK
	tag	tag_855,to,v_link
	tag	tag_879

L5712:	jsr	x_dodoes
	tag	to,context

; DEFINITIONS
x_definitions:
	fcb	$00
	tag	context,to,current	; CONTEXT TO CURRENT

; CHAIN
x_chain:
	fcb	$00
	tag	quote_v,3,plus		; 'V 3 +
	tag	current,4,plus,bang	; CURRENT 4 + !

x_tag_89d:
	fcb	$00
	tag	dup
					; BEGIN
L572d:	tag	at,rp_at,4,plus,at	; @ RP@ 4 + @
	tag	tag_836,not		;   tag_836 NOT
	tagrr	p_until,L572d		; UNTIL
	tag	swap,bang		; SWAP !

; FORGET
x_forget:
	fcb	$00
	tag	tag_862,hdp0,tag_836	; tag_862 HDP0 tag_836
	tagrf	p_notif,L5744		; NOTIF
	tag	drop			;   DROP
	tag	exit
					; ELSE
L5744:	tag	3,plus			;   3 +
	tag	p_call
	fdb	x_p_forget		;   (FORGET)
					; THEN

; (FORGET)
x_p_forget:
	fcb	$00
	fcb	$08
	fcb	$0f,$08,$08,$08,$0e,$08,$25,$08
	fcb	$0d,$08,$36,$4c,$04,$08,$39,$33
	fcb	$0f,$33,$08,$08,$08,$1e,$23,$08
	fcb	$16,$1b,$15,$25,$08,$36,$4c,$50
	fcb	$1f,$23,$1b,$08,$6a,$79,$4e,$43
	fcb	$15,$08,$65,$43,$22,$1c,$4c,$02
	fcb	$3c,$1f,$42,$17,$43,$08,$0a,$14
	fcb	$63,$3d,$3d,$15,$1b,$4c,$2c,$1b
	fcb	$08,$49,$01,$17,$4c,$25,$41,$20
	fcb	$3d,$1b,$15,$20,$67,$22,$16,$1b
	fcb	$08,$6a,$42,$08,$77,$0f,$15,$1b
	fcb	$17,$28,$3d,$08,$0a,$14,$75,$3d
	fcb	$15,$08,$49,$5a,$4c,$05,$08,$08
	fcb	$08,$0b,$24,$01,$0c,$53,$53,$1c
	fcb	$16,$2b,$3d,$15,$1a,$28,$4d,$5d
	fcb	$08,$0a,$14,$c6,$3d,$15,$1a,$4c
	fcb	$08,$1b,$2a,$3e,$08,$9d,$53,$09
	fcb	$08,$0a,$14,$3c,$3d,$08,$9d,$08
	fcb	$16,$1b,$08,$0a,$14,$c6,$3d,$48
	fcb	$4e,$62,$1b,$2f,$3d,$1b,$15,$08
	fcb	$49,$01,$17,$4e,$08,$08,$0a,$14
	fcb	$91,$3d,$1c,$16,$0f,$1b,$1b,$15
	fcb	$08,$0d,$08,$36,$4c,$26,$1b,$41
	fcb	$17,$35,$39,$4c,$1c,$1b,$3f,$15
	fcb	$25,$08,$37,$4e,$14,$22,$1c,$2a
	fcb	$3e,$08,$9d,$1c,$15,$1c,$16,$1c
	fcb	$08,$0a,$14,$c6,$3d,$0c,$8f,$58
	fcb	$60,$53,$2b,$0e,$1b,$08,$49,$01
	fcb	$17,$4e,$19,$1b,$2b,$3d,$15,$08
	fcb	$08,$08,$16,$1b,$08,$0f,$50,$0c
	fcb	$08,$0a,$14,$8e,$3d,$0c,$0b,$54
	fcb	$0c,$19,$57,$2b,$3d,$15,$1a,$28
	fcb	$4d,$6f,$24,$08,$08,$08,$0c,$08
	fcb	$0a,$14,$63,$3d,$14,$12,$a9,$54
	fcb	$3b,$15,$1a,$4c,$2b,$1b,$08,$49
	fcb	$01,$17,$4c,$19,$15,$1b,$15,$1a
	fcb	$4c,$10,$08,$49,$40,$01,$17,$4e
	fcb	$06,$11,$e0,$4e,$1c,$16,$41,$53
	fcb	$12,$0f,$52,$0c,$33,$3b,$16,$08
	fcb	$0a,$15,$50,$04,$0c,$1e,$55,$31
	fcb	$56,$33,$08,$52,$00,$1b,$15,$30
	fcb	$1d,$08,$36,$4c,$04,$60,$53,$09
	fcb	$30,$1d,$16,$16,$00,$1b,$15,$01
	fcb	$0e,$2d,$3d,$15,$08,$36,$4c,$0c
	fcb	$01,$0e,$2f,$3d,$15,$3d,$1b,$20
	fcb	$16,$53,$14,$0e,$00,$1b,$15,$01
	fcb	$0e,$2d,$3d,$15,$08,$36,$4c,$04
	fcb	$60,$53,$0c,$0f,$1b,$15,$01,$0e
	fcb	$2f,$3d,$15,$08,$36,$28,$4d,$09
	fcb	$22,$16

x_tag_89e:
	fcb	$00
	fcb	$aa,$26,$08,$16,$1b,$30,$1d,$0c
	fcb	$0b,$54,$2b,$3d,$15,$1a,$28,$4d
	fcb	$0b,$08,$16,$1b,$15,$2f,$1d,$08
	fcb	$36,$4c,$31,$1b,$41,$17,$35,$39
	fcb	$4c,$28,$1b,$2a,$3e,$2f,$1d,$0c
	fcb	$0b,$54,$30,$1d,$11,$9f,$58,$50
	fcb	$19,$1b,$3f,$15,$01,$0e,$41,$15
	fcb	$5d,$25,$3d,$01,$17,$4c,$0a,$08
	fcb	$39,$25,$3d,$1c,$3f,$16,$52,$02
	fcb	$0e,$53,$35,$0f,$2b,$3d,$15,$1a
	fcb	$28,$4d,$3e,$08,$0a,$14,$3c,$3d
	fcb	$22,$0c,$0b,$54,$0f,$27,$0e

; SHRNK
x_shrnk:
	fcb	$00
	fcb	$08,$62,$08,$0d,$08,$36,$08,$62
	fcb	$08,$0d,$08,$36,$20,$39,$4e,$03
	fcb	$0e,$00,$5d,$01,$17,$4c,$02,$22
	fcb	$30,$33,$65,$08,$6d,$1b,$41,$17
	fcb	$35,$39,$4c,$03,$2a,$3e,$5d,$08
	fcb	$0d,$11,$b7,$58,$08,$9e,$1b,$23
	fcb	$3e,$1b,$08,$0c,$5d,$3d,$25,$08
	fcb	$0c,$3e,$6f,$24,$08,$0d,$11,$9f
	fcb	$58,$08,$9e,$08,$33,$08,$0c,$33
	fcb	$08,$52,$00,$37,$3d,$08,$0c,$3e
	fcb	$1b,$08,$1c,$3d,$01,$81,$14,$10
	fcb	$3e,$67,$66,$08,$0c,$5d,$3d,$67
	fcb	$1c,$12,$9c,$15,$13,$01,$1b,$01
	fcb	$14,$16,$01,$85,$01,$15,$08,$4c
	cstr	"MEMORY FULL"
	fcb	$1b,$08,$0d,$5d
	fcb	$3d,$11,$9f,$58,$08,$9e,$1b,$08
	fcb	$33,$08,$0c,$1b,$08,$33,$08,$0d
	fcb	$1b,$08,$33,$08,$25,$81,$08,$0d
	fcb	$86,$5a,$4c,$05,$1c,$13,$01,$19
	fcb	$0e,$00,$00,$00,$89,$4f,$54,$48	; ".....OTH"
	fcb	$45,$d2,$d8,$59,$85,$49,$46,$45	; "E..Y.IFE"
	fcb	$4e,$c4,$e0,$59,$81,$80

; OTHERWISE
x_otherwise:
	fcb	$00
	fcb	$08
	fcb	$4a,$08,$49,$11,$e8,$59,$08,$06
	fcb	$4d,$09,$0f

; IFTRUE
x_iftrue:
	fcb	$00
	fcb	$4e,$04,$0c,$ec
	fcb	$59

; IFEND
ifend:
	fcb	$00		; NOP

; consume input stream until and including a character matching TOS
T5a00:	fcb	$00
					; BEGIN
L5a01:	tag	inch,dup,not,swap	;   INCH DUP NOT SWAP
	tag	3,pick,equal_to,or	;   3 PICK = OR
	tagrr	p_until,L5a01		; UNTIL
	tag	drop			; DROP
	tag	exit

	fcb	$08,$4c
	cstr	"NO SUCH RAMBANK"
	fcb	$00,$08,$4c
	cstr	"WRONG FILE TYPE"

x_tag_89f:
	fcb	$00
	fcb	$08,$4a,$08,$49,$08,$10,$1c,$17
	fcb	$42,$01,$2e,$08,$10,$79,$32,$08
	fcb	$08,$08,$13,$1b,$42,$08,$08,$08
	fcb	$12,$1c,$42,$17,$14,$3a,$48,$4c
	fcb	$15,$1c,$17,$b4,$1b,$01,$74,$22
	fcb	$28,$3a,$0c,$0d,$5a,$14,$3b,$17
	fcb	$13,$f2,$18,$31,$af,$5d,$01,$8b
	fcb	$1b,$4c,$05,$81,$41,$17,$22

; (LOAD)
x_p_load:
	fcb	$00
	fcb	$08,$17,$08,$18,$26,$08,$19,$08
	fcb	$1a,$26,$08,$08,$08,$1a,$08,$08
	fcb	$08,$19,$08,$08,$08,$18,$08,$08
	fcb	$08,$17,$33,$08,$08,$08,$12,$33
	fcb	$08,$10,$16,$4c,$10,$08,$17,$47
	fcb	$4c,$0b,$12,$57,$79,$08,$10,$1c
	fcb	$01,$3d,$4d,$0d,$08,$99,$27,$08
	fcb	$08,$08,$1a,$08,$08,$08,$19,$27
	fcb	$08,$08,$08,$18,$08,$08,$08,$17
	fcb	$33,$08,$08,$08,$12,$33,$08,$10
	fcb	$16

; LOAD
x_load:
	fcb	$00
	fcb	$33,$08,$9f,$08,$4c
	cstr	"FILE NOT FOUND"
	fcb	$81,$30
	fcb	$3d,$79,$3d,$aa,$0e,$1c,$2b,$39
	fcb	$4c,$07,$60,$11,$08,$5a,$52,$0f
	fcb	$79,$32,$39,$20,$14,$e0,$48,$39
	fcb	$0c,$20,$5a,$11,$08,$5b,$14,$3b
	fcb	$17,$20,$81,$1b,$15,$3d,$30,$1d
	fcb	$12,$9e,$17,$1b,$08,$04,$50,$06
	fcb	$08,$0d,$1b,$01,$24,$08,$a0,$00
	fcb	$14,$22,$08,$5e,$08,$49,$79,$14
	fcb	$11,$67,$1b,$12,$57,$18,$12,$58
	fcb	$22,$01,$2e,$32

; LOAD"
x_load_quote:
	fcb	$00
	fcb	$0c,$13,$5b
	fcb	$01,$19,$99,$ff

; DEVLOAD
x_devload:
	fcb	$00
	fcb	$33,$22,$31
	fcb	$01,$37,$0c,$7b,$4a,$33,$1f,$31
	fcb	$01,$4f,$0e,$11,$08,$5c,$31,$33
	fcb	$33,$08,$a0

; DEVLOAD"
x_devload_quote:
	fcb	$00
	fcb	$0c,$13,$5b,$01
	fcb	$19,$e5,$ff

; EDIT
x_edit:
	fcb	$00
	fcb	$01,$53,$08,$9f
	fcb	$4c,$09,$2b,$39,$0c,$20,$5a,$0e
	fcb	$52,$0e,$1c,$17,$4e,$03,$01,$a2
	fcb	$01,$8a,$8a,$2b,$81,$41,$18,$34
	fcb	$01,$a1

; SAVESNAP
x_savesnap:
	fcb	$00
	fcb	$08,$49,$08,$7a,$3e
	fcb	$08,$7d,$08,$7a,$08,$9f,$4c,$09
	fcb	$2f,$48,$0c,$20,$5a,$81,$01,$8c
	fcb	$01,$8a,$8a,$81,$30,$3d,$79,$3d
	fcb	$1b,$2e,$1d,$30,$3d,$0c,$14,$55
	fcb	$12,$9e,$17,$13,$fb,$16,$14,$3b
	fcb	$17,$12,$02,$16,$5d,$16,$41,$20
	fcb	$1c,$18,$42,$20,$01,$9f,$2f,$81
	fcb	$41,$18,$12,$9e,$17,$08,$04,$33
	fcb	$08,$08,$08,$12,$33,$08,$10,$16

; GET-TYPE
x_get_type:
	fcb	$00
	fcb	$08,$14,$4c,$07,$11,$81,$41
	fcb	$08,$55,$00,$81,$41

; ENDIF THEN
x_then:
	fcb	$00
	fcb	$08,$50,$23,$08,$49,$1c,$3e,$25
	fcb	$14,$0f,$39,$30,$08,$4d,$24,$14
	fcb	$10,$39,$4c,$08,$1b,$0c,$2b,$49
	fcb	$22,$18,$00,$22,$16

x_tag_8a2:
	fcb	$00
	fcb	$23,$1b,$14,$0f,$39,$3f,$25,$50
	fcb	$0a,$14,$10,$39,$30,$3a,$08,$a1
	fcb	$53,$0f,$24,$08,$4d,$00,$08,$50
	fcb	$08,$49,$33,$08,$56,$14,$13,$00
	fcb	$08,$50,$08,$49,$33,$08,$55,$30

x_tag_8a3:
	fcb	$00
	fcb	$24,$79,$08,$56,$23,$0c,$fd,$5b
	fcb	$00,$34,$23,$24,$41,$23,$25,$1d
	fcb	$14,$0f,$39,$2c,$3e,$4d,$0a,$25
	fcb	$1d,$2e,$08,$4d,$08,$49,$24,$41
	fcb	$1d,$3e,$14,$ff,$4b,$00,$0e,$2e
	fcb	$08,$a2,$08,$49,$3f,$3e,$08,$49
	fcb	$3f,$16,$00,$0e,$2e,$08,$a2,$08
	fcb	$49,$3f,$3e,$63,$08,$49,$40,$18

; IF.ITS
x_if_its:
	fcb	$00
	fcb	$08,$68,$4f,$08,$5f,$4c,$09
	fcb	$79,$32,$50,$04,$15,$52,$09,$0f
	fcb	$08,$49,$08,$73,$28,$08,$61,$1b
	fcb	$11,$00,$01,$01,$17,$08,$4c
	cstr	"# TOO BIG"
	fcb	$08,$56,$0c,$fd,$5b

; DOCASE
x_docase:
	fcb	$00
	fcb	$08
	fcb	$50,$32

; ENDCASE
x_endcase:
	fcb	$00
	fcb	$32,$08,$a2

; BEGIN
x_begin:
	fcb	$00
	fcb	$08
	fcb	$50,$08,$49,$2e

; IF.L
x_if_l:
	fcb	$00
	fcb	$08,$68,$01
	fcb	$18,$0c,$07,$5c

; WHILE.L
x_while_l:
	fcb	$00
	fcb	$0c,$8d,$5c
	fcb	$2f,$3d

; ELSE.L
x_else_l:
	fcb	$00
	fcb	$08,$68,$01,$19,$0c
	fcb	$07,$5c,$aa,$08,$a1

; UNTIL
x_until:
	fcb	$00
	fcb	$0c,$19
	fcb	$5c,$4c,$08,$0c,$8d,$5c,$0c,$36
	fcb	$5c,$00,$08,$a3,$4d,$0c,$43,$5c

; REPEAT AGAIN
x_repeat:
	fcb	$00
	fcb	$0c,$19,$5c,$4c,$0c,$08,$68
	fcb	$01,$19,$0c,$07,$5c,$0c,$36,$5c
	fcb	$00,$08,$a3,$53,$0c,$43,$5c

; DO
x_do:
	fcb	$00
	fcb	$08,$68,$54,$31

; ?DO
x_query_do:
	fcb	$00
	fcb	$31,$08,$a3
	fcb	$59,$42

; LOOP
x_loop:
	fcb	$00
	fcb	$08,$68,$57,$31,$08
	fcb	$a2

; +LOOP
x_plus_loop:
	fcb	$00
	fcb	$08,$68,$56,$31,$08,$a2

; CASE
x_case:
	fcb	$00
	fcb	$08,$a3,$58

; =IF
x_equals_if:
	fcb	$00
	fcb	$08,$a3,$50

; <IF
x_less_than_if:
	fcb	$00
	fcb	$08,$a3,$51

; NOTIF
x_not_if:
	fcb	$00
	fcb	$08,$a3,$4e

; IF
x_if:
	fcb	$00
	fcb	$08,$a3,$4c

; CASEWHILE
x_case_while:
	fcb	$00
	fcb	$0c,$e9,$5c
	fcb	$2f,$3d

; =WHILE
x_equals_while:
	fcb	$00
	fcb	$0c,$ed,$5c,$2f,$3d

; <WHILE
x_less_than_while:
	fcb	$00
	fcb	$0c,$f1,$5c,$2f,$3d

; NOTWHILE
x_not_while:
	fcb	$00
	fcb	$0c
	fcb	$f5,$5c,$2f,$3d

; WHILE.ITS
x_while_its:
	fcb	$00
	fcb	$0c,$51,$5c
	fcb	$2f,$3d

; WHILE
x_while:
	fcb	$00
	fcb	$0c,$f9,$5c,$2f,$3d

; ELSE
x_else:
	fcb	$00
	fcb	$08,$a3,$52,$aa,$08,$a1

; backslash
; comment to end of line
x_backslash_backslash:
	fcb	$00
	literal	$0d			; carriage return
	tag	p_call
	fdb	T5a00

; (
; comment to close paren
x_lparen:
	fcb	$00
	literal	')'
	tag	p_call
	fdb	T5a00

; DOES>
x_does:
	fcb	$00
	tag	COMPILE,tag_879		; COMPILE tag_879
	tag	20h,tag_856		; 20H tag_856
	literal	x_dodoes		; DODOES
	tag	tag_855			; tag_855

; ABORT"
x_abort_quote:
	fcb	$00
	tag	compile,tag_84b,s_quote	; COMPILE tag_84b S"

; ?ABORT"
x_query_abort_quote:
	fcb	$00
	tag	compile,tag_84c,s_quote	; COMPILE tag_84c S"

; "NOT"
xa_not:
	fcb	$00
	tag	20h,xor			; $20 XOR

xa_0_equals:
	fcb	$00
	literal	$d0			; $d0 (BNE opcode)

xa_0_less_than:
	fcb	$00
	literal	$10			; $10 (BPL opcode)

xa_cs:
	fcb	$00
	literal	$90			; $90 (BCC opcode)

xa_vs:
	fcb	$00
	literal	$50			; $50 (BVC opcode)

	fcb	$00


D5d5f:	word5	D5d74,"FALSE",$01,$0000
D5d6a:	word5	0,"%OVR",$01,$0000
D5d74:	word5	D5f13,"TRUE",$01,$0001
	word5	D5d6a,"%INVISIBLE",$01,$0001	; file type
	word5	,"WHICH?",$01,$0001
	word5	,"TIMEFLAG",$01,$0001
	word5	,"BATBLIP",$01,$0001
	word5	,"RAMBIT",$01,$0001
	word5	,"LASTFLAG",$01,$0001
	word5	,"KBVECT",$01,$0001
	word5	,"%TEMPORARY",$01,$0002
	word5	,"%INSERT",$01,$0002
	word5	,"TDKFLAG",$01,$0002
	word5	,"SHFTBLIP",$01,$0002
	word5	,"PASSRAW",$01,$0002
	word5	,"LOCKED?",$01,$0002
	wordl	,"CHVECT1",$01,$0003
	wordl	,"CHVECT2",$01,$0005
	word5	,"%LI",$01,$0003
	word5	,"%EXECUTE",$01,$0004		; file type
	word5	,"%DELETE",$01,$0004
	word5	,"RAMEXFLAG",$01,$0004
	word5	,"SHIFT?",$01,$0004
	word5	,"CRBIT",$01,$0004
	word5	,"CAPON",$01,$0004
	word5	,"CSBIT",$01,$0004
	word5	,"LOCKBLIP",$01,$0004
	word5	,"KBFLAG",$01,$0004
	word5	,"%LD",$01,$0005
	word5	,"HDTSZ",$01,$0006
	word5	,"ACVECT",$01,$0007
	word5	,"KQHI",$01,$0008
	word5	,"DSPFLAG",$01,$0008
	word5	,"ROMEXFLAG",$01,$0008
	word5	,"2SHFTBLIP",$01,$0008
	word5	,"DISPON",$01,$0008
	word5	,"&BSP",$01,$0008
	word5	,"%TEXT",$01,$0008		; file type
	word5	,"RUNBIT",$01,$0008
D5f08:	word5	,"LOCK.IT",$01,$0008
D5f13:	word5	$5fb0,"NEXT",$01,$0009
	word5	D5f08,"&LF",$01,$000a
	word5	,"&IO",$01,$000b
	word5	,"EVECT",$01,$000c
	word5	,"&CR",$01,$000d
	word5	,"&STP",$01,$000e
	wordl	,"IVECT1",$01,$000f
	wordl	,"IVECT2",$01,$0012
	word5	,"FUNBIT",$01,$0010
	word5	,"STKBIT",$01,$0010
	word5	,"DVCON",$01,$0010
	word5	,"RECBLIP",$01,$0010
	word5	,"CALT",$01,$0010
	word5	,"MAXDE?",$01,$0010
D5fa6:	word5	,"&HLP",$01,$0014
	word5	D60d4,"IP",$01,$0015
	word5	D5fa6,"IPBANK",$01,$0017
	word5	,"NEXTV",$01,$0018
	word5	,"IRQVECT",$01,$0019
	word5	,"DSIZE",$01,$001a
	word5	,"&ESC",$01,$001b
	word5	,"DBUFL",$01,$001b
	word5	,"IRQXV",$01,$001c
	word5	,"CURBIT",$01,$0020
	word5	,"&BL",$01,$0020
	word5	,"BEEPER",$01,$0020
	word5	,"CQMK",$01,$0020
	word5	,"OPFLAG",$01,$0020
	word5	,"MEMBLIP",$01,$0020
	word5	,"^CURSOR",$01,$0022
	word5	,"LP",$01,$0024
	word5	,"BASE",$01,$0025
	word5	,"'KEY",$01,$0026
	word5	,"'EMIT",$01,$0028
	word5	,"'ABORT",$01,$002a
	word5	,"'FILEORG",$01,$002c
	word5	,"PATLEN",$01,$002e
	word5	,"NMIVECT",$01,$002e
	word5	,"LATCH?",$01,$0031
	word5	,"SL",$01,$0032
	word5	,"ONFLAG",$01,$0033
	word5	,"SOFTFLAG",$01,$0034
D60ca:	word5	,"^HDT",$01,$0035
D60d4:	word5	D60dc,"TP",$01,$0037
D60dc:	word5	D6191,"AP",$01,$0039
	word5	D60ca,"CURRAM",$01,$003b
	word5	,"CURROM",$01,$003c
	word5	,"CURCTL",$01,$003d
	word5	,"IRQX",$01,$003f
	word5	,"IRQY",$01,$0040
	word5	,"ESCUN",$01,$0040	; ESC - LCD unescape
	word5	,"ROLLBIT",$01,$0040
	word5	,"ALRMBLIP",$01,$0040
	word5	,"CFLSH",$01,$0040
	word5	,"CPUON",$01,$0040
	word5	,"CBIT",$01,$0040
	word5	,"AOTOKE",$01,$0040
	word5	,"POPFLAG",$01,$0040
	word5	,"MAXBANK",$01,$0040
	word5	,"HINTFLAG",$01,$0040
D6186:	word5	,"ESCIR",$01,$0041	; ESC - insert right
D6191:	word5	D62c6,"N",$01,$0042
	word5	D6186,"ESCDR",$01,$0042	; ESC - delete right
	word5	,"ESCSI",$01,$0043	; ESC - set inverse mode
	word5	,"ESCUI",$01,$0044	; ESC - set uninverse mode
	word5	,"ESCSF",$01,$0045	; ESC - set flash mode
	word5	,"ESCUF",$01,$0046	; ESC - set unflash mode
	word5	,"ESCDC",$01,$0047	; ESC - display character absolute
	word5	,"ESCFL",$01,$0048	; ESC - flush I/O buffer
	word5	,"ESCCC",$01,$0049	; ESC - set control character mode
	word5	,"ESCHM",$01,$004a	; ESC - home cursor
	word5	,"ESCWB",$01,$004b	; ESC - set word break
	word5	,"%LLEN",$01,$0050
	word5	,"DVSAV",$01,$0057
	word5	,"CHESAV",$01,$0058
	word5	,"CHSAV",$01,$005a
	word5	,"PCASAV",$01,$005c
	word5	,"RCSAV",$01,$005d
	word5	,"IOSAV",$01,$005e
	word5	,"LATSAV",$01,$005f
	word5	,"HDTSAV",$01,$0060
	word5	,"X1SAV",$01,$0061
	word5	,"XSAVE",$01,$0062
	word5	,"FLAG1",$01,$0063
	word5	,"FLAG2",$01,$0064
	word5	,"FLAG3",$01,$0065
	word5	,"EVFLAG",$01,$0066
	word5	,"BUFPOSN",$01,$0067
	word5	,"HLD",$01,$0068
D62bf:	word5	,"Z",$01,$006c
D62c6:	word5	D67e2,"&APS",$01,$0075
	word5	D62bf,"IPBIT",$01,$0080
	word5	,"RUNBLIP",$01,$0080
	word5	,"PENDFLAG",$01,$0080
	word5	,"CNEG",$01,$0080
	word5	,"PROGBIT",$01,$0080
	word5	,"PIPFLAG",$01,$0080
	word5	,"AOENB",$01,$0080
	word5	,"INTFLAG",$01,$0080
	word5	,"&LK",$01,$0086
	word5	,"&C1",$01,$008b
	word5	,"&C2",$01,$008c
	word5	,"&C3",$01,$008d
	word5	,"&C4",$01,$008e
	word5	,"%FLEN",$01,$00aa
	word5	,"SHINT",$01,$00c0
	word5	,"SPINIT",$01,$00ff
	word5	,"LSTK",$01,$0100
	word5	,"RSTK",$01,$01fd
	word5	,"&CFILE",$01,$0201
	word5	,"SLPFLG",$01,$0204
	word5	,"KQI",$01,$0206
	word5	,"KQO",$01,$0207
	word5	,"PKCT",$01,$020a
	word5	,"EVFLAG1",$01,$020d
	word5	,"(FREEZE)",$01,$0215
	word5	,"(ROTMODE)",$01,$0216
	word5	,"SPEED",$01,$0217
	word5	,"PCH",$01,$0218
	word5	,"TVECT0",$01,$021b
	word5	,"DBUF",$01,$0236
	word5	,"DBUF1",$01,$0251
	word5	,"KQ",$01,$026c
	word5	,"PKQ",$01,$0274
	word5	,"KECB",$01,$0278
	word5	,"PKEY",$01,$0279
	word5	,"SOFTROM",$01,$027c
	word5	,"SOFTCTL",$01,$027d
	word5	,"SOFTVECT",$01,$027e
	word5	,"SOFTAG",$01,$0280
	word5	,"TQUEUE",$01,$02b3
	word5	,"SDT",$01,$02c1
	word5	,"FECB",$01,$02d1
	word5	,"DECB",$01,$02d7
	word5	,"POZECB",$01,$02dd
	word5	,"AOECB",$01,$02e3
	word5	,"PSECB",$01,$02e9
	word5	,"A-ECB",$01,$02ef
	word5	,"NATTACH",$01,$02f1
	word5	,"&EXTRINSIC",$01,$02f2
	word5	,"'FILE-COND",$01,$02f3
	word5	,"FP",$01,$02f5
	word6	,"&BUF-ADR",$01,$02f7
	word6	,"&BUF-LEN",$01,$02f9
	word5	,"&DATA-LEN",$01,$02fa
	word5	,"&EOL-TAG",$01,$02fb
	word5	,"&CURPOS",$01,$02fd
	word5	,"&INIT-CURPOS",$01,$02fe
	word5	,"&LINE",$01,$02ff
	word5	,"&MAX-LEN",$01,$0301
	word5	,"&EOF-TAG",$01,$0302
	word5	,"&MODE",$01,$0304
	word5	,"&LOCK",$01,$0305
	word5	,"&LBUF",$01,$0306
	word5	,"&SPAT",$01,$0356
	word5	,"&SLEN",$01,$0368
	word5	,"&FP",$01,$0369
	word5	,"&MEM",$01,$036f
	word5	,"GMTF",$01,$0378
	word5	,"GMT",$01,$0379
	word5	,"UNCOMMITTED",$01,$037d
	word5	,"FILESPACE",$01,$038d
	word5	,"CTROM",$01,$2000
	wordl	,"CTRFLAGS",$01,$2023
	wordl	,"CTRFLAG2",$01,$2024
	word5	,"CTVECT",$01,$2025
	word5	,"CTEXT",$01,$2027
	word5	,"CTRID",$01,$2028
	word5	,"ROMADDR",$01,$4000
	word5	,"ROMVECT",$01,$4028
	word5	,"ROMEXT",$01,$402a
	word5	,"CSPEED",$01,$402b
D662a:	word5	,"ROMID",$01,$402c
D6635:	word5	D6646,"I/O",$01,$47fc
D663e:	word5	D662a,"KB",$01,$5800
D6646:	word5	D6678,"DSPLY",$01,$5800
	word5	D663e,"LOBAT",$01,$58fa
	word5	,"TLO",$01,$58fb
	word5	,"TMID",$01,$58fc
D666f:	word5	,"THI",$01,$58fd
D6678:	word5	D66b9,"LATCH",$01,$58fe
	word5	D666f,"YOFF",$01,$58ff
	word5	,"RAMADDR",$01,$8000
	word5	,"IDICT",$01,$c000

	word5	,"SET.TIMER",$00,ts_set_timer
D66ae:	word5	,"TURN.OFF",$00,ts_turn_off
D66b9:	word5	D6728,"EXIT",$00,ts_exit
D66c3:	word5	D66ae,"(;P)",$00,ts_p_semi_p
D66cd:	word5	D6ae5,"2DROP",$00,ts_2drop
	word5	D675b,"DROP",$00,ts_drop
	word5	D66c3,"ORBLIP",$00,ts_orblip
	word5	,"ANDBLIP",$00,ts_andblip
	word6	,"SET.RAM",$00,ts_set_ram
	word6	,"SET.ROM",$00,ts_set_rom
	word6	,"SET.CTRL",$00,ts_set_ctrl
D671c:	word6	,"SET.CROM",$00,ts_set_crom
D6728:	word5	D6751,"LIT",$00,ts_lit
	word5	D671c,"FLIT",$00,ts_flit
	word5	,"CLIT3",$00,ts_clit3
D6746:	word5	,"CLIT2",$00,ts_clit2
D6751:	word5	D7691,"CLIT",$00,ts_clit
D675b:	word5	D6762,"@",$00,ts_at
D6762:	word5	D6769,"!",$00,ts_bang
D6769:	word5	D6771,"C@",$00,ts_c_at
D6771:	word5	D6795,"C!",$00,ts_c_bang
	word5	D6746,"ABORT",$00,ts_abort
D6784:	word5	,"NOP",$00,ts_nop
D678d:	word5	D67bc,"+!",$00,ts_plus_bang
D6795:	word5	D679f,"?DUP",$00,ts_query_dup
D679f:	word5	D67a8,"DUP",$00,ts_dup
D67a8:	word5	D67b2,"OVER",$00,ts_over
D67b2:	word5	D67d9,"PICK",$00,ts_pick
D67bc:	word5	D78b9,"+C!",$00,ts_plus_c_bang
	word5	D6784,"SP@",$00,ts_sp_at
D67ce:	word5	,"SET.SP",$00,ts_set_sp
D67d9:	word5	D67ec,"ROT",$00,ts_rot
D67e2:	word5	D6969,"ROLL",$00,ts_roll
D67ec:	word5	D6aff,"SWAP",$00,ts_swap
D67f6:	word5	D67ff,"2>R",$00,ts_2_to_r
D67ff:	word5	D6807,">R",$00,ts_to_r
D6807:	word5	D6810,"2R>",$00,ts_2_r_to
D6810:	word5	D6821,"R>",$00,ts_r_to
D6818:	word5	D67ce,"RP!",$00,ts_rp_bang
D6821:	word5	D68c9,"R",$00,ts_r
	word5	D6818,"RP@",$00,ts_rp_at
D6831:	word5	,"SET.RP",$00,ts_set_rp
D683c:	word5	D69b5,"0=",$00,ts_not
	word5	D68d4,"NOT",$00,ts_not
D684d:	word5	,"0<",$00,ts_0_less_than
D6855:	word5	D685c,"9",$00,ts_9
D685c:	word5	D6863,"8",$00,ts_8
D6863:	word5	D686a,"7",$00,ts_7
D686a:	word5	D6871,"6",$00,ts_6
D6871:	word5	D6878,"5",$00,ts_5
D6878:	word5	D687f,"4",$00,ts_4
D687f:	word5	D6886,"3",$00,ts_3
D6886:	word5	D688d,"2",$00,ts_2
D688d:	word5	D6894,"1",$00,ts_1
D6894:	word5	D689b,"0",$00,ts_0
D689b:	word5	D6acf,"-1",$00,ts_minus_1
	word5	D6831,"20H",$00,ts_20h
	word5	,"30H",$00,ts_30h
	word5	,"80H",$00,ts_80h
D68be:	word5	,"#DECB",$00,ts_num_decb
D68c9:	word5	D6915,"FALSIFY",$00,ts_falsify
D68d4:	word5	D68dd,"AND",$00,ts_and
D68dd:	word5	D69bc,"OR",$00,ts_or
D68e5:	word5	D68f5,"XOR",$00,ts_xor
D68ee:	word5	D68be,"K",$00,ts_k
D68f5:	word5	D68fc,"J",$00,ts_j
D68fc:	word5	D6a92,"I",$00,ts_i
D6903:	word5	D690d,"FLIP",$00,ts_flip
D690d:	word5	D694b,"><",$00,ts_flip
D6915:	word5	D691c,"+",$00,ts_plus
D691c:	word5	D6923,"-",$00,ts_minus
D6923:	word5	D692b,"2-",$00,ts_2_minus
D692b:	word5	D6933,"1-",$00,ts_1_minus
D6933:	word5	D693b,"2+",$00,ts_2_plus
D693b:	word5	D6943,"1+",$00,ts_1_plus
D6943:	word5	D6855,"2*",$00,ts_2_times
D694b:	word5	D6b51,"2/",$00,ts_2_div
D6953:	word5	D68ee,"PUSHKEY",$00,ts_pushkey
D695e:	word5	D6e32,"TOGGLE",$00,ts_toggle
D6969:	word5	D6974,"SET.BITS",$00,ts_set_bits
D6974:	word5	D697f,"CLR.BITS",$00,ts_clr_bits
D697f:	word5	D6989,"SAVE",$00,ts_save
D6989:	word5	D6994,"RESTORE",$00,ts_restore
D6994:	word5	D6aaf,"CRESTORE",$00,ts_crestore
	word5	D6953,"EXECUTE",$00,ts_execute
D69aa:	word5	,"(CALL)",$00,ts_p_call
D69b5:	word5	D684d,"=",$00,ts_equal_to
D69bc:	word5	D69c4,"<>",$00,ts_not_equal_to
D69c4:	word5	D69cb,"<",$00,ts_less_than
D69cb:	word5	D69d2,">",$00,ts_greater_than
D69d2:	word5	D67f6,"U<",$00,ts_u_less_than
	word5	D69aa,"(IF)",$00,ts_p_if
	word5	,"(UNTIL)",$00,ts_p_until
	word5	,"?JUMP",$00,ts_query_jump
	word5	,"(NOTIF)",$00,ts_p_notif
	word5	,"(IF.ITS)",$00,ts_p_if_its
	word5	,"(=IF)",$00,ts_p_eq_if
	word5	,"(<IF)",$00,ts_p_less_if
	word5	,"(ELSE)",$00,ts_p_else
	word5	,"(AGAIN)",$00,ts_p_again
	word5	,"JUMP",$00,ts_jump
D6a46:	word5	,"(DO)",$00,ts_p_do
D6a50:	word5	D7bc7,"LEAVE",$00,ts_leave
	word5	D6a46,"(+LOOP)",$00,ts_p_plus_loop
	word5	,"(LOOP)",$00,ts_p_loop
	word5	,"(CASE)",$00,ts_p_case
D6a7c:	word5	,"(?DO)",$00,ts_p_query_do
D6a87:	word5	D7c57,"BOUNDS",$00,ts_bounds
D6a92:	word5	D7890,"?RANGE",$00,ts_query_range
	word5	D6a7c,"B>A",$00,ts_bin_to_ascii
D6aa6:	word5	,"L>U",$00,ts_lower_to_upper
D6aaf:	word5	D6aba,"2ROLL",$00,ts_2roll
D6aba:	word5	D6ac5,"2PICK",$00,ts_2pick
D6ac5:	word5	D6aef,"2ROT",$00,ts_2rot
D6acf:	word5	D6ada,"2SWAP",$00,ts_2swap
D6ada:	word5	D77e3,"2OVER",$00,ts_2over
D6ae5:	word5	D7be6,"2DUP",$00,ts_2dup
D6aef:	word5	D6af7,"2@",$00,ts_2at
D6af7:	word5	D6b15,"2!",$00,ts_2bang
D6aff:	word5	D6b0a,"SWAPDROP",$00,ts_swapdrop
D6b0a:	word5	D78f4,"UNDER",$00,ts_swapdrop
D6b15:	word5	D6b1f,"FDUP",$00,ts_fdup
D6b1f:	word5	D6b2a,"FDROP",$00,ts_fdrop
D6b2a:	word5	D6b35,"FSWAP",$00,ts_fswap
D6b35:	word5	D6c33,"FOVER",$00,ts_fover
	word5	D6aa6,"U*",$00,ts_u_times
D6b48:	word5	,"UM/",$00,ts_um_div
D6b51:	word5	D6b58,"*",$00,ts_times
D6b58:	word5	D6b6e,"NEGATE",$00,ts_negate
D6b63:	word5	D6b48,"DNEGATE",$00,ts_dnegate
D6b6e:	word5	D6bb5,"ABS",$00,ts_abs
	word5	D6b63,"M*",$00,ts_m_times
	word5	,"D+",$00,ts_d_plus
	word5	,"D-",$00,ts_d_minus
	word5	,"D=",$00,ts_d_equals
	word5	,"UD<",$00,ts_ud_less_than
	word5	,"UDMIN",$00,ts_ud_min
D6bab:	word5	,"DABS",$00,ts_dabs
D6bb5:	word5	D6bbe,"MAX",$00,ts_max
D6bbe:	word5	D6bd8,"MIN",$00,ts_min
	word5	D6bab,"M/",$00,ts_m_div
D6bcf:	word5	,"S>D",$00,ts_s_to_d
D6bd8:	word5	D6bf8,"/MOD",$00,ts_div_mod
	word5	D6bcf,"*/MOD",$00,ts_times_div_mod
D6bed:	word5	,"M/MOD",$00,ts_m_div_mod
D6bf8:	word5	D6bff,"/",$00,ts_div
D6bff:	word5	D695e,"MOD",$00,ts_mod
	word5	D6bed,"SHIFT",$00,ts_shift
	word5	,"CHARBUF",$00,ts_charbuf
	word5	,"CANCEL",$00,ts_cancel
D6c29:	word5	,"FLEE",$00,ts_flee
D6c33:	word5	D6c48,"MOVE",$00,ts_move
D6c3d:	word5	D6c29,"DMOVE",$00,ts_dmove
D6c48:	word5	D6c69,"CMOVE",$00,ts_cmove
	word5	D6c3d,"SETBANKS",$00,ts_setbanks
D6c5e:	word5	,"BIGMOVE",$00,ts_bigmove
D6c69:	word5	D6c73,"FILL",$00,ts_fill
D6c73:	word5	D6c7e,"ERASE",$00,ts_erase
D6c7e:	word5	D6d0b,"BLANKS",$00,ts_blanks
	word5	D6c5e,"<JUMP-TAB>",$00,ts_jump_tab
	word5	,"GET.GMT",$00,ts_get_gmt
	word5	,"SD*",$00,ts_s_d_times
	word5	,"GET.LOCAL",$00,ts_get_local
	word5	,"SET.DELAY.LONG",$00,ts_set_delay_long
	word5	,"SET.DELAY",$00,ts_set_delay
	word5	,"ATTACHX",$00,ts_attachx
	word5	,"ATTACH",$00,ts_attach
	word5	,"FLEE.CAP",$00,ts_flee_cap
	word5	,"FLEE.CROM",$00,ts_flee_crom
	word5	,"LOCATE",$00,ts_locate
D6d00	word5	,"CFIND",$00,ts_cfind
D6d0b:	word5	D6d13,"S+",$00,ts_string_plus
D6d13:	word5	D6db5,"S=",$00,ts_string_equal
	word5	D6d00,"ENCODE",$00,ts_encode
	word5	,"UPDISP",$00,ts_updisp
	word5	,"REFRESH",$00,ts_refresh
	word5	,"INS.CH.R",$00,ts_ins_ch_r
	word5	,"DEL.CH.R",$00,ts_del_ch_r
	word5	,"SET.INV",$00,ts_set_inv
	word5	,"UNSET.INV",$00,ts_unset_inv
	word5	,"SET.FLSH",$00,ts_set_flsh
	word5	,"UNSET.FLSH",$00,ts_unset_flsh
	word5	,"POSN",$00,ts_posn
	word6	,"SCROLL",$00,ts_scroll
	word6	,"SCROLR",$00,ts_scrolr
	word5	,"WAIT",$00,ts_wait
D6daa:	word5	,"WAITM",$00,ts_waitm
D6db5:	word5	D6e9a,"SQUEAK",$00,ts_squeak
	word5	D6daa,"LCD.CR",$00,ts_lcd_cr
	word5	,"CGRTN",$00,ts_cgrtn
	word5	,"DISP.CH",$00,ts_disp_ch
	word5	,"RCTL",$00,ts_rctl
	word5	,"ROP",$00,ts_rop
	word5	,"RIP",$00,ts_rip
	word5	,"RCLOSE",$00,ts_rclose
	word5	,"ROPEN",$00,ts_ropen
	word5	,"NAP",$00,ts_nap
	word5	,"(KEY)",$00,ts_p_key
D6e27:	word5	,"(EMIT)",$00,ts_p_emit
D6e32:	word5	D6e3b,"KEY",$00,ts_key
D6e3b:	word5	D6e45,"EMIT",$00,ts_emit
D6e45:	word5	D6e4f,"BEEP",$00,ts_beep
D6e4f:	word5	D6e59,"TYPE",$00,ts_type
D6e59:	word5	D77f1,"COUNT",$00,ts_count
	word5	D6e27,"(.\x22)",$00,ts_p_dot_quote
	word5	,"ALL-EMIT",$00,ts_all_emit
	word5	,"FLAME.ON",$00,ts_flame_on
	word5	,"SMART-POSN",$00,ts_smart_posn
D6e8f:	word5	,"EMIT.ESC",$00,ts_emit_esc
D6e9a:	word5	D6ec2,"?KEY",$00,ts_query_key
D6ea4:	word5	D6eaf,"SPACE",$00,ts_space
D6eaf:	word5	D6fd4,"CR",$00,ts_cr
D6eb7:	word5	D6e8f,"FAST.CR",$00,ts_fast_cr
D6ec2:	word5	D6fcc,"SPACES",$00,ts_spaces
	word5	D6eb7,"START.CURSOR",$00,ts_start_cursor
	word5	,"STOP.CURSOR",$00,ts_stop_cursor
	word5	,"A>B",$00,ts_ascii_to_bin
	word5	,"SOFT.CLR",$00,ts_soft_clr
	word5	,"HARD.CLR",$00,ts_hard_clr
	word5	,"CLEAR",$00,ts_clear
	word5	,"KBSAVE",$00,ts_kbsave
	word5	,"KBREST",$00,ts_kbrest
	word5	,"SAVE.KEY",$00,ts_save_key
	word5	,"SAVE.TASK",$00,ts_save_task
	word5	,"REST.KEY",$00,ts_rest_key
	word5	,"RESTORE.RAM",$00,ts_restore_ram
	word5	,"RESTORE.TASK",$00,ts_restore_task
	word5	,"SOFT.EMIT",$00,ts_soft_emit
	word5	,"SIZERAM",$00,ts_sizeram
	word5	,"COLD.START",$00,ts_cold_start
	word5	,"CAN.LIST",$00,ts_can_list
	word5	,"HOLD",$00,ts_hold
	word5	,"<#",$00,ts_langle_hash
	word5	,"#>",$00,ts_hash_rangle
	word5	,"SIGN",$00,ts_sign
	word5	,"#",$00,ts_hash
	word5	,"#S",$00,ts_hash_s
	word5	,"(D.)",$00,ts_p_d_dot
D6fc3:	word5	,"D.R",$00,ts_d_dot_r
D6fcc:	word5	D7044,".R",$00,ts_dot_r
D6fd4:	word5	D7039,".",$00,ts_dot
	word5	D6fc3,"GRAB",$00,ts_grab
	word5	,"TPSAFE?",$00,ts_tpsafe_query
	word5	,"LETGO",$00,ts_letgo		; release a TSA
	word5	,"T!",$00,ts_t_bang
	word5	,"SECS",$00,ts_secs
	word5	,"LOC.NXT.CAP",$00,ts_loc_nxt_cap
	word5	,"LOC.PRG",$00,ts_loc_prg
	word5	,"RAM.N",$00,ts_ram_n
D702e:	word5	,"DVCSET",$00,ts_dvcset
D7039:	word5	D75e2,"CFILE",$00,ts_cfile
D7044:	word5	D7111,"?KEY-HIT",$00,ts_query_key_hit
	word5	D702e,"NEVER",$00,ts_never
	word5	,"@SA",$00,ts_at_sa
	word5	,"TYPEDROP",$00,ts_typedrop
	word5	,"MENU-DRIVER",$00,ts_menu_driver
	word5	,"(FILEORG)",$00,ts_p_fileorg
	word5	,"FILEORG",$00,ts_fileorg
	word5	,"USED",$00,ts_used
	word5	,"NFILES",$00,ts_nfiles
	word5	,"FSPACE",$00,ts_fspace
	word5	,"FILELEN",$00,ts_filelen
	word5	,"FLIM",$00,ts_flim
	word5	,"FUDGE-FLIM",$00,ts_fudge_flim
	word5	,"AVAIL",$00,ts_avail
	word5	,"?ROOM",$00,ts_query_room
	word5	,"FIO-ERR",$00,ts_fio_err
	word5	,"+USED",$00,ts_plus_used
	word5	,"REC-MOVE",$00,ts_rec_move
D7106:	word5	,"REC-CNT",$00,ts_rec_cnt
D7111:	word5	D7131,"NREC",$00,ts_nrec
	word5	D7106,"EXPAND",$00,ts_expand
D7126:	word5	,"SHRINK",$00,ts_shrink
D7131:	word5	D71e7,"REVISE",$00,ts_revise
	word5	D7126,"READ",$00,ts_read
	word5	,"WRITE",$00,ts_write
	word5	,"LOOKUP",$00,ts_lookup
	word5	,"?FILE",$00,ts_query_file
	word5	,"MAKE",$00,ts_make
	word5	,"OPEN",$00,ts_open
	word5	,"DELETE-FILE",$00,ts_delete_file
	word5	,"DELETE",$00,ts_delete
	word5	,"INSERT",$00,ts_insert
	word5	,"MAKE-ROOM",$00,ts_make_room
	word5	,".NO-ROOM",$00,ts_dot_no_room
	word5	,"FILE-TAG",$00,ts_file_tag
	word5	,"?VISIBLE",$00,ts_query_visible
	word5	,"E-L",$00,ts_e_l
	word5	,".FILE",$00,ts_dot_file
D71dc:	word5	,"OPEN-FILE",$00,ts_open_file
D71e7:	word5	D72ae,"?ENOUGH-ROOM",$00,ts_query_enough_room
	word5	D71dc,"?SF",$00,ts_query_sf
	word5	,"RELOC",$00,ts_reloc
	word5	,"KS",$00,ts_ks
	word5	,"SNAP-FILE",$00,ts_snap_file
	word5	,"EOL",$00,ts_eol
	word5	,"LBUF",$00,ts_lbuf
	word5	,"LLEN",$00,ts_llen
	word5	,"CCNT",$00,ts_ccnt
	word5	,"CURPOS",$00,ts_curpos
	word5	,"BUFPOS",$00,ts_bufpos
	word5	,"SET-BLIPS",$00,ts_set_blips
	word5	,"EXPECT",$00,ts_expect
	word5	,"EDIT-FILE",$00,ts_edit_file
	word5	,"MOVE-IT",$00,ts_move_it
	word5	,"COPY-FILE",$00,ts_copy_file
	word5	,"DO-EDIT",$00,ts_do_edit
	word5	,"NEW-FILE",$00,ts_new_file
D72a3:	word5	,"FSTANDTYPE",$00,ts_fstandtype
D72ae:	word5	D72b6,"F+",$00,ts_f_plus
D72b6:	word5	D72c1,"FNEGATE",$00,ts_fnegate
D72c1:	word5	D72c9,"F-",$00,ts_f_minus
D72c9:	word5	D72d1,"F<",$00,ts_f_less_than
D72d1:	word5	D72db,"FABS",$00,ts_fabs
D72db:	word5	D72e3,"F@",$00,ts_f_at
D72e3:	word5	D72f6,"F!",$00,ts_f_bang
D72eb:	word5	D72a3,"10EXP",$00,ts_10exp
D72f6:	word5	D72fe,"F*",$00,ts_f_times
D72fe:	word5	D7324,"F/",$00,ts_f_div
	word5	D72eb,"FROUND",$00,ts_fround
	word5	,"F#",$00,ts_f_num
D7319:	word5	,"FP>ASC",$00,ts_fp_to_ascii
D7324:	word5	D7421,"F.",$00,ts_f_dot
	word5	D7319,"F.EXT",$00,ts_f_dot_ext
	word5	,"ASC>FP",$00,ts_ascii_to_fp
	word5	,"CEMIT",$00,ts_cemit
	word5	,"CALC",$00,ts_calc
	word5	,"S.T",$00,ts_s_dot_t
	word5	,"E.T",$00,ts_e_dot_t
	word5	,"STM",$00,ts_set_time
	word5	,"SHOW.TIME",$00,ts_show_time
	word5	,"INTAPS",$00,ts_intaps

	word5	,"SCOMP",$01,x_scomp
	word5	,"UCOMP",$01,x_ucomp
	word5	,"SLEEP",$01,x_sleep
	word5	,"SETUP",$01,x_setup
	word5	,"DODOES",$01,x_dodoes
	word5	,"DOLATCH",$01,x_dolatch
	word5	,"GETMEM",$01,x_getmem
	word5	,"GETMEMT",$01,x_getmemt
	word5	,"POSTECB",$01,x_postecb

	word5	,"%REDEF",$01,$0001	; compiler option
	word5	,"%INT",$01,$0002	; compiler option
	word5	,"%FORW",$01,$0004	; compiler option
	word5	,"%AUTOCAP",$01,$0008	; compiler option
	word5	,"%0OPT",$01,$0010	; compiler option

D7421:	word5	D748b,"BL",$01,$0020

	word5	$7416,"FIND",$00,ts_find
D7433:	word5	,"EXPND",$00,ts_expnd
D743e:	word5	D75a3,"TO",$00,ts_to	; used to write SnapFORTH capsule variables
	word5	D7433,"EXECTO",$00,ts_execto
	word5	,"UR@",$00,ts_ur_at

; SnapFORTH capsule dictionary variables
; See SnapFORTH Referene Guide Volume II page G-4
	word5	,"DP",$00,ts_dp
	word5	,"HDP",$00,ts_hdp
	word5	,"HDP0",$00,ts_hdp0
	word5	,"CONTEXT",$00,ts_context
D7480:	word5	,"CURRENT",$00,ts_current
D748b:	word5	D749f,"TIB",$00,ts_tib
D7494:	word5	D7480,"TIBLEN",$00,ts_tiblen
D749f	word5	D76d7,"IN",$00,ts_in
	word5	D7494,"LASTIN",$00,ts_lastin
	word5	,"STATE",$00,ts_state
	word5	,"CSP",$00,ts_csp
	word5	,"V-LINK",$00,ts_v_link
	word5	,"L1",$00,ts_l1
	word5	,"L2",$00,ts_l2
	word5	,"L3",$00,ts_l3
	word5	,"L4",$00,ts_l4
	word5	,"O",$00,ts_o
	word5	,"MAXSZ",$00,ts_maxsz
	word5	,"WIDTH",$00,ts_width
	word5	,"(NUM)",$00,ts_p_num
	word5	,"(LIT)",$00,ts_p_lit
	word5	,"(QUIT)",$00,ts_p_quit
	word5	,"FENCE",$00,ts_fence
	word5	,"AREAPNT",$00,ts_areapnt
	word5	,"CON-LINK",$00,ts_con_link
	word5	,"FWD",$00,ts_fwd
	word5	,"%HIGH",$00,ts_pct_high

	word5	,"WHO",$02,x_who
	word5	,"SET",$02,x_set
	word5	,"CLR",$02,x_clr
	word5	,"H>T",$00,ts_h_to_t
	word5	,"T>H",$00,ts_t_to_h
	word5	,"%VAR",$00,ts_pct_var
D759b:	word5	,"((",$00,ts_lp_lp
D75a3:	word5	D78fb,"+TO",$00,ts_plus_to
	word5	D759b,"FROM",$00,ts_from
D75b6:	word5	,"))",$00,ts_rp_rp
D75be:	word5	D75c6,"U>",$00,ts_u_gt
D75c6:	word5	D75ce,"0>",$00,ts_0_gt
D75ce:	word5	D75d8,"UMIN",$00,ts_umin
D75d8:	word5	D7701,"UMAX",$00,ts_umax
D75e2:	word5	D75ea,"D.",$00,ts_d_dot
D75ea:	word5	D75f2,"U.",$00,ts_u_dot
D75f2:	word5	D75fa,"B.",$00,ts_b_dot
D75fa:	word5	D7602,"H.",$00,ts_h_dot
D7602:	word5	D5d5f,"G.",$00,ts_g_dot
	word5	D75b6,"SEMIT",$00,ts_semit
	word5	,"STYPE",$00,ts_stype
	word5	,"SP!",$00,ts_sp_bang
	word5	,"?S",$00,ts_query_s
	word5	,".S",$00,ts_dot_s
	word5	,"?",$00,ts_query
	word5	,"C?",$00,ts_c_query
D7648:	word5	,"DUMP",$00,ts_dump
D7652:	word5	D76ab,"HERE",$00,ts_here
	word5	D7648,"?PAIRS",$00,ts_query_pairs
	word5	,"!CSP",$00,ts_bang_csp
	word5	,"?CSP",$00,ts_query_csp
	word5	,"?COMP",$00,ts_query_comp
D7686:	word5	,"?EXEC",$00,ts_query_exec
D7691:	wordi5	D7c7b,"\x80",$02,L46a4	; can't use a NUL in a string in ASL
	word5	D7686,"ALLOT",$00,ts_allot
D76a3:	word5	,"F,",$00,ts_f_comma
D76ab:	word5	D76b2,",",$00,ts_comma
D76b2:	word5	D6903,"C,",$00,ts_c_comma
	word5	D76a3,"ASS",$02,x_ass
	word5	,"INCH",$00,ts_inch
D76cd:	word5	,"WORD",$00,ts_word
D76d7:	word5	D76e2,"-WORD",$00,ts_minus_word
D76e2:	word5	D78cc,"-FIND",$00,ts_minus_find
	word5	D76cd,"?DEF",$00,ts_query_def
D76f7:	word5	,"TAG,",$00,ts__tag_
D7701:	word5	D7717,"COMPILE",$00,ts_compile
D770c:	word5	D76f7,"SET.CONSTANT",$02,x_set_constant
D7717:	wordi5	D773f,"LITERAL",$00,ts__literal_
	wordi5	D770c,"DLITERAL",$02,x_dliteral
	wordi5	,"FLITERAL",$02,x_fliteral
D7738:	wordi5	,"'",$02,x_squote
D773f:	wordi5	D7747,"'X",$00,ts_quote_x
D7747:	wordi5	D778d,"[COMPILE]",$02,x_lb_compile
	wordi5	D7738,"MYSELF",$02,x_myself
	word5	,"NFA",$00,ts_nfa
	word5	,"PFA",$00,ts_pfa
	word5	,"LFA",$00,ts_lfa
	word5	,"LATEST",$00,ts_latest
D7783:	word5	,"LAST",$00,ts_last
D778d:	word5	D7796,"HEX",$00,ts_hex
D7796:	word5	D77b7,"DECIMAL",$00,ts_decimal
	word5	D7783,"OCTAL",$00,ts_octal
D77ac:	word5	,"(NUMBER)",$00,ts_p_number
D77b7:	word5	D78ec,"NUMBER",$00,ts_number
	word5	D77ac,"CONVERT",$00,ts_convert
	word5	,"DCONVERT",$00,ts_dconvert
D77d8:	word5	,"FCONVERT",$00,ts_fconvert
D77e3:	wordi1	D77ea,"&?",$02,x_amp_query
D77ea:	wordi1	D68e5,"^?",$02,x_caret_query
D77f1:	word5	D77f9,"S\x22",$00,ts_s_quote
D77f9:	wordi5	D6ea4,".\x22",$02,x_dot_quote
	word5	D77d8,"CFA",$00,ts_cfa
	word5	,"TT.ORIGIN",$00,ts_tt_dot_origin
	word5	,"STAG#",$00,ts_stag_num
	word5	,"LTAG#",$00,ts_ltag_num
	word5	,"EXT#",$00,ts_ext_num
	word5	,"#SHORTS",$00,ts_num_shorts
	word5	,"#LONGS",$00,ts_num_longs
	word5	,"SHORT.TAGS",$02,x_short_tags
	word5	,"LONG.TAGS",$02,x_long_tags
D7861:	wordi5	,"CAPINIT",$02,x_capinit
	wordi5	D7992,"]",$00,ts_right_square
D7873:	wordi5	,"[",$00,ts_left_square
	word5	D7861,"TABLES",$02,x_tables
D7885:	word5	,"(CREATE)",$00,ts_p_create
D7890:	word5	D7899,"TAG",$02,x_tag
D7899:	word5	D78a4,"SHORT",$02,x_short
D78a4:	word5	D678d,"LONG",$02,x_long
D78ae:	word5	D7885,"SMUDGE",$00,ts_smudge
D78b9:	word5	D78c1,"==",$00,ts_eq_eq
D78c1:	word5	D7652,"LABEL",$02,x_label
D78cc:	word5	D78e1,"CODE",$00,ts_code
D78d6:	word5	D78ae,"CODEC",$00,ts_codec
D78e1:	word5	D743e,"ENDCODE",$02,x_endcode
D78ec:	wordi5	D7873,"'V",$00,ts_quote_v
D78f4:	wordi5	D7913,":",$02,x_colon
D78fb:	wordi5	D75be,":C",$02,x_colon_c
	wordi5	D78d6,":P",$02,x_colon_p
D790b:	wordi5	,";P",$02,x_semi_p
D7913:	wordi5	D66cd,";",$02,x_semi
	wordi5	D790b,";CODE",$02,x_semi_code
	word5	,"CREATE",$00,ts_create
	word5	,"CREATEC",$00,ts_createc
	word5	,"<BUILDS",$00,ts_create
	word5	,"<BUILDSC",$00,ts_createc
	word5	,"IMMEDIATE",$02,x_immediate
	word5	,"CONSTANT",$02,x_constant
	word5	,"VARIABLE",$02,x_variable
	word5	,"AREA",$02,x_area
	word5	,"ENDAREA",$02,x_endarea
D7987:	word5	,"STRING",$02,x_string
D7992:	word5	D799b,"VAR",$02,x_var
D799b:	word5	D79b9,"CVAR",$02,x_cvar
	word5	D7987,"DVAR",$02,x_dvar
D79af:	word5	,"FVAR",$02,x_fvar
D79b9:	word5	D79c4,"CVECTOR",$02,x_cvector
D79c4:	word5	D7b54,"VECTOR",$02,x_vector
	word5	D79af,"JUMP-TAB",$02,x_jmp_tab
	word5	,"STRING\x22",$02,x_string_quote
	word5	,"CTABLE",$02,x_ctable
	word5	,"TABLE",$02,x_table
	word5	,"EXPCT",$00,ts_expct
	word5	,"QUERY",$00,ts__query_
	word5	,"(LITERAL)",$00,ts_p_literal
	word5	,"CEXECUTE",$02,x_cexecute
	word5	,"INTERPRET",$00,ts_interpret
	word5	,"CLEANUP",$02,x_cleanup
	word5	,"((QUIT))",$00,ts_pp_quit
	word5	,"QUIT",$00,ts_quit
	word5	,"700TAGS",$02,x_700tags
	word5	,"COLD",$02,x_cold
	word5	,"ID.",$02,x_id_dot
	word5	,"VLIST",$02,x_vlist
	word5	,"VOCABULARY",$02,x_vocabulary
	word5	,"DEFINITIONS",$02,x_definitions
	word5	,"CHAIN",$02,x_chain
	word5	,"FORGET",$02,x_forget
	word5	,"(FORGET)",$02,x_p_forget
	word5	,"SHRNK",$02,x_shrnk
	word5	,"OTHERWISE",$02,x_otherwise
	word5	,"IFTRUE",$02,x_iftrue
	word5	,"IFEND",$02,ifend
	word5	,"(LOAD)",$00,ts_p_load
	word5	,"LOAD",$02,x_load
	word5	,"LOAD\x22",$02,x_load_quote
	word5	,"DEVLOAD",$02,x_devload
	word5	,"DEVLOAD\x22",$02,x_devload_quote
	word5	,"EDIT",$02,x_edit
	word5	,"SAVESNAP",$02,x_savesnap
D7b29:	wordi5	,"GET-TYPE",$02,x_get_type
D7b34:	wordi5	D7b3f,"ENDIF",$00,ts_then
D7b3f:	wordi5	D7b6a,"THEN",$00,ts_then
D7b49:	wordi5	D7b29,"IF.ITS",$02,x_if_its	
D7b54:	wordi5	D7b5f,"DOCASE",$02,x_docase
D7b5f:	wordi5	D7bbe,"ENDCASE",$02,x_endcase
D7b6a:	wordi5	D7b95,"BEGIN",$02,x_begin
	wordi5	D7b49,"IF.L",$02,x_if_l
	wordi5	,"WHILE.L",$02,x_while_l
D7b8a:	wordi5	,"ELSE.L",$02,x_else_l
D7b95:	wordi5	D7ba0,"UNTIL",$02,x_until
D7ba0:	wordi5	D7bb6,"REPEAT",$02,x_repeat
D7bab:	wordi5	D7b8a,"AGAIN",$02,x_repeat
D7bb6:	wordi5	D6a50,"DO",$02,x_do
D7bbe:	wordi5	D7bd1,"?DO",$02,x_query_do
D7bc7:	wordi5	D7bdc,"LOOP",$02,x_loop
D7bd1:	wordi5	D6635,"+LOOP",$02,x_plus_loop
D7bdc:	wordi5	D7c42,"CASE",$02,x_case
D7be6:	wordi5	D7bef,"=IF",$02,x_equals_if
D7bef:	wordi5	D7bf8,"<IF",$02,x_less_than_if
D7bf8:	wordi5	D7c03,"NOTIF",$02,x_not_if
D7c03:	wordi5	D7c4d,"IF",$02,x_if
	wordi5	D7bab,"CASEWHILE",$02,x_case_while
	wordi5	,"=WHILE",$02,x_equals_while
	wordi5	,"<WHILE",$02,x_less_than_while
	wordi5	,"NOTWHILE",$02,x_not_while
D7c37:	wordi5	,"WHILE.ITS",$02,x_while_its
D7c42:	wordi5	D6a87,"WHILE",$02,x_while
D7c4d:	wordi5	D7b34,"ELSE",$02,x_else
D7c57:	wordi5	D7c5e,"\\",$02,x_backslash_backslash
D7c5e:	wordi5	D683c,"(",$02,x_lparen
	wordi5	D7c37,"DOES>",$02,x_does
D7c70:	wordi5	,"ABORT\x22",$02,x_abort_quote
D7c7b:	wordi5	D7c70,"?ABORT\x22",$02,x_query_abort_quote


; assembler addressing modes
	word5	D03a2,"#",$02,xa_mode_immediate
	word5	,".A",$02,xa_mode_accumulator
	word5	,",X",$02,xa_mode_indexed_by_x
	word5	,",Y",$02,xa_mode_indexed_by_y
	word5	,"X)",$02,xa_mode_indexed_by_x_indirect
	word5	,")Y",$02,xa_mode_indirect_indexed_by_y
	word5	,")",$02,xa_mode_indirect
	word5	,"#L",$02,xa_mode_immediate_low_byte
	word5	,"#H",$02,xa_mode_immediate_high_byte

; assembler words to nucleus
	word5	,"TOP",$02,xa_top
	word5	,"SEC",$02,xa_sec

; assembler opcodes
	word5	,"CLC,",$02,xa_op_clc
	word5	,"SEC,",$02,xa_op_sec
	word5	,"CLI,",$02,xa_op_cli
	word5	,"SEI,",$02,xa_op_sei
	word5	,"NOP,",$02,xa_op_nop
	word5	,"CLV,",$02,xa_op_clv
	word5	,"CLD,",$02,xa_op_cld
	word5	,"SED,",$02,xa_op_sed
	word5	,"DEX,",$02,xa_op_dex
	word5	,"INX,",$02,xa_op_inx
	word5	,"DEY,",$02,xa_op_dey
	word5	,"INY,",$02,xa_op_iny
	word5	,"TAX,",$02,xa_op_tax
	word5	,"TXA,",$02,xa_op_txa
	word5	,"TAY,",$02,xa_op_tay
	word5	,"TYA,",$02,xa_op_tya
	word5	,"TXS,",$02,xa_op_txs
	word5	,"TSX,",$02,xa_op_tsx
	word5	,"PHP,",$02,xa_op_php
	word5	,"PLP,",$02,xa_op_plp
	word5	,"PHA,",$02,xa_op_pha
	word5	,"PLA,",$02,xa_op_pla
	word5	,"RTS,",$02,xa_op_rts
	word5	,"RTI,",$02,xa_op_rti
	word5	,"ORA,",$02,xa_op_ora
	word5	,"AND,",$02,xa_op_and
	word5	,"EOR,",$02,xa_op_eor
	word5	,"ADC,",$02,xa_op_adc
	word5	,"STA,",$02,xa_op_sta
	word5	,"LDA,",$02,xa_op_lda
	word5	,"CMP,",$02,xa_op_cmp
	word5	,"SBC,",$02,xa_op_sbc
	word5	,"ASL,",$02,xa_op_asl
	word5	,"ROL,",$02,xa_op_rol
	word5	,"LSR,",$02,xa_op_lsr
	word5	,"ROR,",$02,xa_op_ror
	word5	,"DEC,",$02,xa_op_dec
	word5	,"INC,",$02,xa_op_inc
	word5	,"LDY,",$02,xa_op_ldy
	word5	,"CPX,",$02,xa_op_cpx
	word5	,"CPY,",$02,xa_op_cpy
	word5	,"STY,",$02,xa_op_sty
	word5	,"BIT,",$02,xa_op_bit
	word5	,"LDX,",$02,xa_op_ldx
	word5	,"STX,",$02,xa_op_stx
	word5	,"JMP,",$02,xa_op_jmp
	word5	,"JSR,",$02,xa_op_jsr
	word5	,"BPL,",$02,xa_op_bpl
	word5	,"BMI,",$02,xa_op_bmi
	word5	,"BVC,",$02,xa_op_bbc
	word5	,"BVS,",$02,xa_op_bvs
	word5	,"BCC,",$02,xa_op_bcc
	word5	,"BCS,",$02,xa_op_bcs
	word5	,"BNE,",$02,xa_op_bne
	word5	,"BEQ,",$02,xa_op_beq

; assembler control structures
	word5	,"IF,",$02,xa_if
	word5	,"THEN,",$02,xa_then
	word5	,"ENDIF,",$02,xa_then
	word5	,"ELSE,",$02,xa_else
	word5	,"BEGIN,",$02,xa_begin
	word5	,"UNTIL,",$02,xa_until
	word5	,"AGAIN,",$02,xa_again
	word5	,"WHILE,",$02,xa_while
	word5	,"REPEAT,",$02,xa_repeat

; Assembler interface words to nucleus
	word5	,"PUTTRU",$02,xa_puttru
	word5	,"PUTFLS",$02,xa_putfls
	word5	,"CPUT",$02,xa_cput
	word5	,"CPUSH",$02,xa_cpush
	word5	,"POPPUT",$02,xa_popput
	word5	,"2POP",$02,xa_2pop
	word5	,"PUT",$02,xa_put
	word5	,"POP",$02,xa_pop
	word5	,"PUSH",$02,xa_push

; assembler control structures
	word5	,"NOT",$02,xa_not
	word5	,"0=",$02,xa_0_equals
	word5	,"0<",$02,xa_0_less_than
	word5	,"CS",$02,xa_cs
D7fe2:	word5	,"VS",$02,xa_vs

	fcb	"by JWA V.D. Vuurst"

	fcb	$74,$01,$2a,$20
