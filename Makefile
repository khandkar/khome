MAKEFLAGS := --no-builtin-rules

.PHONY: install install_packages

install:
	@cp  -Rp  home/bin          $(HOME)/
	@cp  -Rp  home/lib          $(HOME)/
	@cp       home/.profile     $(HOME)/
	@cp       home/.fonts.conf  $(HOME)/
	@fc-cache                   $(HOME)/.fonts

install_packages: system/debian/dpkg-selections
	@dpkg --set-selections < $<
	@apt-get -u dselect-upgrade

system/debian/dpkg-selections:
	@dpkg --get-selections > $@
