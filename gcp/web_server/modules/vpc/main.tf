provider "null" {
  version = "~> 2.1"
}

locals {
  network_01_subnet_01 = "${var.network_01_name}-subnet"

  network_01_routes = [
    {
      name              = "${var.network_01_name}-egress-inet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    },
  ]
}

// The Web VPC
module "web-vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 2.1"
  project_id   = var.project_id
  network_name = var.network_01_name
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name           = local.network_01_subnet_01
      subnet_ip             = var.private_subnet_cidr_1
      subnet_region         = var.gcp_region_1
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    }
  ]
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
 