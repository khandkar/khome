ifeq ($(shell uname),Darwin)
	DEPS := brew install ninja libtool automake cmake pkg-config gettext
else
	DEPS := sudo apt install cmake libtool-bin
endif

.PHONY: all
all: deps
	$(MAKE) clone
	$(MAKE) build

.PHONY: deps
deps:
	$(DEPS)

.PHONY: clone
clone:
	mkdir -p data
	cd data && git clone https://github.com/neovim/neovim.git || true

.PHONY: build
build:
	cd data/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo

.PHONY: install
install:
	cd data/neovim && make install
