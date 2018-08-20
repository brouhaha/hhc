; SnapFORTH for HHC

	cpu	6502

	include	"hhc.inc"
	include	"hhc_tags.inc"

; Inserts a tag by number into a SNAP word being defined.
; XXX temporary, replace with "tag"
ntag	macro	tnum
	if	tnum<$100
	fcb	tnum
	else
	fcb	tnum>>8,tnum&$ff
	endif
	endm

; XXX temporary, replace with "tagrf"
ntagrf	macro	tnum,target
	ntag	tnum
	frel	target
	endm

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

word	macro	link,str,type,val
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
Z42	equ	$42
Z88	equ	$88
D02f3	equ	$02f3
tostate	equ	$039f
D03a2	equ	$03a2
D0306	equ	$0306
D03a0	equ	$03a0
D03a1	equ	$03a1
x_find	equ	$03a6
x_expnd	equ	$040e
x_to	equ	$047e
L0485	equ	$0485
L048f	equ	$048f

Xffb8	equ	$ffb8
Xffba	equ	$ffba
Xffc8	equ	$ffc8
Sffd3	equ	$ffd3
Sffd6	equ	$ffd6

	org	$4000

	fcb	$21

	fcb	"Copyright FRIENDS AMIS, INC. 1982"
	fcb	$05,$26,$20,$46,$54,$55

romvect:	fdb	tag_table_8

romext:		fcb	$08	; uses long tag table 8

cspeed:		fcb	$84	; shows in menu, and is a "slow ROM"

romid:		cstr	"SnapFORTH"

; tag table 8 (long tags $800..$8ff)
tag_table_8:
	tt_start    $800
	
	def_tag	tag_800
	def_tag	quit		; QUIT
	def_tag	p_number	; (NUMBER)
	def_tag	p_literal	; (LITERAL)
	def_tag	tag_804
	def_tag	pp_quit		; ((QUIT))
	def_tag	find		; FIND
	def_tag	expnd		; EXPND
	def_tag	to		; TO
	def_tag	execto		; EXECTO
	def_tag	ur_at		; UR@

; SnapFORTH capsule dictionary variables
; See SnapFORTH Referene Guide Volume II page G-4
	def_tag	dp		; DP
	def_tag	hdp		; HDP
	def_tag hdp0		; HDP0
	def_tag	context		; CONTEXT
	def_tag	current		; CURRENT
	def_tag	tib		; TIB
	def_tag	tiblen		; TIBLEN
	def_tag in		; IN
	def_tag	lastin		; LASTIN
	def_tag	state		; STATE
	def_tag	csp		; CSP
	def_tag	v_link		; V-LINK
	def_tag	l1		; L1
	def_tag	l2		; L2
	def_tag	l3		; L3
	def_tag	l4		; L4
	def_tag	o		; O
	def_tag	maxsz		; MAXSZ
	def_tag	width		; WIDTH
	def_tag	tag_81e
	def_tag	tag_81f
	def_tag	tag_820
	def_tag	tag_821
	def_tag p_num		; (NUM)
	def_tag	p_lit		; (LIT)
	def_tag	p_quit		; (QUIT)
	def_tag	fence		; FENCE
	def_tag	areapnt		; AREAPNT
	def_tag	con_link	; CON-LINK
	def_tag	fwd		; FWD
	def_tag	pct_high	; %HIGH
	def_tag	tag_82a
	def_tag	tag_82b
	def_tag	tag_82c

	def_tag	quote_v		; 'V
	def_tag	tag_82e
	def_tag	h_to_t		; H>T
	def_tag	t_to_h		; T>H
	def_tag	pct_var		; %VAR
	def_tag	lp_lp		; ((
	def_tag	plus_to		; +TO
	def_tag	from		; FROM
	def_tag	rp_rp		; ))
	def_tag	tag_836
	def_tag	u_gt		; U>
	def_tag	0_gt		; 0>
	def_tag	umin		; UMIN
	def_tag	umax		; UMAX
	def_tag	d_dot		; D.
	def_tag	u_dot		; U.
	def_tag	b_dot		; B.
	def_tag	h_dot		; H.
	def_tag	decimal		; DECIMAL
	def_tag	g_dot		; G.
	def_tag	semit		; SEMIT
	def_tag	stype		; STYPE
	def_tag	sp_bang		; SP!
	def_tag	query_s		; ?S
	def_tag	dot_s		; .S
	def_tag	query		; ?
	def_tag	c_query		; C?
	def_tag	dump		; DUMP
	def_tag	here		; HERE
	def_tag	tag_84a		; -WORD
	def_tag	tag_84b
	def_tag	tag_84c
	def_tag	query_pairs	; ?PAIRS
	def_tag	bang_csp	; !CSP
	def_tag	query_csp	; ?CSP
	def_tag	query_comp	; ?COMP
	def_tag	query_exec	; ?EXEC
	def_tag	tag_852		; ALLOT
	def_tag	tag_853
	def_tag	tag_854		; ,F
	def_tag	tag_855
	def_tag	tag_856
	def_tag	tag_857
	def_tag	tag_858		; ,
	def_tag	tag_859		; C,
	def_tag	tag_85a
	def_tag	tag_85b
	def_tag	tag_85c
	def_tag	tag_85d		; INCH
	def_tag	tag_85e		; WORD
	def_tag	tag_85f		; -FIND
	def_tag	tag_860
	def_tag	tag_861
	def_tag	tag_862
	def_tag	tag_863		; 'X
	def_tag	tag_864		; ?DEF
	def_tag	tag_865
	def_tag	tag_866		; TAG
	def_tag	tag_867
	def_tag	tag_868
	def_tag	tag_869
	def_tag	tag_86a		; PFA
	def_tag	tag_86b		; LAST
	def_tag	tag_86c		; NFA
	def_tag	tag_86d		; LFA
	def_tag	tag_86e		; LATEST
	def_tag	hex		; HEX
	def_tag	octal		; OCTAL
	def_tag	convert		; CONVERT
	def_tag	tag_872
	def_tag	number		; NUMBER
	def_tag	tag_874		; DCONVERT
	def_tag	tag_875		; FCONVERT
	def_tag	tag_876		; S"
	def_tag	tag_877
	def_tag	tag_878		; CFA
	def_tag	tag_879
	def_tag	tag_87a		; TT.ORIGIN
	def_tag	tag_87b		; STAG#
	def_tag	tag_87c		; LTAG#
	def_tag	tag_87d		; EXT#
	def_tag	tag_87e		; #SHORTS
	def_tag	tag_87f		; #LONGS
	def_tag	tag_880
	def_tag	tag_881
	def_tag	tag_882		; CREATE <BUILDS
	def_tag	tag_883		; ]
	def_tag	tag_884		; [
	def_tag	tag_885		; (CREATE)
	def_tag	tag_886
	def_tag	tag_887
	def_tag	tag_888
	def_tag	tag_889
	def_tag	tag_88a
	def_tag	tag_88b
	def_tag	tag_88c		; SMUDGE
	def_tag	tag_88d
	def_tag	tag_88e		; ==
	def_tag	tag_88f		; CODE
	def_tag	tag_890		; CODEC
	def_tag	tag_891
	def_tag	tag_892
	def_tag	tag_893		; CREATEC <BUILDSC
	def_tag	tag_894
	def_tag	tag_895
	def_tag	tag_896
	def_tag	tag_897		; EXPCT
	def_tag	tag_898		; QUERY
	def_tag	tag_899		; INTERPRET
	def_tag	tag_89a
	def_tag	tag_89b
	def_tag	tag_89c
	def_tag	tag_89d
	def_tag	tag_89e
	def_tag	tag_89f
	def_tag	tag_8a0		; (LOAD)
	def_tag	tag_8a1		; ENDIF THEN
	def_tag	tag_8a2
	def_tag	tag_8a3

L417e:	fcb	$a9,$02
	fcb	$20,$d3,$ff,$86,$62,$b1,$44,$8d
	fcb	$e8,$03,$a8,$b1,$44,$c9,$61,$90
	fcb	$08,$c9,$7b,$b0,$04,$e9,$1f,$91
	fcb	$44,$88,$d0,$ef,$a5,$43,$f0,$41
	fcb	$38,$a5,$44,$e9,$02,$85,$44,$b0
	fcb	$12,$c6,$45,$90,$0e,$a0,$01,$b1
	fcb	$42,$f0,$2e,$aa,$88,$b1,$42,$85
	fcb	$42,$86,$43,$a0,$02,$b1,$42,$49
	fcb	$ff,$29,$1f,$d0,$e8,$c8,$b1,$42
	fcb	$51,$44,$0a,$d0,$e0,$90,$f6,$a6
	fcb	$62,$ca,$ca,$98,$65,$42,$95,$00
	fcb	$a5,$43,$69,$00,$95,$01,$a9,$01
	fcb	$2c,$a6,$62,$6c,$be,$ff,$a9,$03
	fcb	$20,$d3,$ff,$86,$62,$a2,$00,$f0
	fcb	$06,$e6,$46,$d0,$02,$e6,$47,$a1
	fcb	$46,$10,$02,$a9,$20,$c5,$42,$f0
	fcb	$f0,$c9,$0d,$f0,$ec,$a1,$46,$10
	fcb	$11,$49,$80,$aa,$a9,$20,$c8,$c0
	fcb	$51,$b0,$40,$91,$44,$ca,$d0,$f6
	fcb	$f0,$0f,$c9,$0d,$f0,$0b,$c8,$c0
	fcb	$51,$b0,$30,$91,$44,$c9,$00,$f0
	fcb	$18,$e6,$46,$d0,$02,$e6,$47,$a1
	fcb	$46,$f0,$0e,$10,$02,$a9,$20,$c5
	fcb	$42,$d0,$ca,$e6,$46,$d0,$02,$e6
	fcb	$47,$98,$81,$44,$a6,$62,$38,$a5
	fcb	$46,$f5,$fe,$48,$a5,$47,$f5,$ff
	fcb	$6c,$c8,$ff,$4c,$1e,$47,$c8,$8c
	fcb	$9f,$03,$4c,$09,$00,$ad,$a0,$03
	fcb	$85,$42,$ad,$a1,$03,$85,$43,$ad
	fcb	$9f,$03,$f0,$24,$30,$13,$b5,$00
	fcb	$91,$42,$c8,$b5,$01,$91,$42,$e8
	fcb	$e8,$a9,$00,$8d,$9f,$03,$4c,$09
	fcb	$00,$18,$b5,$00,$71,$42,$91,$42
	fcb	$c8,$b5,$01,$71,$42,$4c,$9d,$04
	fcb	$b1,$42,$48,$c8,$b1,$42,$6c,$c8
	fcb	$ff,$68,$85,$42,$68,$a0,$01,$4c
	fcb	$8d,$04

; EXECTO
x_execto:
	LDA	#$01
	JSR	Sffd3
	JMP	L048f

; UR@
x_ur_at:
	fcb	$00
	literal	D03a0		; D03a0
	tag	at		; @
	fcb	$00

; DP (SnapFORTH capsule dictionary variable)
x_dp:
	LDY	#$04
	BNE	L42f1		; always taken

; HDP (SnapFORTH capsule dictionary variable)
x_hdp:
	LDY	#$06
	BNE	L42f1		; always taken

; HDP0 (SnapFORTH capsule dictionary variable)
x_hdp0:
	LDY	#$08
	BNE	L42f1		; always taken

; CONTEXT (SnapFORTH capsule dictionary variable)
x_context:
	LDY	#$0a
	BNE	L42f1		; always taken

; CURRENT (SnapFORTH capsule dictionary variable)
x_current:
	LDY	#$0c
	BNE	L42f1		; always taken

; TIB (SnapFORTH capsule dictionary variable)
x_tib:
	LDY	#$0e
	BNE	L42f1		; always taken

; TIBLEN (SnapFORTH capsule dictionary variable)
x_tiblen:
	LDY	#$10
	BNE	L42f1		; always taken

; IN (SnapFORTH capsule dictionary variable)
x_in:
	LDY	#$12
	BNE	L42f1		; always taken

; LASTIN (SnapFORTH capsule dictionary variable)
x_lastin:
	LDY	#$14
	BNE	L42f1		; always taken

; STATE (SnapFORTH capsule dictionary variable)
x_state:
	LDY	#$16
	BNE	L42f1		; always taken

; CSP (SnapFORTH capsule dictionary variable)
x_csp:
	LDY	#$18
	BNE	L42f1		; always taken

; V-LINK (SnapFORTH capsule dictionary variable)
x_v_link:
	LDY	#$1a
	BNE	L42f1		; always taken

; L1 (SnapFORTH capsule dictionary variable)
x_l1:
	LDY	#$1c
	BNE	L42f1		; always taken

; L2 (SnapFORTH capsule dictionary variable)
x_l2:
	LDY	#$1e
	BNE	L42f1		; always taken

; L3 (SnapFORTH capsule dictionary variable)
x_l3:
	LDY	#$20
	BNE	L42f1		; always taken

; L4 (SnapFORTH capsule dictionary variable)
x_l4:
	LDY	#$22
	BNE	L42f1		; always taken

; O (SnapFORTH capsule dictionary variable)
x_o:
	LDY	#$24
L42f1:	JMP	L0485

; MAXSZ (SnapFORTH capsule dictionary variable)
x_maxsz:
	LDY	#$26
	BNE	L42f1		; always taken

; WIDTH (SnapFORTH capsule dictionary variable)
x_width:
	LDY	#$28
	BNE	L42f1		; always taken

; unknown (SnapFORTH capsule dictionary variable)
x_tag_81e:
	LDY	#$2a
	BNE	L42f1		; always taken

; unknown (SnapFORTH capsule dictionary variable)
x_tag_81f:
	LDY	#$2c
	BNE	L42f1		; always taken

; unknown (SnapFORTH capsule dictionary variable)
x_tag_820:
	LDY	#$2e
	BNE	L42f1		; always taken

; unknown (SnapFORTH capsule dictionary variable)
x_tag_821:
	LDY	#$30
	BNE	L42f1		; always taken

; (NUM) (SnapFORTH capsule dictionary variable)
x_p_num:
	LDY	#$32
	BNE	L42f1		; always taken

; (LIT) (SnapFORTH capsule dictionary variable)
x_p_lit:
	LDY	#$34
	BNE	L42f1		; always taken

; (QUIT) (SnapFORTH capsule dictionary variable)
x_p_quit:
	LDY	#$36
	BNE	L42f1		; always taken

; FENCE (SnapFORTH capsule dictionary variable)
x_fence:
	LDY	#$38
	BNE	L42f1		; always taken

; AREAPNT (SnapFORTH capsule dictionary variable)
x_areapnt:
	LDY	#$3a
	BNE	L42f1		; always taken

; CON-LINK (SnapFORTH capsule dictionary variable)
x_con_link:
	LDY	#$3c
	BNE	L42f1		; always taken

; FWD (SnapFORTH capsule dictionary variable)
x_fwd:
	LDY	#$3e
	BNE	L42f1		; always taken

; %HIGH (SnapFORTH capsule dictionary variable)
x_pct_high:
	LDY	#$40
	BNE	L42f1		; always taken

; unknown (SnapFORTH capsule dictionary variable)
x_tag_82a:
	LDY	#$42
	BNE	L42f1		; always taken

; unknown (SnapFORTH capsule dictionary variable)
x_tag_82b:
	LDY	#$44
	BNE	L42f1		; always taken

; unknown (SnapFORTH capsule dictionary variable)
x_tag_82c:
	LDY	#$46
	BNE	L42f1		; always taken

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

	fcb	$02,$8e,$00,$20,$12,$57,$83	; ".... .W."
	fcb	$00,$81,$a0,$00,$00,$81,$a0,$00	; "........"
	fcb	$00,$b6,$00

	fcb	$c9
	mstr	"ASSEMBLE"	; and "R" , but only first eight matched

	fcb	$02,$a9,$00,$20
	fcb	$12,$57,$e2,$7f,$81,$a0,$91,$00	; ".W......"
	fcb	$81,$a0,$91,$00,$d8,$66

	fcb	$c7
	mstr	"FORWARD"

	fcb	$02,$c3
	fcb	$00,$20,$12,$57,$00,$00,$81,$a0	; ". .W...."
	fcb	$00,$00,$81,$a0,$ac,$00,$00,$04	; "........"
	fcb	$0a,$0c,$1a,$71,$75,$83,$8c,$91	; "...qu..."
	fcb	$9b,$a7,$b0,$b4,$c1,$ce,$00,$00	; "........"
	fcb	$09,$00,$2a,$00,$18,$44,$08,$00	; "..*..D.."
	fcb	$2b,$00,$1e,$44,$07,$00,$2c,$00	; "+..D..,."
	fcb	$24,$44,$06,$00,$2d,$00,$2a,$44	; "$D..-.*D"
	fcb	$05,$00,$2e,$00,$30,$44,$04,$00	; "....0D.."
	fcb	$2f,$00,$36,$44,$03,$00,$30,$00	; "/.6D..0."
	fcb	$3c,$44,$02,$00,$31,$00,$42,$44	; "<D..1.BD"
	fcb	$01,$00,$32,$00,$48,$44,$00,$00	; "..2.HD.."
	fcb	$33,$00,$4e,$44,$ff,$ff,$34,$00	; "3.ND..4."
	fcb	$54,$44,$20,$00,$35,$00,$5a,$44	; "TD .5.ZD"
	fcb	$30,$00,$36,$00,$60,$44,$80,$00	; "0.6.`D.."
	fcb	$37,$00,$66,$44,$d7,$02,$a5

; WHO
L4471:	fcb	$00
	fcb	$7a
	cstr	"JWA V.D. Vuurst"

; SET
; Set a compiler option
L4483:	fcb	$00
	fcb	$08,$0a,$41,$08,$2d,$45

; CLR
; Clear a compiler option
L448a:	fcb	$00
	fcb	$08,$0a,$41,$08,$2d,$46

x_tag_82e:
	fcb	$00
	fcb	$24,$79,$22,$23,$08,$0a,$41,$17	; "$y"#..A."
	fcb	$39                     	; "9"

; H>T
x_h_to_t:
	fcb	$00
	fcb	$08,$1b,$3d               	; "..="

; T>H
x_t_to_h:
	fcb	$00
	fcb	$08,$1b,$3e,$00            	; "..>."

; %VAR
; Returns state of "TO" variables, 0 = FROM, 1 = TO, -1 = +TO
x_pct_var:
	LDA	tostate
	PHA
	BPL	L44ab
	DEY
L44ab:	TYA
	JMP	(Xffc8)

; ((
x_lp_lp:
	PHA
	LDA	tostate
	PHA
	fcb	$24	; bit zero-page opcode to skip one byte

; +TO
x_plus_to:
	DEY
x_from:
	STY	tostate
	JMP	L09

; ))
x_rp_rp:
	PLA
	STA	tostate
	PLA
	JMP	L09

x_tag_836:
	LDY	#$06
	LDA	D03a0
	STA	Z42
	LDA	D03a1
	STA	Z42+1
	LDA	Z02,X
	CMP	(Z42),Y
	INY
	LDA	Z03,X
	SBC	(Z42),Y
	BCC	L44e8
	LDA	Z02,X
	CMP	Z00,X
	LDA	Z03,X
	SBC	Z01,X
	BCS	L44e8
	JMP	(Xffb8)
L44e8:	JMP	(Xffba)

; U>
x_u_gt:
	fcb	$00
	ntag	$22			; SWAP
	ntag	$117			; U<

; 0>
x_0_gt:
	fcb	$00
	ntag	$33			; 0
	ntag	$4b			; >

; UMIN
x_umin:
	fcb	$00
	ntag	$5d			; 2DUP
	ntag	$837			; [ SWAP U< ]
	ntagrf	$4c,R44F9		; (IF)
	ntag	$22			; SWAP
R44F9:	ntag	$0f			; DROP

; UMAX
x_umax:
	fcb	$00
	ntag	$5d			; 2DUP
	ntag	$117			; U<
	ntagrf	$4c,R4501		; (IF)
	ntag	$22			; SWAP
R4501:	ntag	$0f			; DROP

; D.
x_d_dot:
	fcb	$00
	ntag	$33			; '0'
	ntag	$16a			; D.R
	ntag	$7d			; SPACE

; U.
x_u_dot:
	fcb	$00
	fcb	$33			; '0'
	ntag	$83b

T450b:
	fcb	$00
	literal	$ff			; $FF
	ntag	$39			; AND
	literal	$10
	ntag	$69			; /MOD
	ntag	$5b			; B>A
	ntag	$76			; ENIT
	ntag	$5b			; B>A
	ntag	$76			; ENIT

; B.
x_b_dot:
	fcb	$00
	ntag	$0c			; (CALL)
	fdb	T450b			; T450b
	ntag	$7d			; SPACE

; H.
x_h_dot:
	fcb	$00
	ntag	$1b			; DUP
	ntag	$3c			; FLIP
	ntag	$0c			; (CALL)
	fdb	T450b			; T450b
	ntag	$83d			; ?

; G.
x_g_dot:
	fcb	$00
	fcb	$14,$0c,$11,$00,$fb,$01,$ad,$1c	; "........"
	fcb	$95,$1b,$23,$42,$14,$0b,$08,$37	; "..#B...7"
	fcb	$1b,$23,$4c,$0a,$22,$11,$80,$0f	; ".#L."..."
	fcb	$39,$14,$40,$3a,$22,$01,$b0,$24	; "9.@:"..$"
	fcb	$4c,$10,$14,$45,$76,$25,$14,$25	; "L..Ev%.%"
	fcb	$01,$14,$08,$3f,$33,$01,$6b,$01	; "...?3.k."
	fcb	$16,$24,$0e               	; ".$."

; SEMIT
x_semit:
	fcb	$00
	fcb	$14,$7f,$39,$1b,$35,$51,$04,$0f	; "..9.5Q.."
	fcb	$14,$2e,$76               	; "..v"

; STYPE
x_stype:
	fcb	$00
	fcb	$a9,$59,$06,$3b,$17,$08,$41,$57	; ".Y.;..AW"

; SP!
x_sp_bang:
	fcb	$00
	fcb	$14,$ff,$01,$0c            	; "...."

; ?S
x_query_s:
	fcb	$00
	fcb	$1f,$14,$ff,$22,$3e,$01,$12   	; "...">.."

; .S
x_dot_s:
	fcb	$00
	fcb	$7d,$08,$44,$1a,$4c,$0b,$33,$22	; "}.D.L.3""
	fcb	$54,$3b,$1d,$08,$3c,$34,$56,$00	; "T;..<4V."
	fcb	$7a
	cstr	"EMPTY"

; ?
x_query:
	fcb	$00
	fcb	$15,$01,$6c               	; "..l"

; C?
x_c_query:
	fcb	$00
	fcb	$17,$01,$6c               	; "..l"

; DUMP
x_dump:
	fcb	$00
	fcb	$33,$23,$7e,$1b,$5d,$08,$3e,$7d	; "3#~.].>}"
	fcb	$2f,$a9,$54,$3b,$17,$08,$3d,$57	; "/.T;..=W"
	fcb	$7d,$2f,$08,$42,$25,$4c,$08,$01	; "}/.B%L.."
	fcb	$7a,$4c,$04,$24,$38,$23,$25,$1a	; "zL.$8#%."
	fcb	$4e,$0b,$75,$14,$86,$58,$06,$24	; "N.u..X.$"
	fcb	$0f,$75,$1b,$23,$14,$0d,$58,$04	; ".u.#..X."
	fcb	$24,$0e,$00,$37,$58,$05,$2f,$3e	; "$..7X./>"
	fcb	$52,$12,$14,$81,$58,$04,$40,$52	; "R...X.@R"
	fcb	$0b,$14,$82,$58,$04,$42,$52,$04	; "...X.BR."
	fcb	$0f,$2f,$3d,$53,$49         	; "./=SI"

; HERE
x_here:
	fcb	$00
	fcb	$08,$34,$08,$0b            	; ".4.."

; -WORD
x_tag_84b:
	fcb	$00
	fcb	$12,$9e,$17,$08,$04,$7e,$7a
	cstr	"ERROR: "
	fcb	$24
	fcb	$79,$78,$7d,$08,$10,$08,$12,$08	; "yx}....."
	fcb	$13,$af,$08,$42,$77,$08,$01   	; "...Bw.."

x_tag_84c:
	fcb	$00
	fcb	$4e,$05,$01,$19,$dc,$ff,$24,$79	; "N.....$y"
	fcb	$3d,$23,$00,$8a,$a2,$ff,$c5,$32	; "=#.....2"
	fcb	$b0,$29,$c9,$40,$b0,$13,$00,$08	; ".).@...."
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
	fcb	$1f,$08,$08,$08,$15         	; "....."

; ?CSP
x_query_csp:
	fcb	$00
	fcb	$1f,$08,$15,$08,$4d         	; "....M"

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
x_tag_852:
	fcb	$00
	fcb	$08,$0b,$3d,$08,$0c,$1c,$37,$3d	; "..=...7="
	fcb	$3e,$08,$1c,$01,$17,$4e,$05,$1b	; ">....N.."
	fcb	$0c,$80,$59,$08,$08,$08,$0b   	; "..Y...."

x_tag_853:
	fcb	$00
	fcb	$08,$28,$28,$08,$4c
	cstr	"FORWARD NOT ALLOWED"

; ,F
x_tag_854:
	fcb	$00
	fcb	$08,$53,$08,$49,$01,$aa,$2b,$08	; ".S.I..+."
	fcb	$52                     	; "R"

x_tag_855:
	fcb	$00
	fcb	$08,$49,$16,$31,$08,$52      	; ".I.1.R"

x_tag_856:
	fcb	$00
	fcb	$08,$49,$18,$32,$08,$52      	; ".I.2.R"

x_tag_857:
	fcb	$00
	fcb	$08,$28,$1a,$4c,$1a,$08,$0d,$3d	; ".(.L...="
	fcb	$22,$08,$29,$3d,$1c,$18,$42,$08	; "".)=..B."
	fcb	$49,$1c,$16,$41,$16,$11,$e0,$4e	; "I..A...N"
	fcb	$33,$08,$08,$08,$28,$00,$0f   	; "3...(.."

