#!/bin/sh

echo -e "\nTo make the tomcat boot more quickly, tbis shell will modify the file of java.security"

isReplaceChar="s/securerandom.source=file:\/dev\/random"
afterReplacedChar="securerandom.source=file:\/dev\/.\/urandom"
sed -i "${isReplaceChar}/${afterReplacedChar}/g" ../java/jdk*/jre/lib/security/java.security

echo -e "modify java.security finally"
