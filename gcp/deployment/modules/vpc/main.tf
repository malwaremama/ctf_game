resource "google_compute_subnetwork" "management-sub" {
  name          = var.vpc_mgmt_subnet_name
  ip_cidr_range = var.vpc_mgmt_subnet_cidr
  network       = google_compute_network.management-net.self_link
  region        = var.vpc_region
}

resource "google_compute_network" "management-net" {
  name                    = var.vpc_mgmt_network_name
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "untrust-sub" {
  name          = var.vpc_untrust_subnet_name
  ip_cidr_range = var.vpc_untrust_subnet_cidr
  network       = google_compute_network.untrust-net.self_link
  region        = var.vpc_region
}

resource "google_compute_network" "untrust-net" {
  name                    = var.vpc_untrust_network_name
  auto_create_subnetworks = "false"
}

resource "google_compute_firewall" "mgmt-allow-inbound" {
  name    = "mgmt-allow-inbound"
  network = google_compute_network.management-net.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["443", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "untrust-allow-inbound" {
  name    = "untrust-allow-inbound"
  network = google_compute_network.untrust-net.name

  allow {
    protocol = "tcp"
    ports    = ["80", "22", "221", "222"]
  }

  source_ranges = ["0.0.0.0/0"]
}
