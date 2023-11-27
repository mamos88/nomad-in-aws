# Get base_network-lab 
data "aws_vpc" "nomad-lab-vpc" {
  filter {
    name   = "tag:Name"
    values = ["base_network-lab"]
  }
}