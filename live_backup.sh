#!/bin/bash

# Load config
if [ -f server.config ]; then
	source server.config
else
	echo "Missing 'server.config'."
	exit 1
fi

# Check that backup location exists
if [ ! -d "$BACKUP_DIR" ]; then
	mkdir $BACKUP_DIR
fi

# Define function to send commands to server running in screen
to_screen()
{
	screen -S $SCREENNAME -p 0 -X stuff "$1^M"
}

# Count down sequence with stop command issued at end
to_screen "say Server is scheduled for restart in 5 minutes."
sleep 4m
to_screen "say 60s to scheduled restart."
sleep 30s
to_screen "say 30s to scheduled restart."
sleep 20s
to_screen "say 10s to scheduled restart."
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
sleep 3s

# Backup .minecraft directory
OF=$BACKUP_DIR$(date +%F).tar.gz

echo "Backing up the .minecraft folder to $OF" 

tar -czvf $OF -C $DIRECTORY .

if [ -f $OF ]; then
	echo "Backup successful!"
else
	echo "Something went wrong."
fi

# Start server back up
to_screen "java -Xmx$MEM -Xms$MEM -jar minecraft_server.$VERSION.jar nogui"