#!/bin/bash
/usr/bin/rsync -a $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/ $HOME/Documents/resource/icloud/backup --exclude ".git"
cd $HOME/Documents/resource/icloud/backup
/usr/local/bin/git add -A && /usr/local/bin/git commit -m "update"
