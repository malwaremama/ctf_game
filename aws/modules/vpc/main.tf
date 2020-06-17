provider "aws" {
  region = var.aws_region
}

module "priv-vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name               = "secops-ctf"
  cidr               = "10.10.0.0/16"
  azs                = [var.availability_zone]
  private_subnets    = [var.hosts_subnet_cidr]
  public_subnets     = [var.domain_subnet_cidr]
  enable_ipv6        = true
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

module "db-vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name               = "secops-ctf"
  cidr               = "10.11.0.0/16"
  azs                = [var.availability_zone]
  private_subnets    = ["10.11.69.0/24"]
  public_subnets     = [var.db_subnet_cidr]
  enable_ipv6        = true
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

resource "aws_vpc_peering_connection" "priv-to-db-vpc-connect" {
  // (Optional) The AWS account ID of the owner of the peer VPC. 
  // Defaults to the account ID the AWS provider is currently connected to.
  // peer_owner_id = "${var.peer_owner_id}"
  peer_vpc_id = module.db-vpc.vpc_id
  vpc_id      = module.priv-vpc.vpc_id
  auto_accept = true
}

/**
 *  Copyright 2019 Palo Alto Networks.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 