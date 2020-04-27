output "firewall-instance" {
  value = google_compute_instance.firewall.self_link
}

output "firewall-public-ip" {
  value = google_compute_instance.firewall.network_interface.0.access_config.0.nat_ip
}

output "web-public-ip" {
  value = google_compute_instance.firewall.network_interface.1.access_config.0.nat_ip
}
