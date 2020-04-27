Images
======

We have two buckets. One is permanent, called "ctf-backup". The other is 
setup and torn down by Terraform. We keep the images in this permanent
bucket so they can be copied into the lab network on the fly as it is 
stood up and torn down.

Upload Images to Bucket
-----------------------

- Create .ova/ovf images as desired. 
- Upload these images into the permanent "ctf-backup" bucket.
- The images should appear as below when finished.

::

    fdiaz at REMMAC11ELVDT ~ 💩  gsutil ls gs://ctf-backup/                                              deployment
    gs://ctf-backup/Ubuntu-1.ova
    gs://ctf-backup/W7P_x64.ova

You might like to transfer images from Google Drive to GCP
Storage Bucket using colab:
https://colab.research.google.com/drive/1ZZuWEBOrD8Twb78kpY18Cf9g27MfdD-M

Stand up Instances with GCP
---------------------------

Once the OVA/OVF images have been uploaded to a GCP Storage
bucket, we need to create Compute Instances from them. We can
`use these directions <https://cloud.google.com/compute/docs/import/import-ovf-files>`__

The command to create the Compute Instance should look like so:

::

    gcloud compute instances import ubuntu1-secops-ctf-000378 --source-uri=gs://ctf-backup/Ubuntu-1.ova --os=ubuntu-1804

You can verify that it worked properly like so:

::

    🚀 gcloud compute instances list
    NAME                       ZONE        MACHINE_TYPE   PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP     STATUS
    ubuntu1-secops-ctf-000378  us-west1-a  n1-standard-1               10.138.0.6   35.203.185.100  RUNNING
