DOMAIN ?=
CLOUD_PROVIDER ?=

.PHONY: deploy
deploy:
	@terraform init
	@terraform apply -var "domain=$(DOMAIN)" -var "cloud_provider=${CLOUD_PROVIDER}" -auto-approve

.PHONY: destroy
destroy:
	@terraform destroy -var "domain=$(DOMAIN)" -auto-approve
