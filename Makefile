MAKEFLAGS := --no-builtin-rules

.PHONY: home pkgs_install pkgs_purge pkgs

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
	$(MAKE) pkgs_install
	$(MAKE) pkgs_purge

pkgs_install: list pkgs-install
	sudo apt install $(shell ./list pkgs-install)

pkgs_purge: list pkgs-purge
	sudo apt purge $(shell ./list pkgs-purge)
