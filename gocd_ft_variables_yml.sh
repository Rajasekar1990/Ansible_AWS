#!/usr/bin/bash --
## Updating variables.yml with runtime inputs provided in gocd.yaml envrionment & secure variables ##

# Archive_flag='test_OFF'
# File_loc='test_C:/src_loc/'
# Tmp_loc='test_/tmp/'
# Target_loc='test_C:/{{ inventory_hostname }}/'
# File_size='test_2k'
# Ansible_logpath='test_ansible_log.log'
# Vault_password_file='.test_secrets.yml'

echo 'Updating variables.yml with runtime inputs provided in gocd.yaml envrionment & secure variables'
escaped_File_loc=$(echo "$File_loc" | sed 's/\//\\\//g')
escaped_Tmp_loc=$(echo "$Tmp_loc" | sed 's/\//\\\//g')
escaped_Target_loc=$(echo "$Target_loc" | sed 's/\//\\\//g')

variables_yml_sedoutput=$(cat variables_bkp.yml | sed -e "s/archive_flag: \(.*\)/archive_flag: $Archive_flag/g" \
                                                  -e "s/file_loc: \(.*\)/file_loc: $escaped_File_loc/g" \
                                                  -e "s/tmp_loc: \(.*\)/tmp_loc: $escaped_Tmp_loc/g" \
                                                  -e "s/target_loc: \(.*\)/target_loc: $escaped_Target_loc/g" \
                                                  -e "s/file_size: \(.*\)/file_size: $File_size/g")
echo "$variables_yml_sedoutput" > variables.yml

ansible_cfg_sedoutput=$(cat ansible_bkp.cfg | sed -e "s/log_path=\(.*\)/log_path=$Ansible_logpath/g" \
                                              -e "s/vault_password_file=\(.*\)/vault_password_file=$Vault_password_file/g")

echo "$ansible_cfg_sedoutput" > ansible.cfg