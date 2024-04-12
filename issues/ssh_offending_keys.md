
I was getting a lot of offending keys for Github somehow. It actually seemed like hippo's SSH key was removed from Github prior to this, maybe they expire? Maybe unrelated - super unsure.  

But after trying a `ssh-keygen -R github.com` to remove github from the knownhosts, it still didn't work. Likely due to load-balancing handing out different server IPs. The only way I got it to work was to actually move/delete the known_hosts file. `mv ~/.ssh/known_hosts ~/.ssh/known_hosts.bak` and then check & accept the finger-prints. This likely means I'll have to accept all other finger-prints again for other connections like WebHost, GameServers, etc.
