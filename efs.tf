resource "aws_efs_file_system" "prometheus" {
  creation_token = "prometheus"

  tags = {
    Name = "PrometheusEFS"
  }
}

# resource "aws_efs_mount_target" "prometheus_mount_target" {
#   file_system_id = aws_efs_file_system.prometheus.id
#   subnet_id = [for subnet in aws_subnet.nomad-lab-pub: subnet.id]
# }