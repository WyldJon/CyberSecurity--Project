#!/bin/bash


mkdir -p /var/backup
tar cvvWf /var/backup/home.tar /home
mv /var/backup/home.tar /var/backup/home.08262021.tar
ls -lh /var/backup >> /var/backup/file_report.txt
free -h >> /var/backup/disk_report.txt
