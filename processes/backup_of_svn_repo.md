# Backing up an SVN Repository

1. cd to the location containing the `example_repo`
2. svnadmin dump example_repo > backup_example_repo.txt
3. (optional) compress the output
4. winscp to grab the backup, or scp/rsync -avihP to grab the backup file.
5. Keep save.

## Restoring the SVN Repository

1. winscp / scp / rsync to bring the backup_repo.txt to desired location.
2. (optional) decompress the input if required; did you compress it on backup?
3. Create a new repo `new_example_repo`
4. svnadmin load `new_example_repo` < `backup_repo.txt`
