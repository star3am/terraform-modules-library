# Governance and Compliance

Shift Left Security.

Complete, All-in-Code Governance and Compliance, ready to use in seconds.

Shift left means conducting security testing sooner in the development phase. In traditional DevOps, the various stages would flow like this: Plan -> Code -> Build -> Test -> Deploy -> Monitor. As you can see, testing tends to occur after the software is built. This project aims to move Security closer to the Code stage, by using Pre-Commit rules, linters and static code analysis tools and others.

## Pre-Commit

Pre-Commit is a framework for managing and maintaining multi-language pre-commit hooks.

By using pre-commit hooks to run these tools, developers can catch potential issues before they make it into the codebase. This can save a lot of time and effort down the road, as issues can be much harder to fix once they are in the codebase, consider leaking AWS key pairs or Private keys.

Pre-Commit rules are specified in `.pre-commit-config.yaml`

Example FAIL:

```
Simulate Pipeline
pre-commit run -a
check for added large files..............................................Passed
check for merge conflicts................................................Passed
check vcs permalinks.....................................................Passed
forbid new submodules................................(no files to check)Skipped
fix end of files.........................................................Failed
- hook id: end-of-file-fixer
- exit code: 1
- files were modified by this hook

Fixing images/terraform-modules-library.drawio.svg
Fixing docs/terraform-modules-and-patterns-library/README.md
Fixing docs/governance-and-compliance/README.md

trim trailing whitespace.................................................Failed
- hook id: trailing-whitespace
- exit code: 1
- files were modified by this hook

Fixing docs/development-environment/README.md
Fixing docs/governance-and-compliance/README.md

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

Example PASS:

```
Simulate Pipeline
pre-commit run -a
check for added large files..............................................Passed
check for merge conflicts................................................Passed
check vcs permalinks.....................................................Passed
forbid new submodules................................(no files to check)Skipped
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

## TFSec and Checkov

Static analysis - Analyzes code in isolation, identifying risks, misconfigurations, and compliance faults only relevant to the IaC itself. Tools such as TFSec and Checkov etc, can be leveraged for static analysis of IaC.

### TFSec

- https://github.com/aquasecurity/tfsec

tfsec uses static analysis of your terraform code to spot potential misconfigurations.

Features
☁️ Checks for misconfigurations across all major (and some minor) cloud providers
- ⛔ Hundreds of built-in rules
- 🪆 Scans modules (local and remote)
- ➕ Evaluates HCL expressions as well as literal values
- ↪️ Evaluates Terraform functions e.g. concat()
- 🔗 Evaluates relationships between Terraform resources
- 🧰 Compatible with the Terraform CDK
- 🙅 Applies (and embellishes) user-defined Rego policies
- 📃 Supports multiple output formats: lovely (default), JSON, SARIF, CSV, CheckStyle, JUnit, text, Gif.
- 🛠️ Configurable (via CLI flags and/or config file)
- ⚡ Very fast, capable of quickly scanning huge repositories
- 🔌 Plugins for popular IDEs available (JetBrains, VSCode and Vim)
- 🏡 Community-driven - come and chat with us on Slack!

### Checkov

- https://www.checkov.io/

Checkov scans cloud infrastructure configurations to find misconfigurations before they're deployed.

Checkov uses a common command line interface to manage and analyze infrastructure as code (IaC) scan results across platforms such as Terraform, CloudFormation, Kubernetes, Helm, ARM Templates and Serverless framework.

## Terraform fmt and validate

### Terraform fmt

- https://developer.hashicorp.com/terraform/cli/commands/fmt

The terraform fmt command is used to rewrite Terraform configuration files to a canonical format and style. This command applies a subset of the Terraform language style conventions, along with other minor adjustments for readability.

Other Terraform commands that generate Terraform configuration will produce configuration files that conform to the style imposed by terraform fmt, so using this style in your own files will ensure consistency.

The canonical format may change in minor ways between Terraform versions, so after upgrading Terraform we recommend to proactively run terraform fmt on your modules along with any other changes you are making to adopt the new version.

We don't consider new formatting rules in terraform fmt to be a breaking change in new versions of Terraform, but we do aim to minimize changes for configurations that are already following the style examples shown in the Terraform documentation. When adding new formatting rules, they will usually aim to apply more of the rules already shown in the configuration examples in the documentation, and so we recommend following the documented style even for decisions that terraform fmt doesn't yet apply automatically.

