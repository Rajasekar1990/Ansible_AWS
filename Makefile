#WORK_DIR := $(shell pwd)

# incase of changes made to the below tag names; check docker file and docker compose and update tag names on them
# MasterImgTag=jmeter5.3Azmastergocdsh
# SlaveImgTag=jmeter5.3Azslavegocdsh

#To use gocd pre defined and user defined variables in Makefile then enclose them with $()
#To use Makefile variables in Makefile enclose them with ${}

File_Transfer_Playbook:
	chmod +x gocd_ft.sh; \
	sh gocd_ft.sh

MSSQL_Db_Ctrllr_Playbook:
	chmod +x gocd_db_ctrllr.sh; \
	sh gocd_db_ctrllr.sh

Db_Variables_Yml_Update:
	chmod +x gocd_db_variables_yml.sh; \
	sh gocd_db_variables_yml.sh

FT_Variables_Yml_Update: 
	chmod +x gocd_ft_variables_yml.sh; \
	sh gocd_ft_variables_yml.sh