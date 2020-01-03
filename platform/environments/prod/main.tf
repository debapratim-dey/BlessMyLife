provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-bless"
    key = "bless/terraform.tfstate"
    region = "us-eat-2"
    encrypt = true
  }
}

module "vpc" {
  source = "./vpc"
}

// Bastion Setup for our infrastructure
module "bastion" {
  source = "../../management/bastion-hosts"
  vpc_id = module.vpc.vpc_id
}

// Bless Module Will be created as part of our platform tooling
module "bless" {
  source = "/home/ubuntu/blessMe/terraform/environments/prod"
  region = "us-east-2"
}

