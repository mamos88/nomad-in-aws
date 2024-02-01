terraform {
  cloud {
    organization = "Michael-Amos"

    workspaces {
      name = "nomad-in-aws"
    }
  }
}