.SUFFIXES: .asm .tx .o .gb

OBJS  := \
main.o


ROMS := marioland2.gb

all: $(ROMS)
marioland2:  marioland2.gb
compare: baserom.gb marioland2.gb
	cmp $^

clean:
	rm -f $(ROMS)
	rm -f $(OBJS)
	find . -iname '*.tx' -exec rm {} +

baserom.gb: ;
	@echo "Wait! Need baserom.gb first. Check README for details." && false

marioland2.gb: $(OBJS)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix -jsv -k 01 -l 0x33 -m 0x13 -p 0 -r 03 -t "MARIOLAND2" $@

