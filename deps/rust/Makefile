build: data/rustup.sh
	sh $<

data/rustup.sh:
	mkdir -p data
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > $@
