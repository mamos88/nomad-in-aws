resource "aws_launch_template" "NomadAmazonLinuxClientLC" {
    name = "NomadAmazonLinuxClientLC"

    description = "Nomad Amazon Linux Client Launch Template"
    image_id = "ami-0fd39d4310191a123"
    instance_type = var.client_instance_type
    key_name = "Ohio-Mar2022-Keypair"
    vpc_security_group_ids = [aws_security_group.nomad-sg.id]
}

resource "aws_launch_template" "UbuntuLinuxClientLC" {
    name = "UbuntuLinuxClientLC"

    description = "Ubuntu Linux Client Launch Template"
    image_id = "ami-0f68834c4ad48c7a1"
    instance_type = var.client_instance_type
    key_name = "Ohio-Mar2022-Keypair"
    vpc_security_group_ids = [aws_security_group.nomad-sg.id]
}