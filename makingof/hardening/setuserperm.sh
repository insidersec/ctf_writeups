#!/bin/bash


for i in $(cat /etc/passwd | grep cyber | cut -d ":" -f1 )
do
        echo $i
        cp /home/admin/custombashrc /home/$i/.bashrc
        cd /home/$i
        chown root:$i .bash* .profile .viminfo
        chown root:$i /home/$i
        chmod 050 .bash* .profile .viminfo
        chmod 050 /home/$i
done