#!/bin/bash
#
# Author: @theDevilsVoice
# Date: 06/02/2020
#
# Script Name: setup.sh
#
# Description: Configure and deploy on GCP
#
# Run Information:
#
# Error Log: Check .envrc for log file path

# Configure your environment for the Google Cloud Terraform provider:
function setup_environment {
  gcloud config set project ${GOOGLE_PROJECT}
}

function service_user {
  # ok if this one fails if it already exists
  gcloud iam service-accounts create terraform --display-name "Terraform admin account"
  ## download the JSON credentials

  # if this fails, click on the three dot menu: 
  # https://console.cloud.google.com/iam-admin/serviceaccounts?project=ctf-sko21
  gcloud iam service-accounts keys create ${TF_CREDS} \
    --iam-account terraform@${TF_ADMIN}.iam.gserviceaccount.com

  # Any actions that Terraform performs require that the API be enabled to do so. 
  gcloud services enable cloudresourcemanager.googleapis.com
  gcloud services enable cloudbilling.googleapis.com
  gcloud services enable iam.googleapis.com
  gcloud services enable compute.googleapis.com
  gcloud services enable serviceusage.googleapis.com
}

function tfstate_bucket {
  # Create the remote backend bucket in Cloud Storage and the backend.tf file 
  # for storage of the terraform.tfstate file:
  gsutil mb -p ${TF_ADMIN} gs://${TF_ADMIN}

  if [ ! -f "deployment/backend.tf" ]; then
  cat > deployment/backend.tf << EOF
terraform {
 backend "gcs" {
   bucket  = "${TF_ADMIN}"
   prefix  = "terraform/state"
 }
}
EOF
  fi

  if [ ! -f "configuration/backend.tf" ]; then
  cat > configuration/backend.tf << EOF
terraform {
 backend "gcs" {
   bucket  = "${TF_ADMIN}"
   prefix  = "terraform/state"
 }
}
EOF 
  fi

  # Enable versioning for the remote bucket:
  gsutil versioning set on gs://${TF_ADMIN}
}

function machine_images {
  gcloud compute instances import ubuntu1-secops-ctf-000378 \
    --source-uri=gs://ctf-backup/Ubuntu_18_attacker.ova --os=ubuntu-1804
}

function main {
  setup_environment
  #service_user
  #tfstate_bucket
  #machine_images
}

main