; tag table 0 (short tags $00..$bf)
	tt_start $00

tag_table_0:
	def_tgn	$00,exit		; EXIT
	def_tag	esc1
	def_tag	esc2
	def_tag	esc3
	def_tag	esc4
	def_tag	esc5
	def_tag	esc6
	def_tag	esc7
	def_tag	esc8
	def_tgn	$09,nop			; NOP
	def_tgn $0a,wait		; WAIT
	def_tgn $0b,waitm		; WAITM
	def_tgn $0c,p_call		; (CALL)
	def_tgn	$0d,p_semi_p		; (;P)
	def_tgn $0e,2drop		; 2DROP
	def_tgn	$0f,drop		; DROP
	def_tgn $10,set_ram		; SET.RAM
	def_tgn	$11,lit			; LIT
	def_tgn $12,clit3		; CLIT3
	def_tgn $13,clit2		; CLIT2
	def_tgn	$14,clit		; CLIT
	def_tgn $15,at			; @
	def_tgn $16,bang		; !
	def_tgn $17,c_at		; C@
	def_tgn	$18,c_bang		; C!
	def_tgn	$19,plus_bang		; +!
	def_tgn	$1a,query_dup		; ?DUP
	def_tgn $1b,dup			; DUP
	def_tgn	$1c,over		; OVER
	def_tgn	$1d,pick		; PICK
	def_tgn $1e,plus_c_bang		; +C!
	def_tgn	$1f,sp_at		; SP@
	def_tgn	$20,rot			; ROT
	def_tgn	$21,roll		; ROLL
	def_tgn	$22,swap		; SWAP
	def_tgn $23,to_r		; >R
	def_tgn	$24,r_to		; R>
	def_tgn $25,r			; R
	def_tgn	$26,2_to_r		; 2>R
	def_tgn	$27,2_r_to		; 2R>
	def_tgn	$28,not			; NOT or 0=
