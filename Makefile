all: hhc-check snapforth-check

%.lst %.p: %.asm hhc.inc hhc_tags.inc
	asl $< -o $@ -L


hhc.bin: hhc.p
	p2bin -l '$$00' -r '$$c000-$$ffff' hhc.p

hhc-check: hhc.bin
	echo "e51826b015b1f7ea4dce435ddd0376a22eee709a45a4d2a4e2291e2132124195 hhc.bin" | sha256sum -c -


snapforth.bin: snapforth.p
	p2bin -l '$$00' -r '$$4000-$$7fff' snapforth.p

snapforth-check: snapforth.bin
	echo "63532d3fc119729991774ae22898cafbe637acb339e683ef445835fe3e3ee1b5 snapforth.bin" | sha256sum -c -


snapbasic.bin: snapbasic.p
	p2bin -l '$$00' -r '$$4000-$$7fff' snapbasic.p

snapbasic-check: snapbasic.bin
	echo "659de22247e15b1fbbbf0ff6fc5f7f053006e0d5c76a3fd3a708345e75a65cf8 snapbasic.bin" | sha256sum -c -

scicalc.bin: scicalc.p
	p2bin -l '$$00' -r '$$4000-$$4fff' scicalc.p

scicalc-check: scicalc.bin
	echo "039376a65644c7a392757edc669ee1172c0899654f8c275fb051eaa18b08e642 scicalc.bin" | sha256sum -c -

msbasic.bin: msbasic.p
	p2bin -l '$$00' -r '$$4000-$$5fff' msbasic.p

msbasic-check: msbasic.bin
	echo "e08258f2681439ba28bc401202b2ce5b8ffc30cb5ccccb6a9918bdb099be1c41  msbasic.bin" | sha256sum -c -


