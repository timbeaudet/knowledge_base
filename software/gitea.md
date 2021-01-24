# Gitea

Gitea is a self-hosted github like solution that I began using because github didn't have private repositories and continue using because it is what it is.

## Updating Gitea.

I may have done something wrong in initial install, or otherwise made my life more difficult, but the git hooks in all repositories pointed to a specific version of gitea, ex: `gitea-1.11.5-linux-amd`. It took a few updates to symlink gitea to the current/latest but this leaves many repositories with the old hard-coded executable path.

### To Fix

If a repository fails to accept pushed changes with "pre-receive hook declined" this is how to resolve the issue:

1. Open up gitea on the webhost, (in my case I need to switch to the gitea user)
2. Navigate to gitea-repositories/GROUP-OWNER/REPO-NAME.git/hooks
3. Edit each of the following files to specify the new version (or use a common symlink name like `gitea`)
    - `vim pre-receive.d/gitea`
    - `vim post-receive.d/gitea`
    - `vim update.d/gitea`
4. Profit.
