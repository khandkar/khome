Multiarch
---------

https://wiki.debian.org/Multiarch/HOWTO

	dpkg --add-architecture i386
	apt update
	apt install $PKG_NAME:i386

Backports
---------

List installed:

	dpkg-query -W | grep '~bpo'

Startup Apps
------------

Mate had these (and others) among Startup Applications:

    /usr/lib/at-spi2-core/at-spi-bus-launcher --launch-immediately

    start-pulseaudio-x11

    mate-screensaver

Check Enhancements
------------------

On 2019-12-15 02:02:15 EST:

	$ check-enhancements -ip                                                                                               [1:13:42]
	ant => ant-contrib-cpptasks:      Installed: (none)       Candidate: 1.0~b5-2
	ant-optional => jflex:    Installed: (none)       Candidate: 1.7.0-1
	ant-optional => junit:    Installed: (none)       Candidate: 3.8.2-9
	apache2 => open-infrastructure-apache-tools:      Installed: (none)       Candidate: 20170701-3
	apache2 => prometheus-apache-exporter:    Installed: (none)       Candidate: 0.5.0+ds-2+b20
	apt => netselect-apt:     Installed: (none)       Candidate: 0.3.ds1-28
	apt => progress-linux-pgp-keys:   Installed: (none)       Candidate: 20190101-4
	autoconf => autoconf-archive:     Installed: (none)       Candidate: 20180313-1
	caja => caja-nextcloud:   Installed: (none)       Candidate: 2.5.1-3+deb10u1
	caja => caja-owncloud:    Installed: (none)       Candidate: 2.5.1.10973+dfsg-1
	colord => colord-sensor-argyll:   Installed: (none)       Candidate: 1.4.3-4
	cups => ippusbxd:         Installed: (none)       Candidate: 1.33-1
	dpkg => debsig-verify:    Installed: (none)       Candidate: 0.19+b10
	eog => eog-plugin-disable-dark-theme:     Installed: (none)       Candidate: 3.26.3-2
	eog => eog-plugin-exif-display:   Installed: (none)       Candidate: 3.26.3-2
	eog => eog-plugin-export-to-folder:       Installed: (none)       Candidate: 3.26.3-2
	eog => eog-plugin-fit-to-width:   Installed: (none)       Candidate: 3.26.3-2
	eog => eog-plugin-fullscreen-background:          Installed: (none)       Candidate: 3.26.3-2
	eog => eog-plugin-hide-titlebar:          Installed: (none)       Candidate: 3.26.3-2
	eog => eog-plugin-map:    Installed: (none)       Candidate: 3.26.3-2
	eog => eog-plugin-maximize-windows:       Installed: (none)       Candidate: 3.26.3-2
	eog => eog-plugin-picasa:         Installed: (none)       Candidate: 3.26.3-2
	eog => eog-plugin-python-console:         Installed: (none)       Candidate: 3.26.3-2
	eog => eog-plugins:       Installed: (none)       Candidate: 3.26.3-2
	eog => eog-plugin-send-by-mail:   Installed: (none)       Candidate: 3.26.3-2
	eog => eog-plugin-slideshow-shuffle:      Installed: (none)       Candidate: 3.26.3-2
	erlang => erlang-folsom:          Installed: (none)       Candidate: 0.8.2+dfsg-2
	erlang => erlang-folsom-dev:      Installed: (none)       Candidate: 0.8.2+dfsg-2
	erlang => rebar:          Installed: (none)       Candidate: 2.6.4-2
	fonts-noto-core => fonts-noto-extra:      Installed: (none)       Candidate: 20181227-1
	fonts-noto-ui-core => fonts-noto-ui-extra:        Installed: (none)       Candidate: 20181227-1
	gedit => gedit-latex-plugin:      Installed: (none)       Candidate: 3.20.0-1
	gedit => gedit-plugin-text-size:          Installed: (none)       Candidate: 3.30.1-3
	gedit => gedit-source-code-browser-plugin:        Installed: (none)       Candidate: 3.0.3-5.1
	gimp => gimp-gmic:        Installed: (none)       Candidate: 2.4.5-1
	gimp => gimp-gutenprint:          Installed: (none)       Candidate: 5.3.1-7
	gimp => gimp-help-ca:     Installed: (none)       Candidate: 2.8.2-1
	gimp => gimp-help-de:     Installed: (none)       Candidate: 2.8.2-1
	gimp => gimp-help-el:     Installed: (none)       Candidate: 2.8.2-1
	gimp => gimp-help-en:     Installed: (none)       Candidate: 2.8.2-1
	gimp => gimp-help-es:     Installed: (none)       Candidate: 2.8.2-1
	gimp => gimp-help-fr:     Installed: (none)       Candidate: 2.8.2-1
	gimp => gimp-help-it:     Installed: (none)       Candidate: 2.8.2-1
	gimp => gimp-help-ja:     Installed: (none)       Candidate: 2.8.2-1
	gimp => gimp-help-ko:     Installed: (none)       Candidate: 2.8.2-1
	gimp => gimp-help-nl:     Installed: (none)       Candidate: 2.8.2-1
	gimp => gimp-help-nn:     Installed: (none)       Candidate: 2.8.2-1
	gimp => gimp-help-pt:     Installed: (none)       Candidate: 2.8.2-1
	gimp => gimp-help-ru:     Installed: (none)       Candidate: 2.8.2-1
	gimp => gimp-help-sl:     Installed: (none)       Candidate: 2.8.2-1
	gimp => gimp-help-sv:     Installed: (none)       Candidate: 2.8.2-1
	gimp => gimp-plugin-registry:     Installed: (none)       Candidate: 9.20180625
	gimp => gimp-python:      Installed: (none)       Candidate: 2.10.8-2
	gimp => xcftools:         Installed: (none)       Candidate: 1.0.7-6
	git => git2cl:    Installed: (none)       Candidate: 1:2.0+git20120920-1
	git => git-crypt:         Installed: (none)       Candidate: 0.6.0-1
	git => git-ftp:   Installed: (none)       Candidate: 1.5.1+dfsg-1
	git => grokmirror:        Installed: (none)       Candidate: 1.0.0-1.1
	git => wiggle:    Installed: (none)       Candidate: 1.1-1
	gpg-agent => scdaemon:    Installed: (none)       Candidate: 2.2.12-1+deb10u1
	ifupdown => guessnet:     Installed: (none)       Candidate: 0.56+b2
	ifupdown => ifupdown-multi:       Installed: (none)       Candidate: 0.1.1
	intel-microcode => needrestart:   Installed: (none)       Candidate: 3.4-5
	isc-dhcp-client => isc-dhcp-client-ddns:          Installed: (none)       Candidate: 4.4.1-2
	libegl1 => nvidia-egl-icd:        Installed: (none)       Candidate: 418.74-1
	libegl1 => nvidia-legacy-390xx-egl-icd:   Installed: (none)       Candidate: 390.116-1
	libgpg-error0 => libgpg-error-l10n:       Installed: (none)       Candidate: 1.35-1
	libldb1 => samba-dsdb-modules:    Installed: (none)       Candidate: 2:4.9.5+dfsg-5+deb10u1
	libmtp9 => mtp-tools:     Installed: (none)       Candidate: 1.1.16-2
	libproxy1v5 => libproxy1-plugin-kconfig:          Installed: (none)       Candidate: 0.4.15-5
	libproxy1v5 => libproxy1-plugin-mozjs:    Installed: (none)       Candidate: 0.4.15-5
	libreoffice => libreoffice-gtk2:          Installed: (none)       Candidate: 1:6.1.5-3+deb10u5
	libreoffice => libreoffice-kde5:          Installed: (none)       Candidate: 1:6.1.5-3+deb10u5
	libreoffice => libreoffice-voikko:        Installed: (none)       Candidate: 5.0-3
	libreoffice-core => libreoffice-style-breeze:     Installed: (none)       Candidate: 1:6.1.5-3+deb10u5
	libreoffice-core => libreoffice-style-sifr:       Installed: (none)       Candidate: 1:6.1.5-3+deb10u5
	libsqlite3-0 => libsqlite3-mod-blobtoxy:          Installed: (none)       Candidate: 0.9996-1
	libsqlite3-0 => libsqlite3-mod-csvtable:          Installed: (none)       Candidate: 0.9996-1
	libsqlite3-0 => libsqlite3-mod-impexp:    Installed: (none)       Candidate: 0.9996-1
	libsqlite3-0 => libsqlite3-mod-xpath:     Installed: (none)       Candidate: 0.9996-1
	libsqlite3-0 => libsqlite3-mod-zipfile:   Installed: (none)       Candidate: 0.9996-1
	libva2 => i965-va-driver:         Installed: (none)       Candidate: 2.3.0+dfsg1-1
	libva2 => mesa-va-drivers:        Installed: (none)       Candidate: 18.3.6-2
	libva2 => vdpau-va-driver:        Installed: (none)       Candidate: 0.7.4-7
	libvdpau1 => libvdpau-va-gl1:     Installed: (none)       Candidate: 0.4.2-1+b1
	libvdpau1 => mesa-vdpau-drivers:          Installed: (none)       Candidate: 18.3.6-2
	libvdpau1 => nvidia-legacy-340xx-vdpau-driver:    Installed: (none)       Candidate: 340.107-4
	libvdpau1 => nvidia-legacy-390xx-vdpau-driver:    Installed: (none)       Candidate: 390.116-1
	libvdpau1 => nvidia-vdpau-driver:         Installed: (none)       Candidate: 418.74-1
	libvulkan1 => nvidia-legacy-390xx-nonglvnd-vulkan-icd:    Installed: (none)       Candidate: 390.116-1
	libvulkan1 => nvidia-legacy-390xx-vulkan-icd:     Installed: (none)       Candidate: 390.116-1
	libvulkan1 => nvidia-nonglvnd-vulkan-icd:         Installed: (none)       Candidate: 418.74-1
	libvulkan1 => nvidia-vulkan-icd:          Installed: (none)       Candidate: 418.74-1
	make => make-doc:         Installed: (none)       Candidate: 4.2.1-1
	manpages => manpages-posix:       Installed: (none)       Candidate: 2013a-2
	manpages-dev => manpages-posix-dev:       Installed: (none)       Candidate: 2013a-2
	mpc => draai:     Installed: (none)       Candidate: 20180521-1
	mpd => ario:      Installed: (none)       Candidate: 1.6-1
	mpd => glurp:     Installed: (none)       Candidate: 0.12.3-1+b2
	mpd => gmpc:      Installed: (none)       Candidate: 11.8.16-15
	mpd => mpd-sima:          Installed: (none)       Candidate: 0.14.4-2
	mpd => python3-musicpd:   Installed: (none)       Candidate: 0.4.3-1
	nautilus => clamtk-gnome:         Installed: (none)       Candidate: 5.27-1
	nautilus => eiciel:       Installed: (none)       Candidate: 0.9.12.1-1
	nautilus => nautilus-admin:       Installed: (none)       Candidate: 1.1.9-2
	nautilus => nautilus-extension-burner:    Installed: (none)       Candidate: 3.0.6-1
	nautilus => nautilus-hide:        Installed: (none)       Candidate: 0.2.3-7
	nautilus => nautilus-nextcloud:   Installed: (none)       Candidate: 2.5.1-3+deb10u1
	nautilus => nautilus-owncloud:    Installed: (none)       Candidate: 2.5.1.10973+dfsg-1
	nautilus => nautilus-share:       Installed: (none)       Candidate: 0.7.3-2
	ocaml => ocaml-tools:     Installed: (none)       Candidate: 20120103-5
	ocaml => ocamlweb:        Installed: (none)       Candidate: 1.41-1
	ocaml-interp => tuareg-mode:      Installed: (none)       Candidate: 1:2.1.0-2
	openssh-server => gesftpserver:   Installed: (none)       Candidate: 1~ds-1
	openssh-server => progress-linux-ssh-keys:        Installed: (none)       Candidate: 20190101-4
	pandoc => libpandoc-elements-perl:        Installed: (none)       Candidate: 0.38-1
	pandoc => pandoc-sidenote:        Installed: (none)       Candidate: 0.19.0.0-2+b2
	python2.7 => idle-python2.7:      Installed: (none)       Candidate: 2.7.16-2+deb10u1
	python3 => idle:          Installed: (none)       Candidate: 3.7.3-1
	python3.7 => idle-python3.7:      Installed: (none)       Candidate: 3.7.3-2
	python-numpy => python-shapely:   Installed: (none)       Candidate: 1.6.4-2
	r-cran-mass => r-cran-pscl:       Installed: (none)       Candidate: 1.5.2-3
	texlive-base => bibtool:          Installed: (none)       Candidate: 2.67+ds-5
	tmux => tmuxinator:       Installed: (none)       Candidate: 0.15.0-1
	totem => totem-plugin-gromit:     Installed: (none)       Candidate: 3.30.0-4
	totem => totem-plugin-zeitgeist:          Installed: (none)       Candidate: 3.30.0-4
	vim => vim-latexsuite:    Installed: (none)       Candidate: 1:1.9.0-1
	vim => vim-scripts:       Installed: (none)       Candidate: 20180807
	x11-common => unburden-home-dir:          Installed: (none)       Candidate: 0.4.1.1
	xterm => xtitle:          Installed: (none)       Candidate: 1.0.2-7
	zathura => zathura-cb:    Installed: (none)       Candidate: 0.1.8-2
	zathura => zathura-djvu:          Installed: (none)       Candidate: 0.2.8-1
	zathura => zathura-ps:    Installed: (none)       Candidate: 0.2.6-1
	zsh => zsh-antigen:       Installed: (none)       Candidate: 2.2.3-2
	zsh => zsh-autosuggestions:       Installed: (none)       Candidate: 0.5.0-1
