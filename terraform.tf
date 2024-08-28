terraform {
  required_providers {
    aws = {
      version = "5.64"
    }
  }
  backend "s3" {
    bucket = "terraform-labs-backend"
    key    = "statefiles/practice1.tf"
    region = "us-east-1"
  }
}