DOMAIN ?=
CLOUD_PROVIDER ?=
USE_LETSENCRYPT_STAGE ?= false
SKIP_EXPOSE ?=
ARGO_WATCHER_ENABLED ?=
ARGO_WATCHER_IMAGE_TAG ?=

COMMON_TF_VARS := -var "domain=$(DOMAIN)" \
                  -var "cloud_provider=${CLOUD_PROVIDER}" \
                  -var "le_use_stage_issuer=${USE_LETSENCRYPT_STAGE}" \
                  -var "skip_expose=${SKIP_EXPOSE}" \
                  -var "argo_watcher_enabled=${ARGO_WATCHER_ENABLED}" \
                  -var "argo_watcher_image_tag_override=${ARGO_WATCHER_IMAGE_TAG}"

.PHONY: deploy
deploy:
	@tofu init -upgrade
	# Phase 1: ArgoCD installation and token generation
	@tofu apply $(COMMON_TF_VARS) -target=module.argo-cd.helm_release.this -auto-approve
	# Phase 2: ArgoCD applications deployment
	@KUBECONFIG=../kubeconfig tofu apply $(COMMON_TF_VARS) -auto-approve

.PHONY: destroy
destroy:
	@KUBECONFIG=../kubeconfig tofu destroy $(COMMON_TF_VARS) -auto-approve
	@rm -f terraform.tfstate terraform.tfstate.backup

.PHONY: cleanup
cleanup:
	@rm -f terraform.tfstate terraform.tfstate.backup
