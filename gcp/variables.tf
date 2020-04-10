variable "project_id" {
  description = "Google Project ID."
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "us-central1"
}

variable "zones" {
  type    = list(string)
  default = ["a", "b", "c"]
}

variable "trusted_network" {
  description = "0.0.0.0/0"
}

variable "name" {
  description = "secops"
}

variable "cidr" {
  default = "192.168.100.0/24"
}

variable "machine_type" {
  default = "n1-standard-16"
}

variable "gcp_key_filename" {
  description = "secops-iac-ctf-000378-ca7e78916a38.json"
}

variable "remote_user" {
  default = "elastic"
}

variable "public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "private_key" {
  default = "~/.ssh/id_rsa"
}

variable "ece_version" {
  default = "2.4.3"
}

variable "bucket_name" {
  description = "GCS Bucket for storing lab machine images."
  type        = string
}

