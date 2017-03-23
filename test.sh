#!/usr/bin/env bash
tap=''
if [ "$1" == "--tap" ] || [ "$2" == "--tap" ] ; then
	tap="--tap"
fi;
command="bats $tap ./tests/bash/*.test"
$command
while [ "$1" == "--loop" ] || [ "$2" == "--loop" ]; do
	sleep 3;
	$command;
done;
