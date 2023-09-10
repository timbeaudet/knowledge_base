# Setting up the Linux File Share Server:

**Install Ubuntu 18.04**  
> Note: `a_first_setup.sh` may have been run already and installed something used for the server.

```
sudo apt install openssh-server openssh-client
sudo apt install samba
sudo apt install vim
sudo apt install net-tools
```

## Setup samba to share files:
[Ubuntu HowTo](https://help.ubuntu.com/community/How%20to%20Create%20a%20Network%20Share%20Via%20Samba%20Via%20CLI%20%28Command-line%20interface/Linux%20Terminal%29%20-%20Uncomplicated%2C%20Simple%20and%20Brief%20Way%21)

```
sudo smbpasswd -a <username>
mkdir /home/<username>/<folder_name> #share location.
sudo vim /etc/samba/smb.conf
```

Use: [/etc/samba/smb.conf](https://github.com/timbeaudet/knowledge_base/blob/main/processes/linux_file_share.md)

> NOTE: Ensure that `[<share_name>]` area does not contain an item `valid users = ` initially I found a source claiming that opened up for any user, but it seemed to be the cause for an inaccessible share.

## Creating a New disk and copying from an old disk:
> Note: here we had old(1.8tb), new1(5.4tb) and new2(1.9tb) and are placing data from old into new2.

**Setup the disk using cfdisk follow instructions:**
```
sudo cfdisk /dev/sdx

mkdir /mnt/{old,new1,new2}
mount /dev/md126p1 /mnt/old
mount /dev/sda1 /mnt/new1
mount /dev/sda2 /mnt/new2
chown timbeaudet:timbeaudet /mnt/new1/
chown timbeaudet:timbeaudet /mnt/new2/
rsync -avhiP /mnt/old/ /mnt/new2/
```

> When you forget to chown before, or wind up using sudo rsync, use to reset (-R important for files / recursively)
`chown -R <username>:<username> /mnt/new2/`

To setup the mounts automatically...
[check here](https://askubuntu.com/questions/164926/how-to-make-partitions-mount-at-startup/165462#165462)

### Add `~/development/tools` to path:
`vim ~/.profile`
Add `export PATH=$PATH:/development/tools/linux` to the file.
