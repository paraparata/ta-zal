#!/bin/bash
#automate ns-3 to running scripts in priodes. by @paraparataaa

dirHasil=./ta-zal/hasil
locScript=scratch/mc-twoenbs
hasil=*.txt

if [ ! -d "$dirHasil" ];then
	mkdir $dirHasil
fi

# Function 1: update script dari git dan jalankan program
cond_1 () {
	if [ -f "$hasil" ];then
	mv $hasil ./ta-zal/hasil/$hasil
	fi
	cd './ta-zal/'
	./git pull origin
	cp ./mc-twoenbs.cc ../scratch/
	cd '..'
	./waf --run $locScript
}

# Function 2: cuma untuk jalanin program
cond_2 () {
	./waf --run $locScript
}

# Main
case "$1" in
	uprun)
		cond_1
		;;
	run)
		cond_2
		;;
	*)
		echo $"Usage: $0 {uprun|run}"
		exit
esac
