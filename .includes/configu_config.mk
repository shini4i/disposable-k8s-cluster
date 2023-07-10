CONFIGU_SET_NAME ?= disposable-kind

ifneq ($(wildcard .env),)
    include .env
endif

.PHONY: init
init: ## Initialize the project configuration
	@echo "===> Initializing the project configuration using \"$(CONFIGU_SET_NAME)\" set"
	@configu eval \
     --store 'configu' --set $(CONFIGU_SET_NAME) --schema './project-config.cfgu.json' \
     | configu export --format 'Dotenv' > .env
	@echo "===> Project configuration initialized"
