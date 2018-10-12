
# Build and Distribution

## First Time Setup (per Project)

0. Create a project using the Template Projects 2D with TurtleBrains or 3D with Internal Combustion.
1. Get the project on both Windows machine and Linux file server (hippo)'s development areas.
2. `chmod +x ./build/*.sh ./build/automated/*.sh` to setup execute permissions on the scripts.
3. `./initialize_externals.sh` if necessary.
4. Temporary: Fix TurtleBrains macOS lack of defines by:
	- `vim source/turtle_brains/application/implementation/macosx/tbi_realtime_application.cpp`
	- Uncomment the lines defining NSEventModifier constants that are required necessary for building. DO NOT COMMIT.
5. Navigate to webserver tyrebytes.com/games/ add a folder for `project_name/alpha` which is where, by default, the distribution will upload.
6. Because itch.io seems to require hyphens (-) instead of underscores (_) the itch.io project name in `build_and_distribute.sh` needs to be modified to match the itch.io project name.

## To Distribute / Deploy the Project

0. Run `build/build_and_distribute_windows.bat` from the Windows machine and let it finish. This will build and copy the distribution archive to hippo for actual uploading.
1. `ssh hippo` and run `build/build_and_distribute.sh` ensuring the version used is identical to that used on Windows. Make sure to pay attention as the script may require a password be entered.

## Modify the Upload Locations
Open `build/build_and_distribute.sh` and modify the locations the game gets uploaded to; `TBDOTCOM_BUILD_LOCATION`, `ITCHIO_PROJECT_NAME` and `ITCHIO_RELEASE_CHANNEL` are appropriate location variables.
