#!/usr/bin/env bash

# Install Ansible and it's dependencies if not available
if ! type "ansible" &> /dev/null ; then
  sudo apt-get update
  sudo apt-get -y install software-properties-common
  sudo apt-add-repository -y ppa:ansible/ansible
  sudo apt-get update
  sudo apt-get -y install ansible python-apt
fi