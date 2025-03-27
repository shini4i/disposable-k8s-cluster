CLOUD_PROVIDER := $(shell jsonnet -e 'std.get(std.mergePatch(import "config/default.jsonnet", import "config/local.jsonnet"), "cloud_provider")' | tr -d '"')

.PHONY: tfswitch
tfswitch:
	@echo "===> Ensuring the correct OpenTofu version is used"
	@tfswitch --product opentofu

.PHONY: help
help: ## Print this help
	@echo "Usage: make [target]"
	@grep -E '^[a-z.A-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: generate-config
generate-config:
	@echo "Generating Terraform configuration from JSONnet files..."
	@jsonnet -e 'std.mergePatch(import "config/default.jsonnet", import "config/local.jsonnet")' > deploy/terraform.tfvars.json
ifeq ($(CLOUD_PROVIDER),digitalocean)
	@jsonnet -e '{ do_token: std.mergePatch(import "config/default.jsonnet", import "config/local.jsonnet").do_token }' > provision/digitalocean/terraform.tfvars.json
else
	@echo "{}" > provision/$(CLOUD_PROVIDER)/terraform.tfvars.json
endif

.PHONY: bootstrap
bootstrap: generate-config tfswitch provision deploy ## set up a temporary kubernetes cluster, including infrastructure and common services

.PHONY: provision
provision:
	@echo "Provisioning ephemeral Kubernetes cluster..."
	@echo "Using $(CLOUD_PROVIDER) as cloud provider"
	@$(MAKE) -C provision/$(CLOUD_PROVIDER) provision

.PHONY: deploy
deploy:
	@echo "Deploying common services to ephemeral Kubernetes cluster..."
	@$(MAKE) -C deploy deploy

.PHONY: destroy
destroy: ## destroy ephemeral kubernetes cluster
	@echo "Purging cluster content..."
ifeq ($(CLOUD_PROVIDER),kind)
	@$(MAKE) -C deploy cleanup
else
	@$(MAKE) -C deploy destroy
endif
	@rm -f /tmp/disposable-argo-token
	@echo "Destroying ephemeral Kubernetes cluster..."
	@echo "Using $(CLOUD_PROVIDER) as cloud provider"
	@$(MAKE) -C provision/$(CLOUD_PROVIDER) destroy
	@find . -name "terraform.tfvars.json" -exec rm {} +

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
