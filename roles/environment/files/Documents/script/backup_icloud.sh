#!/bin/bash
PATH=/usr/local/bin:/usr/bin:/bin

mkdir -p $HOME/Documents/resource/icloud/
rsync -a $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/ $HOME/Documents/resource/icloud/backup --exclude ".git"
cd $HOME/Documents/resource/icloud/backup
git init && git add -A && git commit -m "update"
