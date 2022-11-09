# Creating an Icon for Steam Games

1. Create a 184x184 image that will be recognizable down to 16x16!  Save as both `.png` and `.jpg`.
2. Convert the `.png` to an `.ico` for Windows use, [freeconvert](https://www.freeconvert.com/png-to-ico).
3. Create a `linux_icon` folder and make several copies of the png
   - `16x16.png`, `24x24.png`, `32x32.png`, `48x48.png`, `64x64.png`, and `96x96.png`
   - Resize each of the images as necessary.
4. Create an `macos_icon.iconset` folder and make several copies of the png
   - `16x16.png`, `32x32.png`, `128x128.png`, `256x256.png`, and `512x512.png`
   - Also: `16x16@2x.png`, `32x32@2x.png`, `128x128@2x.png`, and `256x256@2x.png`
   - Resize each of the images as necessary.
   - Run the command `iconutil -c icns macos_icon.iconset` to get the icns.
