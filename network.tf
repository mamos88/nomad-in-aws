resource "aws_internet_gateway" "nomad-lab-igw" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    Name      = "nomad-on-aws"
    Terraform = "true"
  }
}

resource "aws_route_table" "nomad-lab-public-crt" {
  vpc_id = data.aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nomad-lab-igw.id
  }

  tags = {
    Name      = "nomad-on-aws"
    Terraform = "true"
  }
}

resource "aws_route_table_association" "subnet_association" {
  count = 3

  subnet_id      = data.aws_subnet.nomad-lab-pub[count.index].id
  # subnet_id      = aws_subnet.nomad-lab-pub[count.index].id
  route_table_id = aws_route_table.nomad-lab-public-crt.id

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    # aws_subnet.nomad-lab-pub,
    aws_route_table.nomad-lab-public-crt,
  ]
}

