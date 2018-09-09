# Knowledge Base

> This document contains notes that help with tips and tricks of various software used in Tim Beaudet's Indie Adventure. Some of the tips may be specific to Tim's setup and or usage, but if it helps someone else then it was worth sharing!

### Things to search for in this file:
- Blender Tricks
- Adobe Photoshop Tricks
- [Adobe Illustrator](https://github.com/timbeaudet/knowledge_base/blob/master/software/adobe_illustrator.md)
- Audacity Tricks
- Windows Platform Tricks
- Linux Platform Tricks
- macOS Platform Tricks
- Git Tricks
- Github Tricks

## Windows Platform Tricks:
- Type "cmd ." in the explorer window to get a command prompt where you are!

## Linux Platform Tricks:
- In terminal press `CTRL-R` to search for previous command, pressing enter will RUN the command immediately.
		
- Zipping up a folder into tar.gz
```tar czf behind_closed_doors.tar.gz behind_closed_doors```

## macOS Platform Tricks:
- None Yet

## Audacity Tricks:
- Random background junk/noise can be removed via Effect -> Noise Reduction
	First select a second or so of the background noise, then use Noise Reduction to 'train it' with Get Noise Profile
	Then select the entire recording and use Noise Reduction to eliminate that profile.


## Adobe Photoshop Tricks:
- When setting up Photoshop "for first time" You will need to do the following to get it to behave normally...
1. Window > Workspace > Keyboard shortcuts & Menus > Shortcuts
2. Set "Step Backward" to Ctrl+Z
3. Set "Undo/Redo" to Alt+Ctrl+Z
4. Ensure "Step Foreward" is set to Shift+Ctrl+Z

B for brush mode
	While in brush-mode alt click = eye dropper
CTRL-D for deselect
Window > Workspace > Keyboard shortcuts & Menus > Menus - this allows you to color the menu items which could make things easier to find.

If accidental bad tolerance, place a layer underneath and paint with the background color, then merge down

Check / Uncheck "Auto-Select" use the movement tool and there is an option on the top (tool options) for this.
> If enabled Photoshop seems to auto-guess what layer you want to move around.

Control brackets "[ ]" to move a layer up/down the layert list.


## Adobe Premiere:
	Click on timeline and press F to see the source of the clip highlighted by time cursor
	lock/unlock channels to delete audio or just video, (or context menu: unlink)
  
  
## Blender Tricks:
		Nearly all this help comes from @shakesoda or @ZaCkOX1000
		alm-m to merge vertices.
		'c' to use circle select, to left-click/paint selection (shift to unselect paint area)
		ctrl-mouse (RMB) to lasso select
		'g, g' to use edge slide to slide an edge along the face
		button-to right of face select mode button can be used to select things on the other side. (ghost thingy)
		bevel tool: ctrl-b, use scroll wheel for more loops
		alt-s to scale along normals (or shrink/fatten in words of @shakesoda)
		
		Use period to put the origin/scale/things with the cursor as the hotspot.
		Use comma to put the origin/scale/things to the selection.

		Proportional Edit Mode
		alt-o to enter/exit proportional edit mode
		Check the area of influence (use scroll wheel)

		- **Hide everything except selection**
			Press `numpad /`
		- **Show / Hide everything in a fake-empty-group**
			Hold CTRL while clicking eye-ball icon.

		- **Split a mesh into smaller parts**
			In edit mode, select the parts/faces desired in the new part
			then press `p` and use `selection` to break it apart into a new mesh.

		- **Joining two meshes together, with same surface loops**
			In object mode, select the meshes to be joined.
			Press `ctrl-j` to join them into a single mesh.
			In edit mode, select the edges of the two peices to be combined and bridge
				Bridge via space 'bridge' or `w` menu `e` ... also or ... `ctrl-e` menu `l`

		- Snapping to various things
			Bottom right of 3D view has 'closest' next to that is a mode, vertex, edge, increment etc.
			Grab item to move to snapped location, lock in axis if needed,
			Hover thgy

		Working with Materials:
			Don't hit [+] New unless a new material is required, use the ball next to it to select a material.
			To delete a material from that list: 

		ctrl-x to dissolve an edge loop (or other things) S
		shift-k in vertex paint mode to fill
		v is a hotkey to go to vertex paint/to object mode

		shift-f free move (fps) camera can use LEFT-CLICK to set the view and return to edit.
		shift-f1 to open/copy an object/something from one blend file into current.

		select, then scale 0 on the Z (or other axis) to create a flat spot)
		hit axis key a second time (g, x, x) to move along normal

		ctrl numpad +/- to increase/decrease selections
		to slice a model- 'a' to select all, then use 'bisect' (select fill, clear inner/outer to taste)
		knife tool 'k' to create new 
		While in color mode, use s to sample the color under cursor. (perhaps just UV/Image editor?)

		m to move an object from one layer to another.


		☐ Mesh cleanup, remove doubles with:
			In edit-mode, select all `a` then
			`w` menu `r` for remove doubles

		☐ `Copy a mesh`
			Do NOT use ctrl-c/ctrl-v (shakesoda says this litters the file with junk; as in
			it also duplicates the materials and stuff.)
			☐ Use `alt-d` to link and share same object data
			☐ Use `shift-d` to duplicate the mesh without sharing.


		☐ Splitting a curve into multiple segments
			Select both nodes that should be split, press `w` then `s` to subdivide.

		Select child object first, then parent next and hit ctrl-P to link.

		☐ `Playing with the 3D Cursor`s
		alt-home centers the rotation to 3d cursor

		☐ `Extrude along perpendicular`
		Select the edge, `e` to extrude, `escape` to cancel movement, `alt-s` to move along normal.
		
		tab to edit mode
		grab the bottom edge (or desired rotation point)
		shift-s cursor to selected
		period (regular keyboard) to switch 3D cursor pivot   (comma to set back to average)
		tab to object mode
		rotate etc

		`Permanently change center point in object mode to move origin to geometry or cursor`
		ctrl-alt-shift-c

		EXPORTING LEVEL:
			DO NOT SAVE DURING THIS PROCESS
			box-select all tiles/objects
			relations tab on T menu: make local (all)
			box-select all tiles/objects (again)
			ctrl-shift-a (make duplicates real)
			relations tab on T menu: make single user (check option for "object data")
			Apply transforms
			Export
			DO NOT SAVE
			File > Revert


		Color palette:
			https://puu.sh/BcZLm/b148cf14df.png File >preferences >File,
			set textures directory if not already.
			Then go open C:\Program Files\Blender Foundation\Blender\2.79\scripts\addons\paint_palette.py 
				insert in to line 110 "searchpaths=[bpy.context.user_preferences.filepaths.texture_directory]"
				save it.
			Back to preferences in blender Add-on tab,
				search paint,
				and enable pallet
			finally migrate you pallet to the other pallet using the eye dropper in the colour picker.


