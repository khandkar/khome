MAKEFLAGS := --no-builtin-rules

.PHONY: install_home install_pkgs purge_pkgs pkgs

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

pkgs:
	$(MAKE) install_pkgs
	$(MAKE) purge_pkgs

install_pkgs: list pkgs-install
	sudo apt install $(shell ./list pkgs-install)

purge_pkgs: list pkgs-purge
	sudo apt purge $(shell ./list pkgs-purge)
