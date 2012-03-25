install:
	ln -s `pwd`/vimrc ~/.vimrc
	ln -s `pwd`./gvimrc ~/.gvimrc
	git submodule update --init

update:
	git pull
	git submodule foreach git co master
	git submodule foreach git checkout -- .
	git submodule foreach git pull
	git st
