#!/bin/bash

# Set variables
DIRECTORY=/home/$(whoami)/.minecraftbackups/  # Directory to backup to
VERSION=1.8.5  # Minecraft version number

# Check that backup location exists
if [ ! -d "$DIRECTORY" ]; then
	mkdir $DIRECTORY
fi

# Define function to send commands to server running in screen
to_screen()
{
	screen -S minecraft -p 0 -X stuff "$1^M"
}

# Count down sequence with stop command issued at end
to_screen "say Server is scheduled for restart in 5 minutes."
sleep 4m
to_screen "say 60s to scheduled restart."
sleep 30s
to_screen "say 30s to scheduled restart."
sleep 20s
to_screen "say 10"
sleep 1s
to_screen "say 9"
sleep 1s
to_screen "say 8"
sleep 1s
to_screen "say 7"
sleep 1s
to_screen "say 6"
sleep 1s
to_screen "say 5"
sleep 1s
to_screen "say 4"
sleep 1s
to_screen "say 3"
sleep 1s
to_screen "say 2"
sleep 1s
to_screen "say 1"
sleep 1s
to_screen "stop"

# Backup .minecraft directory
OF=/home/$(whoami)/.minecraftbackups/$(date +%F).tar.gz

echo "Backing up the .minecraft folder to $OF" 

tar -czvf $OF -C /home/$(whoami)/.minecraft/ .

if [ -a $OF ]; then
	echo "Backup successful!"
else
	echo "Something went wrong."
fi

# Start server back up
to_screen "java -Xmx2048M -Xms2048M -jar minecraft_server.$VERSION.jar nogui"