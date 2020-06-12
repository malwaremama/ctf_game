#!/bin/bash
#
# Author: @theDevilsVoice
# Date: 06/02/2020
#
# Script Name: env.sh
#
# Description: Configure and deploy on GCP
#
# Run Information:
#
# Error Log: Any output found in /path/to/logfile
#

# You can set TF_LOG to one of the log levels TRACE, DEBUG, INFO, 
# WARN or ERROR to change the verbosity of the logs. TRACE is the
# most verbose and it is the default if TF_LOG is set to something
# other than a log level name.
export TF_LOG="TRACE"
echo "Set terraform log level to: ${TF_LOG}"
export TF_LOG_PATH="/tmp/terraform.franklin"
echo "Set terraform log file to: ${TF_LOG_PATH}"

# Leave commented out if no organization
#export TF_VAR_org_id=`gcloud organizations list | grep -v DISPLAY | cut -f3 -d' '`
export TF_VAR_billing_account=`gcloud beta billing accounts list | grep -v ACCOUNT | cut -f1 -d' '`
export TF_ADMIN="ctf-sko21"
if [ -f "terraform.tfvars" ]; then
  TF_CRED_FILE=`cat terraform.tfvars | grep gcp_key | cut -f3 -d' ' |sed -e 's/^"//' -e 's/"$//'`
  export TF_CREDS="${HOME}/.config/gcloud/${TF_CRED_FILE}"
else 
  export TF_CREDS="${HOME}/.config/gcloud/${USER}-terraform-admin.json"
fi

export GOOGLE_APPLICATION_CREDENTIALS="${TF_CREDS}"
echo "Set GOOGLE_APPLICATION_CREDENTIALS to: ${TF_CREDS}"
export GOOGLE_PROJECT="${TF_ADMIN}"
echo "Set GOOGLE_PROJECT to: ${TF_ADMIN}"
