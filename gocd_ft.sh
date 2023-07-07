#!/usr/bin/env bash

echo "## Run File Transfer Ansible-playbook ${Playbook_name} ##"
ansible-playbook -i inventory_gocd ${Playbook_name} -vv
echo "## File Transfer Playbook: ${Playbook_name} execution completed ##"