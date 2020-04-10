  # Specify the GCP Provider
  provider "google" {
    project = var.project_id
    region  = var.region
    credentials = file(format("~/.config/gcloud/%s",var.gcp_key_filename))
  }
