.PHONY: all
all:
	mkdir -p data
	cd data && git clone https://github.com/dkogan/feedgnuplot.git || true
	cd data/feedgnuplot && perl Makefile.PL prefix=/usr/local
	cd data/feedgnuplot && make
	cd data/feedgnuplot && make install
