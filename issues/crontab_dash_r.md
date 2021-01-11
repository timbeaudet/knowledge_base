
# crontab -r is bad

Typing this immediately destroys the contents of your cronjobs file without asking any further questions. This is very easy to fat-finger when typing `crontab -e` to make edits. To prevenet it you can create an alias for crontab that will prompt yes/no before automatically destroying things. Why this isn't the default?

## Setup an alias to fix

`crontab=crontab -i`
