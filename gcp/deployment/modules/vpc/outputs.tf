// The name of the management network
output "mgmt_network" {
  value = module.mgmt-vpc.network_name
}

// the name of the management subnet
output "mgmt_subnet" {
  value = var.network_01_name
}

// the CIDR block for the management subnet
output "mgmt_subnet_cidr_block" {
  value = module.mgmt-vpc.0.subnets_ips
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