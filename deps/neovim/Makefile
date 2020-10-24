.PHONY: all
all: deps
	$(MAKE) clone
	$(MAKE) build

.PHONY: deps
deps:
	sudo apt install \
		cmake \
		libtool-bin

.PHONY: clone
clone:
	mkdir -p data
	cd data && git clone https://github.com/neovim/neovim.git

.PHONY: build
build:
	cd data/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo

.PHONY: install
install:
	cd data/neovim && make install
