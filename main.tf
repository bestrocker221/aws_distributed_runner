module "lightsail_instances" {
  source = "./lightsail_instances"

  instance_count = var.instance_count
  # pick your instance type (bundle id) from variables.tf
  vm_size = var.bundle_id_list.nano

  instance_command = var.instance_command

  project_name          = var.project_name
  project_tag           = var.project_tag
  local_ssh_pubkey_path = var.local_ssh_pubkey_path
}

