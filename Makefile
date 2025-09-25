CC      = mpicc
CFLAGS+ = -W -Wall
INSTALL?=install
PREFIX?=/usr/local/

SRCS=mpicat.c
OBJS=$(SRCS:.c=.o)
DEPS=$(OBJS:.o=.d)

.PHONY: all clean
all: mpicat

mpicat: mpicat.o

-include $(DEPS)  # this makes magic happen


install: mpicat
	echo "pwd: $(pwd)"
	echo "DESTDIR: $(DESTDIR)"
	echo "PREFIX: $(PREFIX)"
	ls -alR
	$(INSTALL) -d -m 755 mpicat $(DESTDIR)$(PREFIX)/bin/

clean:
	rm -f mpicat
	rm -f $(DEPS) $(OBJS)
