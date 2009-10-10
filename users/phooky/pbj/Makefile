CFLAGS=$(shell freetype-config --cflags) -g -Wall
LIBS=$(shell freetype-config --libs) -lm

prefix ?= /usr/local

PROGS=truetype-tracer-dxf truetype-tracer

all: $(PROGS)

%.o: %.c
	gcc $(CFLAGS) -o $@ -c $<

%_dxf.o: %.c
	gcc $(CFLAGS) -DDXF -o $@ -c $<

truetype-tracer: ttt.o
	gcc -o $@ $< $(LIBS)

truetype-tracer-dxf: ttt_dxf.o
	gcc -o $@ $< $(LIBS)

install: all
	cp $(PROGS) $(prefix)/bin

clean:
	rm -f $(PROGS) *.o *~ *~*~
