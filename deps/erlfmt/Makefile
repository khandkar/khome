all:
	mkdir -p data
	cd data && git clone https://github.com/WhatsApp/erlfmt.git || true
	cd data/erlfmt && make release
	cp data/erlfmt/_build/release/bin/erlfmt ~/bin/
