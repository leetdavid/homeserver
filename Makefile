
.PHONY: plan
plan: 
	@terraform -chdir=terraform plan -var-file=../secrets.tfvars

.PHONY: apply
apply: 
	@terraform -chdir=terraform apply -var-file=../secrets.tfvars -auto-approve

@:
%:
