# Objectives for Today 2024-01-09

### Time Block 1: (6am - 9am ish)
- Jumping back into the Blender exporter!
- Dig into and fix the bone matrices from an armature, shake says maybe Blender stores them as Y up coordinate space.

### Time Block 2: (9am - 12pm ish)
- Bones didn't have a matrix_world so we need to compute boneToWorld (it is actually almost certainly boneToRoot that we want)
- Save key frames at the animation framerate by sampling each frame in order to use Blenders animation curves.

### Time Block 3: (12pm - 3pm ish)
- Jump back into ICE engine and start playing with the animation controller and other codes.
- Will need to make decisions on whether we exporter boneToRoot or boneToParent matrices, answer depends on anim controller API
  - Can we have a SetBoneToParent() while otherwise using all the boneToRoots? I think we did in the tbCore::Node 

## Events / Notices / Coming Soon

- February 4th: Business Review of January 2024
- February 5th: Collecting the Racing Games on Steam in January 2024
- **Buy: [Eggcelerate! to the Tropics](https://store.steampowered.com/app/1621320/Eggcelerate_to_the_Tropics/) out now!**

