#!/bin/bash
#This bash script made for looping task command. by: @paraparata

c="upinipn"
n=1

case "$1" in
	-h)
		echo "Command to looping  :	Write down the command to loop"
		echo "Looping for how long:	How long the command will be looping"
		;;
	*)
		echo "Command to looping?"
		read c
		echo "Looping for how long?"
		read n
		
		for i in {1..$n}
		do
		   $c
		done
		;;
esac
