#!/usr/bin/env bash

cd "${BASH_SOURCE%/*}/.."

./bin/partials/apps-install.sh

join() {
    IFS="$1"
    shift
    echo "$*"
}

if [[ $# -gt 0 ]]; then
    tags="--tags=$(join , $@)"
fi

ansible-playbook --ask-become-pass -i hosts.ini --skip-tags=update $tags local.yml remote.yml