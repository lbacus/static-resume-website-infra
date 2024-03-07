terraform {
  cloud {
    organization = "luis-terraform-s3" # Fill in your organisation name here

    workspaces {
      name = "luis-workspace" # Fill in your workspace name here
    }
  }
}