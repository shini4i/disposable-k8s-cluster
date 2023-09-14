.DEFAULT_GOAL := help

CLOUD_PROVIDER ?= kind
DOMAIN = $(DISPOSABLE_DOMAIN)
USE_LETSENCRYPT_STAGE ?= false
ARGO_WATCHER_ENABLED ?= true

# If set to true, will skip the creation of cert-manager and external-dns
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
	@$(MAKE) -C deploy deploy DOMAIN=$(DOMAIN) CLOUD_PROVIDER=$(CLOUD_PROVIDER) SKIP_EXPOSE=$(SKIP_EXPOSE) ARGO_WATCHER_ENABLED=$(ARGO_WATCHER_ENABLED)

.PHONY: info
info:
	@bash ./.scripts/wait-for-bootstrap.sh

.PHONY: generate-argo-token
generate-argo-token:
	@bash ./.scripts/generate-argo-token.sh $(DOMAIN)

.PHONY: destroy
destroy: ## Destroy ephemeral Kubernetes cluster
	@echo "Purging cluster content..."
ifneq ($(CLOUD_PROVIDER),kind)
	@$(MAKE) -C deploy destroy DOMAIN=$(DOMAIN) CLOUD_PROVIDER=$(CLOUD_PROVIDER) SKIP_EXPOSE=$(SKIP_EXPOSE)
endif
	@rm -f /tmp/disposable-argo-token
	@echo "Destroying ephemeral Kubernetes cluster..."
	@echo "Using $(CLOUD_PROVIDER) as cloud provider"
	@$(MAKE) -C provision/$(CLOUD_PROVIDER) destroy

.PHONY: stop
stop: ## Stop KIND cluster
	@echo "Stopping kind cluster..."
	@docker stop disposable-cluster-control-plane
	@docker stop disposable-cluster-worker

.PHONY: start
start: ## Start KIND cluster
	@echo "Starting kind cluster..."
	@docker start disposable-cluster-control-plane
	@docker start disposable-cluster-worker
