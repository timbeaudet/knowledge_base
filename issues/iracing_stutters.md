
# 2025/2026 iRacing Stutters

Since mid to late 2024 iRacing has been stuttering at random times for me. Sometimes it will work fine for an hour or two and other times it is every corner of every lap... I absolutely feel the setup I have should be capable of running iRacing with cockpit mirrors but that _appears_ to be the major culprit, somewhat confirmed by the testing on 2026-03-04. 


## 2026-03-04

The AMD card was removed, only 3 monitors plugged in, only keyboard, mouse, and wheel added for USB with no hubs, cameras or anything extra. Fresh restart of the machine with only nVidia, Steam (because iRacing starts it), Windows alert (ignoring) and Sound Blaster in the system tray. Was not running OBS or anything more than [popout/chat](https://www.twitch.tv/popout/timbeaudet/chat) and task manager... Turned `on` resizable bar in bios; it was off. Then proceeded to renamed the `Documents/iRacing` folder to back it up and redo from scratch... Attempted to Settings -> Run Graphics Config, but this didn't work at all. Started the a test session and it ran this automatically, which setup as `Class 1: Max Quality` and would get 100-120 fps, blue bars about 30%.

Then changing only virtual mirror to off, and cockpit mirrors to 3 (for side mirrors) and the results dropped to 65-100, typically blue bars at 60% and sometimes yellow R/G.

After that discovery we tried adding the top monitors again, center through nVidia and top-wing monitors through Intel Integrated with no change in performance, with or without cockpit/virtual mirrors.

Later I also plugged in the Yeti mic and started a bare bones OBS scene streaming live, which also didn't meaningfully change the performance. Actually for nearly an hour I was running **without** issues, even when using the cockpit mirrors, until [a massive 250ms to 500ms stutter](https://www.twitch.tv/trailingbrakes/clip/ApatheticAttractiveDogeCharlieBitMe-rDw7PmpUVnv12Flg?) with cockpit mirrors. After that I went back to virtual mirrors to see if it would happen again without, and never saw that happen in the ~5-10 minutes until my internet dropped (more testing needed).

Still need to try plugging in other USB items, stream deck, etc, the AMD card probably has no performance issue either...

So we had 581.80 which was not the latest driver to begin with, then from dudezords recommendation went with 595.71. This 


## 2026-02-09
Used System > Display > Graphics Sttings, to change iRacing to 3070 and OBS to AMD card.
	This may require a restart of both apps etc, and may punt OBS off nvenc encoding...
	nothingbout says this setting may not affect GPU for encoding, and may only be related to how app renders itself.


### Ideas to Try (feel free to submit ideas)

simunaut:
  - Physically remove AMD GPU
  - 3 monitors only
  - Run Graphics Config to reset all config
  - No mirrors
  - Install and run [latencyMon](https://www.resplendence.com/latencymon) useful to diagnose latency by dodgy USB.

dudezord:
 - Use Display Driver Uninstaller (DDU) to remove and reinstall nVidia (this clears internal data, and regedit)

ikiwixz:
- Don't install latest ??? version ??? of GPU drivers.

-------

