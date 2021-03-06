output "web-1-name" {
  value = google_compute_instance.sandy-web.hostname
}
output "web-1-internal-ip" {
  value = google_compute_instance.sandy-web.network_interface.0.network_ip
}

/*
output "web-2-name" {
  value = google_compute_instance.web_private_2.name
}

output "web-2-internal-ip" {
  value = google_compute_instance.web_private_2.network_interface.0.network_ip
}
*/


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
