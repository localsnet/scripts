#!/usr/bin/env bash
#Author localsnet
# Script with required pattern get container names and make images based on ones
#Get containers names
container_names="$(docker ps | awk '{print $NF}' | grep -v "NAMES" | grep "$1")"

#echo "$container_names" #To check required containers uncomment this line and comment loop
#Make images
for cont in "$container_names"
do 
  docker commit "$cont" "$cont":"$2"
done




