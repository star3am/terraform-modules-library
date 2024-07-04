# tflint-ignore-file: terraform_unused_declarations

variable "name" {
  type        = string
  description = "The name to use for the server."
  default     = "nolan-server"

  validation {
    condition     = length(var.name) > 4 && substr(var.name, 0, 4) == "nolan-"
    error_message = "The server name must start with \"nolan-\"."
  }
}

# variable "os_type" {
#   type        = string
#   description = "Operating System to use for the VM. One of 'windows-server-2019' or 'windows-server-2022' or 'amazon-linux-2023' or 'redhat-9.3' or 'redhat-8.8' as the value"
#   default     = "amazon-linux-2023"

#   validation {
#     condition     = contains(["windows-server-2019", "windows-server-2022", "amazon-linux-2023", "redhat-9.3", "redhat-8.8"], var.os_type)
#     error_message = "The os_type must be either of windows-server-2019 or windows-server-2022 or amazon-linux-2023 or redhat-9.3 or redhat-8.8 as the value."
#   }
# }

variable "ami_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  default     = ""

  validation {
    condition     = var.ami_id == "" || (length(var.ami_id) >= 4 && substr(var.ami_id, 0, 4) == "ami-")
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}
