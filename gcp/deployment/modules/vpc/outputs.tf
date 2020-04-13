output "mgmt_network" {
  value = google_compute_network.management-net.self_link
}

output "mgmt_subnet" {
  value = google_compute_subnetwork.management-sub.self_link
}

output "mgmt_subnet_cidr_block" {
  value = google_compute_subnetwork.management-sub.ip_cidr_range
}

output "untrust_network" {
  value = google_compute_network.untrust-net.self_link
}

output "untrust_subnet" {
  value = google_compute_subnetwork.untrust-sub.self_link
}

output "untrust_subnet_cidr_block" {
  value = google_compute_subnetwork.untrust-sub.ip_cidr_range
}

output "mgmt-allow-inbound-rule" {
  value = google_compute_firewall.mgmt-allow-inbound.self_link
}
output "untrust-allow-inbound-rule" {
  value = google_compute_firewall.untrust-allow-inbound.self_link
}
