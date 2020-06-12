resource "google_compute_firewall" "allow-inbound" {
  name    = "${var.network_01_name}-allow-inbound"
  network = var.network_01_name

  allow {
    protocol = "icmp"
  }

  source_ranges = [var.allowed_mgmt_cidr]
}

# allow http traffic
resource "google_compute_firewall" "allow-http" {
  name    = "${var.network_01_name}-fw-allow-http"
  network = var.network_01_name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  target_tags   = ["http"]
  source_ranges = [var.allowed_mgmt_cidr]
}

# allow https traffic
resource "google_compute_firewall" "allow-https" {
  name    = "${var.network_01_name}-fw-allow-https"
  network = var.network_01_name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  target_tags   = ["https"]
  source_ranges = [var.allowed_mgmt_cidr]
}

# allow ssh traffic
resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.network_01_name}-fw-allow-ssh"
  network = var.network_01_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags   = ["ssh"]
  source_ranges = [var.allowed_mgmt_cidr]
}


/* allow rdp traffic
resource "google_compute_firewall" "allow-rdp" {
  name    = "${var.app_name}-fw-allow-rdp"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
  target_tags = ["rdp"]
}
*/

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
 