#!/usr/bin/env bash

echo "## Run File Transfer Ansible-playbook ##"
ansible-playbook -i inventory_gocd ${Playbook_name} -vv
echo "## Playbook execution completed ##"