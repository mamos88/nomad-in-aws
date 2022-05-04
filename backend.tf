terraform {
  cloud {
    organization = "Michael-Amos"

    workspaces {
      name = "nomad-on-aws"
    }
  }
}