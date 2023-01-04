locals {
  vpc_name = "nomad-lab"
}

data "aws_vpc" "vpc" {
  filter {
    name = "tag:Name"
    values = [local.vpc_name]
  }
}

# resource "aws_subnet" "nomad-lab-pub" {
#   count                   = var.nomad_node_count
#   # vpc_id                  = aws_vpc.nomad-lab-vpc.id
#   vpc_id                  = data.aws_vpc.vpc.id
#   cidr_block              = "10.0.${count.index}.0/24"
#   map_public_ip_on_launch = "true"
#   availability_zone       = "${var.aws_region}${var.az_map[count.index]}"

#   tags = {
#     Name      = "nomad-lab"
#     Terraform = "true"
#   }
# }