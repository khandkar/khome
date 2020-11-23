# https://www.gnu.org/software/emacs/manual/html_node/efaq/Installing-Emacs.html

VERSION     := 27.1
SRC_DIR     := emacs-$(VERSION)
SRC_TARBALL := $(SRC_DIR).tar.gz

.PHONY: configure_build_install
configure_build_install: data/$(SRC_DIR)
	cd data/$(SRC_DIR) && ./configure
	cd data/$(SRC_DIR) && make -j$(shell nproc)
	cd data/$(SRC_DIR) && make -j$(shell nproc) install

data/$(SRC_DIR): $(SRC_TARBALL)
	cd data && tar -vxzf $(SRC_TARBALL)

$(SRC_TARBALL):
	mkdir -p data
	cd data && wget -c https://ftp.gnu.org/pub/gnu/emacs/$(SRC_TARBALL)
