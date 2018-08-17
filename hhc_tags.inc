; tag table 0 (short tags $00..$bf)
	tt_start $00

tag_table_0:
	def_tag	exit		; EXIT
	def_tag	esc1
	def_tag	esc2
	def_tag	esc3
	def_tag	esc4
	def_tag	esc5
	def_tag	esc6
	def_tag	esc7
	def_tag	esc8
	def_tag	nop		; NOP
	def_tag wait		; WAIT
	def_tag waitm		; WAITM
	def_tag p_call		; (CALL)
	def_tag	p_semi_p	; (;P)
	def_tag 2drop		; 2DROP
	def_tag	drop		; DROP
	def_tag set_ram		; SET.RAM
	def_tag	lit		; LIT
	def_tag clit3		; CLIT3
	def_tag clit2		; CLIT2
	def_tag	clit		; CLIT
	def_tag at		; @
	def_tag bang		; !
	def_tag c_at		; C@
	def_tag	c_bang		; C!
	def_tag	plus_bang	; +!
	def_tag	query_dup	; ?DUP
	def_tag dup		; DUP
	def_tag	over		; OVER
	def_tag	pick		; PICK
	def_tag plus_c_bang	; +C!
	def_tag	sp_at		; SP@
	def_tag	rot		; ROT
	def_tag	roll		; ROLL
	def_tag	swap		; SWAP
	def_tag to_r		; >R
	def_tag	r_to		; R>
	def_tag r		; R
	def_tag	2_to_r		; 2>R
	def_tag	2_r_to		; 2R>
	def_tag	not		; NOT or 0=
