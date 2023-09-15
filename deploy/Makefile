DOMAIN ?=
CLOUD_PROVIDER ?=
USE_LETSENCRYPT_STAGE ?= false
SKIP_EXPOSE ?=
ARGO_WATCHER_ENABLED ?=

.PHONY: deploy
deploy:
	@terraform init
    # Phase 1: ArgoCD installation and token generation
	@terraform apply -var "domain=$(DOMAIN)" \
				     -var "cloud_provider=${CLOUD_PROVIDER}" \
				     -var "le_use_stage_issuer=${USE_LETSENCRYPT_STAGE}" \
				     -var "skip_expose=${SKIP_EXPOSE}" \
				     -var "argo_watcher_enabled=${ARGO_WATCHER_ENABLED}" -target=module.argo-cd -auto-approve
	# Phase 2: ArgoCD applications deployment
	@KUBECONFIG=../kubeconfig terraform apply -var "domain=$(DOMAIN)" \
											  -var "cloud_provider=${CLOUD_PROVIDER}" \
											  -var "le_use_stage_issuer=${USE_LETSENCRYPT_STAGE}" \
											  -var "skip_expose=${SKIP_EXPOSE}" \
											  -var "argo_watcher_enabled=${ARGO_WATCHER_ENABLED}" -auto-approve

.PHONY: destroy
destroy:
	@KUBECONFIG=../kubeconfig terraform destroy -var "domain=$(DOMAIN)" \
												-var "cloud_provider=${CLOUD_PROVIDER}" \
												-var "le_use_stage_issuer=${USE_LETSENCRYPT_STAGE}" \
												-var "skip_expose=${SKIP_EXPOSE}" \
												-var "argo_watcher_enabled=${ARGO_WATCHER_ENABLED}" -auto-approve
