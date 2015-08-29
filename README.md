# Minecraft Server Administration
This is a small collection of scripts I use to manage a small vanilla minecraft server.

Learn more about server at: [myrkviðr.com](http://xn--myrkvir-1za.com)

#### Requirements
Linux (tested on [Ubuntu 14.04](http://releases.ubuntu.com/14.04/) and [Arch Linux](https://www.archlinux.org/))
[screen](https://en.wikipedia.org/wiki/GNU_Screen)

#### Config
All configuration is handled by ```server.config```. There you can set the minecraft install directory, backup directory, version number, memory usage, and name of screen session.

---

### Start Server (and Install if applicable)
Use the following command to start your minecraft server:
```
$ bash start_server.sh
```
If the server has not been install yet, this script will download and install the specified minecraft version.

### Live Backup
This can be used to issue a backup while the server is running. It issues a warning to players at 5 minutes, 60 secondns, and 30 seconds before restart as well as a countdown from 10 seconds. After backing up, the server restarts. There are variables for backup directory, Minecraft version, and memory to run the server with. Again the default backup location is `~/.minecraftbackups`. To initiate live backup run:
```
$ bash live_backup.sh
```
I suggest adding it to crontab for daily backups. To do this, start by opening crontab editor:
```
env EDITOR=nano crontab -e
```
Then append the following line:
```
00 00 * * * bash /path/to/script/live_backup.sh
```
This should backup the server at midnight every day while still warning players so they know what to expect.

### Stop Server
Stop the server using:
```
$ bash stop_server.sh
```

### Warp/Teleportation Book
This a json code bit that can be placed in a command block to give a player a warp book. This gives the player the ability to run commands simply by clicking on text in a book. Running commands directly from the book can only be done if the player has permission to run the command normally, i.e., is an operator. Though if you would like non-op players to be able to run commands you can use the ```/trigger``` command. I explain how to do that in a [blog post](http://elza.me/blog/2015/06/Minecraft-Teleport/).

### Backup ```depreciated```
This bash script can be used to backup a server that is not currently running. The default backup location is   `~/.minecraftbackups` though this can be changed in the variables. To run script:
```
$ bash backup.sh
```
