resource "aws_instance" "nomad-server-node" {
  for_each = data.aws_subnet.nomad-lab
  ami                         = var.nomad_server_ami_id
  instance_type               = var.nomad_server_instance_type
  key_name                    = var.aws_key_name
  subnet_id                   = each.key
  vpc_security_group_ids      = [aws_security_group.nomad-sg.id]
  associate_public_ip_address = true
  private_ip                  = cidrhost(each.value.cidr_block, 100)

  tags = {
    Terraform     = "true"
    Name          = "nomad-server"
    ManagedBy     = "Terraform"
  }
}