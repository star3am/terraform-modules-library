variable "location" {
  type        = string
  default     = "Australia East"
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Set of base tags that will be associated with each supported resource."
}

variable "module_name" {
  type        = string
  default     = "module_name"
  description = "The Module name"
}
