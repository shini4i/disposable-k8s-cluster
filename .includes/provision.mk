.PHONY: provision
provision:
	@terraform init
	@terraform apply -auto-approve

.PHONY: destroy
destroy:
	@terraform destroy -auto-approve
	@rm -f terraform.tfstate terraform.tfstate.backup
