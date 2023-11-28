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

variable "nomad_egress" {
  type = map(object({
    description = string
    to_port = number
    from_port = number
    protocol = string
    cidr_blocks = list(string)
  }))
  default = {
    "0-65535-tcp" = {
      description = "Egress Rules TCP"
      to_port = 65535
      from_port = 0
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    "0-65535-udp" = {
      description = "Egress Rules UDP"
      to_port = 65535
      from_port = 0
      protocol = "udp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "application_ingress" {
  type = map(object({
    description = string
    port = number
    protocol = string
    cidr_blocks = list(string)
  }))
  default = {
    "9090" = {
      description = "Prometheus"
      port = 9090
      protocol = "tcp"
      cidr_blocks = ["174.26.254.31/32", "10.0.0.0/16"]
    }
    "3000" = {
      description = "Grafana"
      port = 3000
      protocol = "tcp"
      cidr_blocks = ["174.26.254.31/32", "10.0.0.0/16"]
    }
    "9200" = {
      description = "Elasticsearch"
      port = 9200
      protocol = "tcp"
      cidr_blocks = ["174.26.254.31/32", "10.0.0.0/16"]
    }
    "5601" = {
      description = "Kibana"
      port = 5601
      protocol = "tcp"
      cidr_blocks = ["174.26.254.31/32", "10.0.0.0/16"]
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

  dynamic "ingress" {
    for_each = var.application_ingress
    content {
      description = ingress.value.description
      from_port = ingress.value.port
      to_port = ingress.value.port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks      
    }
  }

    dynamic "egress" {
    for_each = var.nomad_egress
    content {
      description = egress.value.description
      from_port = egress.value.from_port
      to_port = egress.value.to_port
      protocol = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks      
    }
  }

# Consul Sidecar port range
  ingress {
    from_port   = 21000
    to_port     = 21255
    protocol    = "tcp"
    cidr_blocks = ["174.26.254.31/32", "10.0.0.0/16"]
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