#!/bin/bash

function del() {

cd /home/kali/
sleep 5
echo 'kali' | sudo -S rm -d -r slogger.sh sleeper.sh	
}
del
