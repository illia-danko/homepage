all: build install

develop:
	hugo server -D

server: develop

build:
	hugo -D

install:
	rsync -vrP --delete-after public/ root@elijahdanko.net:/var/www/elijahdanko

clean:
	rm -rf ./public

sync:
	git submodule init
	git submodule update
	git submodule foreach git pull

.PHONY: all develop server build install clean sync
