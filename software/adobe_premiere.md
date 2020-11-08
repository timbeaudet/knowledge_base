# Adobe Premiere:
- Click on timeline and press F to see the source of the clip highlighted by time cursor lock/unlock channels to delete audio or just video, (or context menu: unlink)


## Adding Large Photos with Motion

**Syncronizing Audio with Video Clip**

When the frame drops do not have enough precision to work with you can Right-click on the time-ruler at the top of the timeline and choose "Show Audio Time Units" which will allow dragging the audio around with more precision.

**Resizing the image**

1. To rescale the image close to the size of the video frame, right-click on the image clip, _inside the time-line_, and choose `Scale to Frame Size`.
2. In the preview window, double clicking the image allows further manipulation of size and placement.

**Adding Motion Effect** 

1. Ensure the top panel is in "Effects" editing mode.
2. Double-click the image clip, _from time-line_, and open the effect panel on the left.
3. Place the picture where you want it to start, and add a position keyframe at the staart of the effect timeline.
4. Move the effect timeline to the end of the clip and move the image to the final location.

**Stretching a Clip by Adjusting Playback Speed**

1. Cut the start and end of the clip to get the bit you want.
2. Place the start of the clip where it should start in the video.
3. User `r` to Rate Stretch the clip and adjust the end position.

**Removing the Mouse from Gameplay Footage**

1. Pray the mouse did not move in your shot, otherwise, repeat a lot?
2. In the project panel find the timeline and drag to new item icon (left of trashcan at the bottom of that panel.)
3. Enter the timeline for the new copy.
4. Copy the video channel and place above.
5. Use the Effects tab (in Project panel?) to search for Crop and apply to the top video channel.
6. Effect Controls tab to modify the crop area to be NEXT to/ near the mouse.
7. Move the crop to cover the mouse.
8. Return to original timeline for editing.

**Timeline Editing of Clips**

- To cut across all lanes, use SHIFT when clicking the cut tool.
- `SHIFT+DELETE` will ripple delete the clips, bringing future reel backwards. (if all lanes are selected) 

**Efficientest Workflow: Cutting of Clips**
1. Start playing clip.
2. If you didn't like what you just saw, use `Q` to ripple delete from playhead to start of clip. _(Do NOT press `CTRL+K` first)_
3. If you know nothing else in that clip is desired, use `W` to forward ripple delete to end of clip. _(Do NOT press `CTRL+K` first)_

**OLD 'Efficient' Workflow: Cutting of Clips**

1. Cut at the location of the playhead use `CTRL+K` (which may need the cut tool selected)
2. Press left arrow to move the playhead back to previous clip.
3. Press `D` to select the clip under the playhead.
4. Press `SHIFT+DELETE` to ripple delete the select clip and remove space it would create.

**ISSUE: Corrupted MP4 when Camera didn't change anything**

Not sure how this became an issue, but Premiere was complaining of corrupt/incompatible format. The video could be opened in media player.
I used `ffprobe` on hippo to ensure it was still h264 (it was)
To fix: `ffmpeg -i ./input_file.mp4 -c:a copy -c:v h264_nvenc -b:v 100M output_filename.mp4` on falcon to use GPU powah!


**Random Tips**

- With the Cut tool (`C`) use `CTRL+K` to slice at the playhead location.
- Use `~` with preview selected to maximize the panel for larger viewing.
- You can BOX SELECT the keyframes in the effect controls panel, makes easy to move around.

[Premiere Hotkeys](https://helpx.adobe.com/premiere-pro/using/default-keyboard-shortcuts.html)

