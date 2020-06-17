provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source             = "./modules/vpc"
  aws_region         = var.aws_region
  availability_zone  = var.availability_zone
  hosts_subnet_cidr  = "10.10.10.0/24"
  domain_subnet_cidr = "10.10.20.0/24"
  db_subnet_cidr     = "10.11.169.0/24"
}

resource "aws_security_group" "private_vpc_sg" {
  name   = "primary"
  vpc_id = module.vpc.private_vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "db_vpc_sg" {
  name   = "db_vpc_sg"
  vpc_id = module.vpc.db_vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


module "db" {
  source          = "./modules/db"
  db_ami          = "ami-0e5182e21bc8a1560"
  db_vpc          = module.vpc.db_vpc_id
  db_name         = "secops-db"
  db_zone         = var.aws_region
  db_machine_type = "t2.micro"
  db_ssh_key      = var.key_name
  db_subnet_id    = module.vpc.db_public_subnet
  db_ip           = "10.11.169.13"
  db_sec_grp      = aws_security_group.db_vpc_sg.id

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
 