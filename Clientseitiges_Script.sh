#!bin/bash
ziel="/home/backup/tmp/$(date +%Y-%m-%d)"
filename="backupclient1.tar.gz"
tar -czvf $filename /home/thel/Documents /home/thel/Pictures
ssh backup@192.168.80.131 mkdir -p $ziel
rsync -av -e ssh $filename backup@192.168.80.131:$ziel