# data "aws_subnet" "nomad-subnets" {
#     id = aws_vpc.nomad-lab-vpc.id
# }


# # Create an ASG resource
# resource "aws_autoscaling_group" "NomadClientASG" {

#  for_each = var.asgs
#   name                 = each.value.name
#   min_size             = each.value.min_size
#   max_size             = each.value.max_size
#   desired_capacity     = each.value.desired_capacity
#   launch_configuration = "example-lc"
#   vpc_zone_identifier  = [each.value.subnet_id]

#   tag {
#     key                 = "Name"
#     value               = "nomad-clients"
#     propagate_at_launch = true
#   }
# }

# # Create a launch configuration resource
# resource "aws_launch_configuration" "example_lc" {
#   name                  = "example-lc"
#   image_id              = "ami-08c26bf5b1cc0e728"
#   instance_type         = "t2.micro"
#   security_groups       = [aws_security_group.nomad-sg.id]
#   key_name              = var.aws_key_name
# }
