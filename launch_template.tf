resource "aws_launch_template" "NomadAmazonLinuxClientLC" {
    name = "NomadAmazonLinuxClientLC"

    description = "Nomad Amazon Linux Client Launch Template"
    image_id = var.nomad_client_amazon_ami_id
    instance_type = var.client_instance_type
    key_name = var.aws_key_name
    vpc_security_group_ids = [aws_security_group.nomad-sg.id]
    user_data = base64encode(<<-EOF
        #!/bin/bash
        echo "Mounting EFS file system"
        yum install -y amazon-efs-utils
        mkdir /mnt/mysql
        mount -t efs ${aws_efs_file_system.mysql.id}:/ /mnt/mysql
        echo "${aws_efs_file_system.mysql.id}:/ /mnt/mysql efs defaults,_netdev 0 0" >> /etc/fstab
        EOF
     )
}

resource "aws_launch_template" "UbuntuLinuxClientLC" {
    name = "UbuntuLinuxClientLC"

    description = "Ubuntu Linux Client Launch Template"
    image_id = var.nomad_client_ubuntu_ami_id
    instance_type = var.client_instance_type
    key_name = var.aws_key_name
    vpc_security_group_ids = [aws_security_group.nomad-sg.id]
}