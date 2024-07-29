.PHONY: provision
provision:
	@tofu init -upgrade
	@tofu apply -auto-approve

.PHONY: destroy
destroy:
	@tofu destroy -auto-approve
	@rm -f terraform.tfstate terraform.tfstate.backup
