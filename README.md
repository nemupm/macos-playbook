# macos playbook

## clone

```
git clone --recursive git@github.com:nemupm/macos-playbook.git
```

## setup

```
ansible-galaxy collection install community.general
#ansible-galaxy collection install community.general --upgrade
```

## run

```
ansible-playbook homebrew.yml
ansible-playbook homebrew_cask.yml --extra-vars '{include_private: false, latest: false}'
ansible-playbook environment.yml
```
