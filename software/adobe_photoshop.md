# Adobe Photoshop Tricks:

## Setup (the way it should be)
- When setting up Photoshop "for first time" do this to have normal undo/redo.
  0. Window > Workspace > Keyboard shortcuts & Menus > Shortcuts
  1. Set "Edit > Step Backward" to `CTRL+Z`
  2. Set "Edit > Undo/Redo" to `ALT+CTRL+Z`
  3. Ensure "Edit > Step Forward" is set to `SHIFT+CTRL+Z`
  4. Set "Layer > Video Layers> Duplicate Frame to `ALT+CTRL+D`

- Install the [Spritesheet Generator](https://github.com/bogdanrybak/spritesheet-generator) to be able to create animations.
  - If the link is down use [our copy](../config/adobe_photoshop/spritesheet_generator.jsx).
  - Save the file in:
	 - **Windows** - `C:\Program Files\Adobe\Your photoshop version\Presets\Scripts`
	 - **Mac** - `Applications/Your photoshop version/Presets/Scripts`

- Bamboo tablet had issues with small strokes causing brush selector, a circle fills in and requires a not-so minimumal amount of movement to cancel.
  > Loads of threads stated to disable `Press and hold` inside the Windows 10 `Pen & Windows Ink`. Some stated to disable `Windows Ink` option from within the Bamboo preferences (Pen > Mappings > Use Windows Ink) which worked but destroyed pressure sensitivity.

  0. Open `Control Panel` > Hardware and Sound > Pen and Touch > Change tablet pen settings.
  1. Double click `Press and hold` action.
  2. Uncheck the box for `Enable press and hold for right-clicking`.

  > In case it matters, I also had `Double-click`, and `Press and hold` set to Nothing from Pen & Windows Ink settings.
- Photoshop / Bamboo tablet had another issue where small U or V type strokes could close the loop in an odd-ball, unexpected fashion. The fix [described here](https://forums.adobe.com/thread/1863501) is the following:

  0. Close Photoshop.
  1. Create a new text document with the contents `UseSystemStylus 0`
  2. Save that document to `%APPDATA%\Adobe\Adobe Photoshop CC 2018\Adobe Photoshop CC 2018 Settings\PSUserConfig.txt`
  3. Reopen Photoshop and hope it worked.

## Setting up a color palette
0. Delete each color swatch from the current palette.  
(_This involved painfully right-clicking each color, choosing delete, accepting._)  
Feel free to use the [black_and_white.aco](../config/adobe_photoshop/black_and_white.aco)
1. Sample a color from the image  
_or_ click color tab and select your desired color.
2. Add the color to the swatches palette.  
Click in the empty area of swatches palette to add the color.
3. When done adding colors, save the set in the swatch palette hamburg menu, `Save Swatches`

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
- Holding `ALT` will duplicate the layer and move the duplicate. If there was a selection, it duplicates the selection adding it to current layer.
- Pressing `1` through `9` will set the current layer opacity from 10% to 90% respectively, and pressing `0` will set opacity to 100%.

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

## Techniques

### Creating an Alpha Channel
> This is used when you have an image that contains blackness where you want transparency.
1. `CTRL+A` to select all of the layer.
2. `CTRL+C` to copy the layer contents.
3. Create a new layer, fill white.
4. On the white layer, click "Add Layer Mask" at the bottom of the Layers panel.
5. Go to Channels tab of Layer panel, select all `CTRL+A` and paste the contents, `CTRL+V`.

### Creating Outlined Font with Transparent Center
> This was used for Eggcelerate! to the Tropics store/keymailer pages to have a nice bubbly font.
1. Open the Layer Style for the Text object (same place you find/open Stroke)
2. Center screen, in Advanced Blending turn Knockout to `Shallow` and uncheck all except `Blen Clipped Layers as Group` and `Transparency Shapes Layer`
3. Slide Fill Opacity to 0%

### Cutting an area out of a layer (Knockout)
1. `CTRL+LEFT CLICK` layer preview of the layer of the cookie cutter shape, this will select all parts of that layer immediately.
2. Select > Inverse (or `CTRL+SHIFT+I`) to create the cut out selection.
3. Select the other layer that will get cut into cookie shape.
4. New Mask icon at bottom of layers panel to create the mask.

### Filling an outlined area
> This assumes one is using a seperate line-work layer (I used 4px) and color layers.
1. Use the magic wand (`W`) to select the shape(s) to fill.
	- Ensure that 'Sample All Layers' is selected in the tool options.
2. Select > Modify > Expand and increase by some pixels (I used 2px).
3. Use the fill bucket (`G`) to fill the area with the selected color.

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
- It is possible to copy stroke and other effects to other layers by using Copy Layer Style and then Paste Layer Style in context menu.

## Creating a Grid of Dots using Pattern

- Create a new file, 32x32, 64x64 or something - size not super important.
- Fill the background color, or not. (May not be necessary)
- Make a dot any where, position doesn't actually matter too much.
- Make it a pattern: Edit > Define Pattern
	- I don't know how to save this for future loading of pattern, but it doesn't.
- Back in the file you wish to have dots in, add a new layer and double click to open properties.
- Click on Pattern Overlay and the dropdown of the pattern should include your dot, select it.
- Use scale to change the grid size.
- If you are not seeing anything in the document it is because you need to fill the layer with the effect.
	- if you used a background color in the pattern, the fill color doesn't matter.

## Using Smart Objects to Control Guides

I had found that I needed a lot of guides on a piece, that were conflicting with each other, like having a backdrop and a sprite-sheet on the same image. To fix this I used a smart object for the sprite - could also use a smart object for backdrop area.

After having create a layer group `sprite_sheet` and adding a `View > Guide Layout` for the size of the sprites:

0. Right-click the `sprite_sheet` layer group and choose `Convert to Smart Object`
1. On the main sheet remove the guides from the sprite sheet layout.
2. Double-click on the smart object thumbnail view to open and use.
3. Close it (save changes, this is separate object in the file?) the original document will update.

Note: This process may be even better (untested) by simply creating the sprite_sheet as a smart object before adding the guide layout.

## Possible Issues

### Pink Lines / Slow Reaction with Control Pressed

This appears to be smart guides when the "Move" tool is selected. Simply select another tool like the brush `b` and it will go away.  
Note: When the move tool is selected, and you press control like this, it can select bottom layers.

## References:
- [Layer Shortcuts](https://www.sitepoint.com/speed-up-your-photoshop-work-with-layer-shortcuts/)
