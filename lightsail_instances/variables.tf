
provider "aws" {
  region = "eu-west-1"
}

# get current user
data "aws_caller_identity" "current" {}

## VARIABLES PASSED TO THE MODULE

# your project name
variable "project_name" {
  description = "Name for the project"
}

# tag for access control. Must be the same allowed for your user
variable "project_tag" {
  description = "Name for the project TAG "
}

variable "local_ssh_pubkey_path" {
  description = "Name for the project"
}

variable "vm_size" {
  description = "Name for the project"
}

variable "instance_count" {
  type = number
}

variable "instance_command" {
  type = string
}


