resource "aws_launch_template" "NomadAmazonLinuxClientLC" {
    name = "NomadAmazonLinuxClientLC"

    description = "Nomad Amazon Linux Client Launch Template"
    image_id = var.nomad_client_amazon_ami_id
    instance_type = var.client_instance_type
    key_name = var.aws_key_name
    vpc_security_group_ids = [aws_security_group.nomad-sg.id]
}

resource "aws_launch_template" "UbuntuLinuxClientLC" {
    name = "UbuntuLinuxClientLC"

    description = "Ubuntu Linux Client Launch Template"
    image_id = var.nomad_client_ubuntu_ami_id
    instance_type = var.client_instance_type
    key_name = var.aws_key_name
    vpc_security_group_ids = [aws_security_group.nomad-sg.id]
}