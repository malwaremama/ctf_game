variable "fw_name" {
  description = "The name of the firewall instance"
  type        = string
}

variable "fw_zone" {
  description = "The GCP zone in which the firewall instance will be deployed"
  type        = string
}

variable "fw_image" {
  description = "The GCE image for the firewall instance"
  type        = string
}

variable "fw_machine_type" {
  description = "The GCE machine type for the firewall instance"
  type        = string
}

variable "fw_machine_cpu" {
  description = "The GCE machine minumum CPU size for the firewall instance"
  type        = string
}

variable "fw_bootstrap_bucket" {
  description = "The GCP storage bucket containing the firewall bootstrap package"
  type        = string
}

variable "fw_ssh_key" {
  description = "The SSH key used for the firewall admin user"
  type        = string
}

variable "fw_mgmt_subnet" {
  description = "The management subnet of the firewall instance"
  type        = string
  default     = "10.250.116.0"
}

variable "fw_mgmt_ip" {
  description = "The IP address of firewall instance management interface"
  type        = string
  default     = "10.250.116.254"
}

variable "fw_public_subnet" {
  type    = string
  default = "10.200.200.0"
}

variable "fw_public_ip" {
  type    = string
  default = "10.200.200.254"
}

variable "fw_attacker_subnet" {
  type    = string
  default = "192.168.0.0"
}

variable "fw_attacker_ip" {
  type    = string
  default = "192.168.0.254"
}

variable "fw_hosts_subnet" {
  type    = string
  default = " 172.16.10.0"
}

variable "fw_hosts_ip" {
  type    = string
  default = "172.16.10.254"
}

variable "fw_domain_subnet" {
  type    = string
  default = "172.16.20.0"
}

variable "fw_domain_ip" {
  type    = string
  default = "172.16.20.254"
}

variable "fw_web_subnet" {
  type    = string
  default = "172.16.100.0"
}

variable "fw_mgmt_rule" {
  description = "The GCP firewall rule for the firewall intance management interface"
  type        = string
}
/*
variable "fw_public_rule" {
  type = string
}

variable "fw_attacker_rule" {
  type = string
}

variable "fw_hosts_rule" {
  type = string
}

variable "fw_domain_rule" {
  type = string
}

variable "fw_web_rule" {
  type = string
}
*/

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