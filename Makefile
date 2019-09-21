# Makefile to kickoff terraform.
# ####################################################
#
#STATEBUCKET = uki-s3-mi4cc-terraform-state
#STATELOCKTABLE = mi4cc-terraform-state-lock
#STATEKEY = $(LAYER)/terraform.tfstate
#STATEREGION = eu-central-1
##ROLEARN = arn:aws:iam::204770985410:role/uki_iam_role_jenkins_user
#ROLEARN = arn:aws:iam::204770985410:role/uki_iam_role_jenkins_role_test


## Before we start test that we have the mandatory executables available
	EXECUTABLES = git terraform
	K := $(foreach exec,$(EXECUTABLES),\
		$(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH, consider apt-get install $(exec)")))


.PHONY: plan

first-run:
	@echo "initialize remote state file"
	cd layers/$(LAYER) && \
    terraform init
##-backend-config="bucket=$(STATEBUCKET)" -backend-config="key=$(STATEKEY)" -backend-config="dynamodb_table=$(STATELOCKTABLE)" -backend-config="region=$(STATEREGION)"

init:
	@echo "initialize remote state file"
	cd layers/$(LAYER) && \
        terraform workspace select $(WORKSPACE) || terraform workspace new $(WORKSPACE) && \
	terraform init
##--force-copy -backend-config="bucket=$(STATEBUCKET)" -backend-config="key=$(STATEKEY)" -backend-config="dynamodb_table=$(STATELOCKTABLE)" -backend-config="region=$(STATEREGION)"

validate: init
	@echo "running terraform validate"
	cd layers/$(LAYER) && \
	terraform validate -no-color

plan: validate
	@echo "running terraform plan"
	cd layers/$(LAYER) && \
	terraform plan -no-color

apply: plan
	@echo "running terraform apply"
	cd layers/$(LAYER) && \
	terraform apply -auto-approve -no-color

plan-destroy: validate
	@echo "running terraform plan -destroy"
	cd layers/$(LAYER) && \
	terraform plan -destroy -no-color

destroy: init
	@echo "running terraform destroy"
	cd layers/$(LAYER) && \
	terraform destroy -force -no-color
