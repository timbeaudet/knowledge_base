# One Button Steam Uploads

1. Follow [automating steampipe](https://partner.steamgames.com/doc/sdk/uploading#automating_steampipe)
2. Don't save password in the scripts, it shouldn't even be needed!


## Reset Config 

I've found the SteamGuard may sometimes constantly request 2FA, if it does, delete the `<Steam>\config\config.vdf` and go through the process of login again with SteamGuard and then it will be good again. Probably. The theory is that the config file gets corrupted in a way that Steam doesn't know how to resolve.

On Linux / Ubuntu / Rhino that file is found on `~/Steam/config/config.vdf`  
Good Luck.
