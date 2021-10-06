# VIM

## Some Basics

First this is a "mode" editor, meaning you need to pay attention to what "mode" you are IN. Use `i` to enter the _insert_ mode which allows fairly normal text editing. The default mode is _command_ mode that you press `escape` from insert to get into. Apparently there is also a _visual_ mode for selecting things.

**To save and quit:**
- First escape insert mode `escape`
- Then enter the command `:wq` to save, then quit.

**To save and continue working:**
- First escape insert mode: `escape`
- Then enter command `:w` to save
- Re-enter insert mode with `i`

**Jump back to terminal temporarily:**
 <BR>_Without losing undo buffers and everything_
- CTRL-Z _(places vim, or other executable into background)
- Do your commands
- Run command `fg` to switch back.

## Additional Fun

VIM commands act somewhat like verb on noun, so `dw` will delete word: `d` to delete, and `w` for word. `dd` will `delete` a `line` **NOTE:** deleting something also seems to copy it. Which can be pasted with `p` or `SHIFT-P` after/before cursor.

## Learning Day (Community Reward)

- Used this cheat sheet: http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html
	Hello world this is vim day, welcome to the Very Intense Migraine.

## Navigation
- j and k go down and up.
- h and l go left and right.
- $ goes to the end of line.
- ^/0 goes the the beginning of line.
- W/w go to next words, W to next to space.
- B/b go to previous words,
- % will go to the opposite bracket.

## Useful Options / Setup

:set relativenumber
:set number
:!command  (bang command) will run a command from vim, don't be scared of temporary buffer moment.
