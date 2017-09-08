#!/bin/sh

echo -e "\nTo make tomcat start more quickly, then modify the file of java.security"

isReplaceChar="s/securerandom.source=file:\/dev\/random"
afterReplacedChar="securerandom.source=file:\/dev\/.\/urandom"
sed -i "${isReplaceChar}/${afterReplacedChar}/g" ../java/jdk*/jre/lib/security/java.security
