data "google_compute_image" "attacker_ubuntu" {
  // this image was generated by us via packer
  name = var.attacker_image
}

resource "google_compute_instance" "attacker" {
  name                      = var.attacker_name
  machine_type              = var.attacker_machine_type
  zone                      = var.attacker_zone
  can_ip_forward            = true
  allow_stopping_for_update = true
  count                     = 1

  metadata = {
    serial-port-enable     = true
    block-project-ssh-keys = false
    ssh-keys               = var.attacker_ssh_key
  }

  boot_disk {
    initialize_params {
      image = data.google_compute_image.attacker_ubuntu.self_link
    }
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  network_interface {
    // The private IP address to assign to the instance. 
    network_ip = var.attacker_ip
    // The name or self_link of the subnetwork to attach this interface to.
    subnetwork = var.attacker_subnet_id

    access_config {
    }
  }

  scheduling {
    preemptible = true
  }
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