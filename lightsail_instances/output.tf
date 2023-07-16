output "instance_ips" {
  value = [
    for i in range(var.instance_count) : {
      instance_name         = aws_lightsail_instance.lightsail_instance[i].name
      username              = "ubuntu"
      static_ip             = aws_lightsail_static_ip_attachment.static_ip_assign[i].ip_address
      local_ssh_pubkey_path = var.local_ssh_pubkey_path
    }
  ]
}
