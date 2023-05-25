variable "aws_region" {
  description = "The region name to deploy into"
  type        = string
  default     = "us-east-2"
}

variable "client_instance_type" {
  description = "Nomad Client Instance Type"
  default = "t2.medium"
}

variable "nomad_server_instance_type" {
  description = "EC2 instance type/size for Nomad nodes"
  type        = string
  default     = "t2.micro"
}

variable "nomad_client_count" {
  description = "The number of server nodes (should be 3 or 5)"
  type        = number
  default     = 3
}

variable "subnet_count" {
  description = "The number of desired subnets"
  type        = number
  default     = 3
}

variable "nomad_server_count" {
  description = "The number of server nodes (should be 3 or 5)"
  type        = number
  default     = 3
}

variable "az_map" {
  type = map(any)

  default = {
    0 = "a"
    1 = "b"
    2 = "c"
  }
}

# Load Balancer Variables
variable "health_check" {
   type = map(string)
   default = {
      "timeout"  = "10"
      "interval" = "20"
      "path"     = "/"
      "port"     = "8080"
      "unhealthy_threshold" = "2"
      "healthy_threshold" = "3"
    }
}

# These are variables you need to change before run time
# --------------------------------------------------------
# Change the first element in the list to your IP address
variable "allowed_ip_network" {
  description = "Networks allowed in security group for ingress rules"
  type        = list(any)
  default     = ["184.98.50.94/32", "10.0.0.0/16"] # Modify this with your local machine IP. Only replace the 174.26.226.144 with your IP.
}

# This is the AMI for the Server node.  Change it to match the one generated with Packer server AMI build
variable "nomad_server_ami_id" {
  description = "AMI ID to use for Nomad server nodes"
  type        = string
  default = "ami-05536dc705297b831" # Modify this with the server AMI you created
}

variable "nomad_client_amazon_ami_id" {
  description = "AMI ID to use for Nomad server nodes"
  type        = string
  default = "ami-0d33d178a0d02d075" # Modify this with the Amazon client AMI you created
}

variable "nomad_client_ubuntu_ami_id" {
  description = "AMI ID to use for Nomad server nodes"
  type        = string
  default = "ami-05050ce70d6f97db3" # Modify this with the ubuntu client AMI you created
}

# This is your keypair name for connecting to the instance.  Change it to a valid keypair in our account/region.
variable "aws_key_name" {
  description = "SSH key name"
  type        = string
  default     = "test1-keypair" # Modify this with the keypair you created
}

variable "profile" {
  description = "This is your AWS profile"
  type = string
}