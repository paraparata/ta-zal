#!/bin/bash
#automate ns-3 to running scripts in priodes. by @paraparataaa

dirHasil=./ta-zal/hasil
locScript=scratch/mc-twoenbs
hasil=*.txt
tcp="TcpNewReno"

if [ ! -d "$dirHasil" ];then
	mkdir $dirHasil
fi

# Function 1: update script dari git dan jalankan program
cond_1 () {
	cd './ta-zal/'
	cp ./mc-twoenbs.cc ../scratch/
	cd '..'
	./waf --run "$locScript --protocol=\'$tcp\'"
}

# Function 2: cuma untuk jalanin program
cond_2 () {
	./waf --run $locScript
}

# Function 3: update git
cond_3 () {
	git pull origin
}

# Main
case "$1" in
	mvrun)
		cond_1
		;;
	run)
		cond_2
		;;
	update)
		cond_3
		;;
	*)
		echo $"Usage: $0 {mvrun|run|update} {newreno|cubic}"
		echo $" "
		exit
esac

case "$2" in
	newreno)
		tcp="TcpNewReno"
		mv $hasil ./ta-zal/hasil/newreno/
		;;
	cubic)
		tcp="TcpCubic"
		mv $hasil ./ta-zal/hasil/cubic/
		;;
esac
