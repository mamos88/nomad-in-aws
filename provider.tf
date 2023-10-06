provider "aws" {
  profile = var.profile
  region     = var.aws_region
}

terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "0.9.1"
    }
  }
}

provider "azuredevops" {
}