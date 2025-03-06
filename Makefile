-include .env

include config.mk

.DEFAULT_GOAL := help

COMMON_MAKE_VARS := DOMAIN=$(DOMAIN) \
                    CLOUD_PROVIDER=$(CLOUD_PROVIDER) \
                    SKIP_EXPOSE=$(SKIP_EXPOSE) \
                    ARGO_WATCHER_ENABLED=$(ARGO_WATCHER_ENABLED) \
                    ARGO_WATCHER_IMAGE_TAG=$(ARGO_WATCHER_IMAGE_TAG)

.PHONY: tfswitch
tfswitch:
	@echo "===> Ensuring the correct OpenTofu version is used"
	@tfswitch --product opentofu

.PHONY: help
help: ## Print this help
	@echo "Usage: make [target]"
	@grep -E '^[a-z.A-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: bootstrap
bootstrap: validate tfswitch provision deploy ## set up a temporary kubernetes cluster, including infrastructure and common services

.PHONY: provision
provision:
	@echo "Provisioning ephemeral Kubernetes cluster..."
	@echo "Using $(CLOUD_PROVIDER) as cloud provider"
	@$(MAKE) -C provision/$(CLOUD_PROVIDER) provision

.PHONY: deploy
deploy:
	@echo "Deploying common services to ephemeral Kubernetes cluster..."
	@$(MAKE) -C deploy deploy $(COMMON_MAKE_VARS)

.PHONY: destroy
destroy: ## destroy ephemeral kubernetes cluster
	@echo "Purging cluster content..."
ifeq ($(CLOUD_PROVIDER),kind)
	@$(MAKE) -C deploy cleanup
else
	@$(MAKE) -C deploy destroy $(COMMON_MAKE_VARS)
endif
	@rm -f /tmp/disposable-argo-token
	@echo "Destroying ephemeral Kubernetes cluster..."
	@echo "Using $(CLOUD_PROVIDER) as cloud provider"
	@$(MAKE) -C provision/$(CLOUD_PROVIDER) destroy

.PHONY: stop
stop: ## stop kind cluster
	@echo "Stopping kind cluster..."
	@docker stop disposable-cluster-control-plane
	@docker stop disposable-cluster-worker

.PHONY: start
start: ## start kind cluster
	@echo "Starting kind cluster..."
	@docker start disposable-cluster-control-plane
	@docker start disposable-cluster-worker

.PHONY: validate
validate: # a super simple validation of project configuration
	@if [ -z "$(DISPOSABLE_DOMAIN)" ]; then echo "Error: DISPOSABLE_DOMAIN is not set"; exit 1; fi
	@if [ -z "$(SKIP_EXPOSE)" -o "$(SKIP_EXPOSE)" = "false" ]; then if [ -z "$(TF_VAR_cloudflare_api_token)" ]; then echo "Error: TF_VAR_cloudflare_api_token is not set"; exit 1; fi; fi
	@if [ "$(CLOUD_PROVIDER)" = "digitalocean" ]; then if [ -z "$(TF_VAR_do_token)" ]; then echo "Error: TF_VAR_do_token is not set"; exit 1; fi; fi