; ,
x_tag_858:
	fcb	$00
	fcb	$33,$08,$57,$08,$55         	; "3.W.U"

; C,
x_tag_859:
	fcb	$00
	fcb	$31,$08,$57,$08,$56,$00,$a6,$62	; "1.W.V..b"
	fcb	$00,$08,$4b
	cstr	"LINE TOO LONG"
	fcb	$00
	fcb	$20,$d6,$ff,$79,$08,$08	; "G. ..y.."
	fcb	$08,$2c,$79,$08,$08,$08,$2b,$17	; ".,y...+."
	fcb	$08,$08,$08,$2a,$00,$20,$32,$47	; "...*. 2G"
	fcb	$09,$01,$01,$20,$32,$47,$09,$02	; "... 2G.."
	fcb	$00,$20,$32,$47,$05,$04,$01,$20	; ". 2G... "
	fcb	$32,$47,$15,$08,$01,$20,$32,$47	; "2G... 2G"
	fcb	$19,$20,$02,$20,$32,$47,$01,$40	; ". . 2G.@"
	fcb	$01,$20,$32,$47,$11,$80,$01,$20	; ". 2G... "
	fcb	$32,$47,$00,$00,$02,$00,$14,$ff	; "2G......"
	fcb	$39,$0c,$45,$47,$00,$08,$28,$4c	; "9.EG..(L"
	fcb	$08,$32,$08,$08,$08,$29,$52,$02	; ".2...)R."
	fcb	$3c,$0c,$75,$47,$00,$33,$0c,$57	; "<.uG.3.W"
	fcb	$47,$00,$31,$0c,$57,$47,$00,$4c	; "G.1.WG.L"
	fcb	$1b,$0c,$51,$47,$08,$4b
	cstr	"ILLEGAL ADDRESS-MODE"
	fcb	$00
	fcb	$08,$2c,$2e,$3e	; "ODE..,.>"
	fcb	$0c,$96,$47,$08,$56,$00,$20,$d6	; "..G.V. ."
	fcb	$ff,$08,$2c,$08,$2b,$14,$0c,$39	; "..,.+..9"
	fcb	$4c,$1e,$30,$1d,$14,$ff,$08,$37	; "L.0....7"
	fcb	$08,$28,$3a,$4c,$13,$32,$08,$33	; ".(:L.2.3"
	fcb	$08,$2a,$2b,$3d,$08,$2b,$2b,$48	; ".*+=.++H"
	fcb	$4c,$06,$2b,$08,$33,$08,$2b,$22	; "L.+.3.+""
	fcb	$79,$08,$2b,$39,$28,$0c,$96,$47	; "y.+9(..G"
	fcb	$17,$1b,$32,$39,$08,$2b,$39,$4c	; "..29.+9L"
	fcb	$03,$2b,$3e,$3d,$08,$56,$08,$2a	; ".+>=.V.*"
	fcb	$1a,$4c,$1b,$40,$4c,$05,$08,$58	; ".L.@L..X"
	fcb	$52,$14,$1b,$14,$ff,$08,$37,$08	; "R.....7."
	fcb	$28,$28,$39,$08,$2b,$32,$4b,$39	; "((9.+2K9"
	fcb	$0c,$96,$47,$08,$59,$0c,$51,$47	; "..G.Y.QG"
	fcb	$00,$20,$d6,$ff,$17,$0c,$b3,$47	; ". .....G"
	fcb	$00,$20,$21,$48,$18,$20,$21,$48	; ". !H. !H"
	fcb	$38,$20,$21,$48,$58,$20,$21,$48	; "8 !HX !H"
	fcb	$78,$20,$21,$48,$ea,$20,$21,$48	; "x !H. !H"
	fcb	$b8,$20,$21,$48,$d8,$20,$21,$48	; ". !H. !H"
	fcb	$f8,$20,$21,$48,$ca,$20,$21,$48	; ". !H. !H"
	fcb	$e8,$20,$21,$48,$88,$20,$21,$48	; ". !H. !H"
	fcb	$c8,$20,$21,$48,$aa,$20,$21,$48	; ". !H. !H"
	fcb	$8a,$20,$21,$48,$a8,$20,$21,$48	; ". !H. !H"
	fcb	$98,$20,$21,$48,$9a,$20,$21,$48	; ". !H. !H"
	fcb	$ba,$20,$21,$48,$08,$20,$21,$48	; ". !H. !H"
	fcb	$28,$20,$21,$48,$48,$20,$21,$48	; "( !HH !H"
	fcb	$68,$20,$21,$48,$60,$20,$21,$48	; "h !H` !H"
	fcb	$40,$20,$be,$47,$fd,$00,$20,$be	; "@ .G.. ."
	fcb	$47,$fd,$20,$20,$be,$47,$fd,$40	; "G.  .G.@"
	fcb	$20,$be,$47,$fd,$60,$20,$be,$47	; " .G.` .G"
	fcb	$fc,$80,$20,$be,$47,$fd,$a0,$20	; ".. .G.. "
	fcb	$be,$47,$fd,$c0,$20,$be,$47,$fd	; ".G.. .G."
	fcb	$e0,$20,$be,$47,$1e,$01,$20,$be	; ". .G.. ."
	fcb	$47,$1e,$21,$20,$be,$47,$1e,$41	; "G.! .G.A"
	fcb	$20,$be,$47,$1e,$61,$20,$be,$47	; " .G.a .G"
	fcb	$1c,$c1,$20,$be,$47,$1c,$e1,$20	; ".. .G.. "
	fcb	$be,$47,$1d,$a1,$20,$be,$47,$1d	; ".G.. .G."
	fcb	$9f,$20,$be,$47,$05,$df,$20,$be	; ". .G.. ."
	fcb	$47,$05,$bf,$20,$be,$47,$0c,$81	; "G.. .G.."
	fcb	$20,$be,$47,$0c,$7f,$20,$be,$47	; " .G.. .G"
	fcb	$04,$1f,$00,$08,$2c,$14,$15,$48	; "....,..H"
	fcb	$0c,$96,$47,$08,$2c,$14,$19,$48	; "..G.,..H"
	fcb	$4c,$04,$0c,$57,$47,$00,$0c,$f2	; "L..WG..."
	fcb	$48,$0c,$cf,$48,$00,$0c,$f2,$48	; "H..H...H"
	fcb	$0c,$e3,$48,$00,$14,$4c,$08,$2c	; "..H..L.,"
	fcb	$4e,$06,$0c,$51,$47,$35,$3d,$0c	; "N..QG5=."
	fcb	$b3,$47,$08,$58,$00,$35,$0c,$b3	; ".G.X.5.."
	fcb	$47,$08,$58,$00,$11,$00,$01,$01	; "G.X....."
	fcb	$17,$08,$4c
	cstr	"BRANCH OUT OF RANGE"

	fcb	$00
	fcb	$1b,$37,$3d,$0c,$2b,$49,$00,$20	; ".7=.+I. "
	fcb	$d6,$ff,$17,$08,$56,$08,$28,$4e	; "....V.(N"
	fcb	$0a,$08,$49,$08,$2f,$42,$3e,$0c	; "..I./B>."
	fcb	$47,$49,$32,$08,$57,$08,$56,$0c	; "GI2.W.V."
	fcb	$51,$47,$00,$20,$4f,$49,$10,$20	; "QG. OI. "
	fcb	$4f,$49,$30,$20,$4f,$49,$50,$20	; "OI0 OIP "
	fcb	$4f,$49,$70,$20,$4f,$49,$90,$20	; "OIp OI. "
	fcb	$4f,$49,$b0,$20,$4f,$49,$d0,$20	; "OI. OI. "
	fcb	$4f,$49,$f0,$00,$08,$49,$32,$20	; "OI...I2 "
	fcb	$08,$55,$00,$32,$08,$4d,$42,$1b	; ".U.2.MB."
	fcb	$17,$4c,$09,$08,$49,$08,$2f,$22	; ".L..I./""
	fcb	$16,$52,$0b,$08,$49,$1c,$42,$3e	; ".R..I.B>"
	fcb	$0c,$47,$49,$22,$18,$00,$08,$49	; ".GI"...I"
	fcb	$32,$32,$0c,$13,$49,$aa,$0c,$92	; "22..I..."
	fcb	$49,$00,$08,$49,$31,$00,$08,$56	; "I..I1..V"
	fcb	$31,$08,$4d,$08,$49,$42,$3e,$0c	; "1.M.IB>."
	fcb	$47,$49,$08,$56,$00,$31,$08,$4d	; "GI.V.1.M"
	fcb	$08,$2f,$0c,$13,$49,$00,$0c,$8b	; "./..I..."
	fcb	$49,$00,$aa,$0c,$cc,$49,$0c,$92	; "I....I.."
	fcb	$49,$00,$20,$d6,$ff,$17,$11,$00	; "I. ....."
	fcb	$ff,$3a,$0c,$6f,$47,$00,$20,$e2	; ".:.oG. ."
	fcb	$49,$b8,$20,$e2,$49,$ba,$20,$e2	; "I. .I. ."
	fcb	$49,$bc,$20,$e2,$49,$be,$20,$e2	; "I. .I. ."
	fcb	$49,$c0,$20,$e2,$49,$c2,$20,$e2	; "I. .I. ."
	fcb	$49,$c4,$20,$e2,$49,$c6,$20,$e2	; "I. .I. ."
	fcb	$49,$c8

; ASS
L4a12:
	fcb	$00
	fcb	$0c,$51,$47,$08,$0a	; "I...QG.."
	fcb	$14,$ac,$3d,$08,$08,$08,$0e,$00	; "..=....."
	fcb	$20,$d6,$ff               	; " .."

x_tag_804:
	fcb	$00
	fcb	$1b,$10,$0f,$13,$f2,$18      	; "......"

