#!/bin/bash
cpwd=${PWD##*/}
rm -f www
docker-compose down
docker-compose up &
ln -s /var/lib/docker/volumes/${cpwd}_www/_data www
