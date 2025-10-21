.PHONY: build-model
build-model: ## build model
	ollama create ask -f ./ask.modelfile

.PHONY: install
install: ## install ask
	sudo install -m 755 ./src/ask.sh /usr/local/bin/ask

# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help