t_0_equal	equ	t_not
	def_tag	0_less_than	; 0<
	def_tag	9		; 9
	def_tag	8		; 8
	def_tag	7		; 7
	def_tag	6		; 6
	def_tag	5		; 5
	def_tag	4		; 4
	def_tag	3		; 3
	def_tag	2		; 2
	def_tag	1		; 1
	def_tag	0		; 0
	def_tag	minus_1		; -1
	def_tag	20h		; 20H
	def_tag	30h		; 30H
	def_tag	80h		; 80H
	def_tag falsify		; FALSIFY
	def_tag	and		; AND
	def_tag	or		; OR
	def_tag	i		; I
	def_tag	flip		; FLIP or ><
	def_tag	plus		; +
	def_tag	minus		; -
	def_tag	2_minus		; 2-
	def_tag	1_minus		; 1-
	def_tag 2_plus		; 2+
	def_tag	1_plus		; 1+
	def_tag	2_times		; 2*
	def_tag	pushkey		; PUSHKEY
	def_tag	set_bits	; SET.BITS
	def_tag	clr_bits	; CLR.BITS
	def_tag	execute		; EXECUTE
	def_tag	equal_to	; =
	def_tag	not_equal_to	; <>
	def_tag	less_than	; <
	def_tag	greater_than	; >
	def_tag	p_if		; (IF)
	def_tag	p_until		; (UNTIL)
	def_tag	p_notif		; (NOTIF)
	def_tag	p_if_its	; (IF.ITS)
	def_tag	p_eq_if		; (=IF)
	def_tag	p_less_if	; (<IF)
	def_tag	p_else		; (ELSE)
	def_tag	p_again		; (AGAIN)
	def_tag	p_do		; (DO)
	def_tag	leave		; LEAVE
	def_tag	p_plus_loop	; (+LOOP)
	def_tag	p_loop		; (LOOP)
	def_tag	p_case		; (CASE)
	def_tag	p_query_do	; (?DO)
	def_tag	query_range	; ?RANGE
	def_tag	bin_to_ascii	; B>A
	def_tag	2over		; 2OVER
	def_tag	2dup		; 2DUP
	def_tag	2at		; 2@
	def_tag	2bang		; 2!
	def_tag	swapdrop	; SWAPDROP or UNDER
	def_tag	fdrop		; FDROP
	def_tag	times		; *
	def_tag	negate		; NEGATE
	def_tag	abs		; ABS
	def_tag	d_plus		; D+
	def_tag	max		; MAX
	def_tag	min		; MIN
	def_tag	s_to_d		; S>D
	def_tag	div_mod		; /MOD
	def_tag	m_div_mod	; M/MOD
	def_tag	mod		; MOD
	def_tag	shift		; SHIFT
	def_tag	charbuf		; CHARBUF
	def_tag	cancel		; CANCEL
	def_tag	move		; MOVE
	def_tag	set_delay	; SET.DELAY
	def_tag	encode		; ENCODE
	def_tag	posn		; POSN
	def_tag	scroll		; SCROLL
	def_tag	p_emit		; (EMIT)
	def_tag	key		; KEY
	def_tag	emit		; EMIT
	def_tag	beep		; BEEP
	def_tag	type		; TYPE
	def_tag	count		; COUNT
	def_tag	p_dot_quote	; (.")
	def_tag	emit_esc	; EMIT.ESC
	def_tag	query_key	; ?KEY
	def_tag	space		; SPACE
	def_tag	cr		; CR
	def_tag	fast_cr		; FAST.CR
	def_tag	hold		; HOLD
	def_tag	cfile		; CFILE
	def_tag	tag_82
	def_tag	menu_driver	; MENU-DRIVER
	def_tag	fileorg		; FILEORG
	def_tag	nfiles		; NFILES
	def_tag	flim		; FLIM
	def_tag	fio_err		; FIO-ERR
	def_tag	rec_cnt		; REC-CNT
	def_tag	insert		; INSERT
	def_tag	query_enough_room	; ?ENOUGH-ROOM
	def_tag	ccnt		; CCNT
	def_tag	curpos		; CURPOS
	def_tag	bufpos		; BUFPOS
	def_tag	tag_8e
	def_tag	tag_8f
	def_tag	tag_90
	def_tag	tag_91
	def_tag	tag_92
	def_tag	tag_93
	def_tag	fstandtype	; FSTANDTYPE
	def_tag	10exp		; 10EXP
	def_tag	tag_96
	def_tag	tag_97
	def_tag	tag_98
	def_tag	tag_99
	def_tag	tag_9a
	def_tag	tag_9b
	def_tag	tag_9c
	def_tag	tag_9d
	def_tag	tag_9e
	def_tag	tag_9f
	def_tag	tag_a0
	def_tag	tag_a1
	def_tag	tag_a2
	def_tag	tag_a3
	def_tag	set_rom
	def_tag	num_decb	; #DECB
	def_tag	xor		; XOR
	def_tag	tag_a7		; disable interrupts, saves status in z72
	def_tag	tag_a8		; restore status from z72
	def_tag	bounds		; BOUNDS
	def_tag	2swap		; 2SWAP
	def_tag	u_times		; U*
	def_tag	s_d_times	; SD*
	def_tag	get_local	; GET.LOCAL
	def_tag	set_delay_long	; SET.DELAY.LONG
	def_tag	string_plus	; S+
	def_tag	updisp		; UPDISP
	def_tag	refresh		; REFRESH
	def_tag	rop		; ROP
	def_tag	smart_posn	; SMART-POSN
	def_tag	ascii_to_bin	; A>B
	def_tag	soft_clr	; SOFT.CLR
	def_tag	tag_b6
	def_tag	used		; USED
	def_tag	query_room	; ?ROOM
	def_tag	plus_used	; +USED
	def_tag	nrec		; NREC
	def_tag	tag_bb
	def_tag	expect		; EXPECT
	def_tag	tag_bd
	def_tag	f_plus		; F+
	def_tag	tag_bf

; tag table 1 (long tags $100..$1cb)
	tt_start $100

	def_tag	tag_100
	def_tag	tag_101
	def_tag tag_102
	def_tag	tag_103
	def_tag	tag_104
	def_tag tag_105
	def_tag	set_timer	; SET.TIMER
	def_tag	turn_off	; TURN.OFF
	def_tag	orblip		; ORBLIP
	def_tag	andblip		; ANDBLIP
	def_tag	set_ctrl	; SET.CTRL
	def_tag	abort		; ABORT
	def_tag	set_sp		; SET.SP
	def_tag	rp_bang		; RP!
	def_tag	rp_at		; RP@
	def_tag	set_rp		; SET.RP
	def_tag	k		; K
	def_tag	j		; J
	def_tag	2_div		; 2/
	def_tag	toggle		; TOGGLE
	def_tag	save		; SAVE
	def_tag	restore		; RESTORE
	def_tag	crestore	; CRESTORE
	def_tag	u_less_than	; U<
	def_tag	query_jump	; ?JUMP
	def_tag	jump		; JUMP
	def_tag	lower_to_upper	; L>U
	def_tag	2roll		; 2ROLL
	def_tag	2pick		; 2PICK
	def_tag	2rot		; 2ROT
	def_tag	fdup		; FDUP
	def_tag	fswap		; FSWAP
	def_tag	fover		; FOVER
	def_tag	um_div		; UM/
	def_tag	dnegate		; DNEGATE
	def_tag	m_times		; M*
	def_tag	d_minus		; D-
	def_tag	d_equals	; D=
	def_tag	ud_less_than	; UD<
	def_tag	ud_min		; UDMIN
	def_tag	dabs		; DABS
	def_tag	m_div		; M/
	def_tag	times_div_mod	; */MOD
	def_tag	div		; /
	def_tag	flee		; FLEE
	def_tag	dmove		; DMOVE
	def_tag	cmove		; CMOVE
	def_tag	setbanks	; SETBANKS
	def_tag	bigmove		; BIGMOVE
	def_tag	fill		; FILL
	def_tag	erase		; ERASE
	def_tag	blanks		; BLANKS
	def_tag	jump_tab	; <JUMP-TAB>
	def_tag	get_gmt		; GET.GMT
	def_tag	attachx		; ATTACHX
	def_tag	attach		; ATTACH
	def_tag	set_crom	; SET.CROM
	def_tag	flee_cap	; FLEE.CAP
	def_tag	flee_crom	; FLEE.CROM
	def_tag	locate		; LOCATE
	def_tag	cfind		; CFIND
	def_tag	string_equal	; S=
	def_tag	tag_13e
	def_tag	tag_13f
	def_tag	tag_140
	def_tag	ins_ch_r	; INS.CH.R
	def_tag	del_ch_r	; DEL.CH.R
	def_tag	set_inv		; SET.INV
	def_tag	unset_inv	; UNSET.INV
	def_tag	set_flsh	; SET.FLSH
	def_tag	unset_flsh	; UNSET.FLSH
	def_tag	scrolr		; SCROLR
	def_tag	squeak		; SQUEAK
	def_tag	lcd_cr		; LCD.CR
	def_tag	cgrtn		; CGRTN
	def_tag	disp_ch		; DISP.CH
	def_tag	rctl		; RCTL
	def_tag	rip		; RIP
	def_tag	rclose		; RCLOSE
	def_tag	ropen		; ROPEN
	def_tag	nap		; NAP
	def_tag	p_key		; (KEY)
	def_tag	all_emit	; ALL-EMIT
	def_tag	flame_on	; FLAME.ON
	def_tag	spaces		; SPACES
	def_tag	start_cursor	; START.CURSOR
	def_tag	stop_cursor	; STOP.CURSOR
	def_tag	hard_clr	; HARD.CLR
	def_tag	clear		; CLEAR
	def_tag	kbsave		; KBSAVE
	def_tag	kbrest		; KBREST
	def_tag	save_key	; SAVE.KEY
	def_tag	save_task	; SAVE.TASK
	def_tag	rest_key	; REST.KEY
	def_tag	restore_ram	; RESTORE.RAM
	def_tag	restore_task	; RESTORE.TASK
	def_tag	soft_emit	; SOFT.EMIT
	def_tag	sizeram		; SIZERAM
	def_tag	cold_start	; COLD.START
	def_tag	can_list	; CAN.LIST
	def_tag	langle_hash	; <#
	def_tag	hash_rangle	; #>
	def_tag	sign		; SIGN
	def_tag	hash		; #
	def_tag	hash_s		; #S
	def_tag	p_d_dot		; (D.)
	def_tag	d_dot_r		; D.R
	def_tag	dot_r		; .R
	def_tag	dot		; .
	def_tag	grab		; GRAB
	def_tag	tpsafe_query	; TPSAFE?
	def_tag	letgo		; LETGO
	def_tag	t_bang		; T!
	def_tag	secs		; SECS
	def_tag	loc_nxt_cap	; LOC.NXT.CAP
	def_tag	loc_prg		; LOC.PRG
	def_tag	ram_n		; RAM.N
	def_tag	dvcset		; DVCSET
	def_tag	tag_176
	def_tag	tag_177
	def_tag	tag_178
	def_tag	tag_179
	def_tag	query_key_hit	; ?KEY-HIT
	def_tag	never		; NEVER
	def_tag	at_sa		; @SA
	def_tag	typedrop	; TYPEDROP
	def_tag	fspace		; FSPACE
	def_tag	filelen		; FILELEN
	def_tag	fudge_flim	; FUDGE-FLIM
	def_tag	avail		; AVAIL
	def_tag	rec_move	; REC-MOVE
	def_tag	expand		; EXPAND
	def_tag	shrink		; SHRINK
	def_tag	revise		; REVISE
	def_tag	read		; READ
	def_tag	write		; WRITE
	def_tag	lookup		; LOOKUP
	def_tag	query_file	; ?FILE
	def_tag	make		; MAKE
	def_tag	open		; OPEN
	def_tag	delete_file	; DELETE-FILE
	def_tag	delete		; DELETE
	def_tag	make_room	; MAKE-ROOM
	def_tag	tag_18f
	def_tag	dot_no_room	; .NO-ROOM
	def_tag	file_tag	; FILE-TAG
	def_tag	query_visible	; ?VISIBLE
	def_tag	e_l		; E-L
	def_tag	dot_file	; .FILE
	def_tag	open_file	; OPEN-FILE
	def_tag	tag_196
	def_tag	eol		; EOL
	def_tag	lbuf		; LBUF
	def_tag	llen		; LLEN
	def_tag	set_blips	; SET-BLIPS
	def_tag	edit_file	; EDIT-FILE
	def_tag	tag_19c
	def_tag	tag_19d
	def_tag	tag_19e
	def_tag	move_it		; MOVE-IT
	def_tag	copy_file	; COPY-FILE
	def_tag	do_edit		; DO-EDIT
	def_tag	new_file	; NEW-FILE
	def_tag	tag_1a3
	def_tag	tag_1a4
	def_tag	tag_1a5
	def_tag	fnegate		; FNEGATE
	def_tag	f_minus		; F-
	def_tag	f_less_than	; F<
	def_tag	fabs		; FABS
	def_tag	f_bang		; F!
	def_tag	f_times		; F*
	def_tag	f_div		; F/
	def_tag	fround		; FROUND
	def_tag	f_num		; F#
	def_tag	fp_to_ascii	; FP>ASC
	def_tag	f_dot		; F.
	def_tag	f_dot_ext	; F.EXT
	def_tag	ascii_to_fp	; ASC>FP
	def_tag	tag_1b3
	def_tag	cemit		; CEMIT
	def_tag	calc		; CALC
	def_tag	tag_1b6
	def_tag	s_dot_t		; S.T
	def_tag	tag_1b8
	def_tag	e_dot_t		; E.T
	def_tag	set_time	; STM
	def_tag	show_time	; SHOW.TIME
	def_tag	tag_1bc
	def_tag	tag_1bd
	def_tag	tag_1be
	def_tag	tag_1bf
	def_tag	intaps		; INTAPS
	def_tag	tag_1c1
	def_tag	tag_1c2
	def_tag	tag_1c3
	def_tag	tag_1c4
	def_tag	tag_1c5
	def_tag	p_fileorg	; (FILEORG)
	def_tag	flit		; FLIT
	def_tag	query_sf	; ?SF
	def_tag	ks		; KS
	def_tag	snap_file	; SNAP-FILE
	def_tag	reloc		; RELOC
