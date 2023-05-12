DOMAIN ?=

.PHONY: deploy
deploy:
	@terraform init
	@terraform apply -var "domain=$(DOMAIN)" -auto-approve

.PHONY: destroy
destroy:
	@terraform destroy -var "domain=$(DOMAIN)" -auto-approve
