
# iRacing is Stuttering with Present Machine

## History

I had been racing just fine with the setup 6700K and 980ti with 4 screens, 3 in surround and OBS capturing 2 webcams with the triple screen; among the other things running around in the background and overlays etc from 2015 to early 2017.

In late-2018 I added an m2 ssd to the machine and then in mid-2019 I added another graphics card (R7 240) and two additional monitors.

## The Problem

After getting back into iRacing in fall 2019 there were significant frame stutters occuring. One day a reboot appeared to have helped but in other situations it did not matter if all other applications were closed down. 2019-09-11 was the first race-night of the season and with a solid debugging session after the first race it was discovered that the 980ti was using 8x lanes of PCI express instead of all 16x that it required; even after disabling the AMD R7 240 in Device Manager.

There was an update of nVidia drivers from 431.xx to 436.30, though this did nothing to help as the underlying issue was the PCI lanes.
Having physically removed the AMD R7 240 the performance issues stopped immediately and the next race went extremely smoothly.
Note: The m2 drive also takes/requires PCI lanes, which perhaps adds to the issue.

## Possible Solutions

1. Well, obviously removing the AMD R7 240 and losing the "wing" monitors on top will fix the issue, however removes useful view.
2. It may possible that it all works perfectly fine if OBS does not capture the triple screen display at all. This could be what takes enough bandwidth that makes the card require all lanes.
3. Perhaps there is a bios setting that would allow reducing the overhead on the R7 240.
	Even if this lowered their framerate to 30fps, that would work. These are most peripheral.
