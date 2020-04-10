# QUICKSTART

Do these steps to get your local machine ready. 

## Prepare your local environment.

- Create a file called /aws/terraform.tfvars
  - For example:

```
project_id  = ""                   # Put your GCP Project ID.
bucket_name = "my-bucket-48693"    # Put the desired GCS Bucket name.
```

- Run the "config" script in this repo. 
- Correct the errors until you get output as below.


## Log in via gcloud

- Be sure to use your gmail or personal account
  - Do not use your palo alto email to sign in. 

```
gcloud auth login
gcloud projects list
gcloud projects create secops-iac-ctf-000378
gcloud config set project secops-iac-ctf-000378
```

- [Use the cloud console](https://cloud.google.com/docs/authentication/production) to create a service account
- Save the file and then do like so:

```
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/creds/file"
```

- [create a bucket to store your tfstate file](https://console.cloud.google.com/storage/browser)

## Terraform Time

```
```
