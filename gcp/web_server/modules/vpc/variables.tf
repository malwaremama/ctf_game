variable "project_id" {
  description = "The project ID to host the network in"
  type        = string
}

variable "network_01_name" {
  description = "The name of the first VPC network being created"
}

variable "private_subnet_cidr_1" {
  description = "The subnet/CIDR of the VPC"
  type        = string
}

variable "gcp_region_1" {
  description = "The name of the Region"
  type        = string
}

variable "allowed_mgmt_cidr" {
  description = "The source address that will be allowed to access the lab environment"
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
 