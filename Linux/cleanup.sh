#1/bin/bash

#Removes all files in the tmp folder
rm -fr /tmp/*

#Removes all files in the var/tmp folder
rm -fr /var/tmp/*

#Clears the apt cache
apt clean

#Clears thumbnails cache
rm -fr ~/.cache/thumbnails
