resource "aws_security_group" "nomad-sg" {
  name   = "nomad-sg"
  # vpc_id = aws_vpc.nomad-lab-vpc.id
  vpc_id = data.aws_vpc.nomad-lab-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1936
    to_port     = 1936
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 4646
    to_port     = 4646
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 4647
    to_port     = 4647
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 4648
    to_port     = 4648
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 4648
    to_port     = 4648
    protocol    = "udp"
    cidr_blocks = var.allowed_ip_network
  }

  # This is needed for haproxy based on the port I chose
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 8300
    to_port     = 8300
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

 # Vault Ports
  ingress {
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 8201
    to_port     = 8201
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 8301
    to_port     = 8301
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 8301
    to_port     = 8301
    protocol    = "udp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 8302
    to_port     = 8302
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 8302
    to_port     = 8302
    protocol    = "udp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 8400
    to_port     = 8400
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 8500
    to_port     = 8500
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 8600
    to_port     = 8600
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 8600
    to_port     = 8600
    protocol    = "udp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 21000
    to_port     = 21000
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  ingress {
    from_port   = 21255
    to_port     = 21255
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  tags = {
    Terraform  = "true"
  }
}