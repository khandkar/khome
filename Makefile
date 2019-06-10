MAKEFLAGS := --no-builtin-rules

DPKG_SELECTIONS := system/debian/dpkg-selections
APT_SOURCES     := system/debian/apt-sources.list

.PHONY: update install install_packages

install:
	@cp  -Rp  home/bin          $(HOME)/
	@cp  -Rp  home/lib          $(HOME)/
	@cp       home/.compton.conf $(HOME)/
	@cp  -Rp  home/.config/     $(HOME)/
	@cp       home/.profile     $(HOME)/
	@cp       home/.fonts.conf  $(HOME)/
	@fc-cache                   $(HOME)/.fonts
	@cp       home/.Rprofile    $(HOME)/
	@cp       home/.mpdconf     $(HOME)/
	@cp       home/.xbindkeysrc $(HOME)/

# May still need to run:
# 1. dselect update
# 2. interactive dselect with install,
# 3. apt update
# 4. apt upgrade
install_packages: $(DPKG_SELECTIONS)
	@dpkg --set-selections < $<
	@apt-get -u dselect-upgrade

update:
	@dpkg --get-selections > $(DPKG_SELECTIONS)
	@cp /etc/apt/sources.list $(APT_SOURCES)
