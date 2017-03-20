#!/usr/bin/env bash
FILE=hosts.ini
cat $FILE | grep ansible_host|\
while read line;
do
	echo $line | sed 's/\ /\n/g' | {\
	read host;
	#echo "FOR HOST $host"
	ansible_port=22
	ansible_user=$USER
	while read paramwithvalue;
	do
		key=$(echo $paramwithvalue|awk -F '=' '{print $1}')
		value=$(echo $paramwithvalue|awk -F '=' '{print $2}')
		#echo "$key with $value"
		if [ "$key" == "ansible_host" ] ; then
			ansible_host=$value
		elif [ "$key" == "ansible_port" ] ; then
			ansible_port=$value
		elif [ "$key" == "ansible_user" ] ; then
			ansible_user=$value
		fi;
	done;
	if [ "$ansible_host" ] ; then
		ssh-copy-id -p$ansible_port $ansible_user@$ansible_host
	fi;
	}
done;
