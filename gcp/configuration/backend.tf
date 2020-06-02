terraform {
  backend "gcs" {
    bucket = "secops-iac-ctf-000378"
    prefix = "terraform/state"
  }
}
