#!/bin/bash
ziel="/home/backup/tmp/$(date +%Y-%m-%d)"
# Führt das Script auf dem Computer backupclient1 aus
ssh root@192.168.80.132 bash /var/backup/backupscript.sh # Zieht die Dateien von dem 1.Client auf den Server im Verzeichnis "/home/backup/tmp/{aktuelles_datum}/{aktuelles_datum}backupclient1.tar.gz"
# Führt das Script auf dem Computer backupclient2 aus
ssh root@192.168.80.133 bash /var/backup/backupscript.sh # Zieht die Dateien von dem 2.Client auf den Server im Verzeichnis "/home/backup/tmp/{aktuelles_datum}/{aktuelles_datum}backupclient2.tar.gz"


rsync "$ziel/backupclient1.tar.gz" /home/backup/backup/client1/tag #--link-dest="/home/backup/backup/client1/tag/vordere_sicherung"

rsync "$ziel/backupclient2.tar.gz" /home/backup/backup/client1/tag #--link-dest="/home/backup/backup/client2/tag/vordere_sicherung"
§