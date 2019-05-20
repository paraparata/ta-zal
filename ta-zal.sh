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
	git pull origin
	cd './ta-zal/'
	cp ./mc-twoenbs.cc ../scratch/
	cd '..'
}

# Function 2: cuma untuk jalanin program
cond_2 () {
	./waf --run "$locScript --protocol=$tcp"
}

# Main
case "$1" in
	update)
		cond_1
		;;
	run)
		case "$2" in
		        newreno)
   	            		tcp="TcpNewReno"
				cond_2
		                mv $hasil ./ta-zal/hasil/newreno/
                		;;
		        cubic)
		                tcp="TcpCubic"
				cond_2
        		        mv $hasil ./ta-zal/hasil/cubic/
                		;;
			esac
		;;
	*)
		echo $"Usage: $0 {update|run} {newreno|cubic}"
		echo $" "
		exit
esac
