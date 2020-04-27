#/bin/bash

# script to delete everything except the OS image bucket

terraform state rm module.vpc.google_compute_network.untrust-net
terraform state rm module.vpc.google_compute_network.management-net
#terraform state rm google_storage_bucket.ctf_os_images_bucket
terraform state rm module.bootstrap.google_storage_bucket_object.bootstrap_dirs
terraform state rm module.bootstrap.google_storage_bucket_object.bootstrap_files
terraform state rm module.bootstrap.google_storage_bucket.bootstrap
terraform state rm module.vpc.google_compute_subnetwork.untrust-sub
terraform state rm module.vpc.google_compute_firewall.untrust-allow-inbound
terraform state rm module.vpc.google_compute_subnetwork.management-sub
terraform state rm module.vpc.google_compute_firewall.mgmt-allow-inbound
terraform state rm module.firewall.google_compute_instance.firewall[0]
