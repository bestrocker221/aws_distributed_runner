terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}


# Import existing Key Pair into  Lightsail
resource "aws_lightsail_key_pair" "key_pair" {
  name       = "${var.project_name}_key_pair"
  public_key = file("${var.local_ssh_pubkey_path}")
}

# Create instance
resource "aws_lightsail_instance" "lightsail_instance" {
  count = var.instance_count

  name = "${var.project_name}_instance-${count.index}"
  # required
  availability_zone = "eu-west-1a"
  # required, The ID for a virtual private server image
  # IF YOU WANT DIFFERENT OS --> `aws lightsail get-blueprints`
  blueprint_id = "ubuntu_22_04"
  # required, specifies the type of lightsail
  # only ap-south-1: 2_1, ap-southeast-2: 2_2, rest is 2_0
  bundle_id = var.vm_size
  # lightsail keypair, not aws_key_pair
  key_pair_name = aws_lightsail_key_pair.key_pair.name

  tags = {
    Project   = var.project_tag
    CreatedBy = data.aws_caller_identity.current.arn
    // Add more tags as needed
  }
  user_data = var.instance_command
  lifecycle {
    create_before_destroy = true
  }
}

# Open ports
resource "aws_lightsail_instance_public_ports" "open_ports" {
  count         = var.instance_count
  instance_name = aws_lightsail_instance.lightsail_instance[count.index].name

  port_info {
    cidrs     = ["0.0.0.0/0"]
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
  }

  # Can add more open ports here
  #port_info {
  #  protocol  = "tcp"
  #  from_port = 443
  #  to_port   = 443
  #}
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lightsail_static_ip" "static_ip" {
  count = var.instance_count
  name  = "lightsail-static-ip-${count.index}"
}

resource "aws_lightsail_static_ip_attachment" "static_ip_assign" {
  count          = var.instance_count
  static_ip_name = aws_lightsail_static_ip.static_ip[count.index].name
  instance_name  = aws_lightsail_instance.lightsail_instance[count.index].name
  depends_on     = [aws_lightsail_instance.lightsail_instance]
  lifecycle {
    create_before_destroy = true
  }
}
