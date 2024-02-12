# Development Environment

Start Coding in Seconds.

Complete, All-in-Code Terraform Developer Environment, ready to use in seconds.

Typically, engineers are responsible for setting up their developer environment when they join a team. Development environment setup can take a day or a week, depending on the quality of the documentation. Using DevContainers we can automate the entire process. Helpful commands will format and lint your code and protect you from leaking credentials.

The Terraform Modules Librabry's main purpose is to help you develop Terraform with ease and excellence. To do that it makes use of Dev Containers.

You can Develop locally, using VSCode and Remotely (in a browser window) using Github Codespaces.

## Dev Containers

- https://code.visualstudio.com/docs/devcontainers/containers

The Visual Studio Code Dev Containers extension lets you use a container as a full-featured development environment. It allows you to open any folder inside (or mounted into) a container and take advantage of Visual Studio Code's full feature set. A devcontainer.json file in your project tells VS Code how to access (or create) a development container with a well-defined tool and runtime stack. This container can be used to run an application or to separate tools, libraries, or runtimes needed for working with a codebase.

The Tool set are installed and defined in the Dockerfile. Meaning that when you launch the Dev Container, you will have Terraform, Terragrunt, Terraform Docs, Make and everything else already installed and available for you to use.

Workspace files are mounted from the local file system or copied or cloned into the container. Extensions are installed and run inside the container, where they have full access to the tools, platform, and file system. This means that you can seamlessly switch your entire development environment just by connecting to a different container.

## Docker

To be able to take advantage of Dev Containers, you need Docker installed. You can do so by downloading and installing Docker from this link https://www.docker.com/products/docker-desktop/

## VSCode Local Dev

- Visual Studio Code https://code.visualstudio.com/download (with Remote development in Containers extension) https://code.visualstudio.com/docs/remote/containers-tutorial
- Clone this repository
- Now Open VSCode and Open this repository

:bulb: Let's look at some Screenshots of Opening your project

In VSCode, click File -> Open Folder and navigate to this project
![VSCode open repository folder](/images/vscode-open-repository-folder.png?raw=true "VSCode open repository folder")

If you have installed the Devcontainer Extension in the previous step, you'd see a Notification, bottom Right.

__Folder contains a Dev Container configuration file. Reopen folder to develop in a container__ and click `Reopen in Container`

![VSCode open repository folder open in devcontainer](/images/vscode-open-repository-folder-open-in-devcontainer.png?raw=true "VSCode open repository folder open in devcontainer")

You will see the Docker Build log bottom right and once done, you will see the files of the project in VSCode.

![VSCode open repository folder open in devcontainer docker build log](/images/vscode-open-repository-folder-open-in-devcontainer-build-log.png?raw=true "VSCode open repository folder open in devcontainer docker build log")

Now you can open a new Terminal. This will launch a new terminal inside the container, you will note that Terraform, Terragrunt and all the tools this project needs has already been installed for you.

![VSCode open repository folder open in devcontainer new Terminal](/images/vscode-open-repository-folder-open-in-devcontainer-new-terminal.png?raw=true "VSCode open repository folder open in devcontainer new Terminal")

## Github Codespaces Remote Dev

- https://github.com/features/codespaces
- https://docs.github.com/en/codespaces/overview

Github Codespaces simply put is a Devloper Environment in a Browser. It's extremely powerful, simple and fast to get started.  

Use Visual Studio Code, Jupyter, or JetBrains with the editor, terminal, debugger, version control, settings sync, and all of your extensions. Work from any device in a browser, or hand off to your desktop. It's that simple.

### Benefits of GitHub Codespaces

Reasons for choosing to work in a codespace include:

- Use a preconfigured development environment - You can work in a development environment that has been specifically configured for the repository. It will have all of the tools, languages, and configurations you need to work on that project. Everyone who works on that repository in a codespace will have the same environment. This reduces the likelihood of environment-related problems occurring and being difficult to debug. Each repository can have settings that will give contributors a ready-to-use, fit-for-purpose environment, and the environment on your local machine will be unchanged.

