# Objectives for Today 2024-10-14

- LudumDare: PainPoint: Crashed!!! Removed a string property from a Component.
		Had a component "Racetrack Information" that added a "next_track" string property. Eventually moved that to
	  another component and in doing so removed it from the "Racetrack Information" component to avoid confustion.
		Upon loading TrackBuilder after doing this, then opening a .trk that had a Node/Component with RaceTrack Info
		and the next_track property, it crashed; seemingly in the ImGui GadgetInspector, and I even saw that it had
		the whole next_track field... so perhaps something with apply/remove prefab?  It only crashes once the
		racetrack / bad object was clicked on.

    The Code crashed in
		DynamicStructure(const DynStruct& other) with a bad mValueType (messed up data, or something... maybe loading
		a track file gets disrupted somehow?? Seems unlikely... but also the data was messed up)

    It appears to be something with an override, and I say this because I was able to put the component property
		back and then proceeded to remove any overrides, removed the property from the component and reloaded just
		fine.

Among other Track Builder painpoints from LudumDare 56 weekend.

## Events / Notices / Coming Soon

- October 26-27th: DevOrDie Competition (game jam)
- October 31st: Halloween / ??Carve a Pumpkin??
