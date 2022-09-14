.POSIX:

include config.mk

NAME = quadratic
SRC = main.ha

all: $(NAME)

$(NAME): $(SRC)
	$(HARE) build $(HAREFLAGS) -o $(NAME)

install: $(NAME)
	cp $(NAME) $(DESTDIR)$(PREFIX)/bin

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(NAME)

clean:
	rm -f $(NAME)

.PHONY: all clean install uninstall
