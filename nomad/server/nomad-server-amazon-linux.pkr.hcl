variable "ami_name" {
  type    = string
  default = "nomad-server-1.5.3-amazon-linux"
}

source "amazon-ebs" "amazon-linux" {
  ami_name      = var.ami_name
  instance_type = "t2.micro"
  region        = "us-east-2"
  source_ami    = "ami-06d5c50c30a35fb88"
  ssh_username  = "ec2-user"

  tags = {
    Name = "Nomad-Server-1.5.3-amazon-linux"
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