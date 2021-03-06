#!/bin/bash
# Elio Thalmann
# Modul 143
# Serverseitiges Script
#
# t=Täglich Inkrementell
# w=Wöchentlich Differenziell
# m=Monatlich Vollsicherung
# j=Jahr Vollsicherung
$1
$2
ziel="/home/thel/tmp/$(date +%Y-%m-%d)"
# Führt das Script auf dem Computer backupclient1 aus
ssh root@192.168.80.132 bash /var/backup/Clientseitiges_Script_Client_1.sh # Zieht die Dateien von dem 1.Client auf den Server im Verzeichnis "/home/backup/tmp/{aktuelles_datum}/{aktuelles_datum}backupclient1.tar.gz"
# Führt das Script auf dem Computer backupclient2 aus
ssh root@192.168.80.135 bash /var/backup/Clientseitiges_Script_Client_2.sh # Zieht die Dateien von dem 2.Client auf den Server im Verzeichnis "/home/backup/tmp/{aktuelles_datum}/{aktuelles_datum}backupclient2.tar.gz"

if [ $1 == "t" ]; then
    echo 'Tägliche Sicherung wird gestartet'
    # Erstellt den Ordner wo das Backup erstellt wird.
    mkdir -p /home/thel/backup/client1/tag/$(date +%Y-%m-%d)
    # Erstellt den Ordner wo das Backup erstellt wird.
    mkdir -p /home/thel/backup/client2/tag/$(date +%Y-%m-%d)
    # Holt die Daten aus dem temporären Ordner und tut ihn in den Backupordner
    rsync -av "$ziel/$(date +%Y-%m-%d)_backupclient1.tar.gz" /home/thel/backup/client1/tag/$(date +%Y-%m-%d) --link-dest=/home/thel/backup/client1/$2
    # Holt die Daten aus dem temporären Ordner und tut ihn in den Backupordner
    rsync -av "$ziel/$(date +%Y-%m-%d)_backupclient2.tar.gz" /home/thel/backup/client2/tag/$(date +%Y-%m-%d) --link-dest=/home/thel/backup/client2/$2
elif [ $1 == "w" ]; then
    echo 'Wöchentliche Sicherung wird gestartet'
    # Erstellt den Ordner wo das Backup erstellt wird.
    mkdir -p /home/thel/backup/client1/woche/$(date +%Y-%m-%d)
    # Erstellt den Ordner wo das Backup erstellt wird.
    mkdir -p /home/thel/backup/client2/woche/$(date +%Y-%m-%d)
    # Holt die Daten aus dem temporären Ordner und tut ihn in den Backupordner
    rsync -av "$ziel/$(date +%Y-%m-%d)_backupclient1.tar.gz" /home/thel/backup/client1/woche/$(date +%Y-%m-%d) --link-dest=/home/thel/backup/client1/$2
    # Holt die Daten aus dem temporären Ordner und tut ihn in den Backupordner
    rsync -av "$ziel/$(date +%Y-%m-%d)_backupclient2.tar.gz" /home/thel/backup/client2/woche/ $(date +%Y-%m-%d)--link-dest=/home/thel/backup/client2/$2
elif [ $1 == "m" ]; then
    echo 'Monatliche Sicherung wird gestartet'
    # Erstellt den Ordner wo das Backup erstellt wird.
    mkdir -p /home/thel/backup/client1/monat/$(date +%Y-%m-%d)
    # Erstellt den Ordner wo das Backup erstellt wird.
    mkdir -p /home/thel/backup/client2/monat/$(date +%Y-%m-%d)
    # Holt die Daten aus dem temporären Ordner und tut ihn in den Backupordner
    rsync -av "$ziel/$(date +%Y-%m-%d)_backupclient1.tar.gz" /home/thel/backup/client1/monat/$(date +%Y-%m-%d)
    # Holt die Daten aus dem temporären Ordner und tut ihn in den Backupordner
    rsync -av "$ziel/$(date +%Y-%m-%d)_backupclient2.tar.gz" /home/thel/backup/client2/monat/$(date +%Y-%m-%d)
elif [ $1 == "j" ]; then
    echo 'Jährliche Sicherung wird gestartet'
    # Erstellt den Ordner wo das Backup erstellt wird.
    mkdir -p /home/thel/backup/client1/jahr/$(date +%Y-%m-%d)
    # Erstellt den Ordner wo das Backup erstellt wird.
    mkdir -p /home/thel/backup/client2/jahr/$(date +%Y-%m-%d)
    # Holt die Daten aus dem temporären Ordner und tut ihn in den Backupordner
    rsync -av "$ziel/$(date +%Y-%m-%d)_backupclient1.tar.gz" /home/thel/backup/client1/jahr/$(date +%Y-%m-%d)
    # Holt die Daten aus dem temporären Ordner und tut ihn in den Backupordner
    rsync -av "$ziel/$(date +%Y-%m-%d)_backupclient2.tar.gz" /home/thel/backup/client2/jahr/$(date +%Y-%m-%d)
else
  echo 'fehlerhafte Eingabe'
fi
# Löscht den temporären Ordner
rm -r /home/thel/tmp/$(date +%Y-%m-%d)