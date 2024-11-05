# Visual Studio Code Tricks:

## Setup, just the way I like it:
Install the following extensions:
* `Todo+` by Fabio Spampinato
* `Bookmarks` by Alessandro Fragani
* `C/C++` by Microsoft
* `markdownlint` by David Anson
* `Window Colors` by Stuart Robinson
* `hexdump for VSCode` by slevesque
* `Prettify JSON` by Mohsen Azimi
* `Shader languages support for VS Code` by slevesque
* `Live Server` by Ritwick Dey

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

Press `CTRL+SHIFT+P` and type `shortcut` to change user shortcuts and use the follow
```
// Place your key bindings in this file to override the defaults
[
	{ "key": "ctrl+k ctrl+k",         "command": "bookmarks.toggle", "when": "editorFocus" },
	{ "key": "ctrl+k ctrl+n",         "command": "bookmarks.jumpToNext", "when": "editorFocus" },
]
```

## Some Good Settings

Press `CTRL+SHIFT+P` and type `settings` to get into settings then search and apply the following if desired!
- `Wrapping Indent` to `indent` or `deepindent` to help indent a wrapped line when using `ALT+Z`.

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


### Building Linux with F8 to Find Tasks

1. From a VSCode window that is ssh:rhino and opened to some project... (the ssh:rhino may? be important)
1. Use CTRL-SHIFT-P (command palette) to open Tasks: Open User Tasks, which will be system wide tasks for user.
2. Copy the contents, or some of the tasks from: https://github.com/timbeaudet/knowledge_base/blob/main/config/vscode_tasks.json
3. Use CTRL-SHIFT-B to build, and F8 to navigate the errors (good luck choosing not the first)

### Opening Files from Multiple Directories?

I'm opening files from Turtle Brains, ICE, Track Builder and Game Projects all the time, such as the various release notes etc. You can use `workbench.editor.customLabels.patterns` to customize this and shorten it without the built-in path making the tabs extra long.

```
	"workbench.editor.customLabels.patterns": {
		"**/turtle_brains/release_notes.md": "🐢Notes",
		"**/ice/release_notes.md": "🧊Notes",
		"**/track_builder/run/release_notes.md": "🚧Notes",
		"**/turtle_brains/**": "🐢${filename}.${extname}",
		"**/ice/**": "🧊${filename}.${extname}",
		"**/track_builder/**": "TRK: ${filename}.${extname}",
	}
 ```

### Some ShortCuts

- Middle-Mouse Button will close the tab without pressing the [x].
- CTRL+ALT+UP and CTRL+ALT+DOWN arrows will allow multi cursor creation.

## Extra Control for Extensions

### markdownlint

- Disable linting in current file by pressing F1 and typing "toggle"  (in full you want to `markdownlint.toggleLinting` which effects only present file.)

## Solutions to some issues.

- Issue: Too many files for filewatcher.
	- Solution: Add "file.watcherExclude": { "directory/\*\*": true, ... } to settings.json.
	- Solution: Close some VSCode instances, the watchers appear to be system limited, not app limited.
