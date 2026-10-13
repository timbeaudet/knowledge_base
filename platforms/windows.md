# Windows Platform Tricks:

- Type `cmd` in the explorer window to get a command prompt where you are!
- `WIN+PAUSE BREAK` to open system info, doesn't show version but does show system specifications.
- Take a screenshot, and specify capture area with `WINDOWS+SHIFT+S` this will put the image in the clipboard.
- To choose emoji's, press `WINDOWS+;` or `WINDOWS+.` MAGIC! 🧙‍

## Proper Multi-monitor Setup

Once you have all the GPU drivers and monitors connected/extending the desktop in Windows, use [MultiMonitorTool](https://www.nirsoft.net/utils/multi_monitor_tool.html) to position them accurately. The Windows box is not precise enough and being off by a pixels can make a very annoying issue when moving the mouse between monitors. It may also hurt gaming/racing/system performance with a pixel overflowing into multiple monitors if the window extends.  

The follow is a little silly, but the only way I found to set the positions in the tool...

0. Start with all monitors extended as desired.
1. Open MultiMonitorTool
2. Save the configuration file.
3. Open the configuration file in VSCode (or your preffered text editor).
4. Modify the `PositionX=-1920` and `PositionY=0` so they fall as expected; save.
5. Open the configuration file in MultiMonitorTool and apply.
6. Profit... Someday.

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

> Note2: It is possible that the system must restart for these changes to take effect. I was trying to get it to work for a couple weeks and then started working after an unexpected system reboot. Potentially that put Windows into gear with automatic tasks, though there was no hint or reason to expect this.
