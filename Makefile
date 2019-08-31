MAKEFLAGS := --no-builtin-rules

.PHONY: install_home install_pkgs

install_home:
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

install_pkgs: list pkgs-install
	sudo apt install $(shell ./list pkgs-install)
