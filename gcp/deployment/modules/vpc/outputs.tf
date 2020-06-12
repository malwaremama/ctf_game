// SUBNETS
// the name of the management subnet
output "mgmt_subnet" {
  value = module.mgmt-vpc.subnets_names[0]
}

// the CIDR block for the management subnet
output "mgmt_subnet_cidr_block" {
  value = module.mgmt-vpc.subnets_ips[0]
}

output "public_subnet" {
  value = module.pub-vpc.subnets_names[1]
}

output "attacker_subnet" {
  value = module.pub-vpc.subnets_names[0]
}

output "hosts_subnet" {
  value = module.priv-vpc.subnets_names[1]
}

output "domain_subnet" {
  value = module.priv-vpc.subnets_names[0]
}

output "db_subnet" {
  value = module.db-vpc.subnets_names[0]
}

// RULES 

output "mgmt-allow-inbound-rule" {
  value = google_compute_firewall.mgmt-allow-inbound.self_link
}

output "public-allow-inbound-rule" {
  value = google_compute_firewall.public-allow-inbound.self_link
}

output "private-allow-inbound-rule" {
  value = google_compute_firewall.private-allow-inbound.self_link
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
 