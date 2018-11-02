# PicPick Setup

> Note: This is from memory not actually during setup process, so this may be missing an item or two.

0. Download from https://picpick.app/
1. From PicPick icon, open Program Options
2. In the Capture tab set:
	- Output type to FTP Server
	- Check Always copy captured image to Clipboard
3. In Filename tab use `%y%m%d%h%n%s_screenshot` if not already set.
4. In Auto Save tab point to `C:\development\screenshots\` or other location as desired.
5. In FTP Server Setup tab
	- FTP server does not use `http://` or `www.`, so for me: `timbeaudet.com`
	- Remote path is, for me, `timbeaudet.com/goods/screens`
	- Set the username and password and press Test (if it says connection established, it likely worked despite looking like it wants to attempt more)
