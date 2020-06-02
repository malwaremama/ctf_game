provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(format("~/.config/gcloud/%s", var.gcp_key_filename))
}

module "bootstrap" {
  source  = "stealthllama/panos-bootstrap/google"
  version = "0.9.0"

  bootstrap_project = var.project_id
  bootstrap_region  = var.region

  hostname        = var.fw_name
  panorama-server = var.panorama
  tplname         = var.tplname
  dgname          = var.dgname
  vm-auth-key     = var.vm_auth_key
}

module "vpc" {
  source            = "./modules/vpc"
  project_id        = var.project_id
  allowed_mgmt_cidr = var.allowed_mgmt_cidr
}

module "firewall" {
  source = "./modules/firewall"

  fw_name             = "vm-series"
  fw_zone             = var.zone
  fw_image            = "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/vmseries-bundle2-901"
  fw_machine_type     = "n1-standard-4"
  fw_machine_cpu      = "Intel Skylake"
  fw_bootstrap_bucket = module.bootstrap.bootstrap_name

  fw_ssh_key = "admin:${var.ssh_key}"

  fw_mgmt_subnet = module.vpc.mgmt_subnet
  fw_mgmt_ip     = "10.5.0.4"
  fw_mgmt_rule   = "module.vpc.mgmt-allow-inbound-rule"
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