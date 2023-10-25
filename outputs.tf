# output "private_ip_addr" {
#   value = aws_instance.nomad-server-node[*].private_ip
# }

# output "public_ip_addr" {
#   value = aws_instance.nomad-server-node[*].public_ip
# }

output "consul_url" {
    value = "http://${[for i in aws_instance.nomad-server-node: i.public_ip][0]}:8500/ui"
}

output "nomad_url" {
  value = "http://${[for i in aws_instance.nomad-server-node: i.public_ip][0]}:4646/ui"
}

