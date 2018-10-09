# Adobe Photoshop Tricks:

## Setup (the way it should be)
- When setting up Photoshop "for first time" do this to have normal undo/redo.
  1. Window > Workspace > Keyboard shortcuts & Menus > Shortcuts
  2. Set "Edit > Step Backward" to `CTRL+Z`
  3. Set "Edit > Undo/Redo" to `ALT+CTRL+Z`
  4. Ensure "Edit > Step Forward" is set to `SHIFT+CTRL+Z`
  5. Set "Layer > Video Layers> Duplicate Frame to `ALT+CTRL+D`

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
- Hotkey: `B`
- Purpose: Paint all over the canvas with pen.
	- Holding `ALT` will change temporarily to color picker, eye dropper.

### Eraser Tool:
- Hotkey: `E`
- Purpose: To remove the paint on the current layer, making it transparent.

### Color Swap:
- Hotkey `X`
- Purpose: Toggle between two different colors. Select the first color, press `X`, then select the second color.

### Move Tool:
- Hotkey: `V`
- Purpose: Move the selection or layer around the canvas.
- Holding `ALT` will duplicate the layer and move the duplicate. If there was a selection, it duplicates the selection adding it to current layer.v

### Lasso Select Tool: (is your friend)
- Hotkey `L`
- Purpose: Create a selection for edits / movement using a custom shape, this is great with a tablet.
- Holding `ALT` while using with selection will remove the new looped area from the existing selection.
- Holding `SHIFT` while using will add the new looped area to the current selection.

## Playing with Layers
- Create a new layer with `CTRL+SHIFT+N` this will create a layer above the currently selected layer.
- Change selected layer to the layer below with `ALT+[` or use `ALT+]` for the layer above.
- Move selected layer back with `CTRL+[` or use `CTRL+]` to move it forward on the stack.
- `SHIFT+CTRL+[` or `SHIFT+CTRL+]` will move the selected to be the back or front most layer.
- To merge a layer down to the layer below use `CTRL-ALT-E` and then press `delete`, effectively the first shortcut appears to keep the original layer, but places its contents on the layer below like merge down.


## Random Useful Hotkeys / Uses
- Deselect anything select with `CTRL+D`
- `CTRL+SHIFT+V` will paste on top.
- Pressing `ALT` v

## Random Tips
- Window > Workspace > Keyboard shortcuts & Menus > Menus - this allows you to color the menu items which could make things easier to find.
- If accidental bad tolerance, place a layer underneath and paint with the background color, then merge down
- Check / Uncheck "Auto-Select" for the movement tool. Option is on the top of the canvas area _(in movement tool)_.
	> When enabled Photoshop seems to auto-guess what layer you want to move around.
- If hex color is not an option in the color panel, change the image to 8bits/channel.
- To change the color of something, select the color and use **_Image > Adjustments > Hue / Saturation_** `CTRL+U` and change the hue. Seemed to work great when the color was alone, as in the rest of the active was transparent.
- To toggle the visibility of the guides (hide and show without deleting) use `CTRL+;` (or macOS `CMD+;`)

## Using Smart Objects to Control Guides

I had found that I needed a lot of guides on a piece, that were conflicting with each other, like having a backdrop and a sprite-sheet on the same image. To fix this I used a smart object for the sprite - could also use a smart object for backdrop area.

After having create a layer group `sprite_sheet` and adding a `View > Guide Layout` for the size of the sprites:

1. Right-click the `sprite_sheet` layer group and choose `Convert to Smart Object`
2. On the main sheet remove the guides from the sprite sheet layout.
3. Double-click on the smart object thumbnail view to open and use.
4. Close it (save changes, this is separate object in the file?) the original document will update.

Note: This process may be even better (untested) by simply creating the sprite_sheet as a smart object before adding the guide layout.


## References:
- [Layer Shortcuts](https://www.sitepoint.com/speed-up-your-photoshop-work-with-layer-shortcuts/)
