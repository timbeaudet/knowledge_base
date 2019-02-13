# Visual Studio Code Tricks:

## Setup, just the way I like it:
Install the following extensions:
* `Todo+` by Fabio Spampinato
* `Bookmarks` by Alessandro Fragani
* `C/C++` by Microsoft
* `markdownlint` by David Anson

Press `CTRL+,` to open settings and use the following
```
"editor.tabSize": 4,
"editor.insertSpaces": false,
"editor.renderWhitespace": "all",

"todo.timekeeping.started.format": "YYYYMMDD HH:mm", // Format used for displaying time inside @started
"todo.timekeeping.finished.format": "YYYYMMDD HH:mm", // Format used for displaying time inside @done/cancelled
"todo.colors.done": "#2b8b2c",
"todo.colors.cancelled": "#a12525",
"todo.colors.project": "#02d6ff",

"liveServer.settings.donotShowInfoMsg": true,
"workbench.sideBar.location": "right",

"files.insertFinalNewline": true
```

## Fun tips for usage
- Convert Indentation To Tabs from F1/command palette (jobun44)
- To commit all changes or staged changes just type message in the field below SOURCE CONTROL: SVN and hit `Shift+Enter` (jobun44)
- Edit all text that matches selection, `CTRL+F2`
- Open file in a split view, `CTRL+LeftClick` (jobun44)
- Multiline edit: `CTRL+ALT+ up/down` arrows (jobun44)
- Just write a comment (in html) and `CTRL+/` (cicero743)
- `CTRL+R` will open a recent file or project with typable find.
- Use markdown preview `CTRL+K V` to monitor md changes.
- `CTRL+SHIFT+O` will search for symbols or something special, better than `CTRL+F`
- There is a refresh button above tree view, in event it doesn't auto refresh press this button instead of reloading.


### Change Line Endings
Bottom right of status bar click on `LF` or `CRLF`, this will bring up (near top) a menu to change.  
It appears this setting may be per folder.
