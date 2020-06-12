# Web Server

- Source the env.sh file

```
source env.sh
```

- Create backend bucket
- Create terraform.tfvars file in this directory

```
gcloud config set account ${USER}@paloaltonetworks.com 
gcloud config set project ${GOOGLE_PROJECT}
```
- Now set up a terraform service user and local key file
```
# next command may fail if service user already exists
gcloud iam service-accounts create terraform --display-name "Terraform admin account"
gcloud iam service-accounts keys create ${TF_CREDS} \
    --iam-account terraform@${TF_ADMIN}.iam.gserviceaccount.com
```

- Finally, add the new key file to terraform.tfvars in this dir:
```
fdiaz at REMMAC11ELVDT ~ 💰  cat terraform.tfvars| grep gcp_key
gcp_key_filename = "ctf-sko21-fed0a0666.json"
```

## Login

```
gcloud beta compute ssh --zone "us-central1-a" "sandy-linux" --project "secops-iac-ctf-000378"
```

Fix `/home/ubuntu/.ssh/authorized_keys` file