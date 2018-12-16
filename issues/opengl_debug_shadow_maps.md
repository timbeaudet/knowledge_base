# Failure to Debug Shadow Maps

I was attempting to render sprites of each of the Shadow Map Cascades. This was using TurtleBrains sprite rendering and a shader specific to that. However the issue is that attempting to `glBindTexture(CascadeDepthTexture);` is wrong and undefined as per:

> If a texture has a depth or depth-stencil image format and has the depth comparison activated, it cannot be used with a normal sampler. Attempting to do so results in undefined behavior. Such textures must be used with a shadow sampler. This type changes the texture lookup functions (see below), adding an additional component to the textures' usual texture coordinate vector. This extra value is used to compare against the value sampled from the texture. [khronos.org](https://www.khronos.org/opengl/wiki/Sampler_(GLSL))





New project from ice/turtlebrains (3D) template project has intellisense issues as well as build time stamp issues:

### Symptoms:
- The texture remained completely RED with zero adjustments. _(This is undefined behavior, so results may vary)_

### Expected:
- To see a small sprite version of the shadow map layer on screen, in 2D space, for debugging.

### What has been Tried:
- Changing the color via various swizzle/swap matrices.

### Solution(s):

1. One could find a way to copy pixels from the D16 (DEPTH16) texture of the shadow map into an ARGB formatted texture and then render that out as the sprite.
2. One could use the RenderTarget as COLOR_AND_DEPTH in TurtleBrains and bind the color texture normally, this perhaps isn't -amazing- but should show what the light sees.
