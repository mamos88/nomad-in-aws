data_dir = "/var/nomad/server"


datacenter = "dc-aws-1"
region = "region-aws-1"

advertise {
  http = "{{ GetInterfaceIP `enX0` }}"
  rpc  = "{{ GetInterfaceIP `enX0` }}"
  serf = "{{ GetInterfaceIP `enX0` }}"
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

client {
  enabled           = true
  network_interface = "enX0"
  servers           = ["10.0.0.100", "10.0.1.100", "10.0.2.100"]
  host_volume "mysql" {
    path = "/var/lib/mysql"
    read_only = false
  }
  host_volume "prometheus" {
    path = "/var/lib/prometheus"
    read_only = false
  }
  host_volume "grafana" {
    path = "/var/lib/grafana"
    read_only = false
  }
  host_volume "elk" {
    path = "/var/lib/elk"
    read_only = false
  }

}


acl {
  enabled = false
}

telemetry {
  collection_interval = "1s"
  disable_hostname = true
  prometheus_metrics = true
  publish_allocation_metrics = true
  publish_node_metrics = true
}



