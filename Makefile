MAKEFLAGS := --no-builtin-rules

.PHONY: home pkgs_deb_install pkgs_deb_purge pkgs deps

home:
	@cp  -Rp  home/bin           $(HOME)/
	@cp  -Rp  home/lib           $(HOME)/
	@cp       home/.compton.conf $(HOME)/
	@cp  -Rp  home/.config/      $(HOME)/
	@cp       home/.profile      $(HOME)/
	@cp       home/.fonts.conf   $(HOME)/
	@fc-cache                    $(HOME)/.fonts
	@cp       home/.Rprofile     $(HOME)/
	@cp       home/.mpdconf      $(HOME)/
	@cp       home/.tmux.conf    $(HOME)/
	@cp       home/.xbindkeysrc  $(HOME)/

pkgs:
	$(MAKE) pkgs_deb_install
	$(MAKE) pkgs_deb_purge
	$(MAKE) pkgs_snap_classic

pkgs_deb_install: list pkgs-deb-install.list
	sudo apt install $(shell ./list pkgs-deb-install.list)

pkgs_deb_purge: list pkgs-deb-purge.list
	sudo apt purge $(shell ./list pkgs-deb-purge.list)

pkgs_snap_classic: list pkgs-snap-classic.list
	@$(MAKE) $(foreach p,$(shell ./list pkgs-snap-classic.list),pkg_snap_classic_$(p))

# Depends on 'snapd' deb pkg being already installed
pkg_snap_classic_%:
	sudo snap install --classic $*

deps:
	@$(foreach d,$(wildcard deps/*),cd $(d) && make)
