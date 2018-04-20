#!/bin/bash

lalala="/environment/bin"
if [[ $(pwd) == *$lalala* ]]
then
	sh configJdk.sh
	read -p "do you want to continue to configurate the environment of tomcat[yes/no]" isContinued
	if [ "${isContinued}" == "y" ]||[ "${isContinued}" == "Y" ]||[ "${isContinued}" == "YES" ]||[ "${isContinued}" == "yes" ]
	then
	sh configTomcat.sh
	fi
	read -p "do you want to continue to configurate the environment of mysql[yes/no]" isContinued
	if [ "${isContinued}" == "y" ]||[ "${isContinued}" == "Y" ]||[ "${isContinued}" == "YES" ]||[ "${isContinued}" == "yes" ]
	then
	sh configMySQL.sh
	fi
	echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ "
	echo "OK, The environment have finished "
	read -p "System will reboot after 300s, but do you want reboot at once [yes/later/never]" isMoment
	if [ "${isMoment}" == "y" ]||[ "${isMoment}" == "Y" ]||[ "${isMoment}" == "YES" ]||[ "${isMoment}" == "yes" ]
	then
		reboot
	elif [ "${isMoment}" == "later" ]
	then
		echo "System will reboot after 5min"
		shutdown -h +5
	elif [ "${isMoment}" == "never" ]
	then
		echo "Enviroments will be available after reboot system"
	fi
else
   echo "please access the catalogue for ../environment/bin "
fi
