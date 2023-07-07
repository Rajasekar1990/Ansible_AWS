#!/usr/bin/env bash

echo "##### File Transfer Ansible-playbook: ${Playbook_name} execution started #####"
ansible-playbook -i inventory_gocd ${Playbook_name} -vv
echo "##### File Transfer Ansible-playbook: ${Playbook_name} execution completed #####"