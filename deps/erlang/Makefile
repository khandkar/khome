.PHONY: all
all:
	mkdir -p data
	cd data && wget -c http://erlang.org/download/otp_src_22.3.tar.gz
	cd data && tar vxzf otp_src_22.3.tar.gz
	cd data/otp_src_22.3 && ./configure
	cd data/otp_src_22.3 && make -j$(shell nproc)
	cd data/otp_src_22.3 && make -j$(shell nproc) install
