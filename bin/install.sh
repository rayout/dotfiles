#!/usr/bin/env bash

cd "${BASH_SOURCE%/*}/.."

./bin/partials/apps-install.sh
./bin/partials/copy_ssh.sh

source ./bin/src/parse_args.sh

ansible-playbook --ask-become-pass -i hosts.ini --skip-tags=update $tags $groups
