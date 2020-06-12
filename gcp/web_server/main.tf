provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
  credentials = file(format("~/.config/gcloud/%s", var.gcp_key_filename))
}

provider "google-beta" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
  credentials = file(format("~/.config/gcloud/%s", var.gcp_key_filename))
}

module "vpc" {
  source                = "./modules/vpc"
  project_id            = var.project_id
  gcp_region_1          = var.region
  network_01_name       = var.network_01_name
  allowed_mgmt_cidr     = var.allowed_mgmt_cidr
  private_subnet_cidr_1 = "10.10.100.0/24"
}

module "firewall" {
  source                = "./modules/firewall"
  project_id            = var.project_id
  gcp_region_1          = var.region
  network_01_name       = var.network_01_name
  allowed_mgmt_cidr     = var.allowed_mgmt_cidr
  private_subnet_cidr_1 = "10.10.100.0/24"
}

module "web" {
  source           = "./modules/web"
  web_name         = "sandy-linux"
  web_zone         = var.zone
  web_domain       = "ellingson-mineral.com"
  network_01_name  = var.network_01_name
  web_image        = "secops-ctf-attacker-ubuntu-18"
  web_machine_type = "n1-standard-1"
  web_ssh_key      = "admin:${var.ssh_key}"
  web_subnet_id    = module.vpc.web_subnet
  web_ip           = "10.10.100.13"
}

module "load_balancer" {
  source     = "./modules/load_balancer"
  project_id = var.project_id
  lb_name    = "sandy-lb"
  lb_zone    = var.zone
  web-1-name = module.web.web-1-name
  //web-1-internal-ip = module.web.web-1-internal-ip
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
