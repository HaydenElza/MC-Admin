#Minecraft Server Administration
This is a small collection of scripts and tools I used to manage a small minecraft server.

Learn more about server at: [myrkviðr.com](http://xn--myrkvir-1za.com)

###Backup
This bash script can be used to backup a server that is not currently running. The default backup location is   `~/.minecraftbackups` though this can be changed in the variables. To run script:
```
$ bash backup.sh
```


###Live Backup
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
