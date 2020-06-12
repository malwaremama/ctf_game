# 
output "load-balancer-ip-address" {
  description = "show external ip address of load balancer"
  value       = google_compute_global_forwarding_rule.global_forwarding_rule.ip_address
}