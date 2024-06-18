

# Setting up rhino for general use

1. Download Ubuntu 22.04 iso, and install on USB jump-drive with rufus
2. Plug jump-drive in, setup bios to boot from it and install Ubuntu 22.04
3. Setup bios to boot from the real drive
4. While in bios setup the automatic wake/startup on power (auto power on).

First issue, ssh is now disabled in Ubuntu 22.04, so enable it with

```
sudo apt install ssh
sudo systemctl enable sshd && sudo systemctl start ssh
```

## Setup RAID for the Storage Drives

**Warning: Will take HOURS (10+) with large drives...**  
I was following [this article](https://www.linuxbabe.com/linux-server/linux-software-raid-1-setup) through these steps, which seems slightly out of date or something.

1. Use `sudo fdisk -l` to get the list of disks and find the storage drives. (for rhino sda and sdb were the storage drives)
2. Run the following which will wipe all data and partitions from the storage drives. Make sure they are backed up or empty already...
```
sudo parted /dev/sda mklabel gpt
sudo parted /dev/sdb mklabel gpt
```

(after doing this I saw `Information: You may need to update /etc/fstab.` which ... idk what that means.)

3. Run `sudo fdisk /dev/sda` to actually create the partitions, no changes until the write at the end.
    - Type `n` at the prompt for New Partition
    - Type `1` to give it partition id 1, aka `/dev/sda1`
    - Press enter to choose default first and last sectors, use the whole drive.
    - Using `p` will print out the information, and we need to verify the partition type to be Linux raid autodetect (or in my case Linux RAID)
    - To do that I had to use `t` and `29` but check through that list for what makes sense.
    - Double check with `p` again
    - Finally write with `w` and perform all of this again for `/dev/sdb` or the other storage drives.

4. Install mdadm (Linux software raid) with `sudo apt install mdadm`
5. Check that mdadm sees the drives/partions:
    - `sudo mdadm --examine /dev/sda /dev/sdb`
    - `sudo mdadm --examine /dev/sda1 /dev/sdb1`
6. Create the raid mirror: `sudo mdadm --create /dev/md0 --level=mirror --raid-devices=2 /dev/sda1 /dev/sdb1` which is named md0
    - y to create, and if we see `Device or resource busy` we may need to reboot...
    - This will take a WHOLE lot of time (estimated ~10 hours on rhino)
    - Use `cat /proc/mdstat` to check the progress.
7. After waiting forever until that finished, confirm it worked with:
    - `sudo mdadm --detail /dev/md0` to ensure Raid level: is set to raid1 and State is clean
    - `sudo mdadm --examine /dev/sda1 /dev/sdb1` to ensure each has Raid level: raid1 and Raid devices 2.
8. Install the FileSystem
    ```
    sudo mkfs.ext4 /dev/md0
    sudo mkdir /mnt/raid1
    sudo mount /dev/md0 /mnt/raid1
    ```

### Optional: Test the Raid Setup
This seems to require removing the drive, which, I didn't do it on rhino. YOLO.


## Setup SSH Key stuff... 
From `moose`, just needed to `ssh-copy-id rhino` and type password. Done. If there were issues or moose needed more setup [checkout this.](https://github.com/timbeaudet/knowledge_base/blob/main/processes/sshkey_auto_login.md)
I think I got that working through git-bash, but to get working in PowerShell too I had to `ssh hippo` and `cat .ssh/authorized_keys` copy that output and paste into the same place on rhino; `ssh rhino` and `vim .ssh/authorized_keys`

## Setup of SAMBA Share

Much of this was just copied from Hippo, however I did have to add `server min protocol = NT1` to the [global] settings for the WDTV to connect. I didn't really use this [website source](https://help.ubuntu.com/community/How%20to%20Create%20a%20Network%20Share%20Via%20Samba%20Via%20CLI%20%28Command-line%20interface/Linux%20Terminal%29%20-%20Uncomplicated%2C%20Simple%20and%20Brief%20Way%21), but keeping it around in case. Make sure to replace any <user_name> with desired username, typically: `timbeaudet` and likely good idea to set same password as user account. Also replace <folder_name> with the desired path/folder name to share, likely: shelter
```
    sudo apt-get install samba
    sudo smbpasswd -a <user_name>
    mkdir /home/<user_name>/<folder_name>
    sudo cp /etc/samba/smb.conf ~

    # Edit the samba configuration file:
    sudo vim /etc/samba/smb.conf
```

I manually scanned and copied contents from hippo into rhino, but the following was in the old notes:

```
    # Add the following to the very bottom, swap <user_name> and <folder_name> as needed:
    # May also need to find the user group and change to desired, default is WORKGROUP

    [<folder_name>]
    path = /home/<user_name>/<folder_name>
    valid users = <user_name>
    read only = no
```

and after making any changes, restart with:
```
    # Finally restart samba service, and test if it worked:
    testparm
    sudo service smbd restart    
```








## Things to still do

Things to do (everything) _and while doing so, keep these notes up to date_.

- Any build & distribute script will need to swap hippo for rhino
  - This script copies the build over to development/game_builds/... and that needs to go to rhino
- Setup the twitch alert monitor script/cronjob & connect with all things
- Update the linux setup script (last run in like 2014ish with hippo build)
  - Get hippo setup to build some projects
  - sendmail setup (for nightly mails) can be [found here](https://github.com/timbeaudet/knowledge_base/blob/main/platforms/linux.md)
- Get a nightly build or two running.
- emscripten for webgl builds
- jekyll and/or hugo, whichever stuff is used for latest site developments
- crossmac compiling macos stuff (handy, not required)
- Windows VM for building msvc nightlies from rhino (handy, not required) [some info](https://dev.to/pwd9000/create-a-docker-based-self-hosted-github-runner-windows-container-3p7e)


Once everything is starting to come together:
- Copy data from hippo over to rhino
- Begin using rhino as the primary, keeping hippo around until confident



## Copying the Data from Hippo to Rhino

From inside `shelter` on rhino run the following.

`rsync -aivPz timbeaudet@hippo:/mnt/shelter/shelter/backup_cheetah ./`

Having a trailing slash `shelter/backup_cheetah/` will cause it to copy the contents without the directory, as in no backup_cheetah directory will be created on rhino.

