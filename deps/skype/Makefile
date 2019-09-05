FILE := skypeforlinux-64.deb
URI  := https://go.skype.com/$(FILE)

.PHONY: install

install: data/$(FILE)
	cd data && sudo apt install ./$(FILE)

data/$(FILE):
	mkdir -p data
	cd data && wget $(URI)
