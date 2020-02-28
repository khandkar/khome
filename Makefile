MAKEFLAGS := --no-builtin-rules

DEPS := $(wildcard deps/*)

.PHONY: \
    $(DEPS) \
    deps \
    home \
    mpdconf \
    pkgs_brew_cask_install \
    pkgs_brew_install \
    pkgs_deb_install \
    pkgs_deb_purge \
    pkgs_debian \
    pkgs_mac \
    pkgs_pip \
    pkgs_snap_classic \
    pkgs_snap_strict

home: mpdconf
	@cp  -Rp  home/bin           $(HOME)/
	@cp  -Rp  home/lib           $(HOME)/
	@cp       home/.compton.conf $(HOME)/
	@cp  -Rp  home/.config/      $(HOME)/
	@cp  -Rp  home/.newsboat/    $(HOME)/
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

pkgs_debian:
	$(MAKE) pkgs_deb_install
	$(MAKE) pkgs_deb_purge
	$(MAKE) pkgs_pip
	$(MAKE) pkgs_snap_classic
	$(MAKE) pkgs_snap_strict

pkgs_ubuntu: list pkgs-ubuntu.list
	sudo apt install $(shell ./list pkgs-ubuntu.list)

pkgs_mac:
	$(MAKE) pkgs_brew_install
	$(MAKE) pkgs_brew_cask_install

pkgs_pip:
	sudo pip3 install $(shell ./list pkgs-pip.list)

pkgs_brew_install: list pkgs-brew-install.list
	brew install $(shell ./list pkgs-brew-install.list)

pkgs_brew_cask_install: list pkgs-brew-cask-install.list
	brew cask install $(shell ./list pkgs-brew-cask-install.list)

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

diff:
	diff $(HOME)/.Rprofile                       home/.Rprofile
	diff $(HOME)/.compton.conf                   home/.compton.conf
	diff $(HOME)/.config/dunst/dunstrc           home/.config/dunst/dunstrc
	diff $(HOME)/.config/mimeapps.list           home/.config/mimeapps.list
	diff $(HOME)/.config/neofetch/config.conf    home/.config/neofetch/config.conf
	diff $(HOME)/.config/ranger/rc.conf          home/.config/ranger/rc.conf
	diff $(HOME)/.fonts.conf                     home/.fonts.conf
	diff $(HOME)/.mpdconf                        home/.mpdconf
	diff $(HOME)/.newsboat/config                home/.newsboat/config
	diff $(HOME)/.profile                        home/.profile
	diff $(HOME)/.tmux.conf                      home/.tmux.conf
	diff $(HOME)/.xbindkeysrc                    home/.xbindkeysrc
	diff $(HOME)/lib/login_aliases.sh            home/lib/login_aliases.sh
	diff $(HOME)/lib/login_functions.sh          home/lib/login_functions.sh
	diff $(HOME)/lib/login_variables.sh          home/lib/login_variables.sh
	diff $(HOME)/lib/login_variables_dpi_high.sh home/lib/login_variables_dpi_high.sh
	diff $(HOME)/lib/login_variables_dpi_norm.sh home/lib/login_variables_dpi_norm.sh
