data "azuredevops_project" "myapp" {
  name = "myapp"
}

# output "project" {
#   value = data.azuredevops_project.myapp
  
# }

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
    value = "http://${aws_instance.nomad-server-node[0].public_ip}:4646"
  }
}