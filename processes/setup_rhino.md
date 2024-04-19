

# Setting up rhino for general use

1. Download Ubuntu 22.04 iso, and install on USB jump-drive with rufus
2. Plug jump-drive in, setup bios to boot from it and install Ubuntu 22.04

First issue, ssh is now disabled in Ubuntu 22.04, so enable it with

```
sudo apt install ssh
sudo systemctl enable sshd && sudo systemctl start ssh
```

### Setup RAID for the Storage Drives

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




## Things to still do

Things to do (everything) _and while doing so, keep these notes up to date_.

- Setup storage drives
  - Partition the drives: 2 TB for shelter, the rest for media
  - Mirror (Raid 1) the drives for some level of redundancy
- Setup sshkey stuff so `ssh rhino` does not require any password stuffs.
- Setup rhino to automatically wake and startup with power (auto power on).
- Update the linux setup script (last run in like 2014ish with hippo build)
  - Get hippo setup to build some projects
  - sendmail setup (for nightly mails) can be [found here](https://github.com/timbeaudet/knowledge_base/blob/main/platforms/linux.md)
- Ensure SAMBA is setup so that both Windows 10 (moose / falcon) can access as well as WDTV should have access to rhino
  - This will require smbv1, find the samba config from hippo - it was picky as hell to setup
  - May even be something with `server min protocol = NT1` but the hippo config should help
- Get a nightly build or two running.
- emscripten for webgl builds
- jekyll and/or hugo, whichever stuff is used for latest site developments
- crossmac compiling macos stuff (handy, not required)
- Windows VM for building msvc nightlies from rhino (handy, not required) [some info](https://dev.to/pwd9000/create-a-docker-based-self-hosted-github-runner-windows-container-3p7e)

Once everything is starting to come together:
- Copy data from hippo over to rhino
- Begin using rhino as the primary, keeping hippo around until confident
