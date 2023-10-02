variable "amazon_linux_ami_name" {
  type    = string
  default = "nomad-client-amazon-linux-1.6.2-v1"
}

variable "ubuntu_linux_ami_name" {
  type = string
  default = "nomad-client-ubuntu-linux-1.6.2-v1"
}

variable "profile" {
  type = string
}

variable "amazon_source_ami" {
  type = string
  default = "ami-0d406e26e5ad4de53"
}

variable "ubuntu_source_ami" {
  type = string
  default = "ami-024e6efaf93d85776"
}

variable "region" {
  type = string
  default = "us-east-2"
}


source "amazon-ebs" "amazon-linux" {
  ami_name      = var.amazon_linux_ami_name
  profile = var.profile
  instance_type = "t2.micro"
  region        = var.region
  source_ami    = var.amazon_source_ami
  ssh_username  = "ec2-user"

  tags = {
    Name = "Nomad-Client-1.5.6-amazon-linux"
  }
}

source "amazon-ebs" "ubuntu-linux" {
  ami_name      = var.ubuntu_linux_ami_name
  profile = var.profile
  instance_type = "t2.micro"
  region        = "us-east-2"
  source_ami    = "ami-06c4532923d4ba1ec"
  ssh_username  = "ubuntu"

  tags = {
    Name = "Nomad-Client-1.5.6-ubuntu-linux"
  }
}

build {
  name = "nomad-packer-amazon"
  sources = [
    "source.amazon-ebs.amazon-linux"
  ]

  provisioner "shell" {
    script = "./nomad-client-install-amazon-linux.sh"
  }
}

build {
  name = "nomad-packer-ubuntu"
  sources = [
    "source.amazon-ebs.ubuntu-linux"
  ]

  provisioner "shell" {
    script = "./nomad-client-install-ubuntu-linux.sh"
  }
}