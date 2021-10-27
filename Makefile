install: ## install
	ln -s `pwd`/vimrc ~/.vimrc
	ln -s `pwd`./gvimrc ~/.gvimrc
	git submodule update --init

update: ## update all dependencies
	git pull
	git submodule foreach git checkout -qf master
	git submodule foreach git clean -fdq
	git submodule foreach git checkout -- .
	git submodule foreach git pull
	git status

.DEFAULT_GOAL := help
help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
