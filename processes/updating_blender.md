# Updating Blender

Blender scripts are found inside `AppData\Roaming\Blender Foundation\Blender\2.82\scripts\addons` where 2.82 can be replaced with the newer Blender version.  To update open a CMD prompt in the new directory then run the following to create symlinks to the exporter repositories.

**NOTE: Make sure to goto scipts\addons**
_There are two addons directories..._

```
MKLINK /J ice_exporter C:\development\undefined\ice_exporter
MKLINK /J track_data_exporter C:\development\undefined\track_data_exporter
MKLINK /J game_exporter C:\development\undefined\game_exporter
```

Also may want to copy `screencastkeys` and any other addons from the previous version.

May also need to update the script/add-on to support the Blender version.

Once in the export menu, can assign a short cut like `CTRL+SHIFT+E`
