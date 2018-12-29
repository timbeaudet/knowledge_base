# OBS

## Setting it up just the way I like

Import the [scene collections](../config/obs_gamedev_scenes.json) for gamedev streaming.

### Output for Streaming

- Streaming at video bitrate of 2000
- Hardware (NVENC) encoder
- Audio bitrate 128
- Enable Advanced Encoder Settings [on]
- Enforce streaming services bitrate limits [on]

### Audio / Video

- Audio Sample Rate: 44.1khz
- Audio Channels: Stereo
- Audio All devices Disabled and added to scenes manually.
- Video Base (Canvas) Resolution: 1920x1080
- Video Output (Scaled) Resolution: 1536x864
- Video Downscale Filter: Lanczos (Sharpened scaling, 32 samples)
- Video Common FPS Values: 30

## Resizing / Cropping a Source

- Hold ALT and drag a corner to automatically crop the source in a specific scene.
- Using a Filter (Crop/Pad) on a source will crop all instances of a source globally; in all scenes.
