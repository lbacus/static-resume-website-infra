terraform {
  required_providers {
    # Add the latest version of `hashicorp/aws` provider here
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.1"
    }
  }
}

# Add the Sydney region in the provider block below
provider "aws" {
  region = "ap-southeast-2"
}
