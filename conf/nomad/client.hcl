data_dir = "/var/nomad/server"


datacenter = "dc-aws-1"
region = "region-aws-1"

advertise {
  http = "{{ GetInterfaceIP `eth0` }}"
  rpc  = "{{ GetInterfaceIP `eth0` }}"
  serf = "{{ GetInterfaceIP `eth0` }}"
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

client {
  enabled           = true
  network_interface = "eth0"
  servers           = ["10.0.0.82", "10.0.0.10", "10.0.0.94"]
}


acl {
  enabled = false
}





