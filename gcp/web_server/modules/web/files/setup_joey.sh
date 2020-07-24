#!/bin/bash

#####################################
# Configure the Gibson for the game #
#####################################
git clone https://github.com/PaloAltoNetworks/ctf_game /home/ubuntu/ctf_game
# now run the ansible
apt update && apt upgrade -y
apt install -y ansible python3-pip
python3 -m pip install -r/home/ubuntu/ctf_game/python/requirements.txt
cd /home/ubuntu/ctf_game/ansible && ansible-playbook webserver.yml --become -e 'ansible_python_interpreter=/usr/bin/python3'

#########################
# Set up the challenges #
#########################
git clone https://github.com/thedevilsvoice/lucy /tmp/.workspace/.garbage.
python3 -m pip install -r/tmp/.workspace/.garbage./python/requirements.txt
# rm /tmp/.workspace/.garbage./*
# Now they can do `git config --get remote.origin.url`
