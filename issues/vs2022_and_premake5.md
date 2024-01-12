# Visual Studio 2022 not building after first successful build

I was being force to clean rebuild to apply changes to Snailed It! when just barely starting. Turns out the issue stemmed from adding `externalincludedirs` in the premake5 lua script which was added to fix XCode header includes with <angle_brackets>. If this `externaincludedirs` contains the regular source/headers then it seems Visual Studio throws a fit, doesn't detect the changes. I'm guessing from mechanism where it doesn't watch the external directories, makes some sense.
