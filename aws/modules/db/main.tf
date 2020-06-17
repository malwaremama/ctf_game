module "db" {
  source = "github.com/mrichardson03/terraform-aws-instance.git?ref=v0.0.2"

  key_name      = var.db_ssh_key
  vpc_id        = var.db_vpc
  subnet_id     = var.db_subnet_id
  private_ip    = var.db_ip
  sg_id         = var.db_sec_grp
  instance_type = var.db_machine_type
  ami           = var.db_ami

  tags = {
    Name        = "SecOps-database"
    Environment = "secops-ctf"
  }
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