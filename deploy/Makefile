DOMAIN ?=
CLOUD_PROVIDER ?=
USE_LETSENCRYPT_STAGE ?= false
SKIP_EXPOSE ?=

.PHONY: deploy
deploy:
	@terraform init
	@terraform apply -var "domain=$(DOMAIN)" -var "cloud_provider=${CLOUD_PROVIDER}" -var "le_use_stage_issuer=${USE_LETSENCRYPT_STAGE}" -var "skip_expose=${SKIP_EXPOSE}" -auto-approve

.PHONY: destroy
destroy:
	@terraform destroy -var "domain=$(DOMAIN)" -var "cloud_provider=${CLOUD_PROVIDER}" -var "le_use_stage_issuer=${USE_LETSENCRYPT_STAGE}" -auto-approve
