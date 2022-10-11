resource "aws_instance" "ubuntu-1804-client-nodes" {
    count = 0
    ami = "ami-0cfcb52f9327f7093"
    instance_type = var.nomad_node_instance_size
    key_name = var.aws_key_name
    subnet_id = aws_subnet.nomad-lab-pub[count.index].id
    vpc_security_group_ids = [aws_security_group.nomad-sg.id]
    associate_public_ip_address = true

    tags = {
        Terraform     = "true"
        Name          = "nomad-client-ubuntu18.04-${count.index + 1}"
        ManagedBy     = "Terraform"
  }
}