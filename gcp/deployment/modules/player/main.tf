resource "google_compute_http_health_check" "default" {
  name               = "basic"
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
}

resource "google_compute_region_instance_group_manager" "player_instance_group" {
  name               = "CTF-player"
  instance_template  = google_compute_instance_template.player
  base_instance_name = "player"
  region             = var.region
  target_size        = 1

  named_port {
    name = "ssh"
    port = 22
  }

  auto_healing_policies {
    health_check      = google_compute_http_health_check.default.self_link
    initial_delay_sec = 300
  }

}

resource "google_compute_instance_template" "player" {
  name_prefix          = "secops-ctf"
  description          = "Player host"
  project              = var.project_id
  region               = var.region
  tags                 = ["${var.tags}"]
  instance_description = var.desc_inst
  machine_type         = "n1-standard-1"
  can_ip_forward       = false // Whether to allow sending and receiving of packets with non-matching source or destination IPs. This defaults to false.

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  // Create a new boot disk from an image (Lets use one created by Packer)
  disk {
    source_image = var.source_image
    auto_delete  = true
    boot         = true
  }

  metadata {
    startup-script = <<SCRIPT
    INT_IP="$(ip route get 8.8.8.8 | awk '{print $NF; exit}')"
    EXT_IP="$(curl -s ipinfo.io/ip)"
    sudo cat <<EOF > /home/secops/test
    This is a test. 
SCRIPT
  }

  network_interface {
    network = var.network
    #
    # Give a Public IP to instance(s)
    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  lifecycle {
    create_before_destroy = true
  }
}
