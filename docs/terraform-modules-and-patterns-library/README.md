# Terraform Modules and Patterns Library

QA, Plan and Apply.

The Central Terraform Modules Library that accelerates your IaC journey.

Typically, Terraform Modules and Patterns have a lot of duplication, consider, pre-commit rules, pipelines, linters, config files, README, Dockerfiles etc. This project aims to create a solid foundation for your Terraform Modules and Patterns. A QA environment built with Automation, Compliance and Standard Developer Environments from the Development stage right through to Terraform Cloud.

You can access your Modules in a few ways

To use a Module from this repository, usually for Testing / QA / Development purposes, use the following in your Terraform Module Source

```
module "debug" {
  source = "git::git@github.com:star3am/terraform-modules-library.git//aws/modules/terraform-aws-debug?ref=main"
  ...
}
```

To use a Module from it's own repository, after it's been published, use the following in your Terraform Module Source

```
module "debug" {
  source = "git::git@github.com:star3am/terraform-aws-debug.git?ref=1.0.3"
  ...
}
```

And finally to use the Module from your Terraform Cloud Private Module Registry use following in your Terraform Module Source

```
module "debug" {
  source  = "app.terraform.io/nolan/debug/aws"
  version = "1.0.3"
}
```

You can read more about Terraform Module Sources here: https://developer.hashicorp.com/terraform/language/modules/sources

## Modules and Patterns

- https://developer.hashicorp.com/terraform/language/modules
- https://cloud.google.com/docs/terraform/best-practices-for-terraform
- https://developer.hashicorp.com/terraform/tutorials/modules/module

A Terraform module is a collection of standard configuration files in a dedicated directory. Terraform modules encapsulate groups of resources dedicated to one task, reducing the amount of code you have to develop for similar infrastructure components.

## Versioning with SemVer

- https://semver.org/

Given a version number MAJOR.MINOR.PATCH, increment the:

MAJOR version when you make incompatible API changes
MINOR version when you add functionality in a backward compatible manner
PATCH version when you make backward compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

In the world of software management there exists a dreaded place called "dependency hell." The bigger your system grows and the more packages you integrate into your software, the more likely you are to find yourself, one day, in this pit of despair.

In systems with many dependencies, releasing new package versions can quickly become a nightmare. If the dependency specifications are too tight, you are in danger of version lock (the inability to upgrade a package without having to release new versions of every dependent package). If dependencies are specified too loosely, you will inevitably be bitten by version promiscuity (assuming compatibility with more future versions than is reasonable). Dependency hell is where you are when version lock and/or version promiscuity prevent you from easily and safely moving your project forward.

As a solution to this problem, we propose a simple set of rules and requirements that dictate how version numbers are assigned and incremented. These rules are based on but not necessarily limited to pre-existing widespread common practices in use in both closed and open-source software. For this system to work, you first need to declare a public API. This may consist of documentation or be enforced by the code itself. Regardless, it is important that this API be clear and precise. Once you identify your public API, you communicate changes to it with specific increments to your version number. Consider a version format of X.Y.Z (Major.Minor.Patch). Bug fixes not affecting the API increment the patch version, backward compatible API additions/changes increment the minor version, and backward incompatible API changes increment the major version.

We call this system "Semantic Versioning." Under this scheme, version numbers and the way they change convey meaning about the underlying code and what has been modified from one version to the next.

## Module Promotion: Monorepo -> Multirepos -> Terraform Cloud Private Registry

As you've no doubt realised, the Terraform Modules Library is a Monorepo. That means we have a bunch of modules in the same repository. We do this for a reason, we can scan, lint, validate and check our code all at once. We avoid duplication, and we use DevContainers to create a consistent working developer environment with ease and in mere seconds.

But as you know, at some stage these modules should be promoted, checked into their own repository and versioned accordingly.

To do that we use a `.module-version` file. This file is similar to `.terraform-verion` and `.terragrunt-version` file, it stores the version of the module, and it will only make a new tag if that version file is changed.

A visual diagram of this process is below:

