variable "project_id" {
  description = "Google Project ID."
  type        = string
  default     = "ctf-sko21"
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone in which to deploy"
  type        = string
  default     = "us-central1-a"
}

variable "gcp_key_filename" {
  description = "What's the json key filename located in your <home>/.gcloud/ directory path?"
}

variable "ssh_key" {
  description = "The contents of the SSH public key in [username:sha-rsa key username] format"
  type        = string
}

variable "public_key_file" {
  description = "Full path to the SSH public key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "allowed_mgmt_cidr" {
  description = "The source address that will be allowed to access the lab environment"
  type        = string
  default     = "0.0.0.0/0"
}

variable "network_01_name" {
  description = "The name of the first VPC network being created"
  type        = string
  default     = "web"
}

/**
 *  Copyright 2019 Palo Alto Networks.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 