output "private_ip_addr" {
  value = aws_instance.nomad-server-node[*].private_ip
}

output "public_ip_addr" {
  value = aws_instance.nomad-server-node[*].public_ip
}

output "consul_url" {
  value = "http://${aws_instance.nomad-server-node[0].public_ip}:8500/ui"
}

output "nomad_url" {
  value = "http://${aws_instance.nomad-server-node[0].public_ip}:4646/ui"
}

output "ec2_nodes" {
  value = aws_instance.nomad-server-node[*].public_dns
}

