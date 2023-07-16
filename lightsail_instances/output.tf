output "instance_ips" {
  value = [
    for i in range(var.instance_count) : {
      instance_name = aws_lightsail_instance.lightsail_instance[i].name
      username      = "ubuntu"
      #public_ip = aws_lightsail_instance.lightsail_instance[i].public_ip_address
      static_ip             = aws_lightsail_static_ip_attachment.static_ip_assign[i].ip_address
      local_ssh_pubkey_path = var.local_ssh_pubkey_path
    }
  ]
}

/*
output "lightsail-instance" {
  value = [
    aws_lightsail_instance.lightsail_instance.username,
    #aws_lightsail_instance.lightsail_instance.public_ip_address,
    aws_lightsail_static_ip_attachment.static_ip_assign.ip_address
  ]
}
*/
