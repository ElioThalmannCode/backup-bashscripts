#!/bin/bash
# Elio Thalmann
# Modul 143
# Restore Script
rsync -e ssh -av $1 root@$2:/var/backup
ssh root@$2 -t "cd /; bash --login"
ssh root@$2 tar -xf /var/backup/$3