- Access the resources you need - Your local computer may not have the processing power, or storage space, you need to work on a project. GitHub Codespaces allows you to work remotely on a machine with adequate resources.

- Work anywhere - All you need is a web browser. You can work in a codespace on your own computer, on a friend's laptop, or on a tablet. Open your codespace and pick up from where you left off on a different device.

- Choose your editor - Work in the browser in the VS Code web client, or choose from a selection of desktop-based applications.

- Work on multiple projects - You can use multiple codespaces to work on separate projects, or on different branches of the same repository, compartmentalizing your work to avoid changes made for one piece of work accidentally affecting something else you're working on.

- Pair program with a teammate - If you work on a codespace in VS Code, you can use Live Share to work collaboratively with other people on your team. For more information, see "Working collaboratively in a codespace."

- Publish your web app from a codespace - Forward a port from your codespace and then share the URL, to allow teammates to try out the changes you've made to the application before you submit those changes in a pull request.

- Try out a framework - GitHub Codespaces reduces the setup time when you want to learn a new framework. Just create a codespace from one of the quickstart templates.

### Get started

To get started head on over to https://github.com/star3am/terraform-modules-library

![Terraform Modules Library](/images/github-terraform-modules-library-repository.png?raw=true "Terraform Modules Library")

Now you can either fork or clone Terraform Modules Library to your own Github account.

To fork it, simply click the fork button and complete the steps.

![Terraform Modules Library](/images/github-terraform-modules-library-repository-fork.png?raw=true "Terraform Modules Library")

To clone it, simply click on the click on the code button and clone it locally

![Terraform Modules Library](/images/github-terraform-modules-library-repository-clone.png?raw=true "Terraform Modules Library")

### Launch Codespace

Now that you have cloned or forked Terraform Modules Library, let's launch our Codespace and explore our environment a bit.

To do this you can click on the code button and then click on Create Codespace on main

![Terraform Modules Library](/images/github-terraform-modules-library-create-codespace.png?raw=true "Terraform Modules Library")

This will build the Dockerfile to create the Codespace environment for you. The Dockerfile is compatible with Amd64, Intel and Arm64 Architectures.

![Terraform Modules Library](/images/github-terraform-modules-library-build-codespace.png?raw=true "Terraform Modules Library")

After the build your Codespace environement should be created and ready to use.

![Terraform Modules Library](/images/github-terraform-modules-library-codespace.png?raw=true "Terraform Modules Library")

### Terraform Cloud Integration

- https://github.com/hashicorp/vscode-terraform

Because we installed the HashiCorp Terraform Extension via our Devcontainer.json file we will have Terraform Lanuage aids in our editor and also Terraform Cloud Integration

.devcontainer/devcontainer.json
```json
  "customizations": {
    "vscode": {
      "extensions": [
        "dbaeumer.vscode-eslint",
        "hashicorp.terraform",
        "nhoizey.gremlins",
        "hashicorp.hcl"
      ]
    }
  }
```
In order to access Terraform Cloud and our workspaces, we need to Authenticate, so let's go through that process now.

![Terraform Modules Library](/images/github-terraform-modules-library-codespace-terraform-cloud-login.png?raw=true "Terraform Modules Library")

Click on the Login to Terraform Cloud button. You will be asked to approve opening Terraform Cloud

![Terraform Modules Library](/images/github-terraform-modules-library-codespace-terraform-cloud-login-extension-wants-to-sign-in-enter-token-open-tfc.png?raw=true "Terraform Modules Library")

You will be asked whether you want to use an existing Token or generate a new on on Terraform Cloud, I am goin to chose to generate a new Token for this example.

![Terraform Modules Library](/images/github-terraform-modules-library-codespace-terraform-cloud-login-extension-wants-to-sign-in-enter-token.png?raw=true "Terraform Modules Library")

You will be asked to confirm that the extension wants to sign in using Terraform Cloud.

