# Terraform Modules Library

This repository forms the basis of my own personal implimentation of a Terraform Modules Library.

It's made up of pre-coded modules to get you started quickly.

It also uses tools, such as TFEnv, Terraform Docs, Linters, VSCode's Dev / Remote containers and many more to provide effectively a Terraform / DevOps engineer development lab to develop and test Terraform Modules. 

You are most welcome and in fact encouraged to contribute back to this repository.

![Terraform Modules Library](images/009-owl.png?raw=true "Terraform Modules Library")

## Demo

A quick video walk through demo of this solution

![Terraform Modules Library](images/demo.gif?raw=true "Terraform Modules Library")

## Features

This repository uses some best practice tools to help us with our modules. Tools such as TFENV which automatically installs the correct Terraform Version, Terraform Docs and Terraform Lint, the comprehensive feature list is detailed below.

| Product | State |
|-------|---------|
| VSCode Dev Container | ✓ |
| Pre-Commit | ✓ |
| Terratest | ✘ |
| Terraform | ✓ |
| Terragrunt | ✓ |
| TFEnv | ✓ |
| TGEnv | ✓ |
| AWS | ✓ |
| GCP | ✓ |
| Azure | ✓ |
| Custom | ✓ |
| Terraform Lint | ✓ |
| Terraform Format | ✓ |
| Terraform Validate | ✓ |
| Terraform Docs | ✓ |

- Pre-commit: Runs pre-commit with the given config in `.pre-commit-config.yaml.

- Linters: terraform-lint tflint yamllint

- Terraform lint: terraform fmt -check -recursive -diff

- Terraform format: terraform fmt -check -recursive -diff

- Clean: Clean up .terraform and .terrgrunt-cache folders

- Terraform docs: Create README.md files for each Terraform Module on the fly, generated from your code

- Terraform Plan: Using Terragrunt we run a plan on all modules

## Getting started

Please install the following software

- Docker Desktop https://www.docker.com/products/docker-desktop/
- Visual Studio Code https://code.visualstudio.com/download (with Remote development in Containers extension) https://code.visualstudio.com/docs/remote/containers-tutorial
- Clone this repository
- Now Open VSCode and Open this repository

:bulb: Let's look at some Screenshots of Opening your project

In VSCode, click File -> Open Folder and navigate to this project
![VSCode open repository folder](images/vscode-open-repository-folder.png?raw=true "VSCode open repository folder")

If you have installed the Devcontainer Extension in the previous step, you'd see a Notification, bottom Right.

__Folder contains a Dev Container configuration file. Reopen folder to develop in a container__ and click `Reopen in Container`

![VSCode open repository folder open in devcontainer](images/vscode-open-repository-folder-open-in-devcontainer.png?raw=true "VSCode open repository folder open in devcontainer")

You will see the Docker Build log bottom right and once done, you will see the files of the project in VSCode.

![VSCode open repository folder open in devcontainer docker build
log](images/vscode-open-repository-folder-open-in-devcontainer-build-log.png?raw=true "VSCode open repository folder open in
devcontainer docker build log")

Now you can open a new Terminal. This will launch a new terminal inside the container, you will note that Terraform, Terragrunt and all the tools this project needs has already been installed for you.

![VSCode open repository folder open in devcontainer new Terminal](images/vscode-open-repository-folder-open-in-devcontainer-new-terminal.png?raw=true "VSCode open repository folder open in devcontainer new Terminal")

Now you need to Authenticate to your Clouds, see: __Authenticating__ below.

## Authenticating

Somewhere someone or something has to authenticate against the clouds, the pipeline will take care of this for you, however if you are developing locally, you need to take care of this yourself.

```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_REGION=

export GOOGLE_CREDENTIALS=