x_tag_85a:
	fcb	$00
	fcb	$32,$08,$19,$1b,$08,$1a,$01,$17	; "2......."
	fcb	$4e,$04,$0f,$38,$00,$08,$18,$12	; "N..8...."
	fcb	$9e,$17,$58,$05,$08,$0d,$52,$04	; "..X...R."
	fcb	$08,$04,$33,$1b,$23,$3d,$22,$4c	; "..3.#="L"
	fcb	$05,$1b,$79,$52,$0a,$08,$10,$22	; "..yR...""
	fcb	$5d,$22,$14,$0d,$08,$07,$3d,$23	; "]"....=#"
	fcb	$79,$22,$08,$10,$14,$50,$01,$2e	; "y"...P.."
	fcb	$08,$10,$3d,$33,$22,$18,$12,$9e	; "..=3"..."
	fcb	$17,$08,$04,$27,$3e,$08,$08,$08	; "...'>..."
	fcb	$19,$32                  	; ".2"

x_tag_85b:
	fcb	$00
	fcb	$33,$01,$19,$b3,$ff,$00,$08,$4c	; "3......L"
	cstr	"DEVICE INPUT"

x_tag_85c:
	fcb	$00
	fcb	$33,$08,$10,$16,$33,$33,$33,$1f	; "3...333."
	fcb	$42,$1b,$08,$18,$01,$4d,$4e,$09	; "B....MN."
	fcb	$1c,$11,$00,$87,$48,$0c,$7b,$4a	; "....H.{J"
	fcb	$0a,$0f,$14,$7f,$39,$14,$0d,$58	; "....9..X"
	fcb	$04,$0f,$32,$00,$14,$0a,$58,$03	; "..2...X."
	fcb	$52,$15,$2a,$58,$02,$35,$1b,$35	; "R.*X.5.5"
	fcb	$51,$04,$0f,$38,$00,$1c,$08,$10	; "Q..8...."
	fcb	$3d,$16,$42,$14,$4f,$67,$53,$39	; "=.B.OgS9"
	fcb	$00,$14,$31,$17,$08,$2e,$20,$3a	; "..1... :"
	fcb	$11,$fe,$58,$18,$14,$65,$14,$40	; "..X..e.@"
	fcb	$45,$08,$17,$47            	; "E..G"

; INCH
x_tag_85d:
	fcb	$00
	fcb	$08,$10,$08,$12,$3d,$17,$1b,$4e	; "....=..N"
	fcb	$11,$08,$17,$4c,$0c,$0c,$cc,$4a	; "...L...J"
	fcb	$4c,$07,$08,$08,$08,$12,$14,$0d	; "L......."
	fcb	$00,$32,$08,$33,$08,$12      	; ".2.3.."

; WORD
x_tag_85e:
	fcb	$00
	fcb	$08,$12,$08,$08,$08,$13,$08,$10	; "........"
	fcb	$08,$12,$3d,$08,$49,$30,$1d,$08	; "..=.I0.."
	fcb	$07,$08,$33,$08,$12,$32,$08,$49	; "..3..2.I"
	fcb	$15,$32,$50,$10,$08,$17,$4c,$0c	; ".2P...L."
	fcb	$0c,$cc,$4a,$4c,$07,$33,$08,$08	; "..JL.3.."
	fcb	$08,$12,$38,$4d,$2b,$0f      	; "..8M+."

x_tag_84a:
	fcb	$00
	fcb	$35,$08,$5e               	; "5.^"

; -FIND
x_tag_85f:
	fcb	$00
	fcb	$08,$4a,$08,$49,$08,$0e,$08,$06	; ".J.I...."
	fcb	$1a,$4e,$07,$08,$49,$08,$0f,$08	; ".N..I..."
	fcb	$06                     	; "."

x_tag_860:
	fcb	$00
	fcb	$08,$4b
	cstr	"CAN'T FIND"

x_tag_861:
	fcb	$00
	fcb	$4e,$03,$08,$60            	; "N..`"

x_tag_862:
	fcb	$00
	fcb	$08,$5f,$08,$61            	; "._.a"

; ?DEF
x_tag_864:
	fcb	$00
	fcb	$08,$5f,$1b,$4c,$03,$0e,$32   	; "._.L..2"

x_tag_865:
	fcb	$00
	fcb	$1f,$17,$40,$2b,$01,$17,$00,$08	; "..@+...."
	fcb	$2e,$02,$08,$4c
	cstr	"INTERNAL"

; TAG
x_tag_866:
	fcb	$00
	fcb	$08,$65,$4c,$0d,$1f,$17,$2d,$4b	; ".eL...-K"
	fcb	$4c,$04,$0c,$6b,$4b,$08,$55,$00	; "L..kK.U."
	fcb	$08,$56                  	; ".V"

x_tag_867:
	fcb	$00
	fcb	$14,$0c,$08,$56,$08,$58      	; "...V.X"

x_tag_868:
	fcb	$00
	fcb	$08,$50,$24,$79,$14,$0c,$50,$08	; ".P$y..P."
	fcb	$1b,$15,$08,$67,$41,$52,$0a,$1b	; "...gAR.."
	fcb	$40,$15,$08,$65,$22,$08,$66,$3d	; "@..e".f="
	fcb	$23

; value SET.CONSTANT name
; Tell compiler to compile all references to the constant value to the
; specified name.
L4bae:
	fcb	$00,$08,$53,$08,$63,$08,$0c	; "#..S.c.."
	fcb	$3f,$22,$1c,$16,$3f,$22,$1c,$16	; "?"..?".."
	fcb	$3f,$08,$27,$1c,$16,$1b,$08,$08	; "?.'....."
	fcb	$08,$27,$08,$08,$08,$0c,$33,$08	; ".'....3."
	fcb	$52                     	; "R"

x_tag_869:
	fcb	$00
	fcb	$08,$14,$4c,$40,$08,$28,$4e,$37	; "..L@.(N7"
	fcb	$08,$27,$5d,$41,$15,$48,$4e,$06	; ".']A.HN."
	fcb	$15,$1b,$28,$4d,$09,$1a,$4c,$08	; "..(M..L."
	fcb	$2f,$3d,$15,$08,$66,$0f,$00,$1f	; "/=..f..."
	fcb	$42,$17,$33,$58,$07,$08,$68,$14	; "B.3X..h."
	fcb	$08,$56,$00,$31,$58,$07,$08,$68	; ".V.1X..h"
	fcb	$13,$08,$56,$00,$30,$58,$07,$08	; "..V.0X.."
	fcb	$68,$12,$08,$56,$00,$0f,$08,$68	; "h..V...h"
	fcb	$11,$08,$58

; DLITERAL
L4c12:
	fcb	$00
	fcb	$08,$53,$08,$14	; "..X..S.."
	fcb	$4c,$06,$22,$08,$69,$08,$69

; FLITERAL
L4c1e:
	fcb	$00	; "L.".i.i."
	fcb	$08,$53,$08,$14,$4c,$07,$08,$68	; ".S..L..h"
	fcb	$01,$c7,$08,$54

; '
L4c2b:
	fcb	$00
	fcb	$08,$62,$08	; "...T..b."
	fcb	$69                     	; "i"

; 'X
x_tag_863:
	fcb	$00
	fcb	$08,$62,$79,$28,$08,$61,$15,$08	; ".by(.a.."
	fcb	$69

; [COMPILE]
L4c3a:
	fcb	$00
	fcb	$08,$62,$08,$50,$79,$1a	; "i..b.Py."
	fcb	$4e,$05,$15,$08,$66,$00,$31,$08	; "N...f.1."
	fcb	$4d,$15,$08,$67

; MYSELF
L4c4d:
	fcb	$00
	fcb	$08,$6b,$08	; "M..g..k."
	fcb	$6a,$01,$19,$e9,$ff         	; "j...."

; NFA
x_tag_86c:
	LDA	#$01	; 1 .
	JSR	Sffd3
	DEC	Z42+1
	LDY	#$ff	; 255 .
L4c5f:	DEY
	LDA	(Z42),Y
	BPL	L4c5f
	CLC
	TYA
L4c66:	ADC	Z42
	PHA
	LDA	Z42+1
	ADC	#$00	; 0 .
	JMP	(Xffc8)

; PFA
x_tag_86a:
	LDA	#$01	; 1 .
	JSR	Sffd3
	LDY	#$02	; 2 .
L4c77:	INY
	LDA	(Z42),Y
	BPL	L4c77
	TYA
	CLC
	ADC	#$01	; 1 .
	BNE	L4c66

; LFA
x_tag_86d:
	fcb	$00
	fcb	$08,$6c,$3f               	; ".l?"

; LATEST
x_tag_86e:
	fcb	$00
	fcb	$08,$0f,$15               	; "..."

; LAST
x_tag_86b:
	fcb	$00
	fcb	$08,$1e,$1a,$4c,$05,$08,$0d,$3d	; "...L...="
	fcb	$00,$08,$6e               	; "..n"

; HEX
x_hex:
	fcb	$00
	fcb	$14,$10,$14,$25,$18         	; "...%."

; DECIMAL
x_decimal:
	fcb	$00
	fcb	$14,$0a,$14,$25,$18         	; "...%."

; OCTAL
x_octal:
	fcb	$00
	fcb	$2b,$14,$25,$18            	; "+.%."

x_tag_872:
	fcb	$00
	fcb	$1b,$17,$1b,$14,$2d,$48,$1b,$23	; "....-H.#"
	fcb	$22,$14,$2b,$48,$3a,$3d,$33,$33	; "".+H:=33"
	fcb	$20,$79,$01,$1a,$36,$3e,$2a,$1c	; " y..6>*."
	fcb	$51,$0c,$1b,$14,$11,$51,$05,$0f	; "Q....Q.."
	fcb	$34,$52,$03,$2c,$3e,$33,$14,$25	; "4R.,>3.%"
	fcb	$17,$40,$5a,$4c,$13,$33,$2e,$21	; ".@ZL.3.!"
	fcb	$14,$25,$17,$ab,$65,$33,$2e,$21	; ".%..e3.!"
	fcb	$14,$25,$17,$62,$65,$53,$2d,$11	; ".%.beS-."
	fcb	$fc,$ff,$48,$aa,$24,$4c,$03,$01	; "..H.$L.."
	fcb	$22,$aa,$00,$23,$25,$37,$01,$b2	; ""..#%7.."
	fcb	$1c,$24,$1b,$17,$1b,$14,$2d,$48	; ".$....-H"
	fcb	$22,$14,$2b,$48,$3a,$3d,$3e,$48	; "".+H:=>H"
	fcb	$23,$1b,$17,$01,$1a,$14,$45,$48	; "#.....EH"
	fcb	$4c,$17,$24,$38,$23,$42,$14,$25	; "L.$8#B.%"
	fcb	$01,$14,$08,$3f,$08,$71,$01,$16	; "...?.q.."
	fcb	$23,$2f,$6c,$22,$3c,$3d,$3c,$24	; "#/l"<=<$"
	fcb	$24                     	; "$"

; (NUMBER)
x_p_number:
	fcb	$00
	fcb	$14,$25,$17,$14,$0a,$48,$4c,$10	; ".%...HL."
	fcb	$1b,$23,$0c,$f2,$4c,$4e,$06,$24	; ".#..LN.$"
	fcb	$0f,$31,$22,$00,$0f,$61,$24,$08	; ".1"..a$."
	fcb	$72,$1a,$4e,$04,$40,$60,$33,$22	; "r.N.@`3""
	fcb	$00,$79,$1c,$3d,$23,$33,$25,$18	; ".y.=#3%."
	fcb	$08,$22,$47,$24,$48         	; "."G$H"

; NUMBER
x_number:
	fcb	$00
	fcb	$0c,$4a,$4d,$08,$61         	; ".JM.a"

; CONVERT
x_convert:
	fcb	$00
	fcb	$08,$72,$0f,$40,$60         	; ".r.@`"

; DCONVERT
x_tag_874:
	fcb	$00
	fcb	$08,$72,$4e,$02,$40         	; ".rN.@"

; FCONVERT
x_tag_875:
	fcb	$00
	fcb	$0c,$f2,$4c,$0f,$00,$08,$13,$08	; "..L....."
	fcb	$08,$08,$12,$08,$4a,$08,$49,$41	; "....J.IA"
	fcb	$17

; &?
L4d7b:
	fcb	$00
	fcb	$0c,$6e,$4d,$08,$69

; ^?
L4d81:
	fcb	$00	; "...nM.i."
	fcb	$0c,$6e,$4d,$14,$1f,$39,$08,$69	; ".nM..9.i"

; S"
x_tag_876:
	fcb	$00
	fcb	$14,$22,$08,$5e,$08,$49,$17,$42	; ".".^.I.B"
	fcb	$08,$52

; ."
L4d95:
	fcb	$00
	fcb	$08,$14,$4c,$08,$08	; ".R...L.."
	fcb	$68,$7a,$08,$76,$52,$09,$14,$22	; "hz.vR..""
	fcb	$08,$5e,$08,$49,$79,$78      	; ".^.Iyx"

x_tag_877:
	fcb	$00
	fcb	$08,$0a,$14,$4a,$3d,$23,$79,$08	; "...J=#y."
	fcb	$65,$4c,$10,$30,$62,$1b,$24,$3d	; "eL.0b.$="
	fcb	$17,$23,$13,$1b,$3d,$15,$1c,$17	; ".#..=..."
	fcb	$52,$17,$1b,$14,$c0,$51,$08,$11	; "R....Q.."
	fcb	$00,$c0,$24,$38,$52,$09,$14,$c0	; "..$8R..."
	fcb	$3e,$13,$1b,$15,$24,$17,$23,$22	; ">...$.#""
	fcb	$43,$3d,$60,$24            	; "C=`$"

; CFA
x_tag_878:
	fcb	$00
	fcb	$79,$4e,$09,$08,$77,$4c,$05,$15	; "yN..wL.."
	fcb	$08,$2f,$00,$15            	; "./.."

x_tag_879:	fcb	$00
	fcb	$27,$0f,$11,$00,$40,$11,$ff,$7f	; "'...@..."
	fcb	$5a,$4e,$03,$08,$2f,$08,$6b,$08	; "ZN../.k."
	fcb	$6a,$79,$4e,$07,$08,$77,$0f,$15	; "jyN..w.."
	fcb	$52,$04,$15,$08,$30,$42,$16,$00	; "R...0B.."

S4e0c:	JSR	Sffd6
	fcb	$17,$08,$0a,$15,$3d,$08,$09,$00	; "....=..."

; TT.ORIGIN
x_tag_87a:
	JSR	S4e0c
	fcb	$00

; STAG#
x_tag_87b:
	JSR	S4e0c
	fcb	$02                     	; "."

; LTAG#
x_tag_87c:
	JSR	S4e0c
	fcb	$04                     	; "."

; EXT#
x_tag_87d:
	JSR	S4e0c
	fcb	$06

; #SHORTS
x_tag_87e:
	jsr	S4e0c
	fcb	$08

; #LONGS
x_tag_87f:
	JSR	S4e0c
	fcb	$0a

x_tag_880:
	JSR	S4e0c
	fcb	$0c

; SHORT.TAGS
L4e33:
	fcb	$00
	fcb	$33,$08,$08,$08,$80

; LONG.TAGS
L4e39:
	fcb	$00	; "..3....."
	fcb	$32,$08,$08,$08,$80,$00,$13,$33	; "2......3"
	fcb	$13,$1b,$54,$08,$0a,$11,$2d,$fe	; "..T...-."
	fcb	$3d,$3b,$3d,$15,$1a,$4c,$09,$3b	; "=;=..L.;"
	fcb	$16,$14,$3b,$17,$3b,$41,$18,$30	; "..;.;A.0"
	fcb	$56,$00,$3b,$30,$62,$08,$0a,$14	; "V.;0b..."
	fcb	$48,$3d,$3d,$08,$1b,$28,$28,$1c	; "H==..((."
	fcb	$41,$18,$16,$08,$0a,$15,$3b,$43	; "A.....;C"
	fcb	$08,$0a,$14,$63,$3d,$3d,$16,$00	; "...c==.."
	fcb	$08,$7a,$08,$7e,$4c,$0d,$1b,$08	; ".z.~L..."
	fcb	$7f,$43,$3d,$32,$33,$54,$0c,$5b	; ".C=23T.["
	fcb	$4e,$57,$08,$7d,$08,$7f,$14,$ff	; "NW.}...."
	fcb	$3d,$3c,$14,$ff,$39,$a9,$59,$09	; "=<..9.Y."
	fcb	$1b,$0c,$5b,$4e,$13,$00,$3d,$57	; "..[N..=W"
	fcb	$0f,$0c,$3f,$4e,$00,$54,$13,$00	; "..?N.T.."
	fcb	$3b,$30,$3d,$3b,$1c,$30,$01,$2e	; ";0=;.0.."
	fcb	$19,$30,$56               	; ".0V"

x_tag_881:
	fcb	$00
	fcb	$08,$7e,$28,$08,$7f,$11,$01,$01	; ".~(....."
	fcb	$4a,$39,$08,$7f,$28,$3a,$08,$2e	; "J9..(:.."
	fcb	$08,$28,$3a,$28

; CAPINIT
L4eca:
	fcb	$00
	fcb	$08,$2e,$08	; ".(:(...."
	fcb	$08,$61,$08,$14,$28,$28,$08,$81	; ".a..((.."
	fcb	$39,$4c,$08,$08,$7d,$08,$56,$32	; "9L..}.V2"
	fcb	$08,$56,$00,$08,$4b
	cstr	"UNDEFINED"

; ]
x_tag_883:
	fcb	$00
	fcb	$14,$c0,$08,$08,$08,$14      	; "......"

