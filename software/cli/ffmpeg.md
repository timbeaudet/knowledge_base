# FFMPEG Stuffs

### Convert from one file type to another
(Used to load an animation render from Blender into Premiere Pro

`ffmpeg -i file.mkv output_file.mp4`

### Create a Longer Looping Video
(Currently tested)

`ffmpeg -stream_loop 10 -i file.mp4 -c copy output_loop.mp4`

## Other Notes

- `-c` keep the same audio and video codex
- `-c:v` or `-c:a` for just video or audio.
