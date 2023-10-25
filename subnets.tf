# resource "aws_subnet" "nomad-lab-pub" {
#   count                   = var.subnet_count
#   vpc_id                  = aws_vpc.nomad-lab-vpc.id
#   cidr_block              = "10.0.${count.index}.0/24"
#   map_public_ip_on_launch = "true"
#   availability_zone       = "${var.aws_region}${var.az_map[count.index]}"

#   tags = {
#     Name      = "nomad-lab"
#     Terraform = "true"
#   }
# }

# Data source to retrieve subnet information
data "aws_subnets" "nomad-lab" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.nomad-lab-vpc.id]
  }
}

data "aws_subnet" "nomad-lab" {
  for_each = toset(data.aws_subnets.nomad-lab.ids)
  id      = each.value
}

locals {
  subnet_ids = { for key, subnet in data.aws_subnet.nomad-lab : key => subnet.id }
}
