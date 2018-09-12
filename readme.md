# Knowledge Base

> This repository contains notes, tips, tricks and issues with various software, tools and processes used in Tim Beaudet's Indie Adventure. Be warned, the contents within are a bit messy, many items are specific to Tim's setup and/or usage, some may contain incomplete knowledge, but on the offchance it is useful, great.

### Software
- [Audacity](https://github.com/timbeaudet/knowledge_base/blob/master/software/audacity.md)
- [Blender](https://github.com/timbeaudet/knowledge_base/blob/master/software/blender.md)
- [Adobe Illustrator](https://github.com/timbeaudet/knowledge_base/blob/master/software/adobe_illustrator.md)
- [Adobe Photoshop](https://github.com/timbeaudet/knowledge_base/blob/master/software/adobe_photoshop.md)
- [Adobe Premiere](https://github.com/timbeaudet/knowledge_base/blob/master/software/adobe_premiere.md)
- [Git](https://github.com/timbeaudet/knowledge_base/blob/master/software/git.md)
- [Github](https://github.com/timbeaudet/knowledge_base/blob/master/software/github.md)
- [Visual Studio Code](https://github.com/timbeaudet/knowledge_base/blob/master/software/visual_studio_code.md)
- [Visual Studio](https://github.com/timbeaudet/knowledge_base/blob/master/software/visual_studio.md)

### Platforms
- [Windows](https://github.com/timbeaudet/knowledge_base/blob/master/platforms/windows.md)
- [Linux](https://github.com/timbeaudet/knowledge_base/blob/master/platforms/linux.md)
- [macOS](https://github.com/timbeaudet/knowledge_base/blob/master/platforms/macos.md)

### Processes
- [Restart Gitea](https://github.com/timbeaudet/knowledge_base/blob/master/processes/restart_gitea.md)
- [Start Linode Server](https://github.com/timbeaudet/knowledge_base/blob/master/processes/setup_linode.md)



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
`chown -R <username>:<username> /mnt/new2/`

To setup the mounts automatically...
[check here](https://askubuntu.com/questions/164926/how-to-make-partitions-mount-at-startup/165462#165462)
	
	
