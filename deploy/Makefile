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

.PHONY: install-crds
install-crds: # Not sure if this is optimal, but seems to be better than triggering terraform apply twice
	@echo "===> Installing Argo CD CRDs"
	@ARGO_CD_CHART_VERSION=$$(grep 'argo_cd_chart_version' terraform.tfvars | awk -F'=' '{print $$2}' | tr -d ' "') && \
    echo "Extracted ARGO_CD_CHART_VERSION: $${ARGO_CD_CHART_VERSION}" && \
    ARGO_CD_VERSION=$$(curl -s "https://artifacthub.io/api/v1/packages/helm/argo-cd-oci/argo-cd/$${ARGO_CD_CHART_VERSION}" | jq -r '.app_version') && \
    echo "Fetched ARGO_CD_VERSION: $${ARGO_CD_VERSION}" && \
    if [ -z "$${ARGO_CD_VERSION}" ]; then echo "Error: ARGO_CD_VERSION is empty!" && exit 1; fi && \
	KUBECONFIG=../kubeconfig kubectl apply \
		-f https://raw.githubusercontent.com/argoproj/argo-cd/refs/tags/$${ARGO_CD_VERSION}/manifests/crds/application-crd.yaml \
		-f https://raw.githubusercontent.com/argoproj/argo-cd/refs/tags/$${ARGO_CD_VERSION}/manifests/crds/applicationset-crd.yaml \
		-f https://raw.githubusercontent.com/argoproj/argo-cd/refs/tags/$${ARGO_CD_VERSION}/manifests/crds/appproject-crd.yaml

.PHONY: deploy
deploy: install-crds
	@tofu init -upgrade
	@KUBECONFIG=../kubeconfig tofu apply $(COMMON_TF_VARS) -auto-approve

.PHONY: destroy
destroy:
	@KUBECONFIG=../kubeconfig tofu destroy $(COMMON_TF_VARS) -auto-approve
	@rm -f terraform.tfstate terraform.tfstate.backup

.PHONY: cleanup
cleanup:
	@rm -f terraform.tfstate terraform.tfstate.backup
