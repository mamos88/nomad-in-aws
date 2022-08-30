variable "aws_access_key" {
  description = "Access key for AWS account"
}

variable "aws_secret_key" {
  description = "Secret for AWS account"
  type        = string
}

variable "aws_region" {
  description = "The region name to deploy into"
  type        = string
  default     = "us-east-2"
}

variable "aws_key_fingerprint" {
  description = "Fingerprint of your SSH key"
  type        = string
}

variable "aws_key_name" {
  description = "SSH key name"
  type        = string
  default     = "Ohio-Mar2022-Keypair"
}

variable "nomad_node_instance_size" {
  description = "EC2 instance type/size for Nomad nodes"
  type        = string
  # default     = "t2.small"
  default     = "t2.micro"
}

variable "nomad_node_ami_id" {
  description = "AMI ID to use for Nomad nodes"
  type        = string
  default     = "ami-064ff912f78e3e561"
}

variable "nomad_node_count" {
  description = "The number of server nodes (should be 3 or 5)"
  type        = number
  default     = 3
}

variable "allowed_ip_network" {
  description = "Networks allowed in security group for ingress rules"
  type        = list(any)
  default     = ["184.98.168.144/32", "10.0.0.0/16"]
}

variable "az_map" {
  type = map(any)

  default = {
    0 = "a"
    1 = "b"
    2 = "c"
  }
}