output "firewall-instance" {
  value = google_compute_instance.firewall[0].self_link
}
output "firewall-public-ip" {
  value = google_compute_instance.firewall[0].network_interface[0].access_config[0].nat_ip
}
