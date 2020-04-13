variable "fw_name" {
  description = "The name of the firewall instance"
  type        = string
}

variable "fw_zone" {
  description = "The GCP zone in which the firewall instance will be deployed"
  type        = string
}

variable "fw_image" {
  description = "The GCE image for the firewall instance"
  type        = string
}

variable "fw_machine_type" {
  description = "The GCE machine type for the firewall instance"
  type        = string
}

variable "fw_machine_cpu" {
  description = "The GCE machine minumum CPU size for the firewall instance"
  type        = string

}

variable "fw_bootstrap_bucket" {
  description = "The GCP storage bucket containing the firewall bootstrap package"
  type        = string
}

variable "fw_ssh_key" {
  description = "The SSH key used for the firewall admin user"
  type        = string
}

variable "fw_mgmt_subnet" {
  description = "The management subnet of the firewall instance"
  type        = string
}

variable "fw_mgmt_ip" {
  description = "The IP address of firewall instance management interface"
  type        = string
}

variable "fw_mgmt_rule" {
  description = "The GCP firewall rule for the firewall intance management interface"
  type        = string
}

variable "fw_untrust_subnet" {
  description = "The untrust subnet of the firewall instance"
  type        = string
}

variable "fw_untrust_ip" {
  description = "The IP address of firewall instance untrust interface"
  type        = string
}

variable "fw_untrust_rule" {
  description = "The GCP firewall rule for the firewall intance untrust interface"
  type        = string
}
