#!/bin/bash

echo "===================================================================================="
echo "start to configure the environment of Tomcat"

tomcatEnvironment=""

if [ ! -d ../tomcat* ]
then
	cd ..
	temp=$(find -name "*tomcat*")
	temp1=$((${#temp}-7-9))
	echo $temp1
	temp2=${temp:9:$temp1}
	#apache-tomcat-8.5.16.tar.gz
	mv *tomcat* lalala.tar.gz
	tar -zxvf lalala.tar.gz -C .
	mv apache-tomcat-* $temp2
	mv lalala.tar.gz $temp
	cd bin
fi

cd ../tomcat*
tomcatEnvironment=$(pwd)
cd ../bin

abc=$(grep '#Tomcat Environment configuration' /etc/profile)
if [ -n  "${abc}" ]||[ "${CATALINA_HOME}" != "" ]
then
	echo "The environment of jdk have configured"
else
	sed -i "\$a \\\n\n#Tomcat Environment configuration\
	\nexport CATALINA_BASE=${tomcatEnvironment}\
	\nexport CATALINA_HOME=\$CATALINA_BASE\
	\nexport PATH=\$PATH:\$CATALINA_HOME/bin" /etc/profile
	
	source /etc/profile
fi

sh catalina.sh version
if [ ! $? -eq 0 ]
then
	echo "Your system need to reboot ,which make the environment being available!"
fi
