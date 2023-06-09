.DEFAULT_GOAL := help

CLOUD_PROVIDER ?= kind
DOMAIN = $(DISPOSABLE_DOMAIN)
USE_LETSENCRYPT_STAGE ?= false

# If set to true, will skip the creation of traefik, cert-manager and external-dns
SKIP_EXPOSE ?= false

.PHONY: tfswitch
tfswitch:
	@echo "===> Ensuring the correct terraform version is used"
	@tfswitch

.PHONY: help
help: ## Print this help
	@echo "Usage: make [target]"
	@grep -E '^[a-z.A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: bootstrap
bootstrap: tfswitch provision deploy info ## Bootstrap ephemeral Kubernetes cluster (provision infrastructure and deploy common services)

.PHONY: provision
provision: ## Provision ephemeral Kubernetes cluster
	@echo "Provisioning ephemeral Kubernetes cluster..."
	@echo "Using $(CLOUD_PROVIDER) as cloud provider"
	@$(MAKE) -C provision/$(CLOUD_PROVIDER) provision

.PHONY: deploy
deploy: ## Deploy common services to ephemeral Kubernetes cluster
	@echo "Deploying common services to ephemeral Kubernetes cluster..."
	@$(MAKE) -C deploy deploy DOMAIN=$(DOMAIN) CLOUD_PROVIDER=$(CLOUD_PROVIDER) SKIP_EXPOSE=$(SKIP_EXPOSE)

.PHONY: info
info:
	@bash ./.scripts/collect-data.sh

.PHONY: destroy
destroy: ## Destroy ephemeral Kubernetes cluster
	@echo "Purging cluster content..."
ifneq ($(CLOUD_PROVIDER),kind)
	@$(MAKE) -C deploy destroy DOMAIN=$(DOMAIN) CLOUD_PROVIDER=$(CLOUD_PROVIDER)
endif
	@echo "Destroying ephemeral Kubernetes cluster..."
	@echo "Using $(CLOUD_PROVIDER) as cloud provider"
	@$(MAKE) -C provision/$(CLOUD_PROVIDER) destroy
