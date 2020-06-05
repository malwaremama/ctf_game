// NETWORKS

// The name of the management network
output "mgmt_network" {
  //value = module.mgmt-vpc.network_name
  value = "management"
}

output "public_network" {
  value = module.pub-vpc.network_name
}

output "private_network" {
  value = module.priv-vpc.network_name
}

output "web_network" {
  value = module.web-vpc.network_name
}

output "db_network" {
  value = module.db-vpc.network_name
}

// SUBNETS

// the name of the management subnet
output "mgmt_subnet" {
  value = module.mgmt-vpc.0.subnets_names
}

// the CIDR block for the management subnet
output "mgmt_subnet_cidr_block" {
  value = module.mgmt-vpc.0.subnets_ips
}

output "public_subnet" {
  value = module.pub-vpc.0.subnets_names
}

output "attacker_subnet" {
  value = module.pub-vpc.1.subnets_names
}

output "hosts_subnet" {
  value = module.priv-vpc.0.subnets_names
}

output "domain_subnet" {
  value = module.priv-vpc.1.subnets_names
}

output "web_subnet" {
  value = module.web-vpc.0.subnets_names
}

// RULES 

output "mgmt-allow-inbound-rule" {
  value = google_compute_firewall.mgmt-allow-inbound.self_link
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