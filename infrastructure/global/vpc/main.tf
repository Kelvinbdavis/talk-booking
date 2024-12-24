provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "kelvinbdavis-terraform-state"
    key            = "vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }

  required_providers {
    aws = ">= 5.0, < 6.0"
  }
}