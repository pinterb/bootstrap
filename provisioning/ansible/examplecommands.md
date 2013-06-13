## Sample Ansible Commands ##

Until you get up to speed with Ansible, here are some commands I found useful:

### Gather local facts

    ansible all -m setup -i local/hosts.ini --connection=local

### Run playbook against a local node (i.e. localhost) 

    ansible-playbook site.yml -i local/hosts.ini --ask-sudo-pass --connection=local

### Run playbook against a local node (i.e. localhost) where playbook contains 'connection: local'

    ansible-playbook site.yml -i local/hosts.ini --ask-sudo-pass
