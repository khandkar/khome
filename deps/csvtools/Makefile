URI := https://github.com/DavyLandman/csvtools.git

all:
	mkdir -p data
	cd data && git clone $(URI) || true
	cd data/csvtools && git clean -dfx
	cd data/csvtools && make -j$(nproc)
	cd data/csvtools && prefix=/usr/local make install
