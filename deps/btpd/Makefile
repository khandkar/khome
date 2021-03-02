all:
	mkdir -p data
	cd data && git clone https://github.com/btpd/btpd.git || true
	cd data/btpd && git clean -dfx && ./configure --with-evloop-method=EPOLL
	cd data/btpd && make -j$(nproc)
	cd data/btpd && PREFIX=/usr/local make -e install
