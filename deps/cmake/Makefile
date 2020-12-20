N_PROC := $(shell nproc)

.PHONY: all
all:
	mkdir -p data
	cd data && wget -c https://github.com/Kitware/CMake/releases/download/v3.19.2/cmake-3.19.2.tar.gz
	cd data && tar vxzf cmake-3.19.2.tar.gz
	cd data/cmake-3.19.2 && ./bootstrap && make -j$(N_PROC) && make -j$(N_PROC) install
