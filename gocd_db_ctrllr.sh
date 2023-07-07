#!/usr/bin/env bash

echo "##### MSSQL DB Ansible-playbook: ${Playbook_name} execution started #####"
echo "##### PLAYBOOK FULLY EXECUTED FROM ANSIBLE CONTROLLER #####"
ansible-playbook -i inventory_gocd ${Playbook_name} -vv
echo "##### PLAYBOOK FULLY EXECUTED FROM ANSIBLE CONTROLLER #####"
echo "##### MSSQL DB Ansible-playbook: ${Playbook_name} execution completed #####"