![Terraform Modules Library](/images/terraform-modules-library.drawio.png?raw=true "Terraform Modules Library")

## Terraform Cloud Private Module Registry

- https://developer.hashicorp.com/terraform/cloud-docs/registry

Terraform Cloud's private registry works similarly to the public Terraform Registry and helps you share Terraform providers and Terraform modules across your organization. It includes support for versioning and a searchable list of available providers and modules.

You can think of this repository as your library of modules and patterns. Although you can work on each module and pattern seperately using their own repository, you'd have to duplicate many things, for example the devcontainer, the pre-commit rules and so on.

:bulb: Your Terraform module names are important and should be in the format of `terraform-<PROVIDER>-<NAME>` Examples: terraform-google-vault or terraform-aws-ec2-instance.

See: https://developer.hashicorp.com/terraform/registry/modules/publish

For that reason, we've chosen a Monorepo.

The publishing mechanism works as follows:

Terraform Modules Library -> Modules Own Gihub Repository - Terraform Cloud Private Registry

1. You code and commit and test your modules in this repo.

![Terraform Modules Library](/images/terraform-modules-library-repository-codespace-editor.png?raw=true "Terraform Modules Library")

2. Once your module is ready, you create a `.module-version` file in the module's directory.

![Terraform Modules Library](/images/terraform-modules-library-aws-modules-debug-module-version-file.png?raw=true "Terraform Modules Library")

The Github Actions pipeline will run and detect a `.module-version` file and publish the module to it's own repository.

:bulb: Note for the module to be published you need a Personal Access Token with repository rights and this should be added in your repository Github Actions Secrets as:

```
- name: Push Modules and Patterns Upstream
  run: make push-modules-and-patterns-upstream
  env:
    ACCESS_TOKEN_GITHUB: ${{ secrets.ACCESS_TOKEN_GITHUB }}
```

See screenshot below:

![Terraform Modules Library](/images/terraform-modules-library-repository-secrets.png?raw=true "Terraform Modules Library")

The Github action will publish in the following name convention for example:

```
aws/module/debug -> terraform-aws-dbug
azure/module/resource-group -> terraform-azure-resource-group
```
and so on...

3. Create the modules own repository, for example, if your module is in `aws/module/terraform-aws-debug` you will create the following github repository `terraform-aws-dbug` see above.

![Terraform Modules Library](/images/aws-modules-debug-repository.png?raw=true "Terraform Modules Library")

4. Add the module in Terraform Cloud, and everything after that is Automated.

![Terraform Modules Library](/images/terraform-cloud-registry-publish-new-module.png?raw=true "Terraform Modules Library")

![Terraform Modules Library](/images/terraform-cloud-registry-publish-new-module-connect-to-vcs.png?raw=true "Terraform Modules Library")

![Terraform Modules Library](/images/terraform-cloud-registry-publish-new-module-select-repository.png?raw=true "Terraform Modules Library")

![Terraform Modules Library](/images/terraform-cloud-registry-publish-new-module-add-module.png?raw=true "Terraform Modules Library")

![Terraform Modules Library](/images/terraform-cloud-registry-publish-new-module-add-module-wait-to-become-ready.png?raw=true "Terraform Modules Library")

![Terraform Modules Library](/images/terraform-cloud-registry-publish-new-module-add-module-is-ready.png?raw=true "Terraform Modules Library")

This repository has modules and patterns in the following derectories as demostrated below.

```
.
├── aws
│   ├── modules
│   │   └── terraform-aws-debug
│   └── patterns
│       ├── terraform-aws-multiple-ec2-vms
│       ├── terraform-aws-multiple-ec2-vms-behind-elb
│       └── terraform-aws-single-ec2-vm
├── azure
│   ├── modules
│   │   ├── terraform-azure-debug
│   │   └── terraform-azure-resource-group
│   └── patterns
├── custom
│   ├── modules
│   │   └── terraform-custom-debug
│   └── patterns
├── gcp
│   ├── modules
│   │   └── terraform-gcp-debug
│   └── patterns
```