![Terraform Modules Library](/images/github-terraform-modules-library-codespace-terraform-cloud-login-extension-wants-to-sign-in.png?raw=true "Terraform Modules Library")

A new browser window will open the Terraform Cloud Login window.

![Terraform Modules Library](/images/github-terraform-modules-library-codespace-terraform-cloud-login-to-terraform-cloud.png?raw=true "Terraform Modules Library")

I am going to sign in using my HCP Account and Select Sign in with Github.

![Terraform Modules Library](/images/github-terraform-modules-library-codespace-terraform-cloud-login-to-terraform-cloud-using-github.png?raw=true "Terraform Modules Library")

After successfully signing into Terraform Cloud I will be directed to the Tokens page, where I will generate a new Token to use with my Codespace environment.

![Terraform Modules Library](/images/github-terraform-modules-library-codespace-terraform-cloud-tokens.png?raw=true "Terraform Modules Library")

Let's click on Create API Token now. I will generate a new Token and Give it a descriptive name. Because this is a Demo, I will set my Token TTL (Time To Live) for only 7 days, after which, it will be expired.

![Terraform Modules Library](/images/github-terraform-modules-library-codespace-terraform-cloud-tokens-create-api-token.png?raw=true "Terraform Modules Library")

Your new token will now be displayed, let's copy that and head back over to our Codespace Window

![Terraform Modules Library](/images/github-terraform-modules-library-codespace-terraform-cloud-tokens-api-token.png?raw=true "Terraform Modules Library")

Now we can paste our token into the given field for an existing token

![Terraform Modules Library](/images/github-terraform-modules-library-codespace-terraform-cloud-paste-api-token.png?raw=true "Terraform Modules Library")

After we press enter, we can select our Terraform Cloud organisation and our workspaces will now be displayed.

![Terraform Modules Library](/images/github-terraform-modules-library-codespace-terraform-cloud-logged-in.png?raw=true "Terraform Modules Library")

## Github Actions

- https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions
- https://docs.github.com/en/actions/learn-github-actions/variables

We need to set a few secrets in Github Actions to accomplish a few tasks.

### Github Actions secrets

`ACCESS_TOKEN_GITHUB`: A Personal Git Access Toke to publish the Terraform Modules into their own repository
`TF_API_TOKEN`: To Authenticate against Terraform Cloud

### Github Actions variables

`REBUILD_CONTAINER_IMAGE`: Set to true or false to rebuild the container image, only needed when you make changes to the Dockerfile

### Pipeline

The Github Actions pipeline has the following jobs
- build-and-publish-latest
- run-run-dot-sh
- terraform-plan-on-tfc

#### build-and-publish-latest

Builds and Publish to Github Container Registry the Dockerfile. The container image is used for the subsequint jobs to run their tasks in, this means that the DevContainer is exactly what the Pipeline runs in, making this workflow extremely consistent, because what you get in the DevContainer is exactly what the build agent will get.

#### run-run-dot-sh

run.sh is a combination of commands driven by the Makefile. Thus you need to look into the Makefile to see what those commands actually do. I've tried to keep it simple so that it can be extended fairly easily by most people.

```bash
#!/bin/bash -e

echo "Simulate Pipeline"

echo "pre-commit run -a"
pre-commit run -a

echo "make clean"
make clean

echo "make init-all"
make init-all

echo "make tfsec"
make tfsec

echo "make checkov"
make checkov

echo "make format"
make format

echo "make lint"
make lint

echo "make tflint"
make tflint

echo "make validate"
make validate

echo "make docs"
make docs

# echo "make plan-all"
# make plan-all
```

## run.sh

run.sh should be run frequintly, even before you commit your code. It will fix line endings, trailing white space, check for AWS key pairs and private keys. In addition it will do Terraform format and validate for you, it will initialise all your modules, and run TFSec and Checkov on your code.

run.sh will run in the pipeline as well, meaning if it fails your PR cannot be merged. run.sh will run a battery of tests, scanners and linters on your code.
