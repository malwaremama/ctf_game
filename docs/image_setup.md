# Images

## Prepare Images

## Transfer Images to Bucket

https://colab.research.google.com/drive/1Xc8E8mKC4MBvQ6Sw6akd_X5Z1cmHSNca#forceEdit=true&sandboxMode=true

## Stand up Instances with GCP



```
gsutil -m ls gs://secops-iac-ctf-bucket/  
gcloud compute zones list | grep 'us-central'
gcloud config set compute/zone us-west1-a 
gcloud compute os-login ssh-keys add --key-file=/Users/fdiaz/.ssh/id_rsa.pub
#gcloud compute project-info add-metadata --metadata enable-oslogin=TRUE
```

https://cloud.google.com/compute/docs/import/import-ovf-files

```
gcloud compute instances import ubuntu1-secops-ctf-000378 --source-uri=gs://secops-iac-ctf-bucket/Ubuntu-1.ova --os=ubuntu-1804

🚀 gcloud compute instances list
NAME                       ZONE        MACHINE_TYPE   PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP     STATUS
ubuntu1-secops-ctf-000378  us-west1-a  n1-standard-1               10.138.0.6   35.203.185.100  RUNNING

🚀 gcloud beta compute ssh --zone "us-west1-a" "ubuntu1-secops-ctf-000378" --project "secops-iac-ctf-000378"
```
