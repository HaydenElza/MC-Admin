# Minecraft Server Administration
This is a small collection of scripts and tools I used to manage a small minecraft server.

Learn more about server at: [myrkviðr.com](http://xn--myrkvir-1za.com)

### Backup
This bash script can be used to backup a server that is not currently running. The default backup location is   `~/.minecraftbackups` though this can be changed in the variables. To run script:
```
$ bash backup.sh
```

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


### Warp/Teleportation Book
This a json code bit that can be placed in a command block to give a player a warp book. This gives the player the ability to run commands simply by clicking on text in a book. Running commands directly from the book can only be done if the player has permission to run the command normally, i.e., is an operator. Though if you would like non-op players to be able to run commands you can use the ```/trigger``` command. I explain how to do that in a [blog post](http://elza.me/blog/2015/06/Minecraft-Teleport/).
