MAKEFLAGS := --no-builtin-rules

DPKG_SELECTIONS := system/debian/dpkg-selections
APT_SOURCES     := system/debian/apt-sources.list

.PHONY: update install install_packages

install:
	@cp  -Rp  home/bin          $(HOME)/
	@cp  -Rp  home/lib          $(HOME)/
	@cp       home/.profile     $(HOME)/
	@cp       home/.fonts.conf  $(HOME)/
	@fc-cache                   $(HOME)/.fonts

install_packages: $(DPKG_SELECTIONS)
	@dpkg --set-selections < $<
	@apt-get -u dselect-upgrade

update:
	@dpkg --get-selections > $(DPKG_SELECTIONS)
	@cp /etc/apt/sources.list $(APT_SOURCES)
