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
export TF_LOG_PATH="/tmp/terraform.franklin"

# Leave commented out if no organization
#export TF_VAR_org_id=`gcloud organizations list | grep -v DISPLAY | cut -f3 -d' '`
export TF_VAR_billing_account=`gcloud beta billing accounts list | grep -v ACCOUNT | cut -f1 -d' '`
export TF_ADMIN="secops-iac-ctf-000378"
export TF_CREDS="~/.config/gcloud/${USER}-terraform-admin.json"
export GOOGLE_APPLICATION_CREDENTIALS=${TF_CREDS}
export GOOGLE_PROJECT=${TF_ADMIN}
