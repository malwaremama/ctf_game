variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
  description = "EC2 Region for the VPC"
  default     = "us-west-2"
}

variable "availability_zone" {
  description = "Availability Zone"
  default     = "us-west-2c"
}

variable "key_name" {
  default     = "scoreboard"
  description = "Name of your SSH key in EC2"
}

variable "mgmt_subnet_cidr" {
  default = "10.10.116.0/24"
}

variable "public_subnet_cidr" {
  default = "10.10.200.0/24"
}

variable "attacker_subnet_cidr" {
  default = "10.10.168.0/24"
}

variable "hosts_subnet_cidr" {
  default = "10.10.10.0/24"
}

variable "domain_subnet_cidr" {
  default = "10.10.20.0/24"
}

variable "web_subnet_cidr" {
  default = "10.10.100.0/24"
}

variable "db_subnet_cidr" {
  default = "10.10.101.0/24"
}

# You can update this to match your personal public SSH key half.
variable "public_key" {
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCu+5vKjTtTWZwlDlm7AlmQdWKujHq7cWnoeJZa/sUGNj+rg8d+SfJZCF+cSuOEFxqJ6wVbX5WSAvB0MNETtncVsC6NvKNSGFsc8vIrIas5cQtyk8frp6SA9aJ/M90p2ekYwPVhqshGCLiRZ1enbm+8uvpGZkWW/g7eQV8HbxFnFCsdf9JZzHcnXWOD8tkRO9r/uuIX31BmVxEG2YE8IPC3Xq18hGglLsi0vOGdBicfOGGc/DRsw6wxXSjXF66nJAxmKZgg4lWzNIe8MkEJthI9cWPsTWcJC3XPpRuKQY6crofZa+atwkymhYJ/MUIJW4172cWLpbA1+4dvSFKSUpyo/Qs+0Zpft8vVvceaDhOsNCpzKk/qINZ3Z+Q/B4I9Ribw83K3FwfAlr6t35Z4j7cCw3VrlJtyVHrwUnVwkCNuw2zcWISfXSnCCFyVgxiJltnqk6CBOUfk6P3qIXqvQqQqp3cB1SiimVtSN5bzITiNnAdySnOUYJIsmMxkPH0Qua8cOQNNs2Ns9zAjgilTZtzG0siJtWmHJrg8+3jMG5mwzOvIgT3DadAx5ao1/+8ak4gBfoqSrLSJXPwW8Myl/I3/uxVkbxb4+jjJwnxKsbGS5LnfVGSvqEFXgtGYfNz79emdIWf3Tbh6Lv9+3Rrt9maCPg3/i5QtWBpaflI2RxurbQ== fdiaz@paloaltonetworks.com"
  description = "SSH Public key half to use for ubuntu on the new host"
}

variable "key_path" {
  default     = "~/.ssh/id_rsa"
  description = "Path to your SSH private key half on local dev machine"
}
