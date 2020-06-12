/*
  Load balancer with unmanaged instance group
  used to forward traffic to the correct load balancer for HTTP load balancing
*/
resource "google_compute_global_forwarding_rule" "global_forwarding_rule" {
  name       = "${var.lb_name}-global-forwarding-rule"
  project    = var.project_id
  target     = google_compute_target_http_proxy.target_http_proxy.self_link
  port_range = "80"
}

/*
 * used by one or more global forwarding rule to route incoming 
 * HTTP requests to a URL map
 */
resource "google_compute_target_http_proxy" "target_http_proxy" {
  name    = "${var.lb_name}-proxy"
  project = var.project_id
  url_map = google_compute_url_map.url_map.self_link
}

/*
 * defines a group of virtual machines that will serve traffic 
 * for load balancing
 */
resource "google_compute_backend_service" "backend_service" {
  name          = "${var.lb_name}-backend-service"
  project       = var.project_id
  port_name     = "http"
  protocol      = "HTTP"
  health_checks = [google_compute_health_check.healthcheck.self_link]
  backend {
    group                 = google_compute_instance_group.web_private_group.self_link
    balancing_mode        = "RATE"
    max_rate_per_instance = 100
  }
}

# creates a group of dissimilar virtual machine instances
resource "google_compute_instance_group" "web_private_group" {
  name        = "${var.lb_name}-vm-group"
  description = "Web servers instance group"
  zone        = var.lb_zone
  instances = [
    var.web-1-name
  ]
  named_port {
    name = "http"
    port = "80"
  }
}
# determine whether instances are responsive and able to do work
resource "google_compute_health_check" "healthcheck" {
  name               = "${var.lb_name}-healthcheck"
  timeout_sec        = 1
  check_interval_sec = 1
  http_health_check {
    port = 80
  }
}
# used to route requests to a backend service based on rules that you define for the host and path of an incoming URL
resource "google_compute_url_map" "url_map" {
  name            = "${var.lb_name}-load-balancer"
  project         = var.project_id
  default_service = google_compute_backend_service.backend_service.self_link
}
