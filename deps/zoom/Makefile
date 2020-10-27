filename := zoom_amd64.deb

install: data/$(filename)
	sudo apt install ./data/$(filename)

data/$(filename):
	mkdir -p data
	cd data && wget https://zoom.us/client/latest/$(filename)
