resource "aws_autoscaling_group" "NomadAmazonLinuxClientASG" {
    depends_on = [ aws_efs_file_system.mysql, aws_efs_mount_target.mysql_mount_target ]
    name = "NomadAmazonLinuxClientASG"
    max_size = 1
    min_size = 1

    vpc_zone_identifier = [for subnet in aws_subnet.nomad-lab-pub: subnet.id]
    
    launch_template {
        id = aws_launch_template.NomadAmazonLinuxClientLC.id
        version = "$Latest"
    }

    target_group_arns = ["${aws_lb_target_group.test.arn}"]

    tag {
      key = "Name"
      value = "NomadClient-AmazonLinux"
      propagate_at_launch = true
    }
}

resource "aws_autoscaling_group" "UbuntuLinuxClientASG" {
    name = "UbuntuLinuxClientASG"
    max_size = 0
    min_size = 0

    vpc_zone_identifier = [for subnet in aws_subnet.nomad-lab-pub: subnet.id]
    
    launch_template {
        id = aws_launch_template.UbuntuLinuxClientLC.id
        version = "$Latest"
    }

    target_group_arns = ["${aws_lb_target_group.test.arn}"]

    tag {
      key = "Name"
      value = "NomadClient-UbuntuLinux"
      propagate_at_launch = true
    }
}