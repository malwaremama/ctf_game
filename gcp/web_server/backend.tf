terraform {
  backend "gcs" {
    bucket = "secops-iac-ctf-000378-webserver"
    prefix = "terraform/state"
  }
}
