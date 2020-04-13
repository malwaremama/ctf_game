  terraform {
    backend "gcs" {
      bucket = "franklin-tfstate-bucket"   # GCS bucket name to store terraform tfstate
      prefix = "secops-iac-ctf"  # Update to desired prefix name. Prefix name should be unique for each Terraform project having same remote state bucket.
      }
  }