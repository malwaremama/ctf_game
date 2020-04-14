variable "vpc_region" {
  description = "GCP region in which to deploy the network resources"
}

variable "vpc_mgmt_network_name" {
  description = "Management network name"
}

variable "vpc_mgmt_subnet_cidr" {
  description = "Management subnet netblock"
}

variable "vpc_mgmt_subnet_name" {
  description = "Management subnet name"
}

variable "vpc_untrust_network_name" {
  description = "Untrust network name"
}
variable "vpc_untrust_subnet_cidr" {
  description = "Untrust subnet netblock"
}

variable "vpc_untrust_subnet_name" {
  description = "Untrust subnet name"
}
