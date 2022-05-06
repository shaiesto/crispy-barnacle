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
  cidr   = "10.0.0.0/16"
}

module "elb" {
  source = "./modules/elb"
  vpc    = module.vpc.vpc
}

output "public_subnet" {
  value = module.vpc.public_subnet
}

output "private_subnet1" {
  value = module.vpc.private_subnet1
}

output "private_subnet2" {
  value = module.vpc.private_subnet2
}

output "vpc" {
  value = module.vpc.vpc
}

output "elb_dns" {
  value = module.elb.elb_dns
}
