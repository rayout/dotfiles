#!/usr/bin/env bash

linux() {
    if ! type "ansible" &> /dev/null ; then
      sudo apt-get update
      sudo apt-get -y install software-properties-common
      sudo apt-add-repository -y ppa:ansible/ansible
      sudo apt-get update
      sudo apt-get -y install ansible python-apt
    fi
}

macos() {
    # install homebrew
    if [ ! -x /usr/local/bin/brew ]; then
        echo installing homebrew...
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    # install ansible
    if [ ! -x /usr/local/bin/ansible ]; then
        echo installing ansible...
        brew install ansible
    fi
}

# Install Ansible and it's dependencies if not available
os=`uname`
if [[ "$os" == 'Linux' ]]; then
   linux
elif [[ "$os" == 'Darwin' ]]; then
   macos
fi
