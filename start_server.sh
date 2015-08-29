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

# Check that server directory exists, if not create it
if [ ! -d "$DIRECTORY" ]; then
	mkdir $DIRECTORY
	echo "Created $DIRECTORY"
fi

# Check for server jar
if [ ! -f $DIRECTORY/minecraft_server.$VERSION.jar ]; then
	{
		echo -e "Downloading minecraft server version $VERSION...\n"
		wget -O $DIRECTORY/minecraft_server.$VERSION.jar https://s3.amazonaws.com/Minecraft.Download/versions/$VERSION/minecraft_server.$VERSION.jar
		echo "Downloaded minecraft server version $VERSION"
	}||{
		echo "Could not download minecraft version $VERSION. Check that you have entered a valid version."
		exit 1
	}
	# Agree to eula
	echo "Assuming you agree with the eula..."
	java -Xmx$MEM -Xms$MEM -jar $DIRECTORY/minecraft_server.$VERSION.jar nogui > /dev/null
	echo "eula=true" > $DIRECTORY/eula.txt
fi


# Start screen session named "minecraft"
{
	screen -dmS $SCREENNAME
}||{
	echo "ERROR: Could not create screen session."
	exit 1
}

# Start server
{
	to_screen "cd $DIRECTORY"
	to_screen "java -Xmx$MEM -Xms$MEM -jar minecraft_server.$VERSION.jar nogui"
	echo "Server appears to have started successfully. Use 'screen -x $SCREENNAME' to attach to screen and check status."
}||{
	echo "ERROR: Could not start server. Check for missing jar, including version."
	exit 1
}