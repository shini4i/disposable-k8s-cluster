.PHONY: provision
provision:
	@tofu init -upgrade
	@tofu apply -var-file=terraform.tfvars.json -var-file=terraform.tfvars -auto-approve

.PHONY: destroy
destroy:
	@tofu destroy -var-file=terraform.tfvars.json -var-file=terraform.tfvars -auto-approve
	@rm -f terraform.tfstate terraform.tfstate.backup
