#!/bin/bash

echo "===================================================================================="
echo-e "start to configure the environment of jdk\nwaitting..."

if [ ! -d ../java/jdk* ]
then
	mkdir -p ../java
	tar -zxf ../jdk*.tar.gz -C ../java
fi

cd ../java/jdk*
jdkEnvironment=$(pwd)
cd ../../bin

abc=$(grep '#Java Environment configuration' /etc/profile)
if [ -n  "${abc}" ]||[ "${JAVA_HOME}" != "" ]
then
	echo "The environment of jdk have configured"
else
	sed -i "\$a \\\n\n#Java Environment configuration\
	\nexport JAVA_HOME=${jdkEnvironment}\
	\nexport CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar\
	\nexport PATH=\$PATH:\$JAVA_HOME/bin" /etc/profile
	
	source /etc/profile
fi


java -version
if [ ! $? -eq 0 ]
then
	echo "Your system need to reboot ,which make the environment being available!"
fi