; [
x_tag_884:
	fcb	$00
	fcb	$33,$08,$08,$08,$14

; TABLES
L4efa:
	fcb	$00
	fcb	$08,$53	; "3......S"
	fcb	$08,$82,$08,$49,$08,$0a,$16,$33	; "...I...3"
	fcb	$08,$55,$14,$c0,$08,$55,$1c,$3c	; ".U...U.<"
	fcb	$08,$55,$22,$08,$55,$1c,$08,$55	; ".U".U..U"
	fcb	$1b,$08,$55,$1c,$28,$08,$55,$3d	; "..U.(.U="
	fcb	$43,$08,$49,$1b,$08,$08,$08,$7a	; "C.I....z"
	fcb	$1c,$08,$52,$11,$e0,$4e,$1c,$16	; "..R..N.."
	fcb	$1b,$41,$20,$3f,$01,$2e,$33,$08	; ".A ?..3."
	fcb	$55,$08,$81,$4c,$56,$08,$83,$08	; "U..LV..."
	fcb	$7d,$30,$62,$13,$1b,$3d,$08,$49	; "}0b..=.I"
	fcb	$40,$08,$7a,$41,$16,$08,$7e,$4c	; "@.zA..~L"
	fcb	$18,$08,$7f,$43,$08,$69,$13,$1b	; "...C.i.."
	fcb	$08,$69,$1b,$08,$69,$11,$ae,$4e	; ".i..i..N"
	fcb	$08,$49,$2e,$1b,$08,$52,$01,$2e	; ".I...R.."
	fcb	$08,$7f,$11,$00,$01,$4b,$4c,$1d	; ".....KL."
	fcb	$1b,$08,$7f,$40,$3c,$14,$ff,$39	; "...@<..9"
	fcb	$30,$62,$3d,$08,$69,$1b,$08,$69	; "0b=.i..i"
	fcb	$11,$a7,$4e,$08,$49,$14,$0e,$1b	; "..N.I..."
	fcb	$08,$52,$01,$2e,$0f,$33,$08,$59	; ".R...3.Y"
	fcb	$08,$84,$0c,$79,$4e,$08,$79,$20	; "...yN.y "
	fcb	$d6,$ff,$08,$0a,$16         	; "....."

; (CREATE)
x_tag_885:
	fcb	$00
	fcb	$08,$0c,$3f,$20,$1c,$16,$40,$22	; "..? ..@""
	fcb	$1c,$18,$08,$2e,$01,$4c,$1a,$08	; ".....L.."
	fcb	$64,$4c,$14,$7e,$7a
	cstr	"REDEFINING "
	fcb	$08,$49,$79,$78,$77,$52,$03	; " .IyxwR."
	fcb	$08,$4a,$33,$08,$49,$17,$08,$1d	; ".J3.I..."
	fcb	$67,$54,$40,$3b,$08,$49,$3d,$17	; "gT@;.I=."
	fcb	$01,$1a,$1c,$18,$34,$56,$40,$08	; "....4V@."
	fcb	$49,$17,$14,$1f,$67,$37,$3a,$1c	; "I...g7:."
	fcb	$18,$08,$0c,$2f,$3e,$37,$01,$13	; ".../>7.."
	fcb	$3f,$08,$6e,$1c,$16,$1b,$08,$08	; "?.n....."
	fcb	$08,$0c,$1b,$08,$0f,$16,$08,$0d	; "........"
	fcb	$3e,$08,$08,$08,$1e,$33,$08,$52	; ">....3.R"

; TAG
L5003:
	fcb	$00,$33,$08,$85            	; ".3.."

x_tag_886:
	fcb	$00
	fcb	$08,$80,$4e,$2a,$08,$7b,$14,$c0	; "..N*.{.."
	fcb	$08,$7e,$3d,$4a,$4c,$0a,$08,$7b	; ".~=JL..{"
	fcb	$32,$08,$33,$08,$7b,$52,$17,$32	; "2.3.{R.2"
	fcb	$08,$08,$08,$80,$7e,$7a
	cstr	"OUT OF SHORTS"
	fcb	$77,$08,$80,$4c
	fcb	$30,$08,$7c,$1b,$08,$7d,$3c,$08	; "0.|..}<."
	fcb	$7f,$3d,$4a,$08,$4c
	cstr	"TAGTABLE OVERFLOW"
	fcb	$1b
	fcb	$42,$08,$81,$4c,$08,$1b,$08,$7d	; "B..L...}"
	fcb	$3c,$42,$48,$3d,$08,$08,$08,$7c	; "<BH=...|"
	fcb	$1b,$1b,$14,$ff,$08,$37,$4c,$02	; ".....7L."
	fcb	$3c,$0c,$03,$50            	; "<..P"

x_tag_887:
	fcb	$00
	fcb	$08,$5f,$4c,$1e,$1b,$79,$4e,$19	; "._L..yN."
	fcb	$08,$77,$0f,$1b,$15,$11,$e0,$4e	; ".w.....N"
	fcb	$50,$0f,$08,$49,$22,$16,$08,$6d	; "P..I"..m"
	fcb	$08,$0d,$3e,$08,$08,$08,$1e,$00	; "..>....."
	fcb	$0e,$08,$13,$08,$08,$08,$12,$08	; "........"
	fcb	$49,$08,$86,$1b,$14,$ff,$4b,$4c	; "I.....KL"
	fcb	$06,$08,$7d,$3c,$52,$06,$08,$7f	; "..}<R..."
	fcb	$3d,$14,$c0,$3e,$43,$08,$7a,$3d	; "=..>C.z="
	fcb	$16

; SHORT
L50b6:
	fcb	$00
	fcb	$08,$80,$0c,$33,$4e,$08	; ".....3N."
	fcb	$86,$0f,$08,$08,$08,$80

; LONG
L50c3:
	fcb	$00
	fcb	$08	; "........"
	fcb	$80,$0c,$39,$4e,$08,$86,$0f,$08	; "..9N...."
	fcb	$08,$08,$80               	; "..."

x_tag_888:
	fcb	$00
	fcb	$08,$4a,$08,$49,$08,$0a,$14,$c6	; ".J.I...."
	fcb	$3d,$08,$06               	; "=.."

x_tag_889:
	fcb	$00
	fcb	$08,$88,$4c,$70,$79,$20,$48,$08	; "..Lpy H."
	fcb	$4c
	cstr	"PATCH WRONG TYPE"
	fcb	$5d,$16,$40,$08,$6d,$1b	; "PE].@.m."
	fcb	$15,$08,$0a,$14,$c6,$3d,$1b,$15	; ".....=.."
	fcb	$2f,$1d,$3e,$4c,$04,$15,$53,$08	; "/.>L..S."
	fcb	$16,$1b,$08,$0f,$0c,$8f,$58,$1b	; "......X."
	fcb	$08,$0d,$3e,$08,$08,$08,$1e,$3f	; "..>....?"
	fcb	$08,$0c,$1c,$16,$2c,$3e,$1b,$41	; "....,>.A"
	fcb	$79,$1c,$15,$20,$41,$15,$2e,$1d	; "y.. A..."
	fcb	$3d,$20,$33,$58,$05,$22,$16,$52	; "= 3X.".R"
	fcb	$14,$32,$58,$0b,$1c,$08,$2f,$42	; ".2X.../B"
	fcb	$3e,$0c,$47,$49,$52,$05,$30,$50	; ">.GIR.0P"
	fcb	$02,$3c,$22,$18,$15,$1a,$28,$4d	; ".<"...(M"
	fcb	$29,$0f,$00,$08,$13,$08,$08,$08	; ")......."
	fcb	$12,$08,$85               	; "..."

x_tag_88a:
	fcb	$00
	fcb	$08,$49,$08,$2f,$31,$08,$89   	; ".I./1.."

x_tag_88b:
	fcb	$00
	fcb	$08,$6b,$30,$3d,$1b,$17,$1b,$08	; ".k0=...."
	fcb	$08,$08,$21,$37,$39,$32,$3a,$22	; "..!792:""
	fcb	$18                     	; "."

; SMUDGE
x_tag_88c:
	fcb	$00
	fcb	$08,$21,$1a,$4c,$0b,$08,$6b,$30	; ".!.L..k0"
	fcb	$3d,$18,$33,$08,$08,$08,$21   	; "=.3...!"

x_tag_88d:
	fcb	$00
	fcb	$08,$49,$08,$08,$08,$1f,$08,$0c	; ".I......"
	fcb	$08,$0d,$3e,$08,$08,$08,$20,$08	; "..>... ."
	fcb	$4e                     	; "N"

; value == name
; Define name to push the constant value using normal literals.
x_tag_88e:
	fcb	$00
	fcb	$08,$53,$08,$1e,$22,$32,$08,$89	; ".S.."2.."
	fcb	$08,$08,$08,$1e

; LABEL
L51a1:
	fcb	$00
	fcb	$08,$49,$08	; "......I."
	fcb	$2f,$08,$8e,$0c,$12,$4a      	; "/....J"

; CODE
x_tag_88f:
	fcb	$00
	fcb	$08,$8d,$0c,$12,$4a,$08,$87,$08	; "....J..."
	fcb	$8b                     	; "."

; CODEC
x_tag_890:
	fcb	$00
	fcb	$08,$8d,$0c,$12,$4a,$08,$8a,$08	; "....J..."
	fcb	$8b

; ENDCODE
L51bf:	fcb	$00
	fcb	$08,$4f,$08,$8c,$08,$0f	; "...O...."
	fcb	$08,$08,$08,$0e            	; "...."

; 'V
x_quote_v:
	fcb	$00
	fcb	$08,$62,$08,$78,$08,$69      	; ".b.x.i"

x_tag_891:
	fcb	$00
	fcb	$08,$51,$08,$8d,$08,$2e,$10,$4c	; ".Q.....L"
	fcb	$0a,$08,$49,$40,$17,$4e,$04,$34	; "..I@.N.4"
	fcb	$08,$52,$08,$83,$08,$0f,$08,$08	; ".R......"
	fcb	$08,$0e

; : (colon)
L51ec:
	fcb	$00
	fcb	$08,$91,$08,$87,$33	; ".......3"
	fcb	$08,$56,$08,$8b

; :C
L51f6:
	fcb	$00
	fcb	$08,$91,$08	; ".V......"
	fcb	$8a,$33,$08,$56,$08,$8b

; :P
L5200:
	fcb	$00
	fcb	$08
	fcb	$91,$08,$49,$08,$2f,$32,$08,$89	; "..I./2.."
	fcb	$33,$08,$56,$08,$8b

; ;P
L520f:
	fcb	$00
	fcb	$08,$4f
	fcb	$08,$68,$0d,$08,$84,$08,$8c

; ;
L5219:
	fcb	$00
	fcb	$08,$4f,$08,$68,$00,$08,$84,$08	; ".O.h...."
	fcb	$8c

; ;CODE
L5223:
	fcb	$00
	fcb	$08,$4f,$08,$68,$08,$79	; "...O.h.y"
	fcb	$08,$84,$0c,$12,$4a,$00,$08,$2e	; "....J..."
	fcb	$04,$08,$61,$08,$53,$08,$13,$08	; "..a.S..."
	fcb	$08,$08,$12,$08,$88,$7e,$7a
	cstr	"FORWARD "
	fcb	$08,$49,$79,$78,$4c,$1d,$1b,$17	; ".IyxL..."
	fcb	$23,$25,$32,$48,$08,$14,$3a,$4e	; "#%2H..:N"
	fcb	$04,$0c,$e0,$4e,$08,$6d,$2a,$3e	; "...N.m*>"
	fcb	$1b,$15,$08,$0c,$2c,$3e,$20,$16	; "....,> ."
	fcb	$52,$35,$31,$08,$14,$28,$3e,$23	; "R51..(>#"
	fcb	$08,$13,$08,$08,$08,$12,$08,$1e	; "........"
	fcb	$08,$0f,$08,$0a,$14,$c6,$3d,$08	; "......=."
	fcb	$08,$08,$0f,$11,$e0,$4e,$25,$08	; ".....N%."
	fcb	$85,$08,$6b,$41,$35,$45,$08,$08	; "..kA5E.."
	fcb	$08,$0f,$08,$08,$08,$1e,$11,$fe	; "........"
	fcb	$ff,$08,$33,$08,$0c,$33,$08,$0c	; "..3..3.."
	fcb	$2c,$3e,$16,$08,$0c,$2e,$3e,$08	; ",>....>."
	fcb	$0d,$3e,$08,$08,$08,$28,$33,$08	; ".>...(3."
	fcb	$08,$08,$29,$08,$0c,$2c,$3e,$08	; "..)..,>."
	fcb	$08,$08,$0c,$33,$08,$52,$33,$24	; "...3.R3$"
	fcb	$32,$50,$04,$08,$69,$00,$08,$67	; "2P..i..g"

x_tag_892:
	fcb	$00
	fcb	$08,$87,$35,$08,$56,$08,$55   	; "..5.V.U"

; CREATE <BUILDS
x_tag_882:
	fcb	$00
	fcb	$11,$20,$4a,$08,$92         	; ". J.."

; CREATEC <BUILDSC
x_tag_893:
	fcb	$00
	fcb	$08,$8a,$35,$08,$56,$11,$20,$4a	; "..5.V. J"
	fcb	$08,$55

; IMMEDIATE
L52e3:
	fcb	$00
	fcb	$08,$6b,$41,$14,$40	; ".U..kA.@"
	fcb	$45

; value CONSTANT name
; Defines a tag that pushes a constant onto the stack.
L52ea:
	fcb	$00
	fcb	$11,$e8,$ff,$08,$92,$08	; "E......."
	fcb	$55

; VARIABLE
L52f2:
	fcb	$00
	fcb	$0c,$6b,$4b,$11,$99,$42	; "U..kK..B"
	fcb	$08,$92,$34,$08,$55

; AREA aaa
; Allocate a Temporary Storage Area (TSA) named "aaa".
; Use before defining variables, and follow by ENDAREA.
; The defined area name will allocate the TSA, returning a boolean for
; success.
; Note: the maximum size of a TSA is 250 bytes.
L52fe:
	fcb	$00
	fcb	$11,$dc	; "..4.U..."
	fcb	$ff,$08,$92,$08,$49,$08,$08,$08	; "....I..."
	fcb	$26,$32,$08,$56

; ENDAREA
; Stop defining variables in a TSA.
L530d:
	fcb	$00		; effectively a NOP?


x_tag_894:
	fcb	$00
	fcb	$08,$92,$08,$26,$17,$3d,$1b,$14	; "...&.=.."
	fcb	$fd,$4a,$08,$4c,$0d,$41,$52,$45	; ".J.L.ARE"
	fcb	$41,$20,$54,$4f,$20,$4c,$41,$52	; "A TO LAR"
	fcb	$47,$45,$1b,$08,$26,$18,$40,$08	; "GE..&.@."
	fcb	$56

; n STRING ccc
; Allocate a string variable with room for n characters, named "ccc", in a TSA.
L5330:
	fcb	$00
	fcb	$42,$11,$df,$ff,$08,$94	; "V.B....."

; VAR ccc
; Allocate a one-word variable named "ccc" in a TSA.
L5337:
	fcb	$00
	fcb	$32,$0c,$30,$53

; CVAR ccc
; Allocate a one byte variable named "ccc" in a TSA.
L533c:
	fcb	$00
	fcb	$33,$0c	; ".2.0S.3."
	fcb	$30,$53

; DVAR ccc
; Allocate a two-word variable (4 bytes) named "ccc" in a TSA.
L5341:
	fcb	$00
	fcb	$30,$0c,$30,$53

; FVAR ccc
; Allocate a floating point variable (8 bytes) named "ccc" in a TSA.
L5346:
	fcb	$00
	fcb	$2c,$0c,$30,$53

; n CVECTOR ccc
; Allocate a vector of n bytes named "ccc" in a TSA.
L534b:
	fcb	$00
	fcb	$11,$e2,$ff	; ",.0S...."
	fcb	$08,$94

; n VECTOR ccc
; Allocated a vector of n words named "ccc" in a TSA.
L5351:
	fcb	$00
	fcb	$43,$11,$e5,$ff,$08	; "...C...."
	fcb	$94

; JUMP-TAB
L5358:
	fcb	$00
	fcb	$08,$82,$0c,$e3,$52,$33	; "......R3"
	fcb	$54,$08,$63,$08,$55,$57,$08,$79	; "T.c.UW.y"
	fcb	$20,$d6,$ff,$08,$68,$01,$34,$08	; " ...h.4."
	fcb	$49,$22,$3e,$08,$55

; STRING??
L5374:
	fcb	$00
	fcb	$08,$49	; "I">.U..I"
	fcb	$08,$2f,$08,$76,$08,$8e

; CTABLE
L537d:
	fcb	$00
	fcb	$0f	; "./.v...."
	fcb	$11,$eb,$ff,$08,$92

; TABLE
L5384:
	fcb	$00
	fcb	$0f,$11	; "........"
	fcb	$ee,$ff,$08,$92            	; "...."

x_tag_895:
	fcb	$00
	fcb	$14,$65,$14,$40,$45,$12,$05,$17	; ".e.@E..."
	fcb	$4e,$32,$0f,$8f,$33,$50,$0f,$14	; "N2..3P.."
	fcb	$82,$58,$0b,$8d,$17,$35,$14,$7f	; ".X...5.."
	fcb	$5a,$4e,$03,$0f,$35,$8b,$4c,$1b	; "ZN..5.L."
	fcb	$4f,$80,$06,$8c,$63,$42,$8e,$42	; "O...cB.B"
	fcb	$4f,$83,$10,$33,$13,$17,$1b,$01	; "O..3...."
	fcb	$14,$18,$8b,$8c,$3e,$40,$8e,$01	; "....>@.."
	fcb	$16,$40,$1b,$01,$97         	; ".@..."

x_tag_896:
	fcb	$00
	fcb	$0f,$14,$28,$16            	; "..(."

; EXPCT
x_tag_897:
	fcb	$00
	fcb	$14,$28,$15,$11,$08,$96,$14,$28	; ".(.....("
	fcb	$16,$20,$20,$40,$33,$33,$11,$08	; ".  @33.."
	fcb	$95,$33,$bc,$0e,$0e,$33,$8d,$18	; ".3...3.."

; QUERY
x_tag_898:
	fcb	$00
	fcb	$08,$10,$08,$11,$08,$97,$33,$08	; "......3."
	fcb	$08,$08,$12               	; "..."

; (LITERAL)
x_p_literal:
	fcb	$00
	fcb	$33,$58,$04,$08,$69,$00,$32,$58	; "3X..i.2X"
	fcb	$05,$0c,$12,$4c,$00,$31,$58,$05	; "...L.1X."
	fcb	$0c,$1e,$4c,$00,$08,$60,$00

; CEXECUTE
L540b:	lda	Z00,x
	sta	Z42
	lda	Z00+1,x
	sta	Z42+1
	inx
	inx
	jmp	(Z42)

; INTERPRET
x_tag_899	equ	*-1
	fcb	$08,$32,$08,$5f,$4c,$47,$1b,$42	; ".2._LG.B"
	fcb	$15,$1c,$08,$6c,$17,$08,$14,$4b	; "...l...K"
	fcb	$20,$17,$33,$58,$0e,$4c,$08,$08	; " .3X.L.."
	fcb	$35,$47,$08,$32,$52,$03,$08,$66	; "5G.2R..f"
	fcb	$52,$29,$32,$58,$06,$0f,$08,$69	; "R)2X...i"
	fcb	$52,$21,$31,$48,$08,$4c,$0e,$49	; "R!1H.L.I"
	fcb	$4c,$4c,$45,$47,$41,$4c,$20,$53	; "LLEGAL S"
	fcb	$59,$4d,$42,$4f,$4c,$4c,$0a,$08	; "YMBOLL.."
	fcb	$35,$0c,$0b,$54,$08,$32,$52,$03	; "5..T.2R."
	fcb	$08,$67,$52,$17,$1f,$23,$08,$49	; ".gR..#.I"
	fcb	$0c,$4a,$4d,$4c,$08,$08,$23,$47	; ".JML..#G"
	fcb	$24,$0f,$52,$07,$24,$01,$0c,$0c	; "$.R.$..."
	fcb	$2f,$52,$53,$60

; CLEANUP
L547c:
	fcb	$00
	fcb	$08,$43,$27	; "/RS`..C'"
	fcb	$01,$0d,$26,$11,$18,$46,$14,$2a	; "..&..F.*"
	fcb	$16,$33,$08,$08,$08,$14,$33,$08	; ".3....3."
	fcb	$08,$08,$17,$33,$08,$08,$08,$28	; "...3...("
	fcb	$08,$21,$4c,$11,$08,$8c,$08,$1f	; ".!L....."
	fcb	$08,$08,$08,$0b,$08,$20,$08,$0d	; "..... .."
	fcb	$3d,$0c,$49,$57            	; "=.IW"

; ((QUIT))
x_pp_quit:
	fcb	$00
	fcb	$0c,$7c,$54,$7d,$08,$34,$08,$14	; ".|T}.4.."
	fcb	$4e,$05,$7a,$02,$6f,$6b,$7e,$08	; "N.z.ok~."
	fcb	$98,$08,$99,$53,$10         	; "...S."

; QUIT
x_quit:
	fcb	$00
	fcb	$12,$9e,$17,$08,$04,$12,$9c,$15	; "........"
	fcb	$30,$3d,$79,$3d,$30,$3d,$12,$a0	; "0=y=0=.."
	fcb	$16,$0c,$85,$56,$08,$34,$08,$24	; "...V.4.$"
	fcb	$47,$00,$01,$7e,$81,$58,$02,$00	; "G..~.X.."
	fcb	$81,$1b,$15,$1b,$23,$14,$72,$67	; "....#.rg"
	fcb	$23,$1b,$13,$f7,$25,$01,$2e,$25	; "#...%..%"
	fcb	$3d,$22,$1b,$1b,$25,$3d,$2f,$1d	; "="..%=/."
	fcb	$1c,$3e,$6f,$13,$f7,$1c,$25,$01	; ".>o...%."
	fcb	$2e,$25,$3d,$22,$27,$22,$3e,$1a	; ".%="'">."
	fcb	$28,$4d,$26,$0e,$01,$7e,$13,$01	; "(M&..~.."
	fcb	$16,$00,$01,$85,$1b,$4e,$04,$81	; ".....N.."
	fcb	$01,$8c,$8a

; 700TAGS
L551e:
	fcb	$00
	fcb	$08,$0a,$14,$75	; ".......u"
	fcb	$3d,$08,$0a,$16

T5527:	fcb	$00,$0c,$dc,$54
	fcb	$14,$3b,$17,$01,$7e,$33,$08,$04	; ".;..~3.."
	fcb	$14,$53,$1f,$32,$01,$8b,$32,$58	; ".S.2..2X"
	fcb	$0c,$81,$41,$17,$28,$81,$15,$11	; "..A.(..."
	fcb	$2a,$01,$48,$39,$4e,$13,$1f,$32	; "*.H9N..2"
	fcb	$01,$8a,$8a,$81,$2e,$3d,$11,$25	; ".....=.%"
	fcb	$01,$0c,$14,$55,$33,$81,$41,$18	; "...U3.A."
	fcb	$0f,$81,$01,$7e,$48,$4e,$0b,$0c	; "...~HN.."
	fcb	$dc,$54,$1c,$4e,$05,$11,$2a,$01	; ".T.N..*."
	fcb	$3d,$1c,$08,$04,$11
	fdb	L417e
	fcb	$12
	fcb	$a6,$11,$1b,$01,$01,$2e,$1b,$12	; "........"
	fcb	$9c,$16,$1b,$30,$3d,$79,$3d,$30	; "...0=y=0"
	fcb	$3d,$12,$a0,$16,$13,$01,$16,$12	; "=......."
	fcb	$9e,$18,$00

D558e:	cstr	"NEW FILE"

x_tag_89a:
	fcb	$00
	fcb	$1b,$41,$17,$14,$e0,$48,$22,$30	; ".A...H"0"
	fcb	$3d,$79,$3d,$17,$14,$10,$48,$39	; "=y=...H9"

; selecter for menu
x_tag_89b:
	fcb	$00
	literal	$9a08			; tag 89a (byte-reversed)
	literal D02f3
	ntag	$16			; !
	ntag	$33			; 0
	ntagrf	$58,R55b8		; (CASE)
	literal	D558e
	ntag	$191			; FILE-TAG
	fcb	$00

R55b8:	fcb	$40			; 1-
	ntag	$194			; .FILE

; executer for menu
x_tag_89c:
	fcb	$00
	ntag	$1a			; ?DUP
	ntagrf	$4c,R55ca		; (IF)
	ntag	$40			; 1-
	ntag	$195			; OPEN-FILE
	ntag	$0c			; (CALL) T5527
	fdb	T5527
	ntag	$0c			; (CALL) T5685
	fdb	T5685
	ntagrf	$52,R5643		; (ELSE)
R55ca:	fcb	$7e			; CR
	fcb	$7a			; (.")
	cstr	"Enter Filename"
	literal	D0306			; D0306
	fcb	$14,$50,$33,$33,$11,$01,$97	; "..P33..."
	fcb	$33,$bc,$0e,$1b,$4e,$05,$0e,$77	; "3...N..w"
	fcb	$53,$22,$01,$8a,$8a,$0c,$27,$55	; "S"....'U"
	fcb	$08,$0a,$1b,$30,$3e,$11,$d3,$01	; "...0>..."
	fcb	$0c,$14,$55,$11,$38,$43,$1c,$14	; "..U.8C.."
	fcb	$d0,$01,$2e,$11,$18,$44,$11,$08	; ".....D.."
	fcb	$44,$54,$1b,$1b,$3b,$17,$3d,$19	; "DT..;.=."
	fcb	$57,$81,$1b,$15,$3d,$1b,$08,$08	; "W...=..."
	fcb	$08,$0d,$08,$08,$08,$0c,$0c,$79	; ".......y"
	fcb	$4e,$08,$7a,$11,$e0,$4e,$1c,$16	; "N.z..N.."
	fcb	$1b,$41,$14,$7e,$01,$2e,$33,$08	; ".A.~..3."
	fcb	$58,$3f,$1b,$1b,$16,$14,$10,$22	; "X?.....""
	fcb	$40,$18,$14,$e0,$81,$41,$18
R5643:	literal	$a081
	literal	D03a2
	fcb	$08,$0a,$14,$b0	; "........"
	fcb	$3d,$1c,$16,$41,$16,$08,$0a,$14	; "=..A...."
	fcb	$91,$3d,$1b,$08,$08,$08,$0f,$08	; ".=......"
	fcb	$08,$08,$0e,$0c,$3f,$4e,$12,$06	; "....?N.."
	fcb	$08,$08,$08,$10,$14,$63,$08,$08	; ".....c.."
	fcb	$08,$11,$08,$10,$08,$11,$01,$32	; ".......2"
	fcb	$11,$08,$01,$13,$80,$16,$08,$01	; "........"

; SnapFORTH capsule entry point
x_tag_800:
	fcb	$00
	ntag	$32		; 1
	literal	$9c08		; tag1 - executer (byte-reversed)
	literal	$9b08		; tag2 - selecter
	ntag	$83		; MENU-DRIVER

T5685:	fcb	$00
	fcb	$08,$0a,$3f,$1b,$15,$48,$4e	; "...?..HN"
	fcb	$11,$7a
	cstr	"ILLEGAL FILE"
	fcb	$08
	fcb	$00

; COLD
L569e:
	fcb	$00
	fcb	$2b,$13,$80,$16,$12,$9c	; "..+....."
	fcb	$15,$01,$8c,$08,$00

; ID.
L56aa:
	fcb	$00
	fcb	$08,$49	; ".......I"
	fcb	$14,$40,$14,$5e,$01,$31,$1b,$41	; ".@.^.1.A"
	fcb	$22,$08,$6a,$1c,$3e,$08,$49,$22	; "".j.>.I""
	fcb	$01,$2e,$08,$49,$79,$14,$1f,$39	; "...Iy..9"
	fcb	$7d,$08,$42

; VLIST
L56c8:
	fcb	$00
	fcb	$08,$0e,$32,$22	; "}.B...2""
	fcb	$15,$22,$1c,$4e,$03,$0e,$00,$1c	; ".".N...."
	fcb	$0c,$aa,$56,$1a,$4e,$03,$01,$7a	; "..V.N..z"
	fcb	$1b,$4c,$0e,$75,$14,$86,$58,$03	; ".L.u..X."
	fcb	$38,$75,$14,$0d,$50,$03,$0e,$00	; "8u..P..."
	fcb	$53,$21

; VOCABULARY
L56ef:
	fcb	$00
	fcb	$08,$82,$0c,$e3,$52	; "S!.....R"
	fcb	$08,$49,$1b,$2f,$3d,$08,$55,$11	; ".I./=.U."
	fcb	$81,$a0,$1b,$08,$55,$08,$0f,$08	; "....U..."
	fcb	$55,$08,$55,$08,$16,$08,$55,$08	; "U.U...U."
	fcb	$08,$08,$16,$08,$79,$20,$d6,$ff	; "....y .."
	fcb	$08,$08,$08,$0e

; DEFINITIONS
L5719:
	fcb	$00
	fcb	$08,$0e,$08	; "........"
	fcb	$08,$08,$0f

; CHAIN
L5720:
	fcb	$00
	fcb	$08,$2d,$30,$3d	; ".....-0="
	fcb	$08,$0f,$2f,$3d,$16         	; "../=."

x_tag_89d:
	fcb	$00
	fcb	$1b,$15,$01,$0e,$2f,$3d,$15,$08	; "..../=.."
	fcb	$36,$28,$4d,$09,$22,$16

; FORGET
L5739:
	fcb	$00
	fcb	$08	; "6(M."..."
	fcb	$62,$08,$0d,$08,$36,$4e,$03,$0f	; "b...6N.."
	fcb	$00,$30,$3d,$0c,$49,$57

; (FORGET)
L5749:
	fcb	$00
	fcb	$08	; ".0=.IW.."
	fcb	$0f,$08,$08,$08,$0e,$08,$25,$08	; "......%."
	fcb	$0d,$08,$36,$4c,$04,$08,$39,$33	; "..6L..93"
	fcb	$0f,$33,$08,$08,$08,$1e,$23,$08	; ".3....#."
	fcb	$16,$1b,$15,$25,$08,$36,$4c,$50	; "...%.6LP"
	fcb	$1f,$23,$1b,$08,$6a,$79,$4e,$43	; ".#..jyNC"
	fcb	$15,$08,$65,$43,$22,$1c,$4c,$02	; "..eC".L."
	fcb	$3c,$1f,$42,$17,$43,$08,$0a,$14	; "<.B.C..."
	fcb	$63,$3d,$3d,$15,$1b,$4c,$2c,$1b	; "c==..L,."
	fcb	$08,$49,$01,$17,$4c,$25,$41,$20	; ".I..L%A "
	fcb	$3d,$1b,$15,$20,$67,$22,$16,$1b	; "=.. g".."
	fcb	$08,$6a,$42,$08,$77,$0f,$15,$1b	; ".jB.w..."
	fcb	$17,$28,$3d,$08,$0a,$14,$75,$3d	; ".(=...u="
	fcb	$15,$08,$49,$5a,$4c,$05,$08,$08	; "..IZL..."
	fcb	$08,$0b,$24,$01,$0c,$53,$53,$1c	; "..$..SS."
	fcb	$16,$2b,$3d,$15,$1a,$28,$4d,$5d	; ".+=..(M]"
	fcb	$08,$0a,$14,$c6,$3d,$15,$1a,$4c	; "....=..L"
	fcb	$08,$1b,$2a,$3e,$08,$9d,$53,$09	; "..*>..S."
	fcb	$08,$0a,$14,$3c,$3d,$08,$9d,$08	; "...<=..."
	fcb	$16,$1b,$08,$0a,$14,$c6,$3d,$48	; "......=H"
	fcb	$4e,$62,$1b,$2f,$3d,$1b,$15,$08	; "Nb./=..."
	fcb	$49,$01,$17,$4e,$08,$08,$0a,$14	; "I..N...."
	fcb	$91,$3d,$1c,$16,$0f,$1b,$1b,$15	; ".=......"
	fcb	$08,$0d,$08,$36,$4c,$26,$1b,$41	; "...6L&.A"
	fcb	$17,$35,$39,$4c,$1c,$1b,$3f,$15	; ".59L..?."
	fcb	$25,$08,$37,$4e,$14,$22,$1c,$2a	; "%.7N.".*"
	fcb	$3e,$08,$9d,$1c,$15,$1c,$16,$1c	; ">......."
	fcb	$08,$0a,$14,$c6,$3d,$0c,$8f,$58	; "....=..X"
	fcb	$60,$53,$2b,$0e,$1b,$08,$49,$01	; "`S+...I."
	fcb	$17,$4e,$19,$1b,$2b,$3d,$15,$08	; ".N..+=.."
	fcb	$08,$08,$16,$1b,$08,$0f,$50,$0c	; "......P."
	fcb	$08,$0a,$14,$8e,$3d,$0c,$0b,$54	; "....=..T"
	fcb	$0c,$19,$57,$2b,$3d,$15,$1a,$28	; "..W+=..("
	fcb	$4d,$6f,$24,$08,$08,$08,$0c,$08	; "Mo$....."
	fcb	$0a,$14,$63,$3d,$14,$12,$a9,$54	; "..c=...T"
	fcb	$3b,$15,$1a,$4c,$2b,$1b,$08,$49	; ";..L+..I"
	fcb	$01,$17,$4c,$19,$15,$1b,$15,$1a	; "..L....."
	fcb	$4c,$10,$08,$49,$40,$01,$17,$4e	; "L..I@..N"
	fcb	$06,$11,$e0,$4e,$1c,$16,$41,$53	; "...N..AS"
	fcb	$12,$0f,$52,$0c,$33,$3b,$16,$08	; "..R.3;.."
	fcb	$0a,$15,$50,$04,$0c,$1e,$55,$31	; "..P...U1"
	fcb	$56,$33,$08,$52,$00,$1b,$15,$30	; "V3.R...0"
	fcb	$1d,$08,$36,$4c,$04,$60,$53,$09	; "..6L.`S."
	fcb	$30,$1d,$16,$16,$00,$1b,$15,$01	; "0......."
	fcb	$0e,$2d,$3d,$15,$08,$36,$4c,$0c	; ".-=..6L."
	fcb	$01,$0e,$2f,$3d,$15,$3d,$1b,$20	; "../=.=. "
	fcb	$16,$53,$14,$0e,$00,$1b,$15,$01	; ".S......"
	fcb	$0e,$2d,$3d,$15,$08,$36,$4c,$04	; ".-=..6L."
	fcb	$60,$53,$0c,$0f,$1b,$15,$01,$0e	; "`S......"
	fcb	$2f,$3d,$15,$08,$36,$28,$4d,$09	; "/=..6(M."
	fcb	$22,$16                  	; ""."

x_tag_89e:
	fcb	$00
	fcb	$aa,$26,$08,$16,$1b,$30,$1d,$0c	; ".&...0.."
	fcb	$0b,$54,$2b,$3d,$15,$1a,$28,$4d	; ".T+=..(M"
	fcb	$0b,$08,$16,$1b,$15,$2f,$1d,$08	; "...../.."
	fcb	$36,$4c,$31,$1b,$41,$17,$35,$39	; "6L1.A.59"
	fcb	$4c,$28,$1b,$2a,$3e,$2f,$1d,$0c	; "L(.*>/.."
	fcb	$0b,$54,$30,$1d,$11,$9f,$58,$50	; ".T0...XP"
	fcb	$19,$1b,$3f,$15,$01,$0e,$41,$15	; "..?...A."
	fcb	$5d,$25,$3d,$01,$17,$4c,$0a,$08	; "]%=..L.."
	fcb	$39,$25,$3d,$1c,$3f,$16,$52,$02	; "9%=.?.R."
	fcb	$0e,$53,$35,$0f,$2b,$3d,$15,$1a	; ".S5.+=.."
	fcb	$28,$4d,$3e,$08,$0a,$14,$3c,$3d	; "(M>...<="
	fcb	$22,$0c,$0b,$54,$0f,$27,$0e

; SHRNK
L5935:
	fcb	$00
	fcb	$08,$62,$08,$0d,$08,$36,$08,$62	; ".b...6.b"
	fcb	$08,$0d,$08,$36,$20,$39,$4e,$03	; "...6 9N."
	fcb	$0e,$00,$5d,$01,$17,$4c,$02,$22	; "..]..L.""
	fcb	$30,$33,$65,$08,$6d,$1b,$41,$17	; "03e.m.A."
	fcb	$35,$39,$4c,$03,$2a,$3e,$5d,$08	; "59L.*>]."
	fcb	$0d,$11,$b7,$58,$08,$9e,$1b,$23	; "...X...#"
	fcb	$3e,$1b,$08,$0c,$5d,$3d,$25,$08	; ">...]=%."
	fcb	$0c,$3e,$6f,$24,$08,$0d,$11,$9f	; ".>o$...."
	fcb	$58,$08,$9e,$08,$33,$08,$0c,$33	; "X...3..3"
	fcb	$08,$52,$00,$37,$3d,$08,$0c,$3e	; ".R.7=..>"
	fcb	$1b,$08,$1c,$3d,$01,$81,$14,$10	; "...=...."
	fcb	$3e,$67,$66,$08,$0c,$5d,$3d,$67	; ">gf..]=g"
	fcb	$1c,$12,$9c,$15,$13,$01,$1b,$01	; "........"
	fcb	$14,$16,$01,$85,$01,$15,$08,$4c	; ".......L"
	cstr	"MEMORY FULL"
	fcb	$1b,$08,$0d,$5d
	fcb	$3d,$11,$9f,$58,$08,$9e,$1b,$08	; "=..X...."
	fcb	$33,$08,$0c,$1b,$08,$33,$08,$0d	; "3....3.."
	fcb	$1b,$08,$33,$08,$25,$81,$08,$0d	; "..3.%..."
	fcb	$86,$5a,$4c,$05,$1c,$13,$01,$19	; ".ZL....."
	fcb	$0e,$00,$00,$00,$89,$4f,$54,$48	; ".....OTH"
	fcb	$45,$d2,$d8,$59,$85,$49,$46,$45	; "E..Y.IFE"
	fcb	$4e,$c4,$e0,$59,$81,$80

; OTHERWISE
L59ec:
	fcb	$00
	fcb	$08	; "N..Y...."
	fcb	$4a,$08,$49,$11,$e8,$59,$08,$06	; "J.I..Y.."
	fcb	$4d,$09,$0f

; IFTRUE
L59f9:
	fcb	$00
	fcb	$4e,$04,$0c,$ec	; "M...N..."
	fcb	$59

; IFEND
L59ff:
	fcb	$00		; NOP
	fcb	$00
	fcb	$08,$5d,$1b,$28,$22	; "Y...].(""
	fcb	$30,$1d,$48,$3a,$4d,$09,$0f,$00	; "0.H:M..."
	fcb	$08,$4c
	cstr	"NO SUCH RAMBANK"
	fcb	$00,$08,$4c
	cstr	"WRONG FILE TYPE"

x_tag_89f:
	fcb	$00
	fcb	$08,$4a,$08,$49,$08,$10,$1c,$17	; ".J.I...."
	fcb	$42,$01,$2e,$08,$10,$79,$32,$08	; "B....y2."
	fcb	$08,$08,$13,$1b,$42,$08,$08,$08	; "....B..."
	fcb	$12,$1c,$42,$17,$14,$3a,$48,$4c	; "..B..:HL"
	fcb	$15,$1c,$17,$b4,$1b,$01,$74,$22	; "......t""
	fcb	$28,$3a,$0c,$0d,$5a,$14,$3b,$17	; "(:..Z.;."
	fcb	$13,$f2,$18,$31,$af,$5d,$01,$8b	; "...1.].."
	fcb	$1b,$4c,$05,$81,$41,$17,$22   	; ".L..A.""

; (LOAD)
x_tag_8a0:
	fcb	$00
	fcb	$08,$17,$08,$18,$26,$08,$19,$08	; "....&..."
	fcb	$1a,$26,$08,$08,$08,$1a,$08,$08	; ".&......"
	fcb	$08,$19,$08,$08,$08,$18,$08,$08	; "........"
	fcb	$08,$17,$33,$08,$08,$08,$12,$33	; "..3....3"
	fcb	$08,$10,$16,$4c,$10,$08,$17,$47	; "...L...G"
	fcb	$4c,$0b,$12,$57,$79,$08,$10,$1c	; "L..Wy..."
	fcb	$01,$3d,$4d,$0d,$08,$99,$27,$08	; ".=M...'."
	fcb	$08,$08,$1a,$08,$08,$08,$19,$27	; ".......'"
	fcb	$08,$08,$08,$18,$08,$08,$08,$17	; "........"
	fcb	$33,$08,$08,$08,$12,$33,$08,$10	; "3....3.."
	fcb	$16

; LOAD
L5ac5:
	fcb	$00
	fcb	$33,$08,$9f,$08,$4c
	cstr	"FILE NOT FOUND"
	fcb	$81,$30
	fcb	$3d,$79,$3d,$aa,$0e,$1c,$2b,$39	; "=y=...+9"
	fcb	$4c,$07,$60,$11,$08,$5a,$52,$0f	; "L.`..ZR."
	fcb	$79,$32,$39,$20,$14,$e0,$48,$39	; "y29 ..H9"
	fcb	$0c,$20,$5a,$11,$08,$5b,$14,$3b	; ". Z..[.;"
	fcb	$17,$20,$81,$1b,$15,$3d,$30,$1d	; ". ...=0."
	fcb	$12,$9e,$17,$1b,$08,$04,$50,$06	; "......P."
	fcb	$08,$0d,$1b,$01,$24,$08,$a0,$00	; "....$..."
	fcb	$14,$22,$08,$5e,$08,$49,$79,$14	; ".".^.Iy."
	fcb	$11,$67,$1b,$12,$57,$18,$12,$58	; ".g..W..X"
	fcb	$22,$01,$2e,$32

; LOAD"
L5b28:
	fcb	$00
	fcb	$0c,$13,$5b	; ""..2...["
	fcb	$01,$19,$99,$ff

; DEVLOAD
L5b30:
	fcb	$00
	fcb	$33,$22,$31	; ".....3"1"
	fcb	$01,$37,$0c,$7b,$4a,$33,$1f,$31	; ".7.{J3.1"
	fcb	$01,$4f,$0e,$11,$08,$5c,$31,$33	; ".O...\13"
	fcb	$33,$08,$a0

; DEVLOAD"
L5b47:
	fcb	$00
	fcb	$0c,$13,$5b,$01	; "3.....[."
	fcb	$19,$e5,$ff

; EDIT
L5b4f:
	fcb	$00
	fcb	$01,$53,$08,$9f	; ".....S.."
	fcb	$4c,$09,$2b,$39,$0c,$20,$5a,$0e	; "L.+9. Z."
	fcb	$52,$0e,$1c,$17,$4e,$03,$01,$a2	; "R...N..."
	fcb	$01,$8a,$8a,$2b,$81,$41,$18,$34	; "...+.A.4"
	fcb	$01,$a1

; SAVESNAP
L5b6e:
	fcb	$00
	fcb	$08,$49,$08,$7a,$3e	; "....I.z>"
	fcb	$08,$7d,$08,$7a,$08,$9f,$4c,$09	; ".}.z..L."
	fcb	$2f,$48,$0c,$20,$5a,$81,$01,$8c	; "/H. Z..."
	fcb	$01,$8a,$8a,$81,$30,$3d,$79,$3d	; "....0=y="
	fcb	$1b,$2e,$1d,$30,$3d,$0c,$14,$55	; "...0=..U"
	fcb	$12,$9e,$17,$13,$fb,$16,$14,$3b	; ".......;"
	fcb	$17,$12,$02,$16,$5d,$16,$41,$20	; "....].A "
	fcb	$1c,$18,$42,$20,$01,$9f,$2f,$81	; "..B ../."
	fcb	$41,$18,$12,$9e,$17,$08,$04,$33	; "A......3"
	fcb	$08,$08,$08,$12,$33,$08,$10,$16	; "....3..."

; GET-TYPE
L5bbc:
	fcb	$00
	fcb	$08,$14,$4c,$07,$11,$81,$41	; "...L...A"
	fcb	$08,$55,$00,$81,$41         	; ".U..A"

; ENDIF THEN
x_tag_8a1:
	fcb	$00
	fcb	$08,$50,$23,$08,$49,$1c,$3e,$25	; ".P#.I.>%"
	fcb	$14,$0f,$39,$30,$08,$4d,$24,$14	; "..90.M$."
	fcb	$10,$39,$4c,$08,$1b,$0c,$2b,$49	; ".9L...+I"
	fcb	$22,$18,$00,$22,$16         	; "".."."

x_tag_8a2:
	fcb	$00
	fcb	$23,$1b,$14,$0f,$39,$3f,$25,$50	; "#...9?%P"
	fcb	$0a,$14,$10,$39,$30,$3a,$08,$a1	; "...90:.."
	fcb	$53,$0f,$24,$08,$4d,$00,$08,$50	; "S.$.M..P"
	fcb	$08,$49,$33,$08,$56,$14,$13,$00	; ".I3.V..."
	fcb	$08,$50,$08,$49,$33,$08,$55,$30	; ".P.I3.U0"

x_tag_8a3:
	fcb	$00
	fcb	$24,$79,$08,$56,$23,$0c,$fd,$5b	; "$y.V#..["
	fcb	$00,$34,$23,$24,$41,$23,$25,$1d	; ".4#$A#%."
	fcb	$14,$0f,$39,$2c,$3e,$4d,$0a,$25	; "..9,>M.%"
	fcb	$1d,$2e,$08,$4d,$08,$49,$24,$41	; "...M.I$A"
	fcb	$1d,$3e,$14,$ff,$4b,$00,$0e,$2e	; ".>..K..."
	fcb	$08,$a2,$08,$49,$3f,$3e,$08,$49	; "...I?>.I"
	fcb	$3f,$16,$00,$0e,$2e,$08,$a2,$08	; "?......."
	fcb	$49,$3f,$3e,$63,$08,$49,$40,$18	; "I?>c.I@."

; IF.ITS
L5c51:
	fcb	$00
	fcb	$08,$68,$4f,$08,$5f,$4c,$09	; "..hO._L."
	fcb	$79,$32,$50,$04,$15,$52,$09,$0f	; "y2P..R.."
	fcb	$08,$49,$08,$73,$28,$08,$61,$1b	; ".I.s(.a."
	fcb	$11,$00,$01,$01,$17,$08,$4c
	cstr	"# TOO BIG"
	fcb	$08,$56,$0c,$fd,$5b

; DOCASE
L5c7f:
	fcb	$00
	fcb	$08	; "G.V..[.."
	fcb	$50,$32

; ENDCASE
L5c83:
	fcb	$00
	fcb	$32,$08,$a2

; BEGIN
L5c87:
	fcb	$00
	fcb	$08	; "P2.2...."
	fcb	$50,$08,$49,$2e

; IF.L
L5c8d:
	fcb	$00
	fcb	$08,$68,$01	; "P.I...h."
	fcb	$18,$0c,$07,$5c

; WHILE.L
L5c95:
	fcb	$00
	fcb	$0c,$8d,$5c	; "...\...\"
	fcb	$2f,$3d

; ELSE.L
L5c9b:
	fcb	$00
	fcb	$08,$68,$01,$19,$0c	; "/=..h..."
	fcb	$07,$5c,$aa,$08,$a1

; UNTIL
L5ca6:
	fcb	$00
	fcb	$0c,$19	; ".\......"
	fcb	$5c,$4c,$08,$0c,$8d,$5c,$0c,$36	; "\L...\.6"
	fcb	$5c,$00,$08,$a3,$4d,$0c,$43,$5c	; "\...M.C\"

; REPEAT AGAIN
L5cb9:
	fcb	$00
	fcb	$0c,$19,$5c,$4c,$0c,$08,$68	; "...\L..h"
	fcb	$01,$19,$0c,$07,$5c,$0c,$36,$5c	; "....\.6\"
	fcb	$00,$08,$a3,$53,$0c,$43,$5c

; DO
L5cd0:
	fcb	$00	; "...S.C\."
	fcb	$08,$68,$54,$31

; ?DO
L5cd5:
	fcb	$00
	fcb	$31,$08,$a3	; ".hT1.1.."
	fcb	$59,$42

; LOOP
L5cdb:
	fcb	$00
	fcb	$08,$68,$57,$31,$08	; "YB..hW1."
	fcb	$a2

; +LOOP
L5ce2:
	fcb	$00
	fcb	$08,$68,$56,$31,$08,$a2	; "...hV1.."

; CASE
L5ce9:
	fcb	$00
	fcb	$08,$a3,$58

; =IF
L5ced:
	fcb	$00
	fcb	$08,$a3,$50	; "...X...P"

; <IF
L5cf1:
	fcb	$00
	fcb	$08,$a3,$51

; NOTIF
L5cf5:
	fcb	$00
	fcb	$08,$a3,$4e	; "...Q...N"

; IF
L5cf9:
	fcb	$00
	fcb	$08,$a3,$4c

; CASEWHILE
L5cfd:
	fcb	$00
	fcb	$0c,$e9,$5c	; "...L...\"
	fcb	$2f,$3d

; =WHILE
L5d03:
	fcb	$00
	fcb	$0c,$ed,$5c,$2f,$3d	; "/=...\/="

; <WHILE
L5d09:
	fcb	$00
	fcb	$0c,$f1,$5c,$2f,$3d

; NOTWHILE
L5d0f:
	fcb	$00
	fcb	$0c	; "...\/=.."
	fcb	$f5,$5c,$2f,$3d

; WHILE.ITS
L5d15:
	fcb	$00
	fcb	$0c,$51,$5c	; ".\/=..Q\"
	fcb	$2f,$3d

; WHILE
L5d1b:
	fcb	$00
	fcb	$0c,$f9,$5c,$2f,$3d	; "/=...\/="

; ELSE
L5d21:
	fcb	$00
	fcb	$08,$a3,$52,$aa,$08,$a1

; backslash
L5d28:
	fcb	$00
	fcb	$14,$0d,$0c,$00,$5a

; (
L5d2e:
	fcb	$00
	fcb	$14,$29	; "....Z..)"
	fcb	$0c,$00,$5a

; DOES>
L5d34:
	fcb	$00
	fcb	$08,$68,$08,$79	; "..Z..h.y"
	fcb	$35,$08,$56,$11,$d6,$ff,$08,$55	; "5.V....U"

; ABORT"
L5d41:
	fcb	$00
	fcb	$08,$68,$08,$4b,$08,$76

; ?ABORT"
L5d48:	fcb	$00	; "..h.K.v."
	fcb	$08,$68,$08,$4c,$08,$76,$00,$35	; ".h.L.v.5"
	fcb	$a6,$00,$14,$d0,$00,$14,$10,$00	; "........"
	fcb	$14,$90,$00,$14,$50,$00

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
	word	,"CHVECT1",$01,$0003
	word	,"CHVECT2",$01,$0005
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
	word	,"IVECT1",$01,$000f
	word	,"IVECT2",$01,$0012
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
D60dc:	word	D6191,"AP",$01,$0039
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
	word	,"CTRFLAGS",$01,$2023
	word	,"CTRFLAG2",$01,$2024
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

	word5	,"SET.TIMER",$00,$0601
D66ae:	word5	,"TURN.OFF",$00,$0701
D66b9:	word5	D6728,"EXIT",$00,$0000
D66c3:	word5	D66ae,"(;P)",$00,$000d
D66cd:	word5	D6ae5,"2DROP",$00,$000e
	word5	D675b,"DROP",$00,$000f
	word5	D66c3,"ORBLIP",$00,$0801
	word5	,"ANDBLIP",$00,$0901
	word6	,"SET.RAM",$00,$0010
	word6	,"SET.ROM",$00,$00a4
	word6	,"SET.CTRL",$00,$0a01
D671c:	word6	,"SET.CROM",$00,$3801
D6728:	word5	D6751,"LIT",$00,$0011
	word5	D671c,"FLIT",$00,$c701
	word5	,"CLIT3",$00,$0012
D6746:	word5	,"CLIT2",$00,$0013
D6751:	word5	D7691,"CLIT",$00,$0014
D675b:	word5	D6762,"@",$00,$0015
D6762:	word5	D6769,"!",$00,$0016
D6769:	word5	D6771,"C@",$00,$0017
D6771:	word5	D6795,"C!",$00,$0018
	word5	D6746,"ABORT",$00,$0b01
D6784:	word5	,"NOP",$00,$0009
D678d:	word5	D67bc,"+!",$00,$0019
D6795:	word5	D679f,"?DUP",$00,$001a
D679f:	word5	D67a8,"DUP",$00,$001b
D67a8:	word5	D67b2,"OVER",$00,$001c
D67b2:	word5	D67d9,"PICK",$00,$001d
D67bc:	word5	D78b9,"+C!",$00,$001e
	word5	D6784,"SP@",$00,$001f
D67ce:	word5	,"SET.SP",$00,$0c01
D67d9:	word5	D67ec,"ROT",$00,$0020
D67e2:	word5	D6969,"ROLL",$00,$0021
D67ec:	word5	D6aff,"SWAP",$00,$0022
D67f6:	word5	D67ff,"2>R",$00,$0026
D67ff:	word5	D6807,">R",$00,$0023
D6807:	word5	D6810,"2R>",$00,$0027
D6810:	word5	D6821,"R>",$00,$0024
D6818:	word5	D67ce,"RP!",$00,$0d01
D6821:	word5	D68c9,"R",$00,$0025
	word5	D6818,"RP@",$00,$0e01
D6831:	word5	,"SET.RP",$00,$0f01
D683c:	word5	D69b5,"0=",$00,$0028
	word5	D68d4,"NOT",$00,$0028
D684d:	word5	,"0<",$00,$0029
D6855:	word5	D685c,"9",$00,$002a
D685c:	word5	D6863,"8",$00,$002b
D6863:	word5	D686a,"7",$00,$002c
D686a:	word5	D6871,"6",$00,$002d
D6871:	word5	D6878,"5",$00,$002e
D6878:	word5	D687f,"4",$00,$002f
D687f:	word5	D6886,"3",$00,$0030
D6886:	word5	D688d,"2",$00,$0031
D688d:	word5	D6894,"1",$00,$0032
D6894:	word5	D689b,"0",$00,$0033
D689b:	word5	D6acf,"-1",$00,$0034
	word5	D6831,"20H",$00,$0035
	word5	,"30H",$00,$0036
	word5	,"80H",$00,$0037
D68be:	word5	,"#DECB",$00,$00a5
D68c9:	word5	D6915,"FALSIFY",$00,$0038
D68d4:	word5	D68dd,"AND",$00,$0039
D68dd:	word5	D69bc,"OR",$00,$003a
D68e5:	word5	D68f5,"XOR",$00,$00a6
D68ee:	word5	D68be,"K",$00,$1001
D68f5:	word	D68fc,"J",$00,$1101
D68fc:	word	D6a92,"I",$00,$003b
D6903:	word5	D690d,"FLIP",$00,$003c
D690d:	word5	D694b,"><",$00,$003c
D6915:	word5	D691c,"+",$00,$003d
D691c:	word5	D6923,"-",$00,$003e
D6923:	word5	D692b,"2-",$00,$003f
D692b:	word5	D6933,"1-",$00,$0040
D6933:	word5	D693b,"2+",$00,$0041
D693b:	word5	D6943,"1+",$00,$0042
D6943:	word5	D6855,"2*",$00,$0043
D694b:	word5	D6b51,"2/",$00,$1201
D6953:	word5	D68ee,"PUSHKEY",$00,$0044
D695e:	word5	D6e32,"TOGGLE",$00,$1301
D6969:	word5	D6974,"SET.BITS",$00,$0045
D6974:	word5	D697f,"CLR.BITS",$00,$0046
D697f:	word5	D6989,"SAVE",$00,$1401
D6989:	word5	D6994,"RESTORE",$00,$1501
D6994:	word5	D6aaf,"CRESTORE",$00,$1601
	word5	D6953,"EXECUTE",$00,$0047
D69aa:	word5	,"(CALL)",$00,$000c
D69b5:	word5	D684d,"=",$00,$0048
D69bc:	word5	D69c4,"<>",$00,$0049
D69c4:	word5	D69cb,"<",$00,$004a
D69cb:	word5	D69d2,">",$00,$004b
D69d2:	word5	D67f6,"U<",$00,$1701
	word5	D69aa,"(IF)",$00,$004c
	word5	,"(UNTIL)",$00,$004d
	word5	,"?JUMP",$00,$1801
	word5	,"(NOTIF)",$00,$004e
	word5	,"(IF.ITS)",$00,$004f
	word5	,"(=IF)",$00,$0050
	word5	,"(<IF)",$00,$0051
	word5	,"(ELSE)",$00,$0052
	word5	,"(AGAIN)",$00,$0053
	word5	,"JUMP",$00,$1901
D6a46:	word5	,"(DO)",$00,$0054
D6a50:	word5	D7bc7,"LEAVE",$00,$0055
	word5	D6a46,"(+LOOP)",$00,$0056
	word5	,"(LOOP)",$00,$0057
	word5	,"(CASE)",$00,$0058
D6a7c:	word5	,"(?DO)",$00,$0059
D6a87:	word5	D7c57,"BOUNDS",$00,$00a9
D6a92:	word5	D7890,"?RANGE",$00,$005a
	word5	D6a7c,"B>A",$00,$005b
D6aa6:	word5	,"L>U",$00,$1a01
D6aaf:	word5	D6aba,"2ROLL",$00,$1b01
D6aba:	word5	D6ac5,"2PICK",$00,$1c01
D6ac5:	word5	D6aef,"2ROT",$00,$1d01
D6acf:	word5	D6ada,"2SWAP",$00,$00aa
D6ada:	word5	D77e3,"2OVER",$00,$005c
D6ae5:	word5	D7be6,"2DUP",$00,$005d
D6aef:	word5	D6af7,"2@",$00,$005e
D6af7:	word5	D6b15,"2!",$00,$005f
D6aff:	word5	D6b0a,"SWAPDROP",$00,$0060
D6b0a:	word5	D78f4,"UNDER",$00,$0060
D6b15:	word5	D6b1f,"FDUP",$00,$1e01
D6b1f:	word5	D6b2a,"FDROP",$00,$0061
D6b2a:	word5	D6b35,"FSWAP",$00,$1f01
D6b35:	word5	D6c33,"FOVER",$00,$2001
	word5	D6aa6,"U*",$00,$00ab
D6b48:	word5	,"UM/",$00,$2101
D6b51:	word5	D6b58,"*",$00,$0062
D6b58:	word5	D6b6e,"NEGATE",$00,$0063
D6b63:	word5	D6b48,"DNEGATE",$00,$2201
D6b6e:	word5	D6bb5,"ABS",$00,$0064
	word5	D6b63,"M*",$00,$2301
	word5	,"D+",$00,$0065
	word5	,"D-",$00,$2401
	word5	,"D=",$00,$2501
	word5	,"UD<",$00,$2601
	word5	,"UDMIN",$00,$2701
D6bab:	word5	,"DABS",$00,$2801
D6bb5:	word5	D6bbe,"MAX",$00,$0066
D6bbe:	word5	D6bd8,"MIN",$00,$0067
	word5	D6bab,"M/",$00,$2901
D6bcf:	word5	,"S>D",$00,$0068
D6bd8:	word5	D6bf8,"/MOD",$00,$0069
	word5	D6bcf,"*/MOD",$00,$2a01
D6bed:	word5	,"M/MOD",$00,$006a
D6bf8:	word5	D6bff,"/",$00,$2b01
D6bff:	word5	D695e,"MOD",$00,$006b
	word5	D6bed,"SHIFT",$00,$006c
	word5	,"CHARBUF",$00,$006d
	word5	,"CANCEL",$00,$006e
D6c29:	word5	,"FLEE",$00,$2c01
D6c33:	word5	D6c48,"MOVE",$00,$006f
D6c3d:	word5	D6c29,"DMOVE",$00,$2d01
D6c48:	word5	D6c69,"CMOVE",$00,$2e01
	word5	D6c3d,"SETBANKS",$00,$2f01
D6c5e:	word5	,"BIGMOVE",$00,$3001
D6c69:	word5	D6c73,"FILL",$00,$3101
D6c73:	word5	D6c7e,"ERASE",$00,$3201
D6c7e:	word5	D6d0b,"BLANKS",$00,$3301
	word5	D6c5e,"<JUMP-TAB>",$00,$3401
	word5	,"GET.GMT",$00,$3501
	word5	,"SD*",$00,$00ac
	word5	,"GET.LOCAL",$00,$00ad
	word5	,"SET.DELAY.LONG",$00,$00ae
	word5	,"SET.DELAY",$00,$0070
	word5	,"ATTACHX",$00,$3601
	word5	,"ATTACH",$00,$3701
	word5	,"FLEE.CAP",$00,$3901
	word5	,"FLEE.CROM",$00,$3a01
	word5	,"LOCATE",$00,$3b01
D6d00	word5	,"CFIND",$00,$3c01
D6d0b:	word5	D6d13,"S+",$00,$00af
D6d13:	word5	D6db5,"S=",$00,$3d01
	word5	D6d00,"ENCODE",$00,$0071
	word5	,"UPDISP",$00,$00b0
	word5	,"REFRESH",$00,$00b1
	word5	,"INS.CH.R",$00,$4101
	word5	,"DEL.CH.R",$00,$4201
	word5	,"SET.INV",$00,$4301
	word5	,"UNSET.INV",$00,$4401
	word5	,"SET.FLSH",$00,$4501
	word5	,"UNSET.FLSH",$00,$4601
	word5	,"POSN",$00,$0072
	word6	,"SCROLL",$00,$0073
	word6	,"SCROLR",$00,$4701
	word5	,"WAIT",$00,$000a
D6daa:	word5	,"WAITM",$00,$000b
D6db5:	word5	D6e9a,"SQUEAK",$00,$4801
	word5	D6daa,"LCD.CR",$00,$4901
	word5	,"CGRTN",$00,$4a01
	word5	,"DISP.CH",$00,$4b01
	word5	,"RCTL",$00,$4c01
	word5	,"ROP",$00,$00b2
	word5	,"RIP",$00,$4d01
	word5	,"RCLOSE",$00,$4e01
	word5	,"ROPEN",$00,$4f01
	word5	,"NAP",$00,$5001
	word5	,"(KEY)",$00,$5101
D6e27:	word5	,"(EMIT)",$00,$0074
D6e32:	word5	D6e3b,"KEY",$00,$0075
D6e3b:	word5	D6e45,"EMIT",$00,$0076
D6e45:	word5	D6e4f,"BEEP",$00,$0077
D6e4f:	word5	D6e59,"TYPE",$00,$0078
D6e59:	word5	D77f1,"COUNT",$00,$0079
	word5	D6e27,"(.\x22)",$00,$007a
	word5	,"ALL-EMIT",$00,$5201
	word5	,"FLAME.ON",$00,$5301
	word5	,"SMART-POSN",$00,$00b3
D6e8f:	word5	,"EMIT.ESC",$00,$007b
D6e9a:	word5	D6ec2,"?KEY",$00,$007c
D6ea4:	word5	D6eaf,"SPACE",$00,$007d
D6eaf:	word5	D6fd4,"CR",$00,$007e
D6eb7:	word5	D6e8f,"FAST.CR",$00,$007f
D6ec2:	word5	D6fcc,"SPACES",$00,$5401
	word5	D6eb7,"START.CURSOR",$00,$5501
	word5	,"STOP.CURSOR",$00,$5601
	word5	,"A>B",$00,$00b4
	word5	,"SOFT.CLR",$00,$00b5
	word5	,"HARD.CLR",$00,$5701
	word5	,"CLEAR",$00,$5801
	word5	,"KBSAVE",$00,$5901
	word5	,"KBREST",$00,$5a01
	word5	,"SAVE.KEY",$00,$5b01
	word5	,"SAVE.TASK",$00,$5c01
	word5	,"REST.KEY",$00,$5d01
	word5	,"RESTORE.RAM",$00,$5e01
	word5	,"RESTORE.TASK",$00,$5f01
	word5	,"SOFT.EMIT",$00,$6001
	word5	,"SIZERAM",$00,$6101
	word5	,"COLD.START",$00,$6201
	word5	,"CAN.LIST",$00,$6301
	word5	,"HOLD",$00,$0080
	word5	,"<#",$00,$6401
	word5	,"#>",$00,$6501
	word5	,"SIGN",$00,$6601
	word5	,"#",$00,$6701
	word5	,"#S",$00,$6801
	word5	,"(D.)",$00,$6901
D6fc3:	word5	,"D.R",$00,$6a01
D6fcc:	word5	D7044,".R",$00,$6b01
D6fd4:	word5	D7039,".",$00,$6c01
	word5	D6fc3,"GRAB",$00,$6d01
	word5	,"TPSAFE?",$00,$6e01
	word5	,"LETGO",$00,$6f01		; release a TSA
	word5	,"T!",$00,$7001
	word5	,"SECS",$00,$7101
	word5	,"LOC.NXT.CAP",$00,$7201
	word5	,"LOC.PRG",$00,$7301
	word5	,"RAM.N",$00,$7401
D702e:	word5	,"DVCSET",$00,$7501
D7039:	word5	D75e2,"CFILE",$00,$0081
D7044:	word5	D7111,"?KEY-HIT",$00,$7a01
	word5	D702e,"NEVER",$00,$7b01
	word5	,"@SA",$00,$7c01
	word5	,"TYPEDROP",$00,$7d01
	word5	,"MENU-DRIVER",$00,$0083
	word5	,"(FILEORG)",$00,$c601
	word5	,"FILEORG",$00,$0084
	word5	,"USED",$00,$00b7
	word5	,"NFILES",$00,$0085
	word5	,"FSPACE",$00,$7e01
	word5	,"FILELEN",$00,$7f01
	word5	,"FLIM",$00,$0086
	word5	,"FUDGE-FLIM",$00,$8001
	word5	,"AVAIL",$00,$8101
	word5	,"?ROOM",$00,$00b8
	word5	,"FIO-ERR",$00,$0087
	word5	,"+USED",$00,$00b9
	word5	,"REC-MOVE",$00,$8201
D7106:	word5	,"REC-CNT",$00,$0088
D7111:	word5	D7131,"NREC",$00,$00ba
	word5	D7106,"EXPAND",$00,$8301
D7126:	word5	,"SHRINK",$00,$8401
D7131:	word5	D71e7,"REVISE",$00,$8501
	word5	D7126,"READ",$00,$8601
	word5	,"WRITE",$00,$8701
	word5	,"LOOKUP",$00,$8801
	word5	,"?FILE",$00,$8901
	word5	,"MAKE",$00,$8a01
	word5	,"OPEN",$00,$8b01
	word5	,"DELETE-FILE",$00,$8c01
	word5	,"DELETE",$00,$8d01
	word5	,"INSERT",$00,$0089
	word5	,"MAKE-ROOM",$00,$8e01
	word5	,".NO-ROOM",$00,$9001
	word5	,"FILE-TAG",$00,$9101
	word5	,"?VISIBLE",$00,$9201
	word5	,"E-L",$00,$9301
	word5	,".FILE",$00,$9401
D71dc:	word5	,"OPEN-FILE",$00,$9501
D71e7:	word5	D72ae,"?ENOUGH-ROOM",$00,$008a
	word5	D71dc,"?SF",$00,$c801
	word5	,"RELOC",$00,$cb01
	word5	,"KS",$00,$c901
	word5	,"SNAP-FILE",$00,$ca01
	word5	,"EOL",$00,$9701
	word5	,"LBUF",$00,$9801
	word5	,"LLEN",$00,$9901
	word5	,"CCNT",$00,$008b
	word5	,"CURPOS",$00,$008c
	word5	,"BUFPOS",$00,$008d
	word5	,"SET-BLIPS",$00,$9a01
	word5	,"EXPECT",$00,$00bc
	word5	,"EDIT-FILE",$00,$9b01
	word5	,"MOVE-IT",$00,$9f01
	word5	,"COPY-FILE",$00,$a001
	word5	,"DO-EDIT",$00,$a101
	word5	,"NEW-FILE",$00,$a201
D72a3:	word5	,"FSTANDTYPE",$00,$0094
D72ae:	word5	D72b6,"F+",$00,$00be
D72b6:	word5	D72c1,"FNEGATE",$00,$a601
D72c1:	word5	D72c9,"F-",$00,$a701
D72c9:	word5	D72d1,"F<",$00,$a801
D72d1:	word5	D72db,"FABS",$00,$a901
D72db:	word5	D72e3,"F@",$00,$00bf
D72e3:	word5	D72f6,"F!",$00,$aa01
D72eb:	word5	D72a3,"10EXP",$00,$0095
D72f6:	word5	D72fe,"F*",$00,$ab01
D72fe:	word5	D7324,"F/",$00,$ac01
	word5	D72eb,"FROUND",$00,$ad01
	word5	,"F#",$00,$ae01
D7319:	word5	,"FP>ASC",$00,$af01
D7324:	word5	D7421,"F.",$00,$b001
	word5	D7319,"F.EXT",$00,$b101
	word5	,"ASC>FP",$00,$b201
	word5	,"CEMIT",$00,$b401
	word5	,"CALC",$00,$b501
	word5	,"S.T",$00,$b701
	word5	,"E.T",$00,$b901
	word5	,"STM",$00,$ba01
	word5	,"SHOW.TIME",$00,$bb01
	word5	,"INTAPS",$00,$c001

	word5	,"SCOMP",$01,$ffca
	word5	,"UCOMP",$01,$ffcd
	word5	,"SLEEP",$01,$ffd0
	word5	,"SETUP",$01,$ffd3
	word5	,"DODOES",$01,$ffd6
	word5	,"DOLATCH",$01,$ffd9
	word5	,"GETMEM",$01,$fff1
	word5	,"GETMEMT",$01,$fff4
	word5	,"POSTECB",$01,$fff7

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

	word5	,"WHO",$02,L4471
	word5	,"SET",$02,L4483
	word5	,"CLR",$02,L448a
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
	word5	,".S",$00,$4508
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
	word5	D7686,"ALLOT",$00,$5208
D76a3:	word5	,"F,",$00,$5408
D76ab:	word5	D76b2,",",$00,$5808
D76b2:	word5	D6903,"C,",$00,$5908
	word5	D76a3,"ASS",$02,L4a12
	word5	,"INCH",$00,$5d08
D76cd:	word5	,"WORD",$00,$5e08
D76d7:	word5	D76e2,"-WORD",$00,$4a08
D76e2:	word5	D78cc,"-FIND",$00,$5f08
	word5	D76cd,"?DEF",$00,$6408
D76f7:	word5	,"TAG,",$00,$6608
D7701:	word5	D7717,"COMPILE",$00,$6808
D770c:	word5	D76f7,"SET.CONSTANT",$02,L4bae
D7717:	wordi5	D773f,"LITERAL",$00,$6908
	wordi5	D770c,"DLITERAL",$02,L4c12
	wordi5	,"FLITERAL",$02,L4c1e
D7738:	wordi5	,"'",$02,L4c2b
D773f:	wordi5	D7747,"'X",$00,$6308
D7747:	wordi5	D778d,"[COMPILE]",$02,L4c3a
	wordi5	D7738,"MYSELF",$02,$4c4d
	word5	,"NFA",$00,$6c08
	word5	,"PFA",$00,$6a08
	word5	,"LFA",$00,$6d08
	word5	,"LATEST",$00,$6e08
D7783:	word5	,"LAST",$00,$6b08
D778d:	word5	D7796,"HEX",$00,ts_hex
D7796:	word5	D77b7,"DECIMAL",$00,ts_decimal
	word5	D7783,"OCTAL",$00,ts_octal
D77ac:	word5	,"(NUMBER)",$00,ts_p_number
D77b7:	word5	D78ec,"NUMBER",$00,ts_number
	word5	D77ac,"CONVERT",$00,ts_convert
	word5	,"DCONVERT",$00,$7408
D77d8:	word5	,"FCONVERT",$00,$7508
D77e3:	wordi1	D77ea,"&?",$02,L4d7b
D77ea:	wordi1	D68e5,"^?",$02,L4d81
D77f1:	word5	D77f9,"S\x22",$00,$7608
D77f9:	wordi5	D6ea4,".\x22",$02,L4d95
	word5	D77d8,"CFA",$00,$7808
	word5	,"TT.ORIGIN",$00,$7a08
	word5	,"STAG#",$00,$7b08
	word5	,"LTAG#",$00,$7c08
	word5	,"EXT#",$00,$7d08
	word5	,"#SHORTS",$00,$7e08
	word5	,"#LONGS",$00,$7f08
	word5	,"SHORT.TAGS",$02,L4e33
	word5	,"LONG.TAGS",$02,L4e39
D7861:	wordi5	,"CAPINIT",$02,L4eca
	wordi5	D7992,"]",$00,$8308
D7873:	wordi5	,"[",$00,$8408
	word5	D7861,"TABLES",$02,L4efa
D7885:	word5	,"(CREATE)",$00,$8508
D7890:	word5	D7899,"TAG",$02,L5003
D7899:	word5	D78a4,"SHORT",$02,L50b6
D78a4:	word5	D678d,"LONG",$02,L50c3
D78ae:	word5	D7885,"SMUDGE",$00,$8c08
D78b9:	word5	D78c1,"==",$00,$8e08
D78c1:	word5	D7652,"LABEL",$02,L51a1
D78cc:	word5	D78e1,"CODE",$00,$8f08
D78d6:	word5	D78ae,"CODEC",$00,$9008
D78e1:	word5	D743e,"ENDCODE",$02,L51bf
D78ec:	wordi5	D7873,"'V",$00,ts_quote_v
D78f4:	wordi5	D7913,":",$02,L51ec
D78fb:	wordi5	D75be,":C",$02,L51f6
	wordi5	D78d6,":P",$02,L5200
D790b:	wordi5	,";P",$02,L520f
D7913:	wordi5	D66cd,";",$02,L5219
	wordi5	D790b,";CODE",$02,L5223
	word5	,"CREATE",$00,$8208
	word5	,"CREATEC",$00,$9308
	word5	,"<BUILDS",$00,$8208
	word5	,"<BUILDSC",$00,$9308
	word5	,"IMMEDIATE",$02,L52e3
	word5	,"CONSTANT",$02,L52ea
	word5	,"VARIABLE",$02,L52f2
	word5	,"AREA",$02,L52fe
	word5	,"ENDAREA",$02,$530d
D7987:	word5	,"STRING",$02,L5330
D7992:	word5	D799b,"VAR",$02,L5337
D799b:	word5	D79b9,"CVAR",$02,L533c
	word5	D7987,"DVAR",$02,L5341
D79af:	word5	,"FVAR",$02,L5346
D79b9:	word5	D79c4,"CVECTOR",$02,L534b
D79c4:	word5	D7b54,"VECTOR",$02,L5351
	word5	D79af,"JUMP-TAB",$02,L5358
	word5	,"STRIN??",$02,L5374
	word5	,"CTABLE",$02,L537d
	word5	,"TABLE",$02,L5384
	word5	,"EXPCT",$00,$9708
	word5	,"QUERY",$00,$9808
	word5	,"(LITERAL)",$00,ts_p_literal
	word5	,"CEXECUTE",$02,L540b
	word5	,"INTERPRET",$00,$9908
	word5	,"CLEANUP",$02,L547c
	word5	,"((QUIT))",$00,ts_pp_quit
	word5	,"QUIT",$00,ts_quit
	word5	,"700TAGS",$02,L551e
	word5	,"COLD",$02,L569e
	word5	,"ID.",$02,L56aa
	word5	,"VLIST",$02,L56c8
	word5	,"VOCABULARY",$02,L56ef
	word5	,"DEFINITIONS",$02,L5719
	word5	,"CHAIN",$02,L5720
	word5	,"FORGET",$02,L5739
	word5	,"(FORGET)",$02,L5749
	word5	,"SHRNK",$02,L5935
	word5	,"OTHERWISE",$02,L59ec
	word5	,"IFTRUE",$02,L59f9
	word5	,"IFEND",$02,L59ff
	word5	,"(LOAD)",$00,$a008
	word5	,"LOAD",$02,L5ac5
	word5	,"LOAD\x22",$02,L5b28
	word5	,"DEVLOAD",$02,L5b30
	word5	,"DEVLOAD\x22",$02,L5b47
	word5	,"EDIT",$02,L5b4f
	word5	,"SAVESNAP",$02,L5b6e
D7b29:	wordi5	,"GET-TYPE",$02,L5bbc
D7b34:	wordi5	D7b3f,"ENDIF",$00,$a108
D7b3f:	wordi5	D7b6a,"THEN",$00,$a108
D7b49:	wordi5	D7b29,"IF.ITS",$02,L5c51	
D7b54:	wordi5	D7b5f,"DOCASE",$02,L5c7f
D7b5f:	wordi5	D7bbe,"ENDCASE",$02,L5c83
D7b6a:	wordi5	D7b95,"BEGIN",$02,L5c87
	wordi5	D7b49,"IF.L",$02,L5c8d
	wordi5	,"WHILE.L",$02,L5c95
D7b8a:	wordi5	,"ELSE.L",$02,L5c9b
D7b95:	wordi5	D7ba0,"UNTIL",$02,L5ca6
D7ba0:	wordi5	D7bb6,"REPEAT",$02,L5cb9
D7bab:	wordi5	D7b8a,"AGAIN",$02,L5cb9
D7bb6:	wordi5	D6a50,"DO",$02,L5cd0
D7bbe:	wordi5	D7bd1,"?DO",$02,L5cd5
D7bc7:	wordi5	D7bdc,"LOOP",$02,L5cdb
D7bd1:	wordi5	D6635,"+LOOP",$02,L5ce2
D7bdc:	wordi5	D7c42,"CASE",$02,L5ce9
D7be6:	wordi5	D7bef,"=IF",$02,L5ced
D7bef:	wordi5	D7bf8,"<IF",$02,L5cf1
D7bf8:	wordi5	D7c03,"NOTIF",$02,L5cf5
D7c03:	wordi5	D7c4d,"IF",$02,L5cf9
	wordi5	D7bab,"CASEWHILE",$02,L5cfd
	wordi5	,"=WHILE",$02,L5d03
	wordi5	,"<WHILE",$02,L5d09
	wordi5	,"NOTWHILE",$02,L5d0f
D7c37:	wordi5	,"WHILE.ITS",$02,L5d15
D7c42:	wordi5	D6a87,"WHILE",$02,L5d1b
D7c4d:	wordi5	D7b34,"ELSE",$02,L5d21
D7c57:	wordi5	D7c5e,"\\",$02,L5d28
D7c5e:	wordi5	D683c,"(",$02,L5d2e
	wordi5	D7c37,"DOES>",$02,L5d34
D7c70:	wordi5	,"ABORT\x22",$02,L5d41
D7c7b:	wordi5	D7c70,"?ABORT\x22",$02,L5d48

	fcb	$a2,$03,$81	; "O..H]..."
	fcb	$a3,$02,$45,$47,$86,$7c,$82,$2e	; "..EG.|.."
	fcb	$c1,$02,$4b,$47,$8d,$7c,$82,$2c	; "..KG.|.,"
	fcb	$d8,$02,$57,$47,$95,$7c,$82,$2c	; "..WG.|.,"
	fcb	$d9,$02,$5d,$47,$9d,$7c,$82,$58	; "..]G.|.X"
	fcb	$a9,$02,$63,$47,$a5,$7c,$82,$29	; "..cG.|.)"
	fcb	$d9,$02,$69,$47,$ad,$7c,$81,$a9	; "..iG.|.."
	fcb	$02,$6f,$47,$b5,$7c,$82,$23,$cc	; ".oG.|.#."
	fcb	$02,$75,$47,$bc,$7c,$82,$23,$c8	; ".uG.|.#."
	fcb	$02,$7c,$47,$c4,$7c,$83,$54,$4f	; ".|G.|.TO"
	fcb	$d0,$02,$8c,$47,$cc,$7c,$83,$53	; "...G.|.S"
	fcb	$45,$c3,$02,$91,$47,$d5

	fcb	$7c,$84	; "E...G.|."
	fcb	$43,$4c,$43,$ac,$02,$29,$48,$de	; "CLC..)H."

	fcb	$7c,$84,$53,$45,$43,$ac,$02,$2d	; "|.SEC..-"
	fcb	$48,$e8

	fcb	$7c,$84,$43,$4c,$49,$ac	; "H.|.CLI."
	fcb	$02,$31,$48,$f2

	fcb	$7c,$84,$53,$45	; ".1H.|.SE"
	fcb	$49,$ac,$02,$35,$48,$fc

	fcb	$7c,$84	; "I..5H.|."
	fcb	$4e,$4f,$50,$ac,$02,$39,$48,$06	; "NOP..9H."

	fcb	$7d,$84,$43,$4c,$56,$ac,$02,$3d	; "}.CLV..="
	fcb	$48,$10

	fcb	$7d,$84,$43,$4c,$44,$ac	; "H.}.CLD."
	fcb	$02,$41,$48,$1a

	fcb	$7d,$84,$53,$45	; ".AH.}.SE"
	fcb	$44,$ac,$02,$45,$48,$24

	fcb	$7d,$84	; "D..EH$}."
	fcb	$44,$45,$58,$ac,$02,$49,$48,$2e	; "DEX..IH."

	fcb	$7d,$84,$49,$4e,$58,$ac,$02,$4d	; "}.INX..M"
	fcb	$48,$38,$7d,$84,$44,$45,$59,$ac	; "H8}.DEY."
	fcb	$02,$51,$48,$42,$7d,$84,$49,$4e	; ".QHB}.IN"
	fcb	$59,$ac,$02,$55,$48,$4c,$7d,$84	; "Y..UHL}."
	fcb	$54,$41,$58,$ac,$02,$59,$48,$56	; "TAX..YHV"
	fcb	$7d,$84,$54,$58,$41,$ac,$02,$5d	; "}.TXA..]"
	fcb	$48,$60,$7d,$84,$54,$41,$59,$ac	; "H`}.TAY."
	fcb	$02,$61,$48,$6a,$7d,$84,$54,$59	; ".aHj}.TY"
	fcb	$41,$ac,$02,$65,$48,$74,$7d,$84	; "A..eHt}."
	fcb	$54,$58,$53,$ac,$02,$69,$48,$7e	; "TXS..iH~"
	fcb	$7d,$84,$54,$53,$58,$ac,$02,$6d	; "}.TSX..m"
	fcb	$48,$88,$7d,$84,$50,$48,$50,$ac	; "H.}.PHP."
	fcb	$02,$71,$48,$92,$7d,$84,$50,$4c	; ".qH.}.PL"
	fcb	$50,$ac,$02,$75,$48,$9c,$7d,$84	; "P..uH.}."
	fcb	$50,$48,$41,$ac,$02,$79,$48,$a6	; "PHA..yH."
	fcb	$7d,$84,$50,$4c,$41,$ac,$02,$7d	; "}.PLA..}"
	fcb	$48,$b0,$7d,$84,$52,$54,$53,$ac	; "H.}.RTS."
	fcb	$02,$81,$48,$ba,$7d,$84,$52,$54	; "..H.}.RT"
	fcb	$49,$ac,$02,$85,$48,$c4,$7d,$84	; "I...H.}."
	fcb	$4f,$52,$41,$ac,$02,$89,$48,$ce	; "ORA...H."
	fcb	$7d,$84,$41,$4e,$44,$ac,$02,$8e	; "}.AND..."
	fcb	$48,$d8,$7d,$84,$45,$4f,$52,$ac	; "H.}.EOR."
	fcb	$02,$93,$48,$e2,$7d,$84,$41,$44	; "..H.}.AD"
	fcb	$43,$ac,$02,$98,$48,$ec,$7d,$84	; "C...H.}."
	fcb	$53,$54,$41,$ac,$02,$9d,$48,$f6	; "STA...H."
	fcb	$7d,$84,$4c,$44,$41,$ac,$02,$a2	; "}.LDA..."
	fcb	$48,$00,$7e,$84,$43,$4d,$50,$ac	; "H.~.CMP."
	fcb	$02,$a7,$48,$0a,$7e,$84,$53,$42	; "..H.~.SB"
	fcb	$43,$ac,$02,$ac,$48,$14,$7e,$84	; "C...H.~."
	fcb	$41,$53,$4c,$ac,$02,$b1,$48,$1e	; "ASL...H."
	fcb	$7e,$84,$52,$4f,$4c,$ac,$02,$b6	; "~.ROL..."
	fcb	$48,$28,$7e,$84,$4c,$53,$52,$ac	; "H(~.LSR."
	fcb	$02,$bb,$48,$32,$7e,$84,$52,$4f	; "..H2~.RO"
	fcb	$52,$ac,$02,$c0,$48,$3c,$7e,$84	; "R...H<~."
	fcb	$44,$45,$43,$ac,$02,$c5,$48,$46	; "DEC...HF"
	fcb	$7e,$84,$49,$4e,$43,$ac,$02,$ca	; "~.INC..."
	fcb	$48,$50,$7e,$84,$4c,$44,$59,$ac	; "HP~.LDY."
	fcb	$02,$d4,$48,$5a,$7e,$84,$43,$50	; "..HZ~.CP"
	fcb	$58,$ac,$02,$d9,$48,$64,$7e,$84	; "X...Hd~."
	fcb	$43,$50,$59,$ac,$02,$de,$48,$6e	; "CPY...Hn"
	fcb	$7e,$84,$53,$54,$59,$ac,$02,$e8	; "~.STY..."
	fcb	$48,$78,$7e,$84,$42,$49,$54,$ac	; "Hx~.BIT."
	fcb	$02,$ed,$48,$82,$7e,$84,$4c,$44	; "..H.~.LD"
	fcb	$58,$ac,$02,$05,$49,$8c,$7e,$84	; "X...I.~."
	fcb	$53,$54,$58,$ac,$02,$0c,$49,$96	; "STX...I."
	fcb	$7e,$84,$4a,$4d,$50,$ac,$02,$13	; "~.JMP..."
	fcb	$49,$a0,$7e,$84,$4a,$53,$52,$ac	; "I.~.JSR."
	fcb	$02,$24,$49,$aa,$7e,$84,$42,$50	; ".$I.~.BP"
	fcb	$4c,$ac,$02,$6b,$49,$b4,$7e,$84	; "L..kI.~."
	fcb	$42,$4d,$49,$ac,$02,$6f,$49,$be	; "BMI..oI."
	fcb	$7e,$84,$42,$56,$43,$ac,$02,$73	; "~.BVC..s"
	fcb	$49,$c8,$7e,$84,$42,$56,$53,$ac	; "I.~.BVS."
	fcb	$02,$77,$49,$d2,$7e,$84,$42,$43	; ".wI.~.BC"
	fcb	$43,$ac,$02,$7b,$49,$dc,$7e,$84	; "C..{I.~."
	fcb	$42,$43,$53,$ac,$02,$7f,$49,$e6	; "BCS...I."
	fcb	$7e,$84,$42,$4e,$45,$ac,$02,$83	; "~.BNE..."
	fcb	$49,$f0,$7e,$84,$42,$45,$51,$ac	; "I.~.BEQ."
	fcb	$02,$87,$49,$fa,$7e,$83,$49,$46	; "..I.~.IF"
	fcb	$ac,$02,$8b,$49,$04,$7f,$85,$54	; "...I...T"
	fcb	$48,$45,$4e,$ac,$02,$92,$49,$0d	; "HEN...I."
	fcb	$7f,$86,$45,$4e,$44,$49,$c6,$02	; "..ENDI.."
	fcb	$92,$49,$18,$7f,$85,$45,$4c,$53	; ".I...ELS"
	fcb	$45,$ac,$02,$ad,$49,$23,$7f,$86	; "E...I#.."
	fcb	$42,$45,$47,$49,$ce,$02,$b9,$49	; "BEGI...I"
	fcb	$2e,$7f,$86,$55,$4e,$54,$49,$cc	; "...UNTI."
	fcb	$02,$bd,$49,$39,$7f,$86,$41,$47	; "..I9..AG"
	fcb	$41,$49,$ce,$02,$cc,$49,$44,$7f	; "AI...ID."
	fcb	$86,$57,$48,$49,$4c,$c5,$02,$d5	; ".WHIL..."
	fcb	$49,$4f,$7f,$87,$52,$45,$50,$45	; "IO..REPE"
	fcb	$c1,$02,$d9,$49,$5a,$7f,$86,$50	; "...IZ..P"
	fcb	$55,$54,$54,$d2,$02,$ee,$49,$65	; "UTT...Ie"
	fcb	$7f,$86,$50,$55,$54,$46,$cc,$02	; "..PUTF.."
	fcb	$f2,$49,$70,$7f,$84,$43,$50,$55	; ".Ip..CPU"
	fcb	$d4,$02,$f6,$49,$7b,$7f,$85,$43	; "...I{..C"
	fcb	$50,$55,$53,$c8,$02,$fa,$49,$85	; "PUS...I."
	fcb	$7f,$86,$50,$4f,$50,$50,$d5,$02	; "..POPP.."
	fcb	$fe,$49,$90,$7f,$84,$32,$50,$4f	; ".I...2PO"
	fcb	$d0,$02,$02,$4a,$9b,$7f,$83,$50	; "...J...P"
	fcb	$55,$d4,$02,$06,$4a,$a5,$7f,$83	; "U...J..."
	fcb	$50,$4f,$d0,$02,$0a,$4a,$ae,$7f	; "PO...J.."
	fcb	$84,$50,$55,$53,$c8,$02,$0e,$4a	; ".PUS...J"
	fcb	$b7,$7f,$83,$4e,$4f,$d4,$02,$4f	; "...NO..O"
	fcb	$5d,$c1,$7f,$82,$30,$bd,$02,$52	; "]...0..R"
	fcb	$5d,$ca,$7f,$82,$30,$bc,$02,$55	; "]...0..U"
	fcb	$5d,$d2,$7f,$82,$43,$d3,$02,$58	; "]...C..X"
	fcb	$5d,$da,$7f,$82,$56,$d3,$02,$5b	; "]...V..["
	fcb	$5d

	fcb	"by JWA V.D. Vuurst"

	fcb	$74,$01,$2a,$20
