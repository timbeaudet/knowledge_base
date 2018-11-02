# Blender Tricks:
> Nearly all this help comes from (shakesoda) or (ZaCkOX1000)


## Techniques

### Using Mirror Modifier on Cylinder (with ngon caps)

1. Use `z` to see transparently.
2. Lock view to axis with numpad buttons.
3. Select and delete half of the shape.
4. Click on the end cap, press `y` to split the polygon then `w` menu to use symmetrize.
5. Delete half of the shape.
6. Remove doubles with `a` to select, `w` menu to use `remove doubles`
7. Repeat for other cap and mirror modify the shape.

### Make selection fall on a plane

1. Set orientation to 'Normal' mode, (as opposed to Global)
2. Select the faces that should remain planar.
3. Press `s` to scale.
4. Press `z` then `z` to scale along z-normal axis.
5. Press `0` to set that scale to zero.

> Note this can't fix the issue of quads turning in multiple axis, (like a racetrack turning while changing elevation pitch.).

### Make something symmetric (without mirror modifier)

1. Make selection.
2. `w` menu `symmetrize`
3. Use the tool menu to specify direction/threshold

## Edit Mode Tool and Usage Tips

### Modes
- Hotkey: `CTRL+TAB` with `v` for vertices, `e` for edges and `f` for faces.
- Purpose: Change between what gets selected or modified during edit mode manipulators like grab, scale, rotate etc.
- **NOTE:** Edit in multiple modes, at the same time by shift-select the modes (_vertices, edges, faces_) on the bottom panel.

### Selecting Things

> No setup notes yet, but I believe the default is not left click select, which is used in the following section.

- Left click to select an individual _(vertex, edge or face)_.
- `ALT+LMB` to loop select (when built properly)
- `CTRL+NUMPAD+` or `CTRL+NUMPAD-` to extend/decrease loop selections.
- Press `L` to select the entire linked area under the mouse, or `CTRL+L` to select entire linked area to current selection.
- Use `SHIFT+G` to perform all sorts of neat selection tricks related to something already selected. This tool has options (bottom-left) to modify.

### Unformatted mess:
	alm-m to merge vertices.
	'c' to use circle select, to left-click/paint selection (shift to unselect paint area)
	ctrl-mouse (RMB) to lasso select
	'g, g' to use edge slide to slide an edge along the face
	button-to right of face select mode button can be used to select things on the other side. (ghost thingy)
	bevel tool: ctrl-b, use scroll wheel for more loops
	alt-s to scale along normals (or shrink/fatten in words of (shakesoda)

	Use period to put the origin/scale/things with the cursor as the hotspot.
	Use comma to put the origin/scale/things to the selection.

	Proportional Edit Mode
	alt-o to enter/exit proportional edit mode
	Check the area of influence (use scroll wheel)

	- **Hide everything except selection**
		Press `numpad /`
	- **Show / Hide everything in a fake-empty-group**
		Hold CTRL while clicking eye-ball icon.

	- **Split a mesh into smaller parts**
		In edit mode, select the parts/faces desired in the new part
		then press `p` and use `selection` to break it apart into a new mesh.

	- **Joining two meshes together, with same surface loops**
		In object mode, select the meshes to be joined.
		Press `ctrl-j` to join them into a single mesh.
		In edit mode, select the edges of the two peices to be combined and bridge
			Bridge via space 'bridge' or `w` menu `e` ... also or ... `ctrl-e` menu `l`

	- Snapping to various things
		Bottom right of 3D view has 'closest' next to that is a mode, vertex, edge, increment etc.
		Grab item to move to snapped location, lock in axis if needed,
		Hover thgy

	Working with Materials:
		Don't hit [+] New unless a new material is required, use the ball next to it to select a material.
		To delete a material from that list: 

	ctrl-x to dissolve an edge loop (or other things) S
	shift-k in vertex paint mode to fill
	v is a hotkey to go to vertex paint/to object mode

	shift-f free move (fps) camera can use LEFT-CLICK to set the view and return to edit.
	shift-f1 to open/copy an object/something from one blend file into current.

	select, then scale 0 on the Z (or other axis) to create a flat spot)
	hit axis key a second time (g, x, x) to move along normal

	ctrl numpad +/- to increase/decrease selections
	to slice a model- 'a' to select all, then use 'bisect' (select fill, clear inner/outer to taste)
	knife tool 'k' to create new 
	While in color mode, use s to sample the color under cursor. (perhaps just UV/Image editor?)

	m to move an object from one layer to another.


	☐ Mesh cleanup, remove doubles with:
		In edit-mode, select all `a` then
		`w` menu `r` for remove doubles

	☐ `Copy a mesh`
		Do NOT use ctrl-c/ctrl-v (shakesoda says this litters the file with junk; as in
		it also duplicates the materials and stuff.)
		☐ Use `alt-d` to link and share same object data
		☐ Use `shift-d` to duplicate the mesh without sharing.


	☐ Splitting a curve into multiple segments
		Select both nodes that should be split, press `w` then `s` to subdivide.

	Select child object first, then parent next and hit ctrl-P to link.

	☐ `Playing with the 3D Cursor`s
	alt-home centers the rotation to 3d cursor

	☐ `Extrude along perpendicular`
	Select the edge, `e` to extrude, `escape` to cancel movement, `alt-s` to move along normal.

	tab to edit mode
	grab the bottom edge (or desired rotation point)
	shift-s cursor to selected
	period (regular keyboard) to switch 3D cursor pivot   (comma to set back to average)
	tab to object mode
	rotate etc

	`Permanently change center point in object mode to move origin to geometry or cursor`
	ctrl-alt-shift-c

	EXPORTING LEVEL:
		DO NOT SAVE DURING THIS PROCESS
		box-select all tiles/objects
		relations tab on T menu: make local (all)
		box-select all tiles/objects (again)
		ctrl-shift-a (make duplicates real)
		relations tab on T menu: make single user (check option for "object data")
		Apply transforms
		Export
		DO NOT SAVE
		File > Revert


	Color palette:
		https://puu.sh/BcZLm/b148cf14df.png File >preferences >File,
		set textures directory if not already.
		Then go open C:\Program Files\Blender Foundation\Blender\2.79\scripts\addons\paint_palette.py 
			insert in to line 110 "searchpaths=[bpy.context.user_preferences.filepaths.texture_directory]"
			save it.
		Back to preferences in blender Add-on tab,
			search paint,
			and enable pallet
		finally migrate you pallet to the other pallet using the eye dropper in the colour picker.
