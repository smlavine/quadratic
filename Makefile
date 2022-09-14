.POSIX:

PREFIX=/usr

HARE = hare

SRC = main.ha

all: quadratic

quadratic: $(SRC)
	$(HARE) build $(HAREFLAGS) -o $@

install: quadratic
	cp ./quadratic $(DESTDIR)$(PREFIX)/bin

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/quadratic

clean:
	rm -f ./quadratic

.PHONY: all clean install uninstall
