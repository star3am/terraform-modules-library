SHELL = /bin/bash -e

DIRECTORY = "./"
MODULES = `find aws gcp azure custom -maxdepth 2 -mindepth 2 | tr '\n' ' '`

define run_command
	$(info >>> Exec ($(1)))
	$(1)
endef

.PHONY: help
help: ## This help output
help:
	@echo ""
	@echo "Usage: make <target> [parameters]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-38s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Parameters:"
	@echo -e "  \033[36mDIRECTORY=[environment-root-folder]\033[0m    Select the root folder to use for terragrunt execution"
	@echo ""
	@echo "Examples:"
	@echo -e "  \033[36mmake format\033[0m                            Format all code"
	@echo -e "  \033[36mmake lint\033[0m                              Lint all code"
	@echo -e "  \033[36mmake plan-all DIRECTORY=./aws\033[0m  Apply all modules in the \`dev/\` folder"
	@echo -e "  \033[36mmake plan DIRECTORY=./aws/modules/debug\033[0m  Apply specific module"
	@echo -e "  \033[36mmake apply-all DIRECTORY=./aws/modules/debug\033[0m  Apply all modules in the \`dev/australiaeast/\` folder"
	@echo ""

.PHONY: debug
debug:
	for module in $$MODULES; do \
		echo $$module && make tflint-module MODULE=$$module; \
	done

.PHONY: format
format: ## Format Terraform code
format: terraform-format

.PHONY: terraform-format
terraform-format:
	$(info --- terraform-format)
	@$(call run_command,terraform fmt -recursive -diff)

.PHONY: lint
lint: ## Lint all Terraform code
lint: terraform-lint tflint yamllint

.PHONY: terraform-lint
terraform-lint:
	$(info --- terraform-lint)
	@$(call run_command,terraform fmt -check -recursive -diff)

.PHONY: yamllint
yamllint:
	$(info --- yamllint)
	@$(call run_command,yamllint -f auto .)

.PHONY: tflint
tflint:
	$(info --- tflint)
	@for module in $(MODULES); do \
		$(MAKE) --no-print-directory tflint-module MODULE=$$module; \
	done

.PHONY: tflint-module
tflint-module:
tflint-module: module-vars
	$(info --- tflint-module ($(MODULE)))
	@$(call run_command,tflint $(MODULE))

.PHONY: validate
validate: ## Validate all terraform modules
	$(info --- validate)
	@for module in $(MODULE); do \
		cd $$module; \
		terraform validate; \
		cd ../../../; \
	done

.PHONY: clean
clean: ## Remove the .terragrunt-cache directories
	$(info --- clean)
	@$(call run_command,find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;)
	@$(call run_command,find . -type f -name ".terraform.lock.hcl" -prune -exec rm -rf {} \;)
	@$(call run_command,rm -fr /opt/terragrunt-cache/*)

.PHONY: docs
docs: ## Generate teraform-docs for all modules
	$(info --- docs)
	@for module in $(MODULES); do \
		$(MAKE) --no-print-directory docs-module MODULE=$$module; \
	done

.PHONY: docs-module
docs-module: module-vars
	$(info --- docs-module ($(MODULE)))
	@$(call run_command,terraform-docs markdown document --hide requirements --escape=false --sort-by required "$(MODULE)" > "$(MODULE)/README.md")

.PHONY: init-all
init-all: ## Run `terraform init` for specifc [DIRECTORY]
	$(info --- init-all ($(DIRECTORY)))
	@for module in $(MODULES); do \
		cd $$module; \
		terraform init -upgrade; \
		cd ../../../; \
	done

.PHONY: init
init: ## Run `terraform init` for specifc [MODULE]
	$(info --- init ($(MODULE)))
	@$(call run_command,cd $(MODULE))
	@$(call run_command,terraform init)

.PHONY: plan-all
plan-all: ## Run `terragrunt run-all plan` for specifc [DIRECTORY]
	$(info --- plan-all ($(DIRECTORY)))
	@$(call run_command,terragrunt run-all plan --terragrunt-non-interactive --terragrunt-include-external-dependencies --terragrunt-working-dir $(DIRECTORY))

.PHONY: plan
plan: ## Run `terragrunt plan` for specifc [DIRECTORY]
	$(info --- plan ($(DIRECTORY)))
	@$(call run_command,terragrunt plan --terragrunt-non-interactive --terragrunt-working-dir $(DIRECTORY))

# Required environment variables when targeting an environment
.PHONY: module-vars
module-vars:
ifndef MODULE
	$(error MODULE is undefined)
endif
