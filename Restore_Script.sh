#!/bin/bash
# Elio Thalmann
# Modul 143
# Restore Script
rsync -av /home/thel/backup/$1 root@$2:/var/backup
ssh root@$2 tar -xf /home/thel/backup/$1