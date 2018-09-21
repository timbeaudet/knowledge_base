# Adobe Photoshop Tricks:

## Setup (the way it should be)
- When setting up Photoshop "for first time" do this to have normal undo/redo.
  1. Window > Workspace > Keyboard shortcuts & Menus > Shortcuts
  2. Set "Step Backward" to Ctrl+Z
  3. Set "Undo/Redo" to Alt+Ctrl+Z
  4. Ensure "Step Foreward" is set to Shift+Ctrl+Z
- Bamboo tablet had issues with small strokes causing brush selector, a circle fills in and requires a not-so minimumal amount of movement to cancel.
  > Loads of threads stated to disable `Press and hold` inside the Windows 10 `Pen & Windows Ink`. Some stated to disable `Windows Ink` option from within the Bamboo preferences (Pen > Mappings > Use Windows Ink) which worked but destroyed pressure sensitivity.

  1. Open `Control Panel` > Hardware and Sound > Pen and Touch > Change tablet pen settings.
  2. Double click `Press and hold` action.
  3. Uncheck the box for `Enable press and hold for right-clicking`.

  > In case it matters, I also had `Double-click`, and `Press and hold` set to Nothing from Pen & Windows Ink settings.


## Setting up a color palette
1. Delete each color swatch from the current palette.  
(_This involved painfully right-clicking each color, choosing delete, accepting._)  
Feel free to use the [black_and_white.aco](../config/adobe_photoshop/black_and_white.aco)
2. Sample a color from the image  
_or_ click color tab and select your desired color.
3. Add the color to the swatches palette.  
Click in the empty area of swatches palette to add the color.
4. When done adding colors, save the set in the swatch palette hamburg menu, `Save Swatches`

> Loading a swatch palette with `Load Swatches...` seems to append to the present palette so it may be desirable to use `Replace Swatches...` instead.

## Tools and Usage

### Brush Tool:
- Hotkey: `b`
- Purpose: Paint all over the canvas with pen.
	- Holding `alt` will change temporarily to color picker, eye dropper.

## Random Useful Hotkeys / Uses
- Deselect anything select with `CTRL+D`
- Move the current layer up or down in layer list with `CTRL+[` or `CTRL+]`

## Random Tips
- Window > Workspace > Keyboard shortcuts & Menus > Menus - this allows you to color the menu items which could make things easier to find.
- If accidental bad tolerance, place a layer underneath and paint with the background color, then merge down
- Check / Uncheck "Auto-Select" for the movement tool. Option is on the top of the canvas area _(in movement tool)_.
	> When enabled Photoshop seems to auto-guess what layer you want to move around.
- If hex color is not an option in the color panel, change the image to 8bits/channel.
