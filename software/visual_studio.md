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


## Other tricks and tips
 - Search using symbols; use `CTRL+,` (jobun44)
 - Use `CTRL+K`, `CTRL+\` to remove all trailing whitespace in a file. (extension required)
 - `CTRL+SHIFT+T` can allow Visual Studio to fuzzy search for a file, so if you wanted to open ice_light.cpp, just type light and it will find it!
