MAKEFLAGS := --no-builtin-rules
SHELL     := /bin/bash

DEPS := $(wildcard deps/*)

ifeq ($(shell uname),Darwin)
	GREP := ggrep
	SED := gsed
	DIFF := $(shell gls -t1 /usr/local/Cellar/diffutils/*/bin/diff | head -1)
else
	GREP := grep
	SED  := sed
	DIFF := diff
endif

.PHONY: \
    default \
    clean \
    $(DEPS) \
    deps \
    home \
    diff \
    pull \
    push \
    dirs \
    pkgs_void \
    pkgs_void_update \
    pkgs_brew_cask_install \
    pkgs_brew_install \
    pkgs_cargo \
    pkgs_deb_install \
    pkgs_deb_purge \
    pkgs_debian \
    pkgs_mac \
    pkgs_pip_install \
    pkgs_pip_upgrade \
    pkgs_snap_classic \
    pkgs_snap_strict

default:
	@echo '================================================================================'
	@echo '| Default target disabled. Specify a concrete one.'
	@echo '================================================================================'
	@exit 1

home: compiled dirs
	cp -Rp bin $(HOME)/
	$(MAKE) push
	xdg-user-dirs-update

dirs:
	mkdir -p $(shell ./list dirs)

compiled:
	mkdir -p bin
	cd src_c && make
	mv src_c/clockloop bin/

font_cache:
	fc-cache -fv

#
# Void Linux
#

pkgs_void:
	sudo xbps-install $(shell ./list pkgs-void.list)

# Mark $pkg as manually-installed:
#
#     sudo xbps-pkgdb -m manual $pkg
#
# List manually-installed packages:
#
#     xbps-query -m
#
pkgs_void_update:
	xbps-query -m | awk -F - '{sub("-" $$NF "$$", ""); print}' | sort -fu | grep -vf <(./list -v sep='\n' -v end='\n' pkgs-void-src.list) > pkgs-void.list
	(echo '#'; ./patch-comments pkgs-void.list.comments pkgs-void.list) | sponge pkgs-void.list

#
# Golang
#
pkgs_golang: list pkgs-golang.list
	go install $(shell ./list pkgs-golang.list)

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
pkgs_pip_install:
	pip install --user $(shell ./list pkgs-pip.list)

pkgs_pip_upgrade:
	pip install --user --upgrade $(shell ./list pkgs-pip.list)

#
# Rust (cargo)
#

pkgs_cargo: list pkgs-cargo.list
	cargo install $(shell ./list pkgs-cargo.list)

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
	| $(SED) -z 's/^home\///g' \
	| sort -zr \
	| xargs -0 -I% sh -c 'echo %; $(DIFF) --color=auto ~/% home/%'

.PHONY: diff_bins_untracked
diff_bins_untracked:
	ls -1 ~/bin | sort | grep -vf <(ls -1 home/bin | sort)

pull:
	find home -type f -print0 \
	| $(SED) -z 's/^home\///g' \
	| xargs -0 -I% sh -c '$(DIFF) -q ~/% home/% > /dev/null || cp ~/% home/%'

push:
	# TODO Backup files before replacing.
	#      But - recursive copy is not a good strategy for this.
	#      Need to do a file by file pass, like the diff recipe.
	#
	# Limit depth because directories are copied recursively:
	find home -maxdepth 1 -print0 \
	| $(GREP) -zv '^home$$' \
	| xargs -0 -I% cp -Rp % ~

clean:
	rm -rf ./debfiles
	cd src_c && make clean
