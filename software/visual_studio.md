# VisualStudio Tricks:

## Setup just the way I like it:
Install the following extensions:
- [Visual Studio 2015 Color Theme Editor (Microsoft)](https://marketplace.visualstudio.com/items?itemName=VisualStudioProductTeam.VisualStudio2015ColorThemeEditor)
  - Use Solarized Dark + a few custom edits, or just _____
- [Customize Visual Studio Window Title (mayerwin)](https://marketplace.visualstudio.com/items?itemName=mayerwin.RenameVisualStudioWindowTitle)
  - Open Tools > Options > Custom VS Window Title > Global rules > Solution in design mode
  - Set that value to `[parentPath]\[solutionName] - [documentName] - [ideName]`
- [Trailing Whitespace Visualizer (Mads Kristensen)](https://marketplace.visualstudio.com/items?itemName=MadsKristensen.TrailingWhitespaceVisualizer)
  - Tools > Options > Trailing Whitespace > Remove whitespace on save: `true`
- [Editor Guidelines (Paul Harrington)](https://marketplace.visualstudio.com/items?itemName=PaulHarrington.EditorGuidelines)
  - Right-click on column 121 and use context menu to `Guidelines > Add Guideline`. _(Note: 121 = 120 characters wide, the column count is 1 based.)_

After installing the extensions [install the CurrentSettings](https://github.com/timbeaudet/knowledge_base/blob/main/config/visual_studio/CurrentSettings.vssettings), copy into `Documents/Visual Studio 2015/Settings/`

## Setup the following hotkeys to match.
Open `Tools > Options > Environment > Keyboard` (or search hotkey) then show commands containing:
  `Edit.InsertCaretsatAllMatching` and set it to `CTRL+F2` this shortcut was already being used but I never used it. CTRL+F2 matches VSCode for easier swaps.
  `Edit.InsertNextMatchingCaret` and set it to `CTRL+D` this shortcut was already being used (for duplicating current line) but I never actually used it. CTRL+D matches VSCode for easier swaps.

## Turn off automatic comment continuation:
  Open `Tools > Options > Text Editor > C/C++ > Code Style > General` and uncheck the 'Insert existing comment style at the start of new lines when writing comments' box.  
  Also in `Text Editor > C# > Advanced` turn off `Generate XML documentation...`, `Insert // at new lines...` and `Insert * at new lines`.  

Also in `Tools > Options > Text Editor > C/C++ > Advanced` we can turn Brace Completion (Add semicolon for types, Complete parentheses... and Complete multiline comments) to False  
Also in `Tools > Options > Text Editor > C/C++ > Advanced` we can find `Text Editor` and turn off `Format After Auto Surround` and `Expand Selection for Surround Scopes` while setting `Auto Surrond Mode` to `Never`  

## Add Premake Tool
  Open `Tools > External Tools` and click `Add` to add "Run Premake" to the Tool menu. Beats having to find the project and manually click it, also the one in `development/tools/windows` will update Turtle Brains, ICE and other framework stuff at the same time.

  - Title: `Run Premake`
  - Command: `cmd.exe`
  - Arguments: `/c run_premake.bat`
  - Initial Directory: `$(ProjectDir)\..\`

The running in `cmd.exe /c run_premake.bat` may help the explorer window not have final focus, but this issue seemed to reappear until I checked `Use Output Window` to avoid the cmd prompt appearing.




## Other tricks and tips
 - Search using symbols; use `CTRL+,` (jobun44)
 - Use `CTRL+K`, `CTRL+\` to remove all trailing whitespace in a file. (extension required)
 - `CTRL+SHIFT+T` can allow Visual Studio to fuzzy search for a file, so if you wanted to open ice_light.cpp, just type light and it will find it!
 - `ALT+SHIFT+.` will select the next occurance of the highlighted word/token, place before a comma to grab next comma etc. (I changed my hotkeys to use CTRL+D since VSCode uses CTRL+D)
