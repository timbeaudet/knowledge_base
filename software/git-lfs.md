# Notes on using git-lfs

## Installing on Windows

I believe I just downloaded and ran the big Download Button.

## Installing on Linux (rhino)

Follow the instructions at: https://github.com/git-lfs/git-lfs/blob/main/INSTALLING.md which at time of writing looked like...

```
cd ~/development/tools/linux
mkdir git-lfs
cd git-lfs
wget https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh
chmod +x script.deb.sh
sudo ./script.deb.sh
sudo apt-get install git-lfs
```

Started with https://git-lfs.github.com/ for information, then created an "existing repo" for testing. This was troubleshoo_basin. After having installed git-lfs on Windows (almost certainly using the giant download button) we ran these commands on the troubleshoot_basin repo:

Also getting information from https://josh-ops.com/posts/migrate-to-git-lfs/ which stated `--everything` creates the .attributes automagically, and that seemed to be the case.

## Already Existing Repository

### WARNING: Migrate Modified History

```
git lfs install
git lfs migrate import --include="*.msh, *.png" --everything
git lfs ls-files  //Allows you to check the large files are as expected.
git push --all --force
```

## Brand New Repository

```
git lfs install
git lfs track "*.msh"
git lfs track "*.png"
//Add any formats you require to be in large-file.
git add .gitattributes
git commit "attributes for git-lfs"
```
