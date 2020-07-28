# Web Server

- Set up the direnv/.envrc in parent folder.
- Create backend bucket manually in GCloud console.
- Create terraform.tfvars file in this directory.

```fish
gcloud config set account ${USER}@paloaltonetworks.com
gcloud config set project ${GOOGLE_PROJECT}
```

- Now set up a terraform service user and local key file

```fish
# next command may fail if service user already exists
gcloud iam service-accounts create terraform --display-name "Terraform admin account"
gcloud iam service-accounts keys create ${TF_CREDS} \
    --iam-account terraform@${TF_ADMIN}.iam.gserviceaccount.com
```

- Finally, add the new key file to terraform.tfvars in this dir:

```fish
fdiaz at REMMAC11ELVDT ~ 💰  cat terraform.tfvars| grep gcp_key
gcp_key_filename = "ctf-sko21-fed0a0666.json"
```

## Run Terraform

```fish
cd web_server
terraform plan -out franklin.out
terraform apply "franklin.out"
# sometimes there is a race condition where it bombs, just do this:
terraform apply
```

## Login

- Get the public IP address
- Log in to the host

```fish
terraform show | grep -i nat_ip
gcloud beta compute ssh --zone "us-central1-a" "sandy-linux" --project $GOOGLE_PROJECT
```

- Fix `/home/ubuntu/.ssh/authorized_keys` file
  - For now you can manually add your public SSH key half to this file.
- Once authorized_keys is fixed, you can ssh as ubuntu:

```fish
set NAT_IP (gcloud beta compute instances list | grep sandy-linux | grep -m2 -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | tail -1)
ssh -l ubuntu -i ~/.ssh/id_rsa $NAT_IP
```

## Configuration

- Now you can run the `ctf_game/gcp/web_server/modules/web/files/setup_joey.sh` script to set everything up.
- This will:
  - pull the repo
  - install python
  - install ansible
