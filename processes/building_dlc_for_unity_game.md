
# Building DLC Package for Unity Game

This was the solution I found for dealing with things in Eggcelerate! for Winter Eggspansion.

1. Install the Addressable Assets package.
	Since I am using Unity 2019.4, I got Addressable Assets 1.16.19; this looks to have changed drastically in future versions.
2. Create a group for the DLC Package using Window > Asset Manager > Addressables > Groups
3. Choose the scenes or prefabs you want in the DLC package, and check the "Addressable" checkbox in inspector (right menu).
	I first attempted to change the path, as it seemed it could be any name, but this didn't actually appear to work, perhaps I had done something wrong, or didn't do it in multiple places? In the end I wound up just keeping the Asset path as it exists in the repository.
4. Add the scenes/prefabs to the DLC package group.
5. Build the DLC package in the same Addressables Groups window as before, will need to do this any time the scenes or prefabs change.

### Creating a Game Build

To build the original game you might need to clean the build in the Addressables Groups window first, alternatively the
package/deploy scripts might be able to ignore the files to do some of this automatically. This is the manual process:

- Clean the DLC Package from the Addressables Group window.
- Create the build of the game normally, this is the "original" game, _deploy it as necessary before moving on._
- Create the DLC Package by choosing Build in the Addressables Group window.
- From the repository, copy DLC Package contents found in Library/com.unity.addressables/aa/Windows/StandaloneWindows64/dlc
	- This is the DLC Package, install/place in the InstalledGame_Data/StreamingAssets/aa/StandaloneWindows64/dlc
