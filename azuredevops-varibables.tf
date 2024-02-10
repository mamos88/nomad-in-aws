data "azuredevops_project" "myapp" {
  name = "myapp"
}

resource "azuredevops_variable_group" "myapp" {
  project_id   = data.azuredevops_project.myapp.id
  name         = "nomad-variables"
  description  = "AWS Variable Group"
  allow_access = true

  variable {
    name  = "nomad_security_group"
    value = aws_security_group.nomad-sg.id
  }

  variable {
    name  = "nomad_server_url"
    value = "http://${[for i in aws_instance.nomad-server-node: i.public_ip][0]}:4646"
  }
}