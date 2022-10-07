resource "aws_instance" "amazon-client-nodes" {
    count = 3
    ami = "ami-0067e1d862d28908e"
    instance_type = var.nomad_node_instance_size
    key_name = var.aws_key_name
    subnet_id = aws_subnet.nomad-lab-pub[count.index].id
    vpc_security_group_ids = [aws_security_group.nomad-sg.id]
    associate_public_ip_address = true

    tags = {
        Terraform     = "true"
        Name          = "nomad-client-${count.index + 1}"
        ManagedBy     = "Terraform"
  }
}