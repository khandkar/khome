MAKEFLAGS := --no-builtin-rules

.PHONY: install

install:
	@cp -Rp bin $(HOME)/
	@cp -Rp lib $(HOME)/
	@cp     .profile $(HOME)/
