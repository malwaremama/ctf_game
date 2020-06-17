variable "db_name" {
  description = "The name of the database server instance"
  type        = string
}

variable "db_vpc" {
  description = "ID of DB VPC"
  type        = string
}

variable "db_ami" {
  description = "Run packer and get the AMI string"
  type        = string
}

variable "db_zone" {
  description = "The GCP zone in which the database server instance will be deployed"
  type        = string
}

variable "db_machine_type" {
  description = "The GCP machine type for the database server instance"
  type        = string
}

variable "db_ssh_key" {
  description = "The SSH key of the database server instance admin user"
  type        = string
}

variable "db_subnet_id" {
  description = "The subnet in which the database server instance will be deployed"
  type        = string
}

variable "db_ip" {
  description = "The IP address of the database server instance"
  type        = string
}

variable "db_sec_grp" {
  description = "The security grp to put the DB instance in"
  type        = string
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