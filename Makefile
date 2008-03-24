all: hhc-check

%.lst %.p: %.asm
	asl $< -o $@ -L


hhc.bin: hhc.p
	p2bin -l '$$00' -r '$$c000-$$ffff' hhc.p

hhc-check: hhc.bin
	echo "e51826b015b1f7ea4dce435ddd0376a22eee709a45a4d2a4e2291e2132124195 hhc.bin" | sha256sum -c -
