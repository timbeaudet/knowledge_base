# Windows Platform Tricks:

- Type `cmd` in the explorer window to get a command prompt where you are!
- `WIN+PAUSE BREAK` to open system info, doesn't show version but does show system specifications.
- Take a screenshot, and specify capture area with `WINDOWS+SHIFT+S` this will put the image in the clipboard.
- To choose emoji's, press `WINDOWS+;` or `WINDOWS+.` MAGIC! 🧙‍

## Scheduling a Task (script) to Run Nightly

0. Start (Windows Key) to open `Task Scheduler`
1. Action > Create Basic Task
2. Give it a name, like `nightly_build` and some description.
3. Trigger the task Daily
4. Select start date and time for the first run, recur every `1` days.
5. Select the `Start a program` for the action to perform.
6. Navigate to and choose the script, like `C:\development\tools\windows\automate_builds.bat`
7. For nightly builds script, start in `C:\development\nightly_build_area`

In the properties for the nightly_build task make the following changes:

* Run whether user is logged on or not
* Wake the computer to run this task
* Run task as soon as possible after a schedule start is missed
* If the task fails, restart every minute for 3 times
* Stop the task if it runs longer than 4 hours

> Note: To edit the task (in Windows 10) open `Task Scheduler` and click on `Task Schedule Library` this contained the `nightly_build` task for me and it wasn't obvious I needed to click on it when I first searched through every folder of Microsoft.
