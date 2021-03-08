#!bin/bash
# Elio Thalmann
# Modul 143
# Clientseitiges Script

# definiert Ziel auf Backupserver
ziel="/home/thel/tmp/$(date +%Y-%m-%d)"
# definiert den Namen des Backups
filename="$(date +%Y-%m-%d)_backupclient1.tar.gz"
# Klebt Dateien zusammen und komprimiert sie.
tar -czvf $filename /home/thel/Documents /home/thel/Pictures # <---- Hier kann man die Daten auswählen
# Erstellt einen Ordner mit dem aktuellen Datum
ssh backup@192.168.80.131 mkdir -p $ziel
# Kopiert das tar.gz Archiv mit einer sicheren SSH Verbindung auf den Backupserver
rsync -av -e ssh $filename thel@192.168.80.131:$ziel