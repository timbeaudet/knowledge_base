# Update Passwords After Deploy to Development

Presently when running a deploy to development the htaccess and htpasswd from production gets deployed. This requires manual intervention by modifying the development htaccess on the webhost directly to point to the correct path. After a deploy to development the following steps are necessary for the leaderboard admin page to work in that environment...

- ssh into `dev/boss_api` and find the .htaccess file.
- vim into it and change the location of the password file.
