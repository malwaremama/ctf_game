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
  network_03_subnet_01 = "${var.network_03_name}-domain"
  // domain
  network_03_subnet_02 = "${var.network_03_name}-hosts"
  // web
  network_04_subnet_01 = var.network_04_name
  // db
  network_05_subnet_01 = var.network_05_name

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
      subnet_ip             = "10.10.116.0/24"
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
      subnet_ip             = "10.10.200.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    },
    {
      // attacker
      subnet_name           = local.network_02_subnet_02
      subnet_ip             = "10.10.24.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    }
  ]

  routes = "${local.network_01_routes}"
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
      // domain
      subnet_name           = local.network_03_subnet_01
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = "us-central1"
      subnet_private_access = "false"
      subnet_flow_logs      = "true"
    },
    {
      // hosts
      subnet_name           = local.network_03_subnet_02
      subnet_ip             = "10.10.10.0/24"
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
      subnet_ip             = "10.10.100.0/24"
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
      subnet_ip             = "10.10.101.0/24"
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

resource "google_compute_firewall" "public-allow-inbound" {
  name    = "public-allow-inbound"
  network = module.pub-vpc.network_self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["443", "22"]
  }

  source_ranges = [var.allowed_mgmt_cidr]
}

resource "google_compute_firewall" "private-allow-inbound" {
  name    = "private-allow-inbound"
  network = module.priv-vpc.network_self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["443", "22"]
  }

  source_ranges = [var.allowed_mgmt_cidr]
}

module "peering-priv-web" {
  source = "terraform-google-modules/network/google//modules/network-peering"

  local_network = module.priv-vpc.network_self_link
  peer_network  = module.web-vpc.network_self_link
}

module "peering-priv-db" {
  source = "terraform-google-modules/network/google//modules/network-peering"

  local_network     = module.priv-vpc.network_self_link
  peer_network      = module.db-vpc.network_self_link
  module_depends_on = [module.peering-priv-web.complete]
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
