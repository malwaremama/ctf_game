gcloud config set project secops-iac-ctf-000378

## Create the service account in the Terraform admin project 
#export TF_VAR_org_id=`gcloud organizations list | grep -v DISPLAY | cut -f3 -d' '`
export TF_VAR_billing_account=`gcloud beta billing accounts list | grep -v ACCOUNT | cut -f1 -d' '`
export TF_ADMIN=secops-iac-ctf-000378
export TF_CREDS=~/.config/gcloud/${USER}-terraform-admin.json

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

# Configure your environment for the Google Cloud Terraform provider:

export GOOGLE_APPLICATION_CREDENTIALS=${TF_CREDS}
export GOOGLE_PROJECT=${TF_ADMIN}