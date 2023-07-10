#!/usr/bin/bash --
## Updating variables.yml with runtime inputs provided in gocd.yaml envrionment & secure variables ##

# mssql_login_host='172.31.45.40'
# mssql_login_user='target1'
# mssql_db='test_db'
# mssql_port=1433
# sql_srcpath='sql_stmts/'
# sql_dirpath='sql_results'
# Ansible_logpath='ansible_log.log'
# Vault_password_file=.secrets.yml
# mssql_login_password=AES:2G+TB6ba9zA+B6ejy8NHwQ==:y2aCvK75HxpL1ufbejdnSQ==

echo 'Updating variables.yml with runtime inputs provided in gocd.yaml envrionment & secure variables'
escaped_sql_srcpath=$(echo "$sql_srcpath" | sed 's/\//\\\//g')
escaped_sql_dirpath=$(echo "$sql_dirpath" | sed 's/\//\\\//g')

variables_yml_sedoutput=$(cat variables_bkp.yml | sed -e "s/mssql_login_host: \(.*\)/mssql_login_host: '$mssql_login_host'/g" \
                                                  -e "s/mssql_login_user: \(.*\)/mssql_login_user: '$mssql_login_user'/g" \
                                                  -e "s/mssql_db: \(.*\)/mssql_db: '$mssql_db'/g" \
                                                  -e "s/mssql_port: \(.*\)/mssql_port: '$mssql_port'/g" \
                                                  -e "s/sql_srcpath: \(.*\)/sql_srcpath: '$escaped_sql_srcpath'/g" \
                                                  -e "s/sql_dirpath: \(.*\)/sql_dirpath: '$escaped_sql_dirpath'/g" \
                                                  -e "s/mssql_login_password: \(.*\)\([\\t\\r\\n\\s\\S\]*\)/mssql_login_password: '$mssql_login_password'/g")
echo "$variables_yml_sedoutput" > variables.yml


ansible_cfg_sedoutput=$(cat ansible_bkp.cfg | sed -e "s/log_path=\(.*\)/log_path=$Ansible_logpath/g" \
                                              -e "s/vault_password_file=\(.*\)/vault_password_file=$Vault_password_file/g")

echo "$ansible_cfg_sedoutput" > ansible.cfg