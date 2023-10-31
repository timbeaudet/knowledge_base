
# Setup PHP Logging (DreamHost)

This will need to happen whenever a new website is created or when updating to a new php version. The joys.

1.  ssh into the web server, (`user@dev.website.com` if necessary for dev sites)
2.  Find the phprc file, likely in `/home/username/.php/8.2/phprc`
  a.  Use `find -name "*phprc"` if you can't find it.
3. `vim path/phprc` and add the following lines.
```
    log_errors = 1
    error_log = /home/username/php_errors.log
```
5.  (or place them somewhere you wish / symlinks etc)
6.  Restart the php server with: `killall -9 php82.cgi -u shelluser` to apply the changes.

Note: use your username instead of `username` and replace any `8.2` or `82` with the php version necessary.
