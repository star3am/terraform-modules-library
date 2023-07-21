terraform {
  source = "${local.module_folder}//."

  # Force Terraform to not ask for input value if some variables are undefined.
  extra_arguments "disable_input" {
    commands  = get_terraform_commands_that_need_input()
    arguments = ["-input=false"]
  }
}

locals {
  terragrunt_dir   = "${get_parent_terragrunt_dir()}"
  module_folder    = "${get_parent_terragrunt_dir()}"
  module_name      = basename(get_terragrunt_dir()) # Use the module with the same name as the terragrunt folder name

  module_written_for_cloud = element(split("/", get_parent_terragrunt_dir()), 2)
  path_relative_to_include = path_relative_to_include()
}

inputs = merge(
  { module_folder = local.module_folder },
  { module_name   = local.module_name },
  { module_written_for_cloud = local.module_written_for_cloud }
)
