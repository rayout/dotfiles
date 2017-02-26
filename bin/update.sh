#!/usr/bin/env bash

cd "${BASH_SOURCE%/*}/.."

./bin/partials/apps-install.sh

ansible-playbook -i hosts.ini --tags=update local.yml