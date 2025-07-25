
The three monitors being reported as one creates a very wide aspect ratio and some games don't handle this well because one of the options in Unity canvas will zoom in significantly. I imagine this is also a prominent issue with these games even on a more typical super/ultra wide monitor without nVidia Surround. This is definitely a thing games need to support these days. Test your game.

With Unity games we might be able to right-click, properties in Steam and add the following (some or all) to the Launch Options to 
`-screen-height 1080 -screen-width 1920 -screen-fullscreen 0 -popupwindow -monitor 2`

Here are more options in case needed: https://docs.unity3d.com/6000.1/Documentation/Manual/PlayerCommandLineArguments.html
