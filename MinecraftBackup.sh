#!/bin/bash

DIRECTORY=/home/$(whoami)/.minecraftbackups/

if [ ! -d "$DIRECTORY" ]; then
	mkdir $DIRECTORY
fi

OF=/home/$(whoami)/.minecraftbackups/$(date +%F).tar.gz

echo "Backing up the .minecraft folder to $OF" 

tar -czvf $OF -C /home/$(whoami)/.minecraft/ .

if [ -a $OF ]; then
	echo "Backup successful!"
else
	echo "Something went wrong."
fi
