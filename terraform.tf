terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.92.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.7.1"
    }
  }

  backend "s3" {
    bucket = "prog8830-tfstate-week13"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}