export ARM_CLIENT_ID=
export ARM_CLIENT_SECRET=
export ARM_SUBSCRIPTION_ID=
export ARM_TENANT_ID=
```

## Example output

When you run ./run.sh you will get the following output

`ubuntu@0c9b71981e0b:/app$ ./run.sh`

```
Similate Pipeline
make lint
--- terraform-lint
>>> Exec (terraform fmt -check -recursive -diff)
--- tflint
--- tflint-module (aws/modules/debug)
>>> Exec (tflint aws/modules/debug)
--- tflint-module (gcp/modules/debug)
>>> Exec (tflint gcp/modules/debug)
--- tflint-module (azure/modules/debug)
>>> Exec (tflint azure/modules/debug)
--- tflint-module (azure/modules/resource-group)
>>> Exec (tflint azure/modules/resource-group)
--- tflint-module (custom/modules/debug)
>>> Exec (tflint custom/modules/debug)
--- yamllint
>>> Exec (yamllint -f auto .)
make tflint
--- tflint
--- tflint-module (aws/modules/debug)
>>> Exec (tflint aws/modules/debug)
--- tflint-module (gcp/modules/debug)
>>> Exec (tflint gcp/modules/debug)
--- tflint-module (azure/modules/debug)
>>> Exec (tflint azure/modules/debug)
--- tflint-module (azure/modules/resource-group)
>>> Exec (tflint azure/modules/resource-group)
--- tflint-module (custom/modules/debug)
>>> Exec (tflint custom/modules/debug)
make format
--- terraform-format
>>> Exec (terraform fmt -recursive -diff)
make clean
--- clean
>>> Exec (find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;)
>>> Exec (find . -type f -name ".terraform.lock.hcl" -prune -exec rm -rf {} \;)
>>> Exec (rm -fr /opt/terragrunt-cache/*)
make docs
--- docs
--- docs-module (aws/modules/debug)
>>> Exec (terraform-docs markdown document --hide requirements --escape=false --sort-by required "aws/modules/debug" > "aws/modules/debug/README.md")
--- docs-module (gcp/modules/debug)
>>> Exec (terraform-docs markdown document --hide requirements --escape=false --sort-by required "gcp/modules/debug" > "gcp/modules/debug/README.md")
--- docs-module (azure/modules/debug)
>>> Exec (terraform-docs markdown document --hide requirements --escape=false --sort-by required "azure/modules/debug" > "azure/modules/debug/README.md")
--- docs-module (azure/modules/resource-group)
>>> Exec (terraform-docs markdown document --hide requirements --escape=false --sort-by required "azure/modules/resource-group" > "azure/modules/resource-group/README.md")
--- docs-module (custom/modules/debug)
>>> Exec (terraform-docs markdown document --hide requirements --escape=false --sort-by required "custom/modules/debug" > "custom/modules/debug/README.md")
make plan-all
--- plan-all ("./")
>>> Exec (terragrunt run-all plan --terragrunt-non-interactive --terragrunt-include-external-dependencies --terragrunt-working-dir "./")
[INFO] Getting version from tgenv-version-name
[INFO] TGENV_VERSION is 0.48.4
INFO[0000] The stack at ./ will be processed in the following order for command plan:
Group 1
- Module /app/aws/modules/debug
- Module /app/azure/modules/debug
- Module /app/azure/modules/resource-group
- Module /app/custom/modules/debug
- Module /app/gcp/modules/debug


Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/null versions matching "~> 3.0"...

Initializing the backend...

Initializing the backend...

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/null versions matching "~> 3.0"...

Initializing provider plugins...
- Finding hashicorp/null versions matching "~> 3.0"...

Initializing provider plugins...
- Finding hashicorp/azurerm versions matching "~> 3.0"...

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/null versions matching "~> 3.0"...
- Installing hashicorp/null v3.2.1...
- Installing hashicorp/null v3.2.1...
- Installing hashicorp/null v3.2.1...
- Installing hashicorp/azurerm v3.66.0...
- Installing hashicorp/null v3.2.1...
- Installed hashicorp/null v3.2.1 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.debug will be created
  + resource "null_resource" "debug" {
      + id       = (known after apply)
      + triggers = {
          + "module_folder"            = "/app/custom/modules/debug"
          + "module_name"              = "debug"
          + "module_written_for_cloud" = "custom"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + module_folder            = "/app/custom/modules/debug"
  + module_name              = "debug"
  + module_written_for_cloud = "custom"

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
- Installed hashicorp/null v3.2.1 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
- Installed hashicorp/null v3.2.1 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.debug will be created
  + resource "null_resource" "debug" {
      + id       = (known after apply)
      + triggers = {
          + "module_folder"            = "/app/azure/modules/debug"
          + "module_name"              = "debug"
          + "module_written_for_cloud" = "azure"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + module_folder            = "/app/azure/modules/debug"
  + module_name              = "debug"
  + module_written_for_cloud = "azure"

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.debug will be created
  + resource "null_resource" "debug" {
      + id       = (known after apply)
      + triggers = {
          + "module_folder"            = "/app/aws/modules/debug"
          + "module_name"              = "debug"
          + "module_written_for_cloud" = "aws"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + module_folder            = "/app/aws/modules/debug"
  + module_name              = "debug"
  + module_written_for_cloud = "aws"

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
- Installed hashicorp/null v3.2.1 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.debug will be created
  + resource "null_resource" "debug" {
      + id       = (known after apply)
      + triggers = {
          + "module_folder"            = "/app/gcp/modules/debug"
          + "module_name"              = "debug"
          + "module_written_for_cloud" = "gcp"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + module_folder            = "/app/gcp/modules/debug"
  + module_name              = "debug"
  + module_written_for_cloud = "gcp"

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
- Installed hashicorp/azurerm v3.66.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
data.azurerm_subscription.module: Reading...
data.azurerm_subscription.module: Read complete after 0s [id=/subscriptions/b6a8efd1-471a-49ed-9835-fa8731a5e9fa]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.module will be created
  + resource "azurerm_resource_group" "module" {
      + id       = (known after apply)
      + location = "australiaeast"
      + name     = "Pay-As-You-Go-rg"
      + tags     = {
          + "Module" = "resource-group"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + id = (known after apply)

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
pre-commit run -a
check for added large files..............................................Passed
check for merge conflicts................................................Passed
check vcs permalinks.....................................................Passed
forbid new submodules................................(no files to check)Skipped
don't commit to branch...................................................Passed
fix end of files.........................................................Passed
trim trailing whitespace.................................................Passed
check yaml...............................................................Passed
check for merge conflicts................................................Passed
check for broken symlinks............................(no files to check)Skipped
check json...............................................................Passed
check for case conflicts.................................................Passed
mixed line ending........................................................Passed
detect aws credentials...................................................Passed
detect private key.......................................................Passed
Terraform fmt............................................................Passed
Terraform docs...........................................................Passed
Lint Dockerfiles.........................................................Passed
```

## Contributing

### Adding/Changing a Module

1. Create a new git branch e.g. `feature/xxxxxx`
2. Either `cd` into the module folder and make the changes e.g. `modules/debug/` or create a new module.
3. Run `terraform init` to install providers for the module
4. Run `terraform fmt -check -recursive` to format any changes.
5. If format is successful run `terraform validate`
6. If validate is successful run `terraform plan`

## Testing

1. To test a Terraform module, use a test module (module/xxxxxx/test/)
2. When test module is ready for a Terraform module, run `run.sh` to check the result

## Debugging

At some stage of the game you will need to debug something, this setup, automates away a lot of toil, but with these automation and abstraction comes a lack of visibility.

- Make `make -dn docs` use the -dn flag for make

## FAQs

- Why are You using a Mono Repo?
I try to avoid code duplication and as a small team, to avoid this developers commit hell cycle, I opted for a Mono repo, you are welcome to split it up. You can always use teh individual modules using the Terraform Source `source = "git::git@github.com:star3am/terraform-modules-library.git//aws/modules/debug?ref=main"`

## Gotchas

- You will see in the terragrunt.hcl files where I detect the module source I post-fix it with `//.` see this bug: https://github.com/gruntwork-io/terragrunt/issues/1675

- fatal: detected dubious ownership in repository at '/app' To add an exception for this directory see this page: https://www.kenmuse.com/blog/avoiding-dubious-ownership-in-dev-containers/

- I've nto found a way to force no-cache so sometimes you need to say ReBuild and ReOpen in Container.

![VSCode ReBuild and ReOpen in Container](images/remote-command-palette.png?raw=true "VSCode ReBuild and ReOpen in Container")

## Thanks!

Many thanks goes to the team at Gruntwork https://gruntwork.io/ for their amazing effort and for selflessly sharing their code in the great spirit of Open Source. In fact https://github.com/gruntwork-io/terragrunt-infrastructure-modules-example inspired this repo and set the foundation for this repo.
