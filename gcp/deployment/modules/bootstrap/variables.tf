// BOOTSTRAP Variables

variable "bootstrap_project" {
  description = "The GCP project in which to deploy the bootstrap bucket"
  type        = string
}

variable "bootstrap_region" {
  description = "The GCP region in which to deploy the bootstrap bucket"
  type        = string
}

variable "bootstrap_directories" {
  description = "The directories comprising the bootstrap package"
  default = [
    "config/",
    "content/",
    "software/",
    "license/",
    "plugins/"
  ]
}

