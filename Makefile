install:
	ln -s `pwd`/vimrc ~/.vimrc
	ln -s `pwd`./gvimrc ~/.gvimrc
	git submodule update --init

update:
	git pull
	git submodule foreach git checkout -qf master
	git submodule foreach git clean -fdq
	git submodule foreach git checkout -- .
	git submodule foreach git pull
	git status
