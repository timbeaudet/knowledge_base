# Linode Server Setup

> The following script was essentially replaced by `rally_of_rockets/server/create_game_server.sh` by (tsjost).

```
Create a Ubuntu 16.04 (or other) server.
Click BOOT
	`ssh ...` to the server (root@ipaddress ... found on Remote Access tab)
	`adduser <username>`
	`su - timbeaudet` (to change into user)
	`exit` (or CTRL+D) (to change back to root)
From root run the following
	`apt update`
	`apt install sudo`
	`visudo`
Scroll down to ensure %sudo ALL(=ALL) ALL is not commented with #
Exit vi thing
	`usermod --help`
	`usermod --append --groups sudo <username>`
	`groups <username>` should show sudo
	`sudo apt install screen`
Use Deploy script in rally_of_rockets/build/deploy.sh to upload to server.
```

**On Linux VM** _(or where `create_game_server.sh` ran)_  
`ssh <linode-server-ip>`
`passwd` to set the password.

**On Windows bash terminal** (or where desired)_  
`ssh-copy-id <SERVER_IP>`  
`ssh <SERVER_IP>`

**FOR DEBUGGING THE GAME FROM SERVER**  
`sudo apt-get install gdb`  
`gdb ./rally_of_rockets`  
`(gdb) set env LD_LIBRARY_PATH=.`  
`(gdb) handle SIGPIPE nostop`  
`(gdb) run --disable-gui`  
`(gdb) bt` 

for a callstack / backtrace.
