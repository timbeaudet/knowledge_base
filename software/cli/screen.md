# Screen

Screen allows you to run things in the background and come back to them easier. You can even name the screens to make it easier to return to.

## Super Basics

- Use the command `screen` to start a session.
- Within a session you can use `CTRL+A, D` to detach.
- Within a session you can use `CTRL+D` or the `exit` command to quit the session.

## Extra Basics

- To create a named session use: `screen -S name_of_session`
- To see all the screens that are running: `screen -ls`
- To attach or use a running session: `screen -r name_of_session` or `screen -r session_id`
- To force detach everyone else and attach: `screen -rD name_of_session`
- To share the screen with who ever is attached: `screen -x`
