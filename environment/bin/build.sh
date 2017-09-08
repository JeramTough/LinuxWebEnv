#!/bin/bash

lalala="/environment/bin"
if [[ $(pwd) == *$lalala* ]]
then
	sh configJdk.sh
	sh configJre.sh
	sh configTomcat.sh
	sh configMySQL.sh
	echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ "
	echo "OK, The environment have finished "
	read -p "System will reboot after 300s, do you want reboot at once [yes/later/never]" isMoment
	if [ "${isMoment}" == "y" ]||[ "${isMoment}" == "Y" ]||[ "${isMoment}" == "YES" ]||[ "${isMoment}" == "yes" ]
	then
		reboot
	elif [ "${isMoment}" == "later" ]
	then
		echo "System will reboot after 5min"
		shutdown -h +5
	else
		echo "Yout must reboot later"
	fi
else
   echo "please access the catalogue for ../environment/bin "
fi