Formatting decisions are always subjective and so you might disagree with the decisions that terraform fmt makes. This command is intentionally opinionated and has no customization options because its primary goal is to encourage consistency of style between different Terraform codebases, even though the chosen style can never be everyone's favorite.

We recommend that you follow the style conventions applied by terraform fmt when writing Terraform modules, but if you find the results particularly objectionable then you may choose not to use this command, and possibly choose to use a third-party formatting tool instead. If you choose to use a third-party tool then you should also run it on files that are generated automatically by Terraform, to get consistency between your hand-written files and the generated files.

### Terraform validate

- https://developer.hashicorp.com/terraform/cli/commands/validate

The terraform validate command validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc.

Validate runs checks that verify whether a configuration is syntactically valid and internally consistent, regardless of any provided variables or existing state. It is thus primarily useful for general verification of reusable modules, including correctness of attribute names and value types.

It is safe to run this command automatically, for example as a post-save check in a text editor or as a test step for a re-usable module in a CI system.

## Linters

A linter is a tool to help you improve your code. But in what ways does it do that? The answer is: by analyzing your source code looking for problems.

The term linter comes from a tool originally called 'lint' that analyzed C source code. The computer scientist Stephen C. Johnson developed this utility in 1978 when he worked at Bell Labs.

### Terraform Lint

- https://github.com/terraform-linters/tflint

TFLint is a framework and each feature is provided by plugins, the key features are as follows:

- Find possible errors (like invalid instance types) for Major Cloud providers (AWS/Azure/GCP).
- Warn about deprecated syntax, unused declarations.
- Enforce best practices, naming conventions.

### YAML Lint

- https://github.com/adrienverge/yamllint

A linter for YAML files.

yamllint does not only check for syntax validity, but for weirdnesses like key repetition and cosmetic problems such as lines length, trailing spaces, indentation, etc.

## Terraform docs

- https://github.com/terraform-docs/terraform-docs

Terraform Docs will generate Terraform Module documentation from your Terraform Code. It's an incredibly useful tool to keep documentation up to date, and it will generate documentation in various output formats.

## Terraform Cloud

- https://app.terraform.io
- https://www.hashicorp.com/resources/what-is-terraform-cloud

Terraform Cloud is a SaaS that we support—that instead, when you run Terraform you still could run it on your local machine, but now it saves and retrieves the state file from Terraform Cloud—which is running over here.

This simplifies a lot of things. First of all, this is pretty much invisible. It still exists, but we manage it for you. Second of all, we could perform a lot more security on this access. You can see who is accessing your state file, control who accesses the state file, and more.

In addition to that, Terraform Cloud will also version and back up your state file so that you could go back in time and see what your infrastructure looked like in the past—or if something went wrong, you could restore a past version. This is something that's really tricky with a local file because this is a normal file on your computer—you would have to be responsible for this yourself. In Terraform Cloud's case, you could still talk directly to the various cloud providers. That's how Terraform Cloud works today. That's the major benefit that remote state brings for you.

### Terraform Cloud collaboration/governance

On top of remote state, there are a number of other features in Terraform Cloud in other tiers that enable things like centralized runs, plan approvals, and more. This changes this behavior, so that instead of talking directly to the cloud providers it talks instead to Terraform Cloud.

Here, instead of talking directly to the cloud providers, what would happen is all your requests to plan and apply would go through Terraform Cloud. Then from here—would then go to the cloud providers. As I said, this is optional. You could use the state storage and talk directly to the cloud providers or you could add this on and use this in the middle.

The benefit is you have a full history here of all the runs that have ever happened. Terraform ensures that only one run happens at a time—and you can get approvals. So, if Alice submits a plan to change infrastructure, Bob has to approve it before it goes through.

You can see how having a SaaS around Terraform can simplify and hide a lot of internal details that are difficult to do with Terraform alone. Broadly, the theme around this is collaboration.

Terraform on your computer—by itself—is a great, powerful tool. But it makes it really hard as soon as you're working with a team or with many people. You can do it. There are ways to coordinate this, but we're introducing Terraform Cloud to make this easy and automatic, and idiomatic in terms of how it should work across all Terraform users.

This makes it clean to have access control here, access control here, history—and you still keep the same Terraform workflow. It's still terraform plan, terraform apply, just like you would here. It will automatically use Terraform Cloud in the backend.
