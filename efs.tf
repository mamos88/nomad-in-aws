resource "aws_efs_file_system" "mysql" {
  creation_token = "mysql"

  tags = {
    Name = "mysql-efs"
  }
}

resource "aws_efs_mount_target" "mysql_mount_target" {
  count = var.subnet_count
  file_system_id = aws_efs_file_system.mysql.id
  subnet_id = aws_subnet.nomad-lab-pub[count.index].id
  security_groups = [aws_security_group.nomad-sg.id]
}

output "efs_file_system_id" {
  value = aws_efs_file_system.mysql.id
}
