CPPFLAGS := -D_POSIX_C_SOURCE=200809L
CFLAGS   := -std=c99 -Wall -Wextra -pedantic
LDLIBS   := -lncurses
LDFLAGS  := -s  # Remove all symbol table and relocation information from the
                # executable.

.PHONY: build clean

build: clockloop

clean:
	rm -f clockloop

clockloop: clockloop.c
	$(CC) $(LDFLAGS) $(CPPFLAGS) $(CFLAGS) -o $@ $< $(LDLIBS)
