# Git Tricks:

## Setting up Git the first time (Windows)
- Download Visual Studio (2015) and ensure Git tools is installed with it.
   - One can probably install Git for windows directly, but during falcon reinstall, it came from this install process.
- Open `Git Bash` from start menu.
- [Generate an SSH key](https://help.github.com/enterprise/2.14/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) by:
   - ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   - Leave it in the default location (_/Users/you/.ssh/idrsa_)
   - Enter a passphrase, or don't; depends on how accessible your local machine is.
  - Add the SSH key to the agent:
    - `eval $(ssh-agent -s)`
    - `ssh-add ~/.ssh/id_rsa`
  > Note: if default location is used, `ssh-add` will work without specifying file.

- [Add SSH key](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/) to [github](https://github.com/settings/keys) and/or gitea
  - `clip < ~/.ssh/id_rsa.pub`
  - If that fails, use `cat ~/.ssh/id_rsa.pub` (ensure .pub, as no extension is **private**) and proceed to copy the contents.
  - In User Settings > SSH Keys add a new SSH key and paste contents.

- Test to ensure it works by cloning a repository with ssh.
- Download and install [TortoiseGit](https://tortoisegit.org/download/)
  - During the install flow when requested, I used the OpenSSH instead of PuTTy.
  - During the install flow I used "Open Key" to add the existing _private_ key to TortoiseGit / PuTTy. For this I navigated to `C:/Users/<username>/.ssh/id_rsa` and saved a PuTTy version of it.
- Test to ensure it works by cloning a repository with ssh from TortoiseGit.

## Moving a Repository from Gitea to Github (or elsewhere)
- Create a new repository on github, do not initialize repo with anything. No readme, .gitignore or license
- Use `git remote set-url origin git@github.com:TyreBytes/<REPOSITORY_NAME>.git` on each machine accessing the repo.
- On the very first machine, or ideally the one with most recent changes, run a `git push` to send repo to Github.
- Profit?

## Setup Just the Way I like it

> Use the following git alias commands to setup everything well.

```
git config --global alias.last 'log -1 HEAD'
git config --global alias.lg 'log --oneline --graph'
git config --global alias.lg1 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
git config --global alias.lg2 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) %C(cyan)%an%C(reset) - %C(white)%s%C(reset) %C(dim white)(%ar)%C(reset) %C(bold yellow)%d%C(reset)' --all"
git config --global alias.ap 'add --patch'
git config --global alias.cm 'commit --message'
git config --global alias.cam 'commit --all --message'
git config --global alias.pr 'pull --rebase'
git config --global alias.prp 'pull --rebase=merges'  (or git config --global alias.prp 'pull --rebase=preserve')
git config --global alias.pra 'pull --rebase --autostash'
git config --global alias.b 'branch'
git config --global alias.co 'checkout'
git config --global alias.cop 'checkout --patch'
git config --global alias.st 'status'
git config --global alias.ss 'stash save'
git config --global alias.sp 'stash pop'
```

> Use the following git config command to immediately set branch as upstream and push without requiring the git push --set-upstream origin blah/blah-blah

```
git config --global --add --bool push.autoSetupRemote true
```

Unformatted below.

	If git ever says "you cannot push because there are other stuff on the remote" do a `git pull --rebase`
		> This will take all your local commits and 'replay' them on top of the remotes commits.
	If you accidentally did `git pull` do a `:cq` in the thingy (vim) and then
		`git merge --abort`
		`git pull --rebase`

	After performing a merge, you must:
		`git pull --rebase`

## Converting an SVN repository to GIT
		echo "timb = Tim Beaudet <timbeaudet@yahoo.com>" > users.txt
			> or any other users that are in both old/new systems.
		git svn clone -A "users.txt" www.url.to/svn/repo/ ./new_git_repo_folder
		
		cd into the new directory
		git remote add origin <repo ssh URL>
		git push -u origin master
		If you have issues, and the remote repo is clean / minimal (okay to be wiped to new state) use-
		git push -u origin master --force

## Tagging a release / build:
`git push origin <name of tag>` _(or `git push --tags`)_
Or, use `gitea` releases tab.

Moving a repository to point to a different remote:
```
git remote set-url origin url/to/new/remote/repo
git remote -v
```

Changing/Fixing a broken commit:
```
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
```
**NOW EDITING FROM THAT COMMIT; GO FIX THE BROKEN ISSUES**
```
git add --patch
git commit --amend
git rebase --continue
git push --force    (ensure to check box in TortoiseGit)
```

**Add a remote to pull branches from a different repository:**  
`git remote -v`                          Check if the remote is already existing.  
`git remote add REMOTE-NAME REMOTE-URL`  Add the remote  
`git fetch REMOTE-NAME`  
`git checkout BRANCH-NAME`  


**Process of adding a new feature:**  
Doesn't actually matter if on master, but master must be up to date.  
`git checkout master`                    Make sure to get back to the master branch.  
`git pull --rebase`                      Make sure master is all up-to-date locally.  
`git checkout other-branch`              Do this only if there is a reason to make a branch from different branch.  
`git checkout -b feature/name`           Feature branch for the feature!!! feature/name-with-kababs  

**Do code edits once finished...**

`git checkout master`                   Make sure master is all up-to-date, this and pull.  
`git pull --rebase=preserve`            Make sure to preserve the railroad tracks.  
`git checkout feature/name`             Make sure to checkout the feature branch where work was done.  
`git rebase master --preserve-merges`   Replays all feature commits on top of anything in master, while keeping any merged history.
`git checkout master`                   
`git merge --no-ff feature/name`        feature/name can be omitted if you use `-` instead to represent "previous"  
`git push`  

To continue working on the branch, after merging to master, do  
`git checkout feature/name && git rebase master --preserve-merges`

**If you forgot that step...** _(and committed to the master branch instead; but have not pushed...)

`git checkout feature/name`  
`git rebase master  --preserve-merges`   Bring the new commits to the branch  
feature/name and master should now match.  
`git checkout master`  
`git log` and find the commit id of the commit BEFORE the one desired.  
Stash anything left in working directory; otherwise **lose it**  
`git reset --hard COMMIT_ID`  

**If worked on master without creating branch**

`git branch feature/name`
`git stash`
`git log` and find commit id where master SHOULD be
`git reset --hard COMMIT_ID`

**If history was randomly flattened** _(you ran git pull --rebase without preserve (successfully rebased) and done nothing else...)**

`git status`     Ensure the working directory is in a clean state, stash as needed, untracked files are okay.  
`git reset --hard ORIG_HEAD`     Reset head back to where it was before the last rebase command.  
`git pull --rebase=preserve`     This is slow, but preserves the history of railroad tracks.  

**If rebase was not successful, just --abort**

Can even create the code edits first:
	Do code edits, once finished...

	Cleanup (delete) all the merged branches:
	DO NOT RUN UNLESS MASTER IS CHECKED OUT:
	`git branch | xargs git branch -d`
	IF deleted master, just checkout again.
	IF branch was removed just, git checkout -b branch/name-here commit-id

If the branch was merged from a different computer after doing a rebase, the branch will remain and you'll need to use `git branch -D`. Be careful!

## Running Git Bisect to find broken commit:

Go to the root directory  
`git bisect start`  
`git bisect bad`  
`git bisect good <good commit id>`  
	Create a build and test it out, if the issue works type
	`git bisect good`  
	Otherwise it sucks so type
	`git bisect bad`  
	Repeat until the broken commit emerges from the ashes.  
	IF for some reason you can't build type in
	`git bisect skip`  
	When finished with the search type in
	`git bisect reset`  
