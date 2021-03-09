#!/bin/bash
# Elio Thalmann
# Modul 143
# Restore Script
rsync -e ssh -av $1 root@$2:/var/backup
ssh root@$2 "cd /; tar -xf /var/backup/$3"

# rsync -e ssh -av /home/thel/backup/client1/jahr/2021-03-08/2021-03-08_backupclient1.tar.gz root@192.168.80.132/var/backup
# ssh root@192.168.80.132 
# cd /
# tar -xf /var/backup/$""