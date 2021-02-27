
```
git clone http://timbeaudet.com:3000/GameDevArena/eggcelerate.git
Cloning into 'eggcelerate'...
remote: Counting objects: 4551, done.
remote: aborting due to possible repository corruption on the remote side.
fatal: protocol error: bad pack header
```

This seems to be caused by the server running out of memory to compress on that end before sending to the client requesting the repo. I fixed this by first checking what the config was, there was no output so nothing was set for me.

`$ git config --global pack.window`

Then I set that to 0 which has your client tell the server not to pack it over there, clone may then take longer or something but _it did work_. The final line could be changed so the valye could reset to the original value if yours existed, or whatever, here we unset it again.

```
$ git config --global pack.window "0"
$ git clone http://timbeaudet.com:3000/GameDevArena/eggcelerate.git
$ git config --global --unset pack.window
```

**Note:**

It would appear that didn't help a collaborator with the issue they had, I then went into the gitea repository folder on the server and ran the following commands, _(which could probably be done with `--global` but just local to that repo for now)_:

```
git config pack.windowMemory "100m"
git config pack.packSizeLimit "100m" 
git config pack.threads "1"
```
