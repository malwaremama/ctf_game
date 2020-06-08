provider "aws" {
  region = var.aws_region
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "secops-ctf"

  cidr = "10.10.0.0/16"

  azs             = [var.availability_zone]
  private_subnets = [var.hosts_subnet_cidr, var.domain_subnet_cidr, var.web_subnet_cidr, var.db_subnet_cidr]
  public_subnets  = [var.mgmt_subnet_cidr, var.public_subnet_cidr, var.attacker_subnet_cidr]

  enable_ipv6 = true

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "secops-ctf"
  }

  tags = {
    Owner       = "secops"
    Environment = "ctf"
  }

  vpc_tags = {
    Name = "secops"
  }
}