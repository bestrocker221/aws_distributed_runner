output "instance_ips" {
  value = module.lightsail_instances.instance_ips
}

resource "local_file" "output_file_instances" {
  content         = jsonencode(module.lightsail_instances.instance_ips)
  filename        = "./output/instances.json"
  file_permission = "0640"
}

resource "local_file" "output_file" {
  filename = "ansible/inventory.ini"
  content = templatefile("./template/output_template.tmpl", {
    instances_data = module.lightsail_instances.instance_ips
  })
}

