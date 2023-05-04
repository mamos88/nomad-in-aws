variable "amazon_linux_ami_name" {
  type    = string
  default = "nomad-client-1.5.3-amazon-linux"
}

variable "ubuntu_linux_ami_name" {
  type = string
  default = "nomad-client-1.5.3-ubuntu-linux"
}

source "amazon-ebs" "amazon-linux" {
  ami_name      = var.amazon_linux_ami_name
  instance_type = "t2.micro"
  region        = "us-east-2"
  source_ami    = "ami-06d5c50c30a35fb88"
  ssh_username  = "ec2-user"

  tags = {
    Name = "Nomad-Client-1.5.3-amazon-linux"
  }
}

source "amazon-ebs" "ubuntu-linux" {
  ami_name      = var.ubuntu_linux_ami_name
  instance_type = "t2.micro"
  region        = "us-east-2"
  source_ami    = "ami-06c4532923d4ba1ec"
  ssh_username  = "ubuntu"

  tags = {
    Name = "Nomad-Client-1.5.3-ubuntu-linux"
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