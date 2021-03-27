
# Create a Server on Hippo

This works for Eggcelerate! and similar php served sites.

0. `cd` into the directory with index.php
1. `php -S 0.0.0.0:1080`
2. Open browser to `hippo:1080`

# Deploy Live WebSite Changes

When developing the Tyre Bytes website, or others that use the same setup, you can modify the site and immediately see the results using the `hugo server`.

0. Navigate terminal to the project folder where hugo would generate the site.
1. Run the command `hugo server --bind 0.0.0.0`
2. Navigate your browser to the site displayed, it should work on other LAN devices.

# Deploy Live Builds on the Fly

0. Make sure all the scripts in build and build/automated have executable permissions.
1. Create a place for the live build to be uploaded, folder must exist on server.
2. Edit auto_deploy.sh to contain the path of the project. 
   By default this goes to `tyrebytes.com/games/TEMPLATE_PROJECT_FILE/live/TEMPLATE_PROJECT_FILE.html`
3. Ensure the pushd location of this script matches the project location on disk.
4. Ensure that auto_build.sh is building the web version of the project.
   Probably only the web version, but ensure cronjob waits for previous builds to finish.
5. Edit `./irc.py` from collaborations/timautobuild (from tsjost) to use correct URL of project. 
6. Run `./irc.py` from collaborations/timautobuild (from tsjost)
7. Open crontab to make the job run every minute, or desired timing:

```
	EDITOR=nano crontab -e
	#Check for changes every minute:
	* * * * * /path/to/script > /path/to/output_log.txt 2>&1
	#Check for changes every 5 minutes:
	*/5 * * * * /path/to/script > /path/to/output_log.txt 2>&1
```
