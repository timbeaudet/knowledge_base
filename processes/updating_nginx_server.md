# Updating nginx Server

Edit the file found at: `/etc/nginx/sites-enabled/default`

Find where the root director is and ensure it is where expected.  
_(this file was created when stream_remote moved from personal to tyre_bytes)_

## Restart the nginx Process

`systemctl reload nginx`

Reload is safer than restarting as it will load the new config and keep the old one if there are errors found.
