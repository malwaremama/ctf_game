# Examples

## set up gcloud

```
gcloud auth login
gcloud config set project ctf-sko21
gcloud compute networks create default
gcloud compute firewall-rules create default-allow-icmp --network default --allow icmp --source-ranges 0.0.0.0/0
gcloud compute firewall-rules create default-allow-ssh --network default --allow tcp:22 --source-ranges 0.0.0.0/0
gcloud compute firewall-rules create default-allow-internal --network default --allow tcp:0-65535,udp:0-65535,icmp --source-ranges 10.128.0.0/9
```

## build an image

- [Make a service key](https://console.cloud.google.com/iam-admin/serviceaccounts?organizationId=992524860932&project=ctf-sko21)
    - For packer it should only need computer engine perms but you might need more perms depending on what you're building.
- Place your service key in `~/.config/gcloud/<<key name>>`
- run this command:

```
packer build -var 'service_key=ctf-sko21-e5a43042f7d8.json' attacker_ubuntu18.json
```