t_0_equal	equ	t_not
	def_tgn	$29,0_less_than		; 0<
	def_tgn	$2a,9			; 9
	def_tgn	$2b,8			; 8
	def_tgn	$2c,7			; 7
	def_tgn	$2d,6			; 6
	def_tgn	$2e,5			; 5
	def_tgn	$2f,4			; 4
	def_tgn	$30,3			; 3
	def_tgn	$31,2			; 2
	def_tgn	$32,1			; 1
	def_tgn	$33,0			; 0
	def_tgn	$34,minus_1		; -1
	def_tgn	$35,20h			; 20H
	def_tgn	$36,30h			; 30H
	def_tgn	$37,80h			; 80H
	def_tgn $38,falsify		; FALSIFY
	def_tgn	$39,and			; AND
	def_tgn	$3a,or			; OR
	def_tgn	$3b,i			; I
	def_tgn	$3c,flip		; FLIP or ><
	def_tgn	$3d,plus		; +
	def_tgn	$3e,minus		; -
	def_tgn	$3f,2_minus		; 2-
	def_tgn	$40,1_minus		; 1-
	def_tgn $41,2_plus		; 2+
	def_tgn	$42,1_plus		; 1+
	def_tgn	$43,2_times		; 2*
	def_tgn	$44,pushkey		; PUSHKEY
	def_tgn	$45,set_bits		; SET.BITS
	def_tgn	$46,clr_bits		; CLR.BITS
	def_tgn	$47,execute		; EXECUTE
	def_tgn	$48,equal_to		; =
	def_tgn	$49,not_equal_to	; <>
	def_tgn	$4a,less_than		; <
	def_tgn	$4b,greater_than	; >
	def_tgn	$4c,p_if		; (IF)
	def_tgn	$4d,p_until		; (UNTIL)
	def_tgn	$4e,p_notif		; (NOTIF)
	def_tgn	$4f,p_if_its		; (IF.ITS)
	def_tgn	$50,p_eq_if		; (=IF)
	def_tgn	$51,p_less_if		; (<IF)
	def_tgn	$52,p_else		; (ELSE)
	def_tgn	$53,p_again		; (AGAIN)
	def_tgn	$54,p_do		; (DO)
	def_tgn	$55,leave		; LEAVE
	def_tgn	$56,p_plus_loop		; (+LOOP)
	def_tgn	$57,p_loop		; (LOOP)
	def_tgn	$58,p_case		; (CASE)
	def_tgn	$59,p_query_do		; (?DO)
	def_tgn	$5a,query_range		; ?RANGE
	def_tgn	$5b,bin_to_ascii	; B>A
	def_tgn	$5c,2over		; 2OVER
	def_tgn	$5d,2dup		; 2DUP
	def_tgn	$5e,2at			; 2@
	def_tgn	$5f,2bang		; 2!
	def_tgn	$60,swapdrop		; SWAPDROP or UNDER
	def_tgn	$61,fdrop		; FDROP
	def_tgn	$62,times		; *
	def_tgn	$63,negate		; NEGATE
	def_tgn	$64,abs			; ABS
	def_tgn	$65,d_plus		; D+
	def_tgn	$66,max			; MAX
	def_tgn	$67,min			; MIN
	def_tgn	$68,s_to_d		; S>D
	def_tgn	$69,div_mod		; /MOD
	def_tgn	$6a,m_div_mod		; M/MOD
	def_tgn	$6b,mod			; MOD
	def_tgn	$6c,shift		; SHIFT
	def_tgn	$6d,charbuf		; CHARBUF
	def_tgn	$6e,cancel		; CANCEL
	def_tgn	$6f,move		; MOVE
	def_tgn	$70,set_delay		; SET.DELAY
	def_tgn	$71,encode		; ENCODE
	def_tgn	$72,posn		; POSN
	def_tgn	$73,scroll		; SCROLL
	def_tgn	$74,p_emit		; (EMIT)
	def_tgn	$75,key			; KEY
	def_tgn	$76,emit		; EMIT
	def_tgn	$77,beep		; BEEP
	def_tgn	$78,type		; TYPE
	def_tgn	$79,count		; COUNT
	def_tgn	$7a,p_dot_quote		; (.")
	def_tgn	$7b,emit_esc		; EMIT.ESC
	def_tgn	$7c,query_key		; ?KEY
	def_tgn	$7d,space		; SPACE
	def_tgn	$7e,cr			; CR
	def_tgn	$7f,fast_cr		; FAST.CR
	def_tgn	$80,hold		; HOLD
	def_tgn	$81,cfile		; CFILE
	def_tgn	$82,tag_82
	def_tgn	$83,menu_driver		; MENU-DRIVER
	def_tgn	$84,fileorg		; FILEORG
	def_tgn	$85,nfiles		; NFILES
	def_tgn	$86,flim		; FLIM
	def_tgn	$87,fio_err		; FIO-ERR
	def_tgn	$88,rec_cnt		; REC-CNT
	def_tgn	$89,insert		; INSERT
	def_tgn	$8a,query_enough_room	; ?ENOUGH-ROOM
	def_tgn	$8b,ccnt		; CCNT
	def_tgn	$8c,curpos		; CURPOS
	def_tgn	$8d,bufpos		; BUFPOS
	def_tgn	$8e,tag_8e
	def_tgn	$8f,tag_8f
	def_tgn	$90,tag_90
	def_tgn	$91,tag_91
	def_tgn	$92,tag_92
	def_tgn	$93,tag_93
	def_tgn	$94,fstandtype		; FSTANDTYPE
	def_tgn	$95,10exp		; 10EXP
	def_tgn	$96,tag_96
	def_tgn	$97,tag_97
	def_tgn	$98,tag_98
	def_tgn	$99,tag_99
	def_tgn	$9a,tag_9a
	def_tgn	$9b,tag_9b
	def_tgn	$9c,tag_9c
	def_tgn	$9d,tag_9d
	def_tgn	$9e,tag_9e
	def_tgn	$9f,tag_9f
	def_tgn	$a0,tag_a0
	def_tgn	$a1,tag_a1
	def_tgn	$a2,tag_a2
	def_tgn	$a3,tag_a3
	def_tgn	$a4,set_rom
	def_tgn	$a5,num_decb		; #DECB
	def_tgn	$a6,xor			; XOR
	def_tgn	$a7,tag_a7		; disable interrupts, saves status in z72
	def_tgn	$a8,tag_a8		; restore status from z72
	def_tgn	$a9,bounds		; BOUNDS
	def_tgn	$aa,2swap		; 2SWAP
	def_tgn	$ab,u_times		; U*
	def_tgn	$ac,s_d_times		; SD*
	def_tgn	$ad,get_local		; GET.LOCAL
	def_tgn	$ae,set_delay_long	; SET.DELAY.LONG
	def_tgn	$af,string_plus	; S+
	def_tgn	$b0,updisp		; UPDISP
	def_tgn	$b1,refresh		; REFRESH
	def_tgn	$b2,rop			; ROP
	def_tgn	$b3,smart_posn		; SMART-POSN
	def_tgn	$b4,ascii_to_bin	; A>B
	def_tgn	$b5,soft_clr		; SOFT.CLR
	def_tgn	$b6,tag_b6
	def_tgn	$b7,used		; USED
	def_tgn	$b8,query_room		; ?ROOM
	def_tgn	$b9,plus_used		; +USED
	def_tgn	$ba,nrec		; NREC
	def_tgn	$bb,tag_bb
	def_tgn	$bc,expect		; EXPECT
	def_tgn	$bd,tag_bd
	def_tgn	$be,f_plus		; F+
	def_tgn	$bf,f_at		; F@

; tag table 1 (long tags $100..$1cb)
	tt_start $100

	def_tgn	$100,tag_100
	def_tgn	$101,tag_101
	def_tgn $102,tag_102
	def_tgn	$103,tag_103
	def_tgn	$104,tag_104
	def_tgn $105,tag_105
	def_tgn	$106,set_timer		; SET.TIMER
	def_tgn	$107,turn_off		; TURN.OFF
	def_tgn	$108,orblip		; ORBLIP
	def_tgn	$109,andblip		; ANDBLIP
	def_tgn	$10a,set_ctrl		; SET.CTRL
	def_tgn	$10b,abort		; ABORT
	def_tgn	$10c,set_sp		; SET.SP
	def_tgn	$10d,rp_bang		; RP!
	def_tgn	$10e,rp_at		; RP@
	def_tgn	$10f,set_rp		; SET.RP
	def_tgn	$110,k			; K
	def_tgn	$111,j			; J
	def_tgn	$112,2_div		; 2/
	def_tgn	$113,toggle		; TOGGLE
	def_tgn	$114,save		; SAVE
	def_tgn	$115,restore		; RESTORE
	def_tgn	$116,crestore		; CRESTORE
	def_tgn	$117,u_less_than	; U<
	def_tgn	$118,query_jump		; ?JUMP
	def_tgn	$119,jump		; JUMP
	def_tgn	$11a,lower_to_upper	; L>U
	def_tgn	$11b,2roll		; 2ROLL
	def_tgn	$11c,2pick		; 2PICK
	def_tgn	$11d,2rot		; 2ROT
	def_tgn	$11e,fdup		; FDUP
	def_tgn	$11f,fswap		; FSWAP
	def_tgn	$120,fover		; FOVER
	def_tgn	$121,um_div		; UM/
	def_tgn	$122,dnegate		; DNEGATE
	def_tgn	$123,m_times		; M*
	def_tgn	$124,d_minus		; D-
	def_tgn	$125,d_equals		; D=
	def_tgn	$126,ud_less_than	; UD<
	def_tgn	$127,ud_min		; UDMIN
	def_tgn	$128,dabs		; DABS
	def_tgn	$129,m_div		; M/
	def_tgn	$12a,times_div_mod	; */MOD
	def_tgn	$12b,div		; /
	def_tgn	$12c,flee		; FLEE
	def_tgn	$12d,dmove		; DMOVE
	def_tgn	$12e,cmove		; CMOVE
	def_tgn	$12f,setbanks		; SETBANKS
	def_tgn	$130,bigmove		; BIGMOVE
	def_tgn	$131,fill		; FILL
	def_tgn	$132,erase		; ERASE
	def_tgn	$133,blanks		; BLANKS
	def_tgn	$134,jump_tab		; <JUMP-TAB>
	def_tgn	$135,get_gmt		; GET.GMT
	def_tgn	$136,attachx		; ATTACHX
	def_tgn	$137,attach		; ATTACH
	def_tgn	$138,set_crom		; SET.CROM
	def_tgn	$139,flee_cap		; FLEE.CAP
	def_tgn	$13a,flee_crom		; FLEE.CROM
	def_tgn	$13b,locate		; LOCATE
	def_tgn	$13c,cfind		; CFIND
	def_tgn	$13d,string_equal	; S=
	def_tgn	$13e,tag_13e
	def_tgn	$13f,tag_13f
	def_tgn	$140,tag_140
	def_tgn	$141,ins_ch_r		; INS.CH.R
	def_tgn	$142,del_ch_r		; DEL.CH.R
	def_tgn	$143,set_inv		; SET.INV
	def_tgn	$144,unset_inv		; UNSET.INV
	def_tgn	$145,set_flsh		; SET.FLSH
	def_tgn	$146,unset_flsh		; UNSET.FLSH
	def_tgn	$147,scrolr		; SCROLR
	def_tgn	$148,squeak		; SQUEAK
	def_tgn	$149,lcd_cr		; LCD.CR
	def_tgn	$14a,cgrtn		; CGRTN
	def_tgn	$14b,disp_ch		; DISP.CH
	def_tgn	$14c,rctl		; RCTL
	def_tgn	$14d,rip		; RIP
	def_tgn	$14e,rclose		; RCLOSE
	def_tgn	$14f,ropen		; ROPEN
	def_tgn	$150,nap		; NAP
	def_tgn	$151,p_key		; (KEY)
	def_tgn	$152,all_emit		; ALL-EMIT
	def_tgn	$153,flame_on		; FLAME.ON
	def_tgn	$154,spaces		; SPACES
	def_tgn	$155,start_cursor	; START.CURSOR
	def_tgn	$156,stop_cursor	; STOP.CURSOR
	def_tgn	$157,hard_clr		; HARD.CLR
	def_tgn	$158,clear		; CLEAR
	def_tgn	$159,kbsave		; KBSAVE
	def_tgn	$15a,kbrest		; KBREST
	def_tgn	$15b,save_key		; SAVE.KEY
	def_tgn	$15c,save_task		; SAVE.TASK
	def_tgn	$15d,rest_key		; REST.KEY
	def_tgn	$15e,restore_ram	; RESTORE.RAM
	def_tgn	$15f,restore_task	; RESTORE.TASK
	def_tgn	$160,soft_emit		; SOFT.EMIT
	def_tgn	$161,sizeram		; SIZERAM
	def_tgn	$162,cold_start		; COLD.START
	def_tgn	$163,can_list		; CAN.LIST
	def_tgn	$164,langle_hash	; <#
	def_tgn	$165,hash_rangle	; #>
	def_tgn	$166,sign		; SIGN
	def_tgn	$167,hash		; #
	def_tgn	$168,hash_s		; #S
	def_tgn	$169,p_d_dot		; (D.)
	def_tgn	$16a,d_dot_r		; D.R
	def_tgn	$16b,dot_r		; .R
	def_tgn	$16c,dot		; .
	def_tgn	$16d,grab		; GRAB
	def_tgn	$16e,tpsafe_query	; TPSAFE?
	def_tgn	$16f,letgo		; LETGO
	def_tgn	$170,t_bang		; T!
	def_tgn	$171,secs		; SECS
	def_tgn	$172,loc_nxt_cap	; LOC.NXT.CAP
	def_tgn	$173,loc_prg		; LOC.PRG
	def_tgn	$174,ram_n		; RAM.N
	def_tgn	$175,dvcset		; DVCSET
	def_tgn	$176,tag_176
	def_tgn	$177,tag_177
	def_tgn	$178,tag_178
	def_tgn	$179,tag_179
	def_tgn	$17a,query_key_hit	; ?KEY-HIT
	def_tgn	$17b,never		; NEVER
	def_tgn	$17c,at_sa		; @SA
	def_tgn	$17d,typedrop		; TYPEDROP
	def_tgn	$17e,fspace		; FSPACE
	def_tgn	$17f,filelen		; FILELEN
	def_tgn	$180,fudge_flim		; FUDGE-FLIM
	def_tgn	$181,avail		; AVAIL
	def_tgn	$182,rec_move		; REC-MOVE
	def_tgn	$183,expand		; EXPAND
	def_tgn	$184,shrink		; SHRINK
	def_tgn	$185,revise		; REVISE
	def_tgn	$186,read		; READ
	def_tgn	$187,write		; WRITE
	def_tgn	$188,lookup		; LOOKUP
	def_tgn	$189,query_file		; ?FILE
	def_tgn	$18a,make		; MAKE
	def_tgn	$18b,open		; OPEN
	def_tgn	$18c,delete_file	; DELETE-FILE
	def_tgn	$18d,delete		; DELETE
	def_tgn	$18e,make_room		; MAKE-ROOM
	def_tgn	$18f,tag_18f
	def_tgn	$190,dot_no_room	; .NO-ROOM
	def_tgn	$191,file_tag		; FILE-TAG
	def_tgn	$192,query_visible	; ?VISIBLE
	def_tgn	$193,e_l		; E-L
	def_tgn	$194,dot_file		; .FILE
	def_tgn	$195,open_file		; OPEN-FILE
	def_tgn	$196,tag_196
	def_tgn	$197,eol		; EOL
	def_tgn	$198,lbuf		; LBUF
	def_tgn	$199,llen		; LLEN
	def_tgn	$19a,set_blips		; SET-BLIPS
	def_tgn	$19b,edit_file		; EDIT-FILE
	def_tgn	$19c,tag_19c
	def_tgn	$19d,tag_19d
	def_tgn	$19e,tag_19e
	def_tgn	$19f,move_it		; MOVE-IT
	def_tgn	$1a0,copy_file		; COPY-FILE
	def_tgn	$1a1,do_edit		; DO-EDIT
	def_tgn	$1a2,new_file		; NEW-FILE
	def_tgn	$1a3,tag_1a3
	def_tgn	$1a4,tag_1a4
	def_tgn	$1a5,tag_1a5
	def_tgn	$1a6,fnegate		; FNEGATE
	def_tgn	$1a7,f_minus		; F-
	def_tgn	$1a8,f_less_than	; F<
	def_tgn	$1a9,fabs		; FABS
	def_tgn	$1aa,f_bang		; F!
	def_tgn	$1ab,f_times		; F*
	def_tgn	$1ac,f_div		; F/
	def_tgn	$1ad,fround		; FROUND
	def_tgn	$1ae,f_num		; F#
	def_tgn	$1af,fp_to_ascii	; FP>ASC
	def_tgn	$1b0,f_dot		; F.
	def_tgn	$1b1,f_dot_ext		; F.EXT
	def_tgn	$1b2,ascii_to_fp	; ASC>FP
	def_tgn	$1b3,tag_1b3
	def_tgn	$1b4,cemit		; CEMIT
	def_tgn	$1b5,calc		; CALC
	def_tgn	$1b6,tag_1b6
	def_tgn	$1b7,s_dot_t		; S.T
	def_tgn	$1b8,tag_1b8
	def_tgn	$1b9,e_dot_t		; E.T
	def_tgn	$1ba,set_time		; STM
	def_tgn	$1bb,show_time		; SHOW.TIME
	def_tgn	$1bc,tag_1bc
	def_tgn	$1bd,tag_1bd
	def_tgn	$1be,tag_1be
	def_tgn	$1bf,tag_1bf
	def_tgn	$1c0,intaps		; INTAPS
	def_tgn	$1c1,tag_1c1
	def_tgn	$1c2,tag_1c2
	def_tgn	$1c3,tag_1c3
	def_tgn	$1c4,tag_1c4
	def_tgn	$1c5,tag_1c5
	def_tgn	$1c6,p_fileorg		; (FILEORG)
	def_tgn	$1c7,flit		; FLIT
	def_tgn	$1c8,query_sf		; ?SF
	def_tgn	$1c9,ks			; KS
	def_tgn	$1ca,snap_file		; SNAP-FILE
	def_tgn	$1cb,reloc		; RELOC
