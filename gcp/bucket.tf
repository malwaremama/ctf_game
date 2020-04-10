# Create a GCS Bucket
resource "google_storage_bucket" "ctf_os_images_bucket" {
  lifecycle {
    prevent_destroy = true
  }
  name     = var.bucket_name
  location = var.region
}
