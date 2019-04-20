MAKEFLAGS := --no-builtin-rules

.PHONY: install install_packages

install:
	@cp -Rp bin $(HOME)/
	@cp -Rp lib $(HOME)/
	@cp     .profile $(HOME)/
	@cp     .fonts.conf $(HOME)/
	@fc-cache $(HOME)/.fonts

install_packages: dpkg-selections
	@dpkg --set-selections < $<
	@apt-get -u dselect-upgrade

dpkg-selections:
	@dpkg --get-selections > $@
