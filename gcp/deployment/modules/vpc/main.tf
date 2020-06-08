provider "null" {
  version = "~> 2.1"
}

locals {
  // management
  network_01_subnet_01 = var.network_01_name
  // public
  network_02_subnet_01 = "${var.network_02_name}-public"
  // attacker
  network_02_subnet_02 = "${var.network_02_name}-attacker"
  // hosts
  network_03_subnet_01 = "${var.network_03_name}-hosts"
  // domain
  network_03_subnet_02 = "${var.network_03_name}-domain"
  // web
  network_04_subnet_01 = var.network_04_name
  // db
  network_05_subnet_01 = var.network_05_name
}

// The Management VPC
module "mgmt-vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 2.1"
  project_id   = var.project_id
  network_name = var.network_01_name
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name           = local.network_01_subnet_01
      subnet_ip             = "10.250.116.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    }
  ]
}

// The Public VPC
module "pub-vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 2.1"
  project_id   = var.project_id
  network_name = var.network_02_name
  routing_mode = "GLOBAL"

  subnets = [
    {
      // public
      subnet_name           = local.network_02_subnet_01
      subnet_ip             = "10.200.200.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    },
    {
      // attacker
      subnet_name           = local.network_02_subnet_02
      subnet_ip             = "192.168.0.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    }
  ]
}

// The Private VPC
module "priv-vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 2.1"
  project_id   = var.project_id
  network_name = var.network_03_name
  routing_mode = "GLOBAL"

  subnets = [
    {
      // hosts
      subnet_name           = local.network_03_subnet_01
      subnet_ip             = "172.16.10.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "false"
      subnet_flow_logs      = "true"
    },
    {
      // domain
      subnet_name           = local.network_03_subnet_02
      subnet_ip             = "172.16.20.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    }
  ]
}

// The Web VPC
module "web-vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 2.1"
  project_id   = var.project_id
  network_name = var.network_04_name
  routing_mode = "GLOBAL"

  subnets = [
    {
      // web
      subnet_name           = local.network_04_subnet_01
      subnet_ip             = "172.16.100.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    }
  ]
}

// The DB VPC
module "db-vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 2.1"
  project_id   = var.project_id
  network_name = var.network_05_name
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name           = local.network_05_subnet_01
      subnet_ip             = "172.16.200.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    }
  ]
}

resource "google_compute_firewall" "mgmt-allow-inbound" {
  name    = "mgmt-allow-inbound"
  network = module.mgmt-vpc.network_self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["443", "22"]
  }

  source_ranges = [var.allowed_mgmt_cidr]
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
