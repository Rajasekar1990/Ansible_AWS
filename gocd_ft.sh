#!/usr/bin/env bash

echo "## Run File Transfer Ansible-playbook ##"
ansible-playbook -i inventory_gocd ${Playbook_name} -vv
echo "## Playbook execution completed ##"
echo "## print the list of files in the current dir"
ls -lrat