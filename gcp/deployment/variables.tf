variable "project_id" {
  description = "Google Project ID."
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone in which to deploy"
  type        = string
  default     = "a"
}


variable "trusted_network" {
  description = "CIDR formatted IP (<IP Address>/32) or network that will be allowed access (you can use 0.0.0.0/0 for unrestricted access)"
  default     = "0.0.0.0/0"
}

variable "name" {
  description = "An idenfitying name used for names of cloud resources"
  default     = "secops"
}

variable "cidr" {
  default = "192.168.100.0/24"
}

variable "machine_type" {
  default = "n1-standard-16"
}

variable "gcp_key_filename" {
  description = "What's the json key filename located in your <home>/.gcloud/ directory path?"
  default     = "secops-iac-ctf-000378-ca7e78916a38.json"
}

variable "public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "private_key" {
  default = "~/.ssh/id_rsa"
}

variable "bucket_name" {
  description = "GCS Bucket for storing lab machine images."
  type        = string
  default     = "secops-iac-ctf-bucket"
}

variable "ssh_key" {
  description = "The contents of the SSH public key in [username:sha-rsa key username] format"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCu+5vKjTtTWZwlDlm7AlmQdWKujHq7cWnoeJZa/sUGNj+rg8d+SfJZCF+cSuOEFxqJ6wVbX5WSAvB0MNETtncVsC6NvKNSGFsc8vIrIas5cQtyk8frp6SA9aJ/M90p2ekYwPVhqshGCLiRZ1enbm+8uvpGZkWW/g7eQV8HbxFnFCsdf9JZzHcnXWOD8tkRO9r/uuIX31BmVxEG2YE8IPC3Xq18hGglLsi0vOGdBicfOGGc/DRsw6wxXSjXF66nJAxmKZgg4lWzNIe8MkEJthI9cWPsTWcJC3XPpRuKQY6crofZa+atwkymhYJ/MUIJW4172cWLpbA1+4dvSFKSUpyo/Qs+0Zpft8vVvceaDhOsNCpzKk/qINZ3Z+Q/B4I9Ribw83K3FwfAlr6t35Z4j7cCw3VrlJtyVHrwUnVwkCNuw2zcWISfXSnCCFyVgxiJltnqk6CBOUfk6P3qIXqvQqQqp3cB1SiimVtSN5bzITiNnAdySnOUYJIsmMxkPH0Qua8cOQNNs2Ns9zAjgilTZtzG0siJtWmHJrg8+3jMG5mwzOvIgT3DadAx5ao1/+8ak4gBfoqSrLSJXPwW8Myl/I3/uxVkbxb4+jjJwnxKsbGS5LnfVGSvqEFXgtGYfNz79emdIWf3Tbh6Lv9+3Rrt9maCPg3/i5QtWBpaflI2RxurbQ== fdiaz@paloaltonetworks.com"
}

############################################################################################
# Copyright 2019 Palo Alto Networks.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
############################################################################################
