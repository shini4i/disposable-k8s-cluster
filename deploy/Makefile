.PHONY: deploy
deploy:
	@tofu init -upgrade
	# Phase 1: ArgoCD installation and token generation
	@tofu apply -target=module.argo-cd.helm_release.this -var-file=terraform.tfvars.json -auto-approve
	# Phase 2: ArgoCD applications deployment
	@KUBECONFIG=../kubeconfig tofu apply -var-file=terraform.tfvars.json -auto-approve

.PHONY: destroy
destroy:
	@KUBECONFIG=../kubeconfig tofu destroy -var-file=terraform.tfvars.json -auto-approve
	@rm -f terraform.tfstate terraform.tfstate.backup

.PHONY: cleanup
cleanup:
	@rm -f terraform.tfstate terraform.tfstate.backup
