SHELL = /bin/bash -e

DIRECTORY = "./"
MODULES = `find terraform -maxdepth 3 -mindepth 3 | tr '\n' ' '`

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

.PHONY: debug
debug:
	@for module in $(MODULES); do \
		echo $$module && \
		if [ "$$module" != "test" ]; then \
        	echo "$$module does not equal test"; \
		else \
		    echo "$$module"; \
    	fi \
	done

.PHONY: if-else
if-else:
	@if [ "test" = "test" ]; then\
        echo "Hello world";\
    fi

# This will only push modules/patterns to their upstream repos if they have a .module-version file
# The repositories must* exist before you can push modules/patterns to their upstream repos
.PHONY: push-modules-and-patterns-upstream
push-modules-and-patterns-upstream: ## Push modules and patterns that contains .module-version file upstrem
  # Only find modules/patterns with .module-version file in the directory
	@for module in `find -name ".module-version" | grep -v tmp | grep -v "\.terraform" | cut -d "/" -f2,3,4,5`; do \
		echo "source-folder-path: $$module"; \
		echo "temporary-folder-path: tmp/$$module"; \
		echo "destination-repository-name: $$(echo $$module | cut -d / -f4)"; \
		pwd; \
		echo "destination-repository-tag: $$(cat $$module/.module-version)"; \
		# Git SSH URL; \
		# echo "Cloning $$(git config --get remote.origin.url | cut -d / -f1)/$$(echo $$module | cut -d / -f4).git into 'tmp/$$module'..."; \
		# Git HTTPS URL; \
		echo "Cloning $$(git config --get remote.origin.url | cut -d / -f2,3,4)/$$(echo $$module | cut -d / -f4).git into 'tmp/$$module'..."; \
		rm -rf tmp/$$module; \
		mkdir -p tmp/$$module; \
		cd tmp/$$module; \
		if ! (git clone https://oauth2:$(ACCESS_TOKEN_GITHUB)@github.com/$$(git config --get remote.origin.url | cut -d / -f4)/$$(echo $$module | cut -d / -f4).git .); then \
        	echo "There was an Error Cloning $$(git config --get remote.origin.url | cut -d / -f1,2,3,4)/$$(echo $$module | cut -d / -f4).git into 'tmp/$$module'..."; \
			echo "Does the repository exist? We use ACCESS_TOKEN_GITHUB in secrets to do Git operations"; \
			exit 1; \
		else \
		    echo "$$module"; \
			cd ../../../../../; \
			echo "rsync -azv --delete $$module/ tmp/$$module/"; \
			rsync -azv --exclude '.git' --exclude '.terraform' --delete $$module/ tmp/$$module/; \
			cd tmp/$$module; \
			git config --global user.email "$(GITHUB_REPOSITORY)@github.com"; \
			git config --global user.name "$(GITHUB_ACTOR)"; \
			git status; \
			pwd; \
			ls -la; \
			# git add -A; \
			echo "Git add -A"; \
			git status; \
			git commit -am "$$(git log -n 1 --pretty=format:'%s')" || true; \
			git push; \
			git status; \
			git tag --list; \
			git tag v$$(cat .module-version) || true; \
			git push --tags || true; \
			cd ../../../../../; \
    	fi \
	done
	tree -L 4 tmp/ && \
	echo "Removing tmp directory" && \
	echo "Done" && \
	rm -rf tmp; \

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
	@tflint --init
	@for module in $(MODULES); do \
		$(MAKE) --no-print-directory tflint-module MODULE=$$module; \
	done

.PHONY: tflint-module
tflint-module:
tflint-module: module-vars
	$(info --- tflint-module ($(MODULE)))
	@$(call run_command,tflint --chdir $(MODULE))

.PHONY: validate
validate: ## Validate all terraform modules
	$(info --- validate)
	@for module in $(MODULES); do \
		echo Running terraform validate on $$module; \
		cd $$module; \
		terraform validate; \
		cd ../../../../; \
	done

.PHONY: tfsec
tfsec: ## TFSec all terraform modules
	$(info --- tfsec)
	@for module in $(MODULES); do \
		echo Running tfsec on $$module; \
		cd $$module; \
		tfsec ./; \
		cd ../../../../; \
	done

.PHONY: checkov
checkov: ## Checkov all terraform modules
	$(info --- checkov)
	@for module in $(MODULES); do \
		echo Running checkov validate on $$module; \
		cd $$module; \
		checkov -d ./ --skip-path examples; \
		cd ../../../../; \
	done
# checkov:skip:CKV2_GHA_1:Ensure top-level permissions are not set to write-all
# checkov:skip:CKV_DOCKER_2:Ensure that HEALTHCHECK instructions have been added to container images
# checkov:skip:CKV_DOCKER_9:Ensure that APT isn't used
# checkov:skip:CKV_DOCKER_4:Ensure that certificate validation isn't disabled with the pip '--trusted-host' option
	checkov -d ./ --skip-check CKV2_GHA_1 --skip-check CKV_DOCKER_9 --skip-check CKV_DOCKER_2 --skip-check CKV_DOCKER_4 --skip-check CKV2_DOCKER_4; \

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
	@$(call run_command, mkdir -p $(MODULE)/docs; terraform-docs markdown document --hide requirements --escape=false --sort-by required "$(MODULE)" > "$(MODULE)/docs/README.md")

.PHONY: init-all
init-all: ## Run `terraform init` for specifc [DIRECTORY]
	$(info --- init-all ($(DIRECTORY)))
	@for module in $(MODULES); do \
		echo Running terraform init on $$module; \
		cd $$module; \
		terraform init -upgrade; \
		cd ../../../../; \
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
