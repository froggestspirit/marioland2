.PHONY: all compare

objects := main.o

all: sml2.gb compare
compare: baserom.gb sml2.gb
	cmp $^

%.o: %.asm
	rgbasm -o $@ $<

sml2.gb: $(objects)
	rgblink -o $@ $^
	rgbfix -v $@