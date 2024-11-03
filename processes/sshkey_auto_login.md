
# Automatic Login with ssh-keys vs password.

ALL OF THE FOLLOWING IS TO BE DONE ON THE LOCAL MACHINE.
To connect penguin to hippo we would perform all of this on penguin.

## Setup

From github, though the process works for other things:
https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

1. First generate the ssh-key to use
  `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`
2. Allow it to save to default location `/home/username/.ssh/id_rsa` (or on Windows with git bash: `/c/Users/timbeaudet/.ssh/id_rsa`)
3. Use a passphrase.

## As Needed

Sometimes it is required to start the ssh-agent and add the key to it.
1. `eval "$(ssh-agent -s)"`
2. `ssh-add ~/.ssh/id_rsa`

## Copy Key to Remote

1. `ssh-copy-id <remote>`
for penguin to hippo this would be `ssh-copy-id hippo`
