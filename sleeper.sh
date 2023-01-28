#!/bin/bash

function del() {
echo 'kali' | sudo -S shred /var/log/auth.log
cd /home/kali/
sleep 5
echo 'kali' | sudo -S rm -d -r Checker Sleep

exit
}
del
