MAKEFLAGS := --no-builtin-rules

DEPS := $(wildcard deps/*)

.PHONY: home pkgs_deb_install pkgs_deb_purge pkgs deps $(DEPS) pkgs_snap_classic pkgs_snap_strict mpdconf

home: mpdconf
	@cp  -Rp  home/bin           $(HOME)/
	@cp  -Rp  home/lib           $(HOME)/
	@cp       home/.compton.conf $(HOME)/
	@cp  -Rp  home/.config/      $(HOME)/
	@cp       home/.profile      $(HOME)/
	@cp       home/.fonts.conf   $(HOME)/
	@fc-cache                    $(HOME)/.fonts
	@cp       home/.Rprofile     $(HOME)/
	@cp       home/.tmux.conf    $(HOME)/
	@cp       home/.xbindkeysrc  $(HOME)/

mpdconf:
	@mkdir -p ~/Archives/Audio
	@mkdir -p ~/var/lib/mpd/playlists
	@mkdir -p ~/var/log/mpd
	@mkdir -p ~/var/run/mpd
	@cp home/.mpdconf $(HOME)/

pkgs:
	$(MAKE) pkgs_deb_install
	$(MAKE) pkgs_deb_purge
	$(MAKE) pkgs_snap_classic
	$(MAKE) pkgs_snap_strict

pkgs_deb_install: list pkgs-deb-install.list
	sudo apt install $(shell ./list pkgs-deb-install.list)

pkgs_deb_purge: list pkgs-deb-purge.list
	sudo apt purge $(shell ./list pkgs-deb-purge.list)

pkgs_snap_classic: list pkgs-snap-classic.list
	@$(MAKE) $(foreach p,$(shell ./list pkgs-snap-classic.list),pkg_snap_classic_$(p))

pkgs_snap_strict: list pkgs-snap-strict.list
	@$(MAKE) $(foreach p,$(shell ./list pkgs-snap-strict.list),pkg_snap_strict_$(p))

# 'snap' command comes from 'snapd' deb pkg
pkg_snap_classic_%:
	sudo snap install --classic $*
pkg_snap_strict_%:
	sudo snap install $*

deps: $(DEPS)

define GEN_DEP_RULE
$(1):
	cd $1 && make
endef

$(foreach d,$(DEPS),$(eval $(call GEN_DEP_RULE,$(d))))
