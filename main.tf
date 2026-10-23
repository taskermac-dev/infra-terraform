terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "acme-terraform-state"
    key            = "infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "acme-terraform-lock"
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  name       = "acme-vpc"
  cidr_block = var.vpc_cidr
}

module "eks" {
  source = "./modules/eks"

  cluster_name = "acme-eks"
  vpc_id       = module.vpc.vpc_id
}
