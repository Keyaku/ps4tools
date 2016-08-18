CC	=  gcc
CFLAGS	=  -g -O2 -Wall
LDLIBS  =
FILES	=	pupunpack unpkg
COMMON	=	sha2.o
DEPS	=	Makefile sha2.h

OBJS	= $(COMMON) $(addsuffix .o, $(FILES))

all: $(FILES)

$(FILES): %: %.o $(COMMON) $(DEPS)
	$(CC) $(CFLAGS) -o $@ $< $(COMMON) $(LDLIBS)

$(OBJS): %.o: %.c $(DEPS)
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f $(OBJS) $(FILES) *.exe *~
