resource "aws_instance" "amazon-client-nodes" {
    count = 3
    ami = "ami-08c26bf5b1cc0e728" # Nomad 1.4.3 with Telemetry
    # ami = "ami-0f756fcce08b197a3" # Alma Linux
    instance_type = var.nomad_node_instance_size
    key_name = var.aws_key_name
    subnet_id = aws_subnet.nomad-lab-pub[count.index].id
    vpc_security_group_ids = [aws_security_group.nomad-sg.id]
    associate_public_ip_address = true

    tags = {
        Terraform     = "true"
        Name          = "nomad-client-amazon-${count.index + 1}"
        ManagedBy     = "Terraform"
  }
}