data_dir = "/var/consul/server"

server           = true
bootstrap_expect = 3
advertise_addr   = "{{ GetInterfaceIP `eth0` }}"
client_addr      = "0.0.0.0"
# ui               = true
datacenter       = "dc-aws-1"
retry_join       = ["10.0.0.100", "10.0.1.100", "10.0.2.100"]
retry_max        = 10
retry_interval   = "15s"

ui_config = {
  enabled = true
}


connect = {
  enabled = true
}

acl = {
  enabled = false
  default_policy = "allow"
  enable_token_persistence = true
}