.PHONY: maybeall all download extract build install

maybeall:
	$(MAKE) build
	$(MAKE) install

all:
	$(MAKE) download
	$(MAKE) extract
	$(MAKE) build
	$(MAKE) install

download:
	mkdir -p data
	cd data && wget 'https://sourceforge.net/projects/terminus-font/files/terminus-font-4.48/terminus-font-4.48.tar.gz'

extract:
	cd data && tar xzf terminus-font-4.48.tar.gz

build: data/terminus-font-4.48
	cd data/terminus-font-4.48 && ./configure && make -j $(shell nproc)

install: data/terminus-font-4.48
	cd data/terminus-font-4.48 && make install fontdir
	sudo dpkg-reconfigure fontconfig-config
	fc-cache -fv


data/terminus-font-4.48.tar.gz:
	$(MAKE) download

data/terminus-font-4.48: data/terminus-font-4.48.tar.gz
	$(MAKE) extract
