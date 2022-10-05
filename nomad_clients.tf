# resource "aws_launch_configuration" "NomadClientLC" {
#   name          = "NomadClientLC"
#   image_id      = "ami-0067e1d862d28908e"
#   instance_type = "t2.micro"
#   key_name = "var.aws_key_name"
#   security_groups = [aws_security_group.nomad-sg.id]
# }

# resource "aws_autoscaling_group" "NomadClientASG" {
#   name                      = "NomadClientASG"
#   max_size                  = 3
#   min_size                  = 3
#   health_check_grace_period = 300
#   health_check_type         = "EC2"
#   desired_capacity          = 3
#   force_delete              = false
#   launch_configuration      = aws_launch_configuration.NomadClientLC.name
# #   vpc_zone_identifier       = [aws_subnet.example1.id, aws_subnet.example2.id]
#   availability_zones = [aws_subnet.nomad-lab-pub.id]
# }