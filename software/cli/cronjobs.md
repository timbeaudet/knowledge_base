# Creating and Running CronJobs

## NEVER TYPE: `crontab -r`

This will wipe all cronjobs without prompting "are you sure?". Just gone. No more.

## General Usage

- These jobs do not know how to play with the ~ which is a bash feature. Must specify `/home/username/path`
- Try running the job each minute (or 10 minutes if that makes more sense) until you prove it works!
- The $PATH might not contain all the paths the normal bash user would have, I add the following to `nightly_job.sh` to fix

```
PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
source /home/timbeaudet/.profile
```

To run something nightly at/around midnight use

`59 23 * * * ~/task.sh`

To run something every minute use

`* * * * * ~/task.sh`

To redirect stdout into a file you can check later  use

`59 23 * * * ~/path/task.sh > ~/path/log.txt 2>&1`


My cronjobs on hippo 2021-09-28

```
59 23 * * * ~/development/nightly_build_area/run_nightly_builds.sh > ~/development/nightly_build_area/crontab_log.txt 2>&1
59 23 * * * ~/development/undefined/adventure_trails/scripts/nightly_task.sh > ~/development/undefined/adventure_trails/history/cronlog.txt 2>&1
59 23 * * * ~/development/undefined/stream_downloader/nightly_job.sh > ~/development/undefined/stream_downloader/cronlog.txt 2>&1
59 23 * * * ~/development/undefined/marketing_data_collector/run/nightly_job.sh > ~/development/undefined/marketing_data_collector/run/cronlog.txt 2>&1
* * * * * php ~/development/undefined/GameLivestreamNotification/fetch.php > ~/development/undefined/GameLivestreamNotification/cronlog.txt 2>&1
```
