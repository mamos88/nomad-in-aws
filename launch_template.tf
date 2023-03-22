resource "aws_launch_template" "NomadAmazonLinuxClientLC" {
    name = "NomadAmazonLinuxClientLC"

    description = "Nomad Amazon Linux Client Launch Template"
    image_id = "ami-08c26bf5b1cc0e728"
    instance_type = "t2.medium"
    key_name = "Ohio-Mar2022-Keypair"
    vpc_security_group_ids = [aws_security_group.nomad-sg.id]
}

resource "aws_launch_template" "UbuntuLinuxClientLC" {
    name = "UbuntuLinuxClientLC"

    description = "Ubuntu Linux Client Launch Template"
    image_id = "ami-0b9ed7dee2824b98a"
    instance_type = "t2.medium"
    key_name = "Ohio-Mar2022-Keypair"
    vpc_security_group_ids = [aws_security_group.nomad-sg.id]
}