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

variable "vpc_web_network_name" {
  description = "Web network name"
}

variable "vpc_web_subnet_cidr" {
  description = "Web subnet netblock"
}

variable "vpc_web_subnet_name" {
  description = "Web subnet name"
}

variable "vpc_db_network_name" {
  description = "Database network name"
}

variable "vpc_db_subnet_cidr" {
  description = "Database subnet netblock"
}

variable "vpc_db_subnet_name" {
  description = "Database subnet name"
}

variable "allowed_mgmt_cidr" {
  description = "The source address that will be allowed to access the lab environment"
  type        = string
  default     = "0.0.0.0/0"
}
