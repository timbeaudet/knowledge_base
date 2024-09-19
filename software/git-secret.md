# Learning / Usages Notes for git-secret

Notice there is a difference between `git-secrets` and `git-secret`. This document is about using `git-secret` to encrypt and store secret information directly in a repository where `git-secrets` attempts to detect password/tokens and prevent them from being committed.

Will be using https://sobolevn.me/git-secret/ 

## Installing Windows

gpg is required, it appears `gpg (GnuPG) 2.2.29-unknown` was already working with git-bash (and or was installed with git-lfs or something else?)
[scoop](https://scoop.sh/) may also be needed to grab other requirements...  which was installed with the following command in VSCode PS terminal.
```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

scoop allows us to install the other requirements
```
scoop install make
scoop install man (didn't work)
```

gnupg, git, and gawk were aleady installed.

In case it matters I ran `scoop install binutils` and `scoop install coreutils` from VSCode PS terminal, but I think running the following in gitbash (MINGW64) will "just work"

```
cd C:\development\tools\windows\
git clone https://github.com/sobolevn/git-secret.git git-secret-installation
cd git-secret-installation && make build
PREFIX="C:\development\tools\windows\git-secret-tool" make install
cp git-secret-tool\bin\git-secret .\
rm -rf git-secret-installation
rm -rf git-secret-tool
```

And of course verify with `git-secret --version`

## Installing Linux (rhino)

It appears `gpg (GnuPG) 2.2.27` was already installed on rhino from something, maybe git-lfs?


## Setting up a GPG KeyPair

Run `gpg --gen-key` from gitbash and it will ask name/email/passphrase while setting up a key.  
To export that key use `gpg --armor --export your.email@address.com > public-key.gpg` which will put `public-key.gpg` file in the current working directory.

If you need to change a passphrase, you can use

```
gpg -k  // to show all the keys, copy the random string under pub of the key, this is the id.
gpg --edit-key <key id> //pasting in that key id, this will start a prompt
passwd   // enter old passwd, and new passwd twice...
quit //close the gpg prompt.
```

To copy the gpg keys to another machine (like rhino, etc) we can do the following...

1. Run the command: `gpg --armor --export-secret-key tim@tyrebytes.com > secret-gpgkeys`
2. Copy the `secret-gpgkeys` file to rhino (or the other machine).
3. From rhino/other machine run the command `gpg --batch --import secret-gpgkeys`

## Actually Using git-secret

This was from an already started repository, but should be about the same, from [git-secret documentation](https://sobolevn.me/git-secret/)

Initialize the git-secret repository by running `git secret init`. The .gitsecret/ folder will be created, with subdirectories keys/ and paths/, .gitsecret/keys/random_seed will be added to .gitignore, and .gitignore will be configured to not ignore .secret files.

```
git secret init
git ap .gitignore //should contain ignore for randomseeds & non-ignore for .secrets
git add .gitsecret/
git cm "Adding git-secret for project."
```

Now to add users to tell about the secrets:

```
git secret tell your@email.id
```

To track/add a secret file, use:

```
git secret add <path/filename.ext>
git secret hide
```

This will add a `path/filename.ext.secret` file that needs to be committed.

ALL contents of the `.gitsecret/` folder should be checked in, **except** the `random_seed` file, which is already set to be ignored in the `git secret init` command.

To recover a secret file that changed, or when cloning the repo use `git secret reveal`

Note when changing secret files, there will be nothing that shows the changes. `git st` won't show that!! It is a manual process to remember to call `git secret hide` to update the secrets. Also there was some advice to put `git secret hide` inside the precommit hook. I actually tried this, but it seemed (at least on Windows / gitbash) to cause the secret file to ALWAYS remain changed! Maybe they needed a hide and add to the commit? But it seems hide is ALWAYS changing stuff.

Good luck!

