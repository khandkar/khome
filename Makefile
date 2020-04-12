MAKEFLAGS := --no-builtin-rules

DEPS := $(wildcard deps/*)

.PHONY: \
    default \
    clean \
    $(DEPS) \
    deps \
    home \
    diff \
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

default:
	@echo '================================================================================'
	@echo '| Default target disabled. Specify a concrete one.'
	@echo '================================================================================'
	@exit 1

home: mpdconf compiled
	@cp  -Rp       bin           $(HOME)/
	@cp  -Rp  home/bin           $(HOME)/
	@cp  -Rp  home/lib           $(HOME)/
	@cp       home/.compton.conf $(HOME)/
	@cp  -Rp  home/.config/      $(HOME)/
	@cp  -Rp  home/.newsboat/    $(HOME)/
	@cp       home/.profile      $(HOME)/
	@cp       home/.fonts.conf   $(HOME)/
	@cp       home/.Rprofile     $(HOME)/
	@cp       home/.tmux.conf    $(HOME)/
	@cp       home/.xbindkeysrc  $(HOME)/

mpdconf:
	@mkdir -p ~/Archives/Audio
	@mkdir -p ~/var/lib/mpd/playlists
	@mkdir -p ~/var/log/mpd
	@mkdir -p ~/var/run/mpd
	@cp home/.mpdconf $(HOME)/

compiled:
	mkdir -p bin
	cd src && make
	mv src/clockloop bin/

font_cache:
	@fc-cache -fv

#
# Golang
#
pkgs_golang: list pkgs-golang.list
	go get $(shell ./list pkgs-golang.list)

#
# Ubuntu
#
pkgs_ubuntu: list pkgs-ubuntu.list
	sudo apt install $(shell ./list pkgs-ubuntu.list)

pkgs_ubuntu_debfiles: list pkgs-ubuntu-debfiles.list
	./install-debfiles pkgs-ubuntu-debfiles.list

#
# PIP
#
pkgs_pip:
	sudo pip3 install $(shell ./list pkgs-pip.list)

#
# Homebrew/Mac
#

pkgs_mac:
	$(MAKE) pkgs_brew_install
	$(MAKE) pkgs_brew_cask_install

# TODO: Test pkgs_brew_tap when list contains multiple items
pkgs_brew_tap: list pkgs-brew-tap.list
	brew tap $(shell ./list pkgs-brew-tap.list)

pkgs_brew_install: list pkgs-brew-install.list
	brew install $(shell ./list pkgs-brew-install.list)

pkgs_brew_cask_install: list pkgs-brew-cask-install.list
	brew cask install $(shell ./list pkgs-brew-cask-install.list)

#
# Debian
#
pkgs_deb_install: list pkgs-deb-install.list
	sudo apt install $(shell ./list pkgs-deb-install.list)

pkgs_deb_purge: list pkgs-deb-purge.list
	sudo apt purge $(shell ./list pkgs-deb-purge.list)

#
# Snap
#
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
	find home -type f -print0 \
	| sed -z 's/^home\///g' \
	| xargs -0 -I% sh -c 'echo %; diff --color=always ~/% home/%'

clean:
	rm -rf ./debfiles
	cd src && make clean
