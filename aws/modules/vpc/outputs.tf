// VPC
output "private_vpc_id" {
  description = "The ID of the VPC"
  value       = module.priv-vpc.vpc_id
}

output "db_vpc_id" {
  description = "The ID of the VPC"
  value       = module.db-vpc.vpc_id
}

// CIDR blocks
output "private_vpc_cidr_block" {
  description = "The CIDR block of the private VPC"
  value       = module.priv-vpc.vpc_cidr_block
}

output "db_vpc_cidr_block" {
  description = "The CIDR block of the database VPC"
  value       = module.db-vpc.vpc_cidr_block
}

//output "vpc_ipv6_cidr_block" {
//  description = "The IPv6 CIDR block"
//  value       = ["${module.vpc.vpc_ipv6_cidr_block}"]
//}

# Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.priv-vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.priv-vpc.public_subnets
}

output "db_public_subnet" {
  description = "List of IDs of public subnets"
  value       = module.db-vpc.public_subnets[0]
}

# NAT gateways
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.priv-vpc.nat_public_ips
}

# AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.priv-vpc.azs
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
 