terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Create a vpc with a cidr 10.0.0.0/16
# Create 3 subnets within the VPC in different AZ's.
module "vpc" {
  source = "./modules/vpc"
  cidr = "10.0.0.0/16"
}