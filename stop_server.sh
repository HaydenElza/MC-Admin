#!/bin/bash

# Load config
if [ -f server.config ]; then
	source server.config
else
	echo "Missing 'server.config'."
	exit 1
fi

# Define function to send commands to server running in screen
to_screen()
{
	screen -S $SCREENNAME -p 0 -X stuff "$1^M"
}

# Stop server
{
	echo "Stopping server..."
	to_screen "stop"
	sleep 5s
	echo "Server appears to have stopped successfully."
	to_screen "exit"
	echo "Exited from screen."
}||{
	echo "ERROR: Could not stop server. Not sure what happened."
	exit 1
}