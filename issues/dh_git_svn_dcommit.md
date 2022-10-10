I was last speaking with SOMEONE and created a test account for an SVN issue I was having. I’ve been unable to get this working on your servers but was able to on a different one. I don’t understand why it would be breaking on the DreamHost servers, seems to be something with the user/permissions as we ran into early but the steps I took to reproduce the issue:  

## Make a copy of the svn repo from timbeaudet account to the test account by doing the following:

### On timbeaudet account:
- `svnadmin dump turtlebrains > turtle_brains_repo.bak`
- Download via winscp/scp/rsync to move `turtle_brains_repo.bak` to the test account.
- From this point on all actions on DreamHost are for the test account.  

### On test account:
- Upload the turtle_brains_repo.bak via wincsp
- Create new repo through the dashboard `testturtlebrains`
- `svnadmin load testturtlebrains < turtle_brains_repo.bak`

### On a Local machine (not a dreamhost server)
- `svn checkout https://timbea11.dreamhosters.com/testturtlebrains`
- `echo "timb = Tim Beaudet <tim@tyrebytes.com>\ntimbeaudet = Tim Beaudet <tim@tyrebytes.com>\nsrsdev_tb = Tim Beaudet <tim@tyrebytes.com>" > users.txt`
- `git svn clone -A "users.txt" https://timbea11.dreamhosters.com/testturtlebrains ./tb_git`
    - (this step may take a few minutes, 1769 revisions)
- Make any change to `tb_git/build/build_notes.txt` (_like adding “This is just a test” at the top._)
- `git commit --all --message "test commit"`
- `git svn dcommit`

This will return the following:
```
$ git svn dcommit
Committing to https://timbea11.dreamhosters.com/testturtlebrains ...
        M       build/build_notes.txt

ERROR from SVN:
Permission denied: Can't move '/home/timbeatest/svn/testturtlebrains/db/txn-protorevs/1769-1da.rev' to '/home/timbeatest/svn/testturtlebrains/db/revs/1/1770': Permission denied
W: 9f57c096f84527fe0443592e0987e370c6341058 and refs/remotes/git-svn differ, using rebase:
:040000 040000 51d733947058444e99e52a3f16bca9513966c743 517428b9b307b4e9b7b58af49c456d66bcefd8f5 M      build
Current branch master is up to date.
ERROR: Not all changes have been committed into SVN, however the committed
ones (if any) seem to be successfully integrated into the working tree.
Please see the above messages for details.
```

After `git svn dcommit` the permissions issue is reproduced and you will be unable to perform the following actions which would have been fine prior:

- `svn checkout https://timbea11.dreamhosters.com/testturtlebrains`
- `cd testturtlebrains/build` && Add a note to build_notes.txt
- `svn commit -m "test commit"`

Now gives this:
```
Sending        build_notes.txt
Transmitting file data .done
Committing transaction...
svn: E000013: Commit failed (details follow):
svn: E000013: Can't move '/home/timbeatest/svn/testturtlebrains/db/txn-protorevs/1769-1db.rev' to '/home/timbeatest/svn/testturtlebrains/db/revs/1/1770': Permission denied
```

When I tried this with a simple svn repo that I created and made a few test commits to, https://timbea11.dreamhosters.com/testmorestuff/, it worked flawlessly even on your servers. Something happens with both the ice and turtlebrains repos, and I can’t see why that would be other than they have significantly more real-world commits. There shouldn’t be anything in those repositories that changes users/permission stuff.  

As far as I am aware `git svn dcommit` will be like a regular commit from whatever is on current branch into the svn repo, this would let me start using git for source control while all legacy svn projects continue working as they always have.
