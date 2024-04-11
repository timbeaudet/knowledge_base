

# Setting up rhino for general use

1. Download Ubuntu 22.04 iso, and install on USB jump-drive with rufus
2. Plug jump-drive in, setup bios to boot from it and install Ubuntu 22.04

First issue, ssh is now disabled in Ubuntu 22.04, so enable it with

```
sudo apt install ssh
sudo systemctl enable sshd && sudo systemctl start ssh
```

Things to do (everything) _and while doing so, keep these notes up to date_.

- Setup storage drives
  - Partition the drives: 2 TB for shelter, the rest for media
  - Mirror (Raid 1) the drives for some level of redundancy
- Setup sshkey stuff so `ssh rhino` does not require any password stuffs.
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
