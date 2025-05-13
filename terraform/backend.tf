terraform {
  backend "s3" {
    bucket         = "aws-training-terraform-states"
    key            = "ecs-demo-root/terraform.tfstate"
    region         = "eu-west-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "archive" {}
