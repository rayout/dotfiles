# dotfiles/ansible-project
Ansible configuration for apps and dotfiles with usefull scripts

# Commands

## how install ansible to your ansible-master

    git clone git@github.com:rayout/dotfiles.git
    cd dotfiles
    ./bin/partials/apps-install.sh

## Working with ansible hosts
### to install to webservers and domainservers tags: docker, quake, editors
    
    ./bin/install.sh webservers,domanservers docker quake editors

### to install to all hostgroups apache2

    # all hostgroups selected by default 
    ./bin/install.sh apache2

### to install default to webservers group

    ./bin/install.sh webservers

### install 
for example you

# Service command

## update/push repo from symlinks:
    
    ./bin/update.sh
