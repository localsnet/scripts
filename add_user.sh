#!/bin/env bash
#Create user, add to dev group, copy public key
username=
key=
adduser -m --group devs $username
gpasswd -a $username docker
mkdir /home/$username/.ssh
echo $key >> /home/$username/.ssh/authorized_keys
chown -R $username:$username /home/$username/.ssh
chmod 700 /home/$username/.ssh
chmod 600 /home/$username/.ssh/authorized_keys

