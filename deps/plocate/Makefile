URI := http://git.sesse.net/plocate

data/plocate: | data
	cd data && git clone $(URI)

data:
	mkdir -p data

.PHONY: clean
clean:
	rm -rf data
