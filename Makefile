#WORK_DIR := $(shell pwd)

# incase of changes made to the below tag names; check docker file and docker compose and update tag names on them
# MasterImgTag=jmeter5.3Azmastergocdsh
# SlaveImgTag=jmeter5.3Azslavegocdsh

#To use gocd pre defined and user defined variables in Makefile then enclose them with $()
#To use Makefile variables in Makefile enclose them with ${}

File_Transfer_Playbook:
	chmod +x sh gocd_ft.sh; \
	sh gocd_ft.sh