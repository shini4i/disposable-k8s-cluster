DOMAIN ?=
CLOUD_PROVIDER ?=
USE_LETSENCRYPT_STAGE ?=

.PHONY: deploy
deploy:
	@terraform init
	@terraform apply -var "domain=$(DOMAIN)" -var "cloud_provider=${CLOUD_PROVIDER}" -var "le_use_stage_issuer=${USE_LETSENCRYPT_STAGE}" -auto-approve

.PHONY: destroy
destroy:
	@terraform destroy -var "domain=$(DOMAIN)" -var "cloud_provider=${CLOUD_PROVIDER}" -auto-approve
