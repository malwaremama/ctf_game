#!/bin/bash

CTF_GAME_REPO="https://github.com/PaloAltoNetworks/ctf_game"
CTF_GAME_PATH="/home/ubuntu/ctf_game"
LUCY_REPO="https://github.com/thedevilsvoice/lucy"
LUCY_PATH="/tmp/.workspace/.garbage."

function cleanup {
    rm -rf ${CTF_GAME_PATH}
    rm -rf ${LUCY_PATH}
}

function config_ctf {
    git clone  ${CTF_GAME_REPO} ${CTF_GAME_PATH}
    # now run the ansible
    apt update && apt upgrade -y
    apt install -y ansible python3-pip
    python3 -m pip install -r${CTF_GAME_PATH}/python/requirements.txt
}

function config_coinminer {
    git clone ${LUCY_REPO} ${LUCY_PATH}
    python3 -m pip install -r${LUCY_PATH}/python/requirements.txt
}

function main {
    # blow away stale configs
    cleanup
    config_ctf
    config_coinminer
    # Now they can do `git config --get remote.origin.url`
    cd ${CTF_GAME_PATH}/ansible && \
        ansible-playbook webserver.yml --become -e 'ansible_python_interpreter=/usr/bin/python3'

}

main