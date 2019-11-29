all: cux.gen.hfst cux.mor.hfstol

cux.lexc.hfst: cux.lexc
	hfst-lexc $< -o $@

cux.twol.hfst: cux.twol
	hfst-twolc $< -o $@

cux.gen.hfst: cux.twol.hfst cux.lexc.hfst
	hfst-compose-intersect -1 cux.lexc.hfst -2 cux.twol.hfst -o $@

cux.mor.hfst: cux.gen.hfst
	hfst-invert $< -o $@

cux.mor.hfstol: cux.mor.hfst
	hfst-fst2fst -w $< -o $@

cux.mor.twol.hfst: cux.mor.twol
	hfst-twolc $< -o $@
