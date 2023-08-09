# your project name
variable "project_name" {
  description = "Name for the project"
  default     = "ProjLightsailTest"
}

# tag for access control. Must be the same allowed for your user
variable "project_tag" {
  description = "Name for the project TAG "
  default     = "projX"
}

variable "local_ssh_pubkey_path" {
  description = "Local path to public key used for authentication"
  default     = "~/.ssh/aws_pj.pub"
}

variable "instance_count" {
  type    = number
  default = 3
}

variable "instance_command" {
  type    = string
  default = "echo Hello > /tmp/hello"
}

variable "bundle_id_list" {
  description = "Bundle_id, lightsail type"
  type        = map(any)
  default = {
    "nano"   = "nano_2_0",
    "micro"  = "micro_2_0",
    "small"  = "small_2_0",
    "medium" = "medium_2_0",
    "large"  = "large_2_0"
  }
}
