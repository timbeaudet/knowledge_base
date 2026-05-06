# Making a Bushy Tree

**Blender 4.5.3**

First time ever using the particle system in Blender, so this was fun.

1. Create a leaf or branch texture, I used 128x128 with a 4px Hard Round brush and drew random leaf like shapes.
2. Create a plane and put the leaves texture on it, optionally loop-cut and give it some flair.
3. Create a general shape, could be of a tree with branches, or just a bulb for a bush.
4. Optional? Paint Weights, so that the branches would be red and lower trunk to be blue (don't forget to select and apply to a group, GL)
5. Click on Particles, + one, Hair, and check advanced [x]
6. Emission > Number > to 100 to start, then up/down as you see fit
7. In the Render area, choose Render As [Object] and select the Leaf object
8. Optional? If you painted weights into a group, you can use those weights as a Density

Other options that might be worth playing with are:

- Rotation (if you can't find it, you need to checked advanced)
- Rotation: Orientation Axis, Randomize, Phase and Random Phase are all useful.
- Emission: Number is also useful
- Probably other things.

Once the tree is exactly as you want... you can get it into Internal Combustion by...

1. In Object Mode, select your tree, and look at modifiers.
2. Choose `Make Instances Real` on the ParticleSystem.
3. Select all the parts and the trunk last and join together with `CTRL+J`
4. Export like normal. (kinda... this may need "leaves" and "trunk" as separate objects for texture etc).
