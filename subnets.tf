locals {
  subnet_name = "nomad-lab"
}

# data "aws_subnet" "nomad-lab-pub" {
#   filter {
#     name = "tag:Name"
#     values = [local.subnet_name]
#   }
# }

data "aws_subnet" "nomad-lab-pub" {
  # vpc_id = "vpc-0efcce26479a6e53a"
  filter {
    name = "id"
    values = [
    "subnet-06e7824f4aa19c854", 
    "subnet-08287822bdca109a0",
    ]
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