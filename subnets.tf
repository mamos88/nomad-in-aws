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
