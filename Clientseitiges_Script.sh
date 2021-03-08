#!bin/bash
ziel="/home/thel/tmp/$(date +%Y-%m-%d)"
filename="$(date +%Y-%m-%d)_backupclient1.tar.gz"
tar -czvf $filename /home/thel/Documents /home/thel/Pictures
ssh backup@192.168.80.131 mkdir -p $ziel
rsync -av -e ssh $filename thel@192.168.80.131:$ziel