# dotfiles/ansible-project
Ansible configuration for apps and dotfiles with usefull scripts

## Install ansible

```bash
git clone git@github.com:rayout/dotfiles.git
cd dotfiles
./bin/partials/apps-install.sh```

## Instruction
Currently we have to main host groups: *local* and *remote*
* local - this is your computer
* remote - this is remote hosts which you can configure with ansible

## Examples:
* install guake to your pc
```bash
./bin/install.sh local guake
```

* install guake to your local host and all remote hosts
```bash
./bin/install.sh remote,local guake
```

## Testing
we have some test for bash scripts, for testing we use **Bats**
### installing
to install bats go to [Bats on github.com](https://github.com/sstephenson/bats)
### Run tests
use
```bash
./test.sh
```
