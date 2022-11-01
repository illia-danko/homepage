all: build install

develop:
	hugo server -D

server: develop

build:
	hugo -D

install:
	rsync -vrP --delete-after public/ root@danko.ws:/var/www/danko

clean:
	rm -rf ./public

sync:
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

.PHONY: all develop server build install clean sync