## VisualStudio Tricks:
 - Search using symbols; use `CTRL+,` jobun44

## VisualStudio Code Tricks:
	Convert Indentation To Tabs from F1/command palette jobun44
	To commit all changes or staged changes just type message in the field below SOURCE CONTROL: SVN and hit `Shift+Enter` jobun44
	Edit all text that matches selection, CTRL+F2
	Open file in a split view, CTRL+LClick jobun44
	Multiline edit: CTRL+ALT+ up/down arrows jobun44
	Just write a comment (in html) and CTRL+/ cicero743
	CTRL+R will open a recent file or project with typable find.


## Git Tricks:
	If git ever says "you cannot push because there are other stuff on the remote" do a `git pull --rebase`
		> This will take all your local commits and 'replay' them on top of the remotes commits.
	If you accidentally did `git pull` do a `:cq` in the thingy (vim) and then
		`git merge --abort`
		`git pull --rebase`

	After performing a merge, you must:
		`git pull --rebase`

	Taking an SVN repository and keeping the history alive when converting to git:
		echo "timb = Tim Beaudet <timbeaudet@yahoo.com>" > users.txt
			> or any other users that are in both old/new systems.
		git svn clone -A "users.txt" path/to/svn/repo/ ./new_git_repo_folder
		
		cd into the new directory
		git remote add origin <repo ssh URL>
		git push -u origin master
		If you have issues, and the remote repo is clean / minimal (okay to be wiped to new state) use-
		git push -u origin master --force

	Tagging a release / build:
		`git push origin <name of tag> (or git push --tags)`
		Or use gitea releases tab.

	Moving a repository to point to a different remote:
		`git remote set-url origin url/to/new/remote/repo`
		`git remote -v`

	Changing/Fixing a broken commit-
		git log --oneline --graph
		stash everything in your working directory if there's anything (git stash)
		git rebase -i <commit ID>^      <commit ID> is from git log, -i = use interactive vim junk.
			or git rebase -i <commit ID of the commit before the one you want to edit>
			or git rebase -i @~2 or something
			In interactive editor replace "pick" with "e" for the commit you want to edit
				hit d, w      --to delete word
				i             --to go into insert
				e, space      --to add the e in front of commit
				ESCAPE        --to exit insert mode
				:wq           --write and quit
		git log --oneline     (verify the HEAD is where we want to play)
		
		NOW EDITING FROM THAT COMMIT, GO FIX THE BROKEN ISSUES

		git add --patch
		git commit --amend
		git rebase --continue
		git push --force    (ensure to check box in TortoiseGit)

	Add a remote to pull branches from a different repository:
		`git remote -v`                          Check if the remote is already existing.
		`git remote add REMOTE-NAME REMOTE-URL`  Add the remote
		`git fetch REMOTE-NAME`                  
		`git checkout BRANCH-NAME`               


	Process of adding a new feature:
		Doesn't actually matter if on master, but master must be up to date.
		`git checkout master`                    Make sure to get back to the master branch.
		`git pull --rebase`                      Make sure master is all up-to-date locally
		`git checkout other-branch`              Do this only if there is a reason to make a branch from different branch
		`git checkout -b feature/name`           Feature branch for the feature!!! feature/name-with-kababs

		Do code edits once finished...

		`git checkout master`                   Make sure master is all up-to-date, this and pull
		`git pull --rebase`                     
		`git checkout feature/name`             Make sure to checkout the feature branch where work was done.
		`git rebase master`                     Replays all feature commits on top of anything in master.
		`git checkout master`                   
		`git merge --no-ff feature/name`        feature/name can be omitted if you use `-` instead to represent "previous"
		`git push`

		To continue working on the branch, after merging to master, do
		`git checkout feature/name && git rebase master`

		Can even create the code edits first:
			Do code edits, once finished...
			
		Cleanup (delete) all the merged branches:
		DO NOT RUN UNLESS MASTER IS CHECKED OUT:
		`git branch | xargs git branch -d`
		IF deleted master, just checkout again.



		Running Git Bisect to find issue:
		Go to the root directory
		`git bisect start`
		`git bisect bad`
		`git bisect good <good commit id>`
			Create a build and test it out, if the issue works type
			`git bisect good`
			Otherwise is sucks so type
			`git bisect bad`
			Repeat until the broken commit emerges from the ashes.
			IF for some reason you can't build type in
			`git bisect skip`
			When finished with the search type in
			`git bisect reset`


## Github Tricks
- Click `Preview changes` instead of commit when modifying this readme and checking the changes.

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
		https://help.ubuntu.com/community/How%20to%20Create%20a%20Network%20Share%20Via%20Samba%20Via%20CLI%20%28Command-line%20interface/Linux%20Terminal%29%20-%20Uncomplicated%2C%20Simple%20and%20Brief%20Way%21
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
