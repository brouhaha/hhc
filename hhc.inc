		ifndef	as_hhc_main
as_hhc_main	equ	0
		endif

; Starts a tag table, assigning tag numbers starting from the argument value.
tt_start	macro	tagnum
_ttnum	set	tagnum
_ttbase	set	*
	endm

; Defines a tag and creates a tag table entry. If the argument is foo,
; the tag name is t_foo, and the table entry contains a pointer to the
; label x_foo.
def_tag	macro	name
t_name	set	_ttnum
	if	_ttnum <= $ff
ts_name	equ	_ttnum
	else
ts_name	equ	((_ttnum >> 8) & $ff) | ((_ttnum & $ff) << 8)
	endif
	if	as_hhc_main || ((_ttnum >= $0c0) && (_ttnum <= $0ff)) || (_ttnum >= $200)
	fdb	x_name
	endif
_ttnum	set	_ttnum+1
	endm

def_tgn	macro	num,name
	if	(num <> _ttnum)
	error	"tag number mismatch"
	endif
	def_tag	name
	endm

; Inserts a tag by number into a SNAP word being defined.
ntag	macro	tnum
	if	tnum<$100
	fcb	tnum
	else
	fcb	tnum>>8,tnum&$ff
	endif
	endm

; Inserts a tag by name into a SNAP word being defined.
tag	macro	tname
	ifnb	tname
	ntag	t_tname
	shift
	tag	ALLARGS
	endif
	endm

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

frel	macro	target
	fcb	target-*
	endm

tagrf	macro	tagnum,target
	tag	tagnum
	frel	target
	endm

rrel	macro	target
	fcb	(*-1)-target
	endm

tagrr	macro	tagnum,target
	tag	tagnum
	rrel	target
	endm

; string with MSB of last character set
mstr	macro	str
	if	strlen(str)>1
	fcb	substr(str, 0, strlen(str)-1)
	endif
	if	strlen(str)>0
	fcb	charfromstr(str, strlen(str)-1)|$80
	endif
	endm

cstr	macro	str
	fcb	end-start
start:	fcb	str
end:
	endm

skip2	macro
	fcb	$2c		; BIT absolute opcode
	endm