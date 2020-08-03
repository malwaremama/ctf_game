#!/bin/bash

CTF_GAME_REPO="https://github.com/PaloAltoNetworks/ctf_game"
CTF_GAME_PATH="/home/ubuntu/ctf_game"

function cleanup {
    rm -rf ${CTF_GAME_PATH}
}

function config_ctf {
    git clone  ${CTF_GAME_REPO} ${CTF_GAME_PATH}
    apt update && apt upgrade -y
    apt install -y ansible
    python3 -m pip install -r${CTF_GAME_PATH}/python/requirements.txt
}

function main {
    # blow away stale configs
    cleanup
    config_ctf
    cd ${CTF_GAME_PATH}/ansible && \
        ansible-playbook webserver.yml --become -e 'ansible_python_interpreter=/usr/bin/python3'

}

main