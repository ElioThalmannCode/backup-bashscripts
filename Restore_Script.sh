#!/bin/bash
# Elio Thalmann
# Modul 143
# Restore Script
rsync -av $1 root@$2:/var/backup
ssh root@$2 tar -xf /var/backup/$3