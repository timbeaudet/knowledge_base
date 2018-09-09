# Knowledge Base

> This document contains notes that help with tips and tricks of various software used in Tim Beaudet's Indie Adventure. Some of the tips may be specific to Tim's setup and or usage, but if it helps someone else then it was worth sharing!

### Things to search for in this file:
- [Audacity](https://github.com/timbeaudet/knowledge_base/blob/master/software/audacity.md)
- [Blender](https://github.com/timbeaudet/knowledge_base/blob/master/software/blender.md)
- [Adobe Illustrator](https://github.com/timbeaudet/knowledge_base/blob/master/software/adobe_illustrator.md)
- [Adobe Photoshop](https://github.com/timbeaudet/knowledge_base/blob/master/software/adobe_photoshop.md)
- [Adobe Premiere](https://github.com/timbeaudet/knowledge_base/blob/master/software/adobe_premiere.md)
- [Git](https://github.com/timbeaudet/knowledge_base/blob/master/software/git.md)
- [Github](https://github.com/timbeaudet/knowledge_base/blob/master/software/github.md)
- [Visual Studio Code](https://github.com/timbeaudet/knowledge_base/blob/master/software/visual_studio_code.md)
- [Visual Studio](https://github.com/timbeaudet/knowledge_base/blob/master/software/visual_studio.md)

**Platforms**
- [Windows](https://github.com/timbeaudet/knowledge_base/blob/master/platforms/windows.md)
- [Linux](https://github.com/timbeaudet/knowledge_base/blob/master/platforms/linux.md)
- [macOS](https://github.com/timbeaudet/knowledge_base/blob/master/platforms/macos.md)

## Manually Restarting Gitea:
```
ssh to webhost
su - username
./gitea_1.40 &

IF you were an idiot and forgot the & at the end of the last command:
CTRL-Z
bg
```


## Linode Server Setup:
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
  
All the above now happens from rally_of_rockets/server/create_game_server.sh - Thanks tsjost


	FROM Linux VM where (create_game_server.sh ran)
		`passwd` to set the password.
	FROM Windows terminal (or where desired)
		`ssh-copy-id <SERVER_IP>`
		`ssh <SERVER_IP>`
	

	FOR DEBUGGING THE GAME FROM SERVER
		`sudo apt-get install gdb`
		`gdb ./rally_of_rockets`
		`(gdb) set env LD_LIBRARY_PATH=.`
		`(gdb) handle SIGPIPE nostop`
		`(gdb) run --disable-gui`
		`(gdb) bt` for a callstack / backtrace


## How to use Twitter:
	1) Grab them in a few words.
	2) Then tell them what you want them to do.
	3) Make sure generally the tweet offers value to them.
	4) Links should go before the #hashtags

	use hashtags (when they make sense): 
		#earlyaccess #screenshotsaturday #indiegame #indiedev #gamedev

## Places to discuss/promote indie games:
	https://www.reddit.com/r/gamedeals/
	https://www.reddit.com/r/freegames/
	https://www.reddit.com/r/IndieGaming/
	https://www.reddit.com/r/indiegames/
	https://www.reddit.com/r/playmygame/
	https://www.reddit.com/r/IndieDev/


## Setting up the Linux File Share Server:

**Install Ubuntu 18.04**
_Note: More things may have been done already with a "first_setup.sh" Tim has."

sudo apt install openssh-server openssh-client
sudo apt install samba
sudo apt install vim
sudo apt install net-tools

**Setup the samba thing to share files:**
	[Ubuntu HowTo](https://help.ubuntu.com/community/How%20to%20Create%20a%20Network%20Share%20Via%20Samba%20Via%20CLI%20%28Command-line%20interface/Linux%20Terminal%29%20-%20Uncomplicated%2C%20Simple%20and%20Brief%20Way%21)
		
		sudo smbpasswd -a <username>
		mkdir /home/<username>/<folder_name> # Share location.
		
		Fyi you can set default masks in the smb config like: create mask = 0664 (_hoeindoe_)

**Creating a New disk and copying from an old disk:**
	Note: here we had old(1.8tb), new1(5.4tb) and new2(1.9tb)
	and are placing data from old into new2.

**Setup the disk using cfdisk follow instructions:**
		sudo cfdisk /dev/sdx

		mkdir /mnt/{old,new1,new2}
		mount /dev/md126p1 /mnt/old
		mount /dev/sda1 /mnt/new1
		mount /dev/sda2 /mnt/new2
		chown timbeaudet:timbeaudet /mnt/new1/
		chown timbeaudet:timbeaudet /mnt/new2/
		rsync -avhiP /mnt/old/ /mnt/new2/

		
When you forget to chown before, or wind up using sudo rsync, use to reset (-R important for files / recursively)
		chown -R <username>:<username> /mnt/new2/
