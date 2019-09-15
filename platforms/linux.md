# Linux Platform Tricks:

- In terminal press `CTRL-R` to search for previous command, pressing enter will RUN the command immediately.
		
- Zipping up a folder into tar.gz
```tar czf behind_closed_doors.tar.gz behind_closed_doors```

- Generate passwords with `pwgen`

- **Kill a Process from terminal**
   - Search the process via: `ps aux | grep <name>`
   - Kill the process via pid with, `kill <pid>`
   - Use `kill -9 <pid>` for forced kill.
   - Kill the process via: `killall <name>` _also use `-9` for force kill.

## Setup sendmail to email from command-line

0. Grab required packages and setup configuration file:
```
apt-get install sendmail
apt-get install ssmtp
sudo vim /etc/ssmtp/ssmtp.conf
```

```
#
# Config file for SSMTP sendmail
#
# The person who gets all mail for userids < 1000
# Make this empty to disable rewriting.
root=user@gmail.com

# The place where the mail goes. The actual machine name is required no
# MX records are consulted. Commonly mailhosts are named mail.domain.com
mailhub=smtp.gmail.com:587
AuthUser=user@gmail.com
AuthPass=passwd
UseTLS=YES
UseSTARTTLS=YES
# Where will the mail seem to come from?
#rewriteDomain=

# The full hostname
hostname=DESKTOP-G5R9HKB.localdomain

# Are users allowed to set their own From: address?
# YES - Allow the user to specify their own From: address
# NO - Use the system generated From: address
#FromLineOverride=YES
```

1. Send the email: `echo "Subject: Test mail" | sendmail sendto@mail.com`

```
echo "From: Sender Name" > contents.txt
echo "Subject: Test mail" >> contents.txt
echo -e "\n\n" >> contents.txt
echo "Email body contents here." >> contents.txt
sendmail sendto@mail.com < contents.txt
```

2. It may shout about unsecured access you need to go here and allow it https://myaccount.google.com/lesssecureapps
