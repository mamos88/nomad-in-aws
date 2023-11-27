variable "nomad_ingress" {
  type = map(object({
    description = string
    port = number
    protocol = string
    cidr_blocks = list(string)
  }))
  default = {
    "80" = {
      description = "HTTP"
      port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    "443" = {
      description = "HTTPS"
      port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    "22" = {
      description = "SSH"
      port = 22
      protocol = "tcp"
      cidr_blocks = ["174.26.254.31/32", "10.0.0.0/16"]
    }
    "1936" = {
      description = "HAProxy Statistics Page"
      port = 1936
      protocol = "tcp"
      cidr_blocks = ["174.26.254.31/32", "10.0.0.0/16"]
    }
    "4646" = {
      description = "Nomad Server Console Page"
      port = 4646
      protocol = "tcp"
      cidr_blocks = ["174.26.254.31/32", "10.0.0.0/16"]
    }
    "4647" = {
      description = "Nomad RPC communication"
      port = 4647
      protocol = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }
    "4648-tcp" = {
      description = "Nomad Serf WAN communication TCP"
      port = 4648
      protocol = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }
    "4648-udp" = {
      description = "Nomad Serf WAN communication UDP"
      port = 4648
      protocol = "udp"
      cidr_blocks = ["10.0.0.0/16"]
    }
    "8080" = {
      description = "HAProxy & Load Balancer Communication"
      port = 8080
      protocol = "tcp"
      cidr_blocks = ["10.0.0.0/16"] 
    }
    "8600" = {
      description = "Consul DNS Port"
      port = 8600
      protocol = "tcp"
      cidr_blocks = ["10.0.0.0/16"]       
    }
    "8500" = {
      description = "Consul HTTP API Port"
      port = 8500
      protocol = "tcp"
      cidr_blocks = ["174.26.254.31/32", "10.0.0.0/16"]       
    }
    "8300" = {
      description = "Consul Server RPC Address Port"
      port = 8300
      protocol = "tcp"
      cidr_blocks = ["10.0.0.0/16"]       
    }
    "8301-tcp" = {
      description = "Consul Serf LAN Port"
      port = 8301
      protocol = "tcp"
      cidr_blocks = ["10.0.0.0/16"]          
    }
    "8301-udp" = {
      description = "Consul Serf LAN Port"
      port = 8301
      protocol = "udp"
      cidr_blocks = ["10.0.0.0/16"]          
    }
    "8302-tcp" = {
      description = "Consul Serf WAN Port"
      port = 8302
      protocol = "tcp"
      cidr_blocks = ["10.0.0.0/16"]          
    }
    "8302-udp" = {
      description = "Consul Serf WAN Port"
      port = 8302
      protocol = "udp"
      cidr_blocks = ["10.0.0.0/16"]          
    }
  }
}




resource "aws_security_group" "nomad-sg" {
  name   = "nomad-sg"
  vpc_id = data.aws_vpc.nomad-lab-vpc.id

  dynamic "ingress" {
    for_each = var.nomad_ingress
    content {
      description = ingress.value.description
      from_port = ingress.value.port
      to_port = ingress.value.port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks      
    }
    
  }

/*
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
    cidr_blocks = var.allowed_ip_network
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
*/
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

  # # Prometheus
  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }
  # Grafana
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

# Elasticsearch
  ingress {
    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }

# Kibana
  ingress {
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
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