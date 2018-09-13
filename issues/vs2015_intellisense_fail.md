# Visual Studio 2015 Intellisense Failure

New project from ice/turtlebrains (3D) template project has intellisense issues as well as build time stamp issues:

### Symptoms:
- intellisense squigglies on includes for TurtleBrains / Ice
- build will fail the first time with "OpenAL32" as a linker input, rename to "openal32" fixes it.
	- WTF is with case-sensitivity? This works fine in new project from 2D template with "OpenAL32"
- build will recheck each file; though not compile them, as if time stamps are wrong - even with no text changes

### Expected:
- No intellisense issues, the build to work as is, with "OpenAL32", and not to recheck files each successive build without changes.

### What has been Tried:
- Previous project from 3D template (LudumDare41) works flawlessly as expected.
- New project from 2D templates work flawlessly.
- Differences between 2D template and 3D template projects:
	- 3D template uses git/GameKit and svn/ice

- Differences between LD41 and 3D template
	LudumDare41 is working with Visual Studio while using:
	TurtleBrains r1119
	ICE r89
	GameKit: 6fa7ef7c1e1235ed7708fe7a92c26312d4ef99b6
	LD41 was created pre-Windows update.

Building with Diagnostic verbosity produced:
	..\..\source\most_or_all.cpp will be compiled as it was not found in the tracking log. (TaskId:17)

### There is no Solution:
After losing several days of work attempting to figure this out, it was found that `Windows Subsystem for Linux` (WSL) was the cause of the issue. In the windows update after Ludumdare41 was created, Microsoft changed directory settings to allow per-directory case-sensistivity. [This source](https://blogs.msdn.microsoft.com/commandline/2018/02/28/per-directory-case-sensitivity-and-wsl/) explains the issue and attempts/pretends to show how to change it back. Any combination I tried, `case=force` to go back to old behavior but this did not work.

Also attempt to [setup /etc/wsl.conf](https://blogs.msdn.microsoft.com/commandline/2018/02/07/automatically-configuring-wsl/) without luck, and the `fsutil.exe file setCaseSensitiveInfo <path> disabled` also failed to work after running git in WSL to pull the repo.

### Work around:
Do NOT use git, or _anything_ that creates a directory from within WSL as it will screw things up.
Do NOT use create_project_ice.sh **as-is** to automatically setup the project, this fails as it grabs from git.
You can setup the project by commenting out the git pulls from create_project_ice.sh and then using, then manually pulling the git repos from git bash.
