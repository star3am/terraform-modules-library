# Terraform Modules Library

This repository forms the basis of my own personal implimentation of a Terraform Modules Library.

Your Developer Environment is driven by DevContainers, and all the dependencies are installed for you. You can have a look at the `Dockerfile`

The container works on AMD64, Intel and ARM64 architectures.

It also uses tools, such as TFEnv, TFSec, Checkov, Terraform Docs, Linters, VSCode's Dev / Remote containers and many more to provide effectively a Terraform / DevOps engineer's development lab to develop and test Terraform Modules.

This project is affectively a QA / Test / Development project for your Terraform Modules, once you create a `.module-version` file in your modules, and you create the module's repository, the modules will be published to it's own repository.

![Terraform Modules Library](images/009-owl.png?raw=true "Terraform Modules Library")

## Diagram


On a high level this project can be visualised as the following diagram

![Terraform Modules Library](images/terraform-modules-library.drawio.png?raw=true "Terraform Modules Library")

## Demo

A quick video walk through demo of this solution

![Terraform Modules Library](images/demo.gif?raw=true "Terraform Modules Library")

## Information

This repository consists basically of 3 topics.

1. [Develppment Environment](docs/development-environment/#development-environment)

- [Dev Containers](docs/development-environment/#dev-containers)
- [Docker](docs/development-environment/#docker)
- [VSCode Local Dev](docs/development-environment/#vscode-local-dev)
- [Github Codespaces Remote Dev](docs/development-environment/#github-codespaces-remote-dev)
- [Github Actions](docs/development-environment/#github-actions)
- [Github Secrets and Variables](docs/development-environment/#github-secrets-and-variables)
- [run.sh](docs/development-environment/#run-sh)

2. [Governance and Compliance](docs/governance-and-compliance/#governance-and-compliance)

- [Pre-Commit](docs/governance-and-compliance/#pre-commit)
- [TFSec and Checkov](docs/governance-and-compliance/#tfsec-and-checkov)
- [Terraform fmt and validate](docs/governance-and-compliance/#terraform-fmt-and-validate)
- [Linters](docs/governance-and-compliance/#linters)
- [Terraform docs](docs/governance-and-compliance/#terraform-docs)
- [Terraform Cloud](docs/governance-and-compliance/#terraform-cloud)

3. [Terraform Modules and Patterns Library](docs/terraform-modules-and-patterns-library/#terraform-modules-and-patterns-library)

- [Modules and Patterns](docs/terraform-modules-and-patterns-library/#modules-and-patterns)
- [Versioning with SemVer](docs/terraform-modules-and-patterns-library/#versioning-with-semver)
- [Module Promotion: Monorepo -> Multirepos -> Terraform Cloud Private Registry](docs/terraform-modules-and-patterns-library/#module-promotion-monorepo---multirepos---terraform-cloud-private-registry)
- [Terraform Cloud Private Module Registry](docs/terraform-modules-and-patterns-library/#terraform-cloud-private-module-registry)

## Features

This repository uses some best practice tools to help us with our modules. Tools such as TFENV which automatically installs the correct Terraform Version, Terraform Docs and Terraform Lint, the comprehensive feature list is detailed below.

| Product | State | URL |
|---------|-------|-----|
| VSCode Dev Container | ✓ | https://code.visualstudio.com/docs/devcontainers/containers |
| Pre-Commit | ✓ | https://pre-commit.com/ |
| Terratest | ✘ | https://terratest.gruntwork.io/ |
| Terraform | ✓ | https://www.terraform.io/ |
| Terraform Cloud | ✓ | https://app.terraform.io/ |
| Terragrunt | ✓ | https://terragrunt.gruntwork.io/ |
| TFEnv | ✓ | https://github.com/tfutils/tfenv |
| TGEnv | ✓ | https://github.com/cunymatthieu/tgenv |
| TFsec | ✓ | https://github.com/aquasecurity/tfsec |
| Checkov | ✓ | https://www.checkov.io/ |
| AWS | ✓ | https://aws.amazon.com/free/ |
| GCP | ✓ | https://cloud.google.com/free/ |
| Azure | ✓ | https://azure.microsoft.com/en-au/free/ |
| Custom | ✓ | - |
| Terraform Lint | ✓ | https://github.com/terraform-linters/tflint |
| Terraform Format | ✓ | https://developer.hashicorp.com/terraform/cli/commands/fmt |
| Terraform Validate | ✓ | https://developer.hashicorp.com/terraform/cli/commands/validate |
| Terraform Docs | ✓ | https://github.com/terraform-docs/terraform-docs |

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
PIPELINE OUTPUT
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
I try to avoid code duplication and as a small team, to avoid this developers commit hell cycle, I opted for a Mono repo, you are welcome to split it up. You can always use the individual modules using the Terraform Source `source = "git::git@github.com:star3am/terraform-modules-library.git//aws/modules/terraform-aws-debug?ref=main"`

## Gotchas

- You will see in the terragrunt.hcl files where I detect the module source I post-fix it with `//.` see this bug: https://github.com/gruntwork-io/terragrunt/issues/1675

- fatal: detected dubious ownership in repository at '/app' To add an exception for this directory see this page: https://www.kenmuse.com/blog/avoiding-dubious-ownership-in-dev-containers/

- I've not found a way to force no-cache so sometimes you need to say ReBuild and ReOpen in Container.

![VSCode ReBuild and ReOpen in Container](images/remote-command-palette.png?raw=true "VSCode ReBuild and ReOpen in Container")

## Thanks!

Many thanks goes to the team at Gruntwork https://gruntwork.io/ for their amazing effort and for selflessly sharing their code in the great spirit of Open Source. In fact https://github.com/gruntwork-io/terragrunt-infrastructure-modules-example inspired this repo and set the foundation for this repo.

## Links

- https://www.hashicorp.com/blog/terraform-mono-repo-vs-multi-repo-the-great-debate
- https://developer.hashicorp.com/terraform/language/modules/sources
- https://github.com/gruntwork-io/terragrunt-infrastructure-modules-example
- https://medium.com/@riaan.nolan/top-gun-terraform-development-environment-60ac00d49577
- https://hashiqube.com
- https://www.linkedin.com/in/riaannolan/
