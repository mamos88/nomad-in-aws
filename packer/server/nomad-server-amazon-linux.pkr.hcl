variable "ami_name" {
  type    = string
  default = "nomad-server-amazon-linux-1.5.6"
}

variable "profile" {
  type = string
}

variable "server_source_ami" {
  type = string
}

variable "region" {
  type = string
  default = "us-east-2"
}

source "amazon-ebs" "amazon-linux" {
  ami_name      = var.ami_name
  profile       = var.profile
  instance_type = "t2.micro"
  region        = var.region
  source_ami    = var.server_source_ami
  ssh_username  = "ec2-user"

  tags = {
    Name = "Nomad-Server-1.5.6-amazon-linux"
  }
}

build {
  name = "nomad-packer"
  sources = [
    "source.amazon-ebs.amazon-linux"
  ]

  provisioner "shell" {
    script = "./nomad-install-amazon-linux.sh"
  }
}