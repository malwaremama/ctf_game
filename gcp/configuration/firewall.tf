provider "panos" {
  hostname = "127.0.0.1"
  username = "terraform"
  password = "secret"
}

module "networking" {
  source = "./modules/networking"

  template = var.template
  stack    = var.stack
}

module "policies" {
  source            = "./modules/policies"
  device_group      = var.device_group
  zone_untrust      = module.networking.zone_untrust
  interface_untrust = module.networking.interface_untrust
}

resource "null_resource" "commit_panorama" {

  provisioner "local-exec" {
    command = "${path.module}/commit"
  }
  depends_on = [
    module.policies.security_rule_group,
    module.policies.nat_rule_group
  ]
}

############################################################################################
# Copyright 2019 Palo Alto Networks.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
############################################################################################
