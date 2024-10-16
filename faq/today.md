# Objectives for Today 2024-10-14

☐ LudumDare: PainPoint: Found spawn point kept resetting when modifying default.trk
  I think this is prefabs within prefabs, racetrack had a prefab spawn point - and it might even involve
  modifying the racetrack prefab (I changed a Track Name poperty); but moving the spawnpoint and saving will
  work, then reopen make changes to that racetrack property and save and I think it moves back to OG position?
☐ LudumDare: PainPoint: A SplineMesh component added to Prefab re-enabled itself?
  https://www.twitch.tv/timbeaudet/clip/AssiduousFrailWhaleKeepo-PVpMMLxynJCv8SuQ
 
  Seems to be ApplyToPrefab automatically enabled a disabled component. I'm pretty sure we discovered that the
  component active state is not overrideable, or even really saved/loaded properly. I think it follows the
  same type of issue Node active/name/transform state had before the NodeComponent refactor.
  ☐ 2024-10-06: LudumDare: PainPoint: Can't apply/revert active state of component to a prefab.
    This isn't a property, so that makes some sense, but yup... where else would that data get saved?

☐ LudumDare: PainPoint: Single Node Prefabs don't keep rotation/scale when Instantiating.
  I had added a BoxCollider to a "finish_zone" node. Which was then modified by quickly scaling the node rather
  than editing the Size/Center of the BoxCollider. This was all good until I made it a prefab object. Then 
  adding the prefab broked because the Prefab RootNode wipes out the scale/rotation/translation (IE Identity...)
  Perhaps we need to keep scale only? That seems odd.

  Hey, guess what. This happened again... This time I added Mesh, scaled up the Node and made a prefab but
  placing that prefab killed scale. Worked around by adding a mesh node which got scaled up.

  I believe the solution here is to force prefabs to have/used a "root node" that somehow gets removed on
  instantiation? The rootNode would always be at origin, the other node then keeps rotation/scale. Possibly
  a different way to look/solve it might be to simply SetPosition(Origin) versus SetIdentity(). This should
  probably have a unit test since it is the desired work flow model.

☐ PainPoint: Prefabs probably need to save with a Root node (breaking format)
  This is almost certainly how we should be solving the "scaled/rotated" issue listed in another painpoint
  where I tried having scale applied to a object and then instantiating the prefab reset the scale/rotation

Among other Track Builder painpoints from LudumDare 56 weekend.

## Events / Notices / Coming Soon

- October 26-27th: DevOrDie Competition (game jam)
- October 31st: Halloween / ??Carve a Pumpkin??
