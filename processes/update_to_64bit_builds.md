
# Updating Projects to 64bit Builds and More

1. Ensure the project is on tyrebytes/github (instead of gitea) and ensure the default/primary branch is `main`.
2. Create a branch `feature/64bit-builds-and-more` to perform all this work.
3. Directly copy `build/make_project.sh` and `build/make_project.bat` from an upgraded project.
    - Rename `PROJECT_NAME=trophy_brawlers` in both of the newly copied scripts.
4. Probably need to copy/update the `initialize_externals` scripts (.sh and .bat) from TrophyBrawlers.
    - Ensure `initialize_externals` scripts are setup to `main` branches and skipping init during automated_builds by default
5. Modify `post_build.sh` to copy macos executable to `project_name_macos_config` (rather than `project_name_config`)
6. Before TurtleBrains Logger is created (making a console window) copy this code to the VERY start of main:
	```
	int main(const int argumentCount, const char* argumentValues[])
	{
		for (int argumentIndex = 0; argumentIndex < argumentCount; ++argumentIndex)
		{	//Run unit tests if --test is present as an argument.
			if (tbCore::tbString("--test") == argumentValues[argumentIndex])
			{
				return (true == TurtleBrains::Core::UnitTest::RunAllTests()) ? 0 : 1;
			}
		}

		// Run --test above this so it can output the results into the nightly build emails.
	```
7. Remove `build_version_xyz` from the `build/abs_build_configuration` file.
8. Add a `build/version.txt` file if one doesn't exist, set the contents to X.Y.Z of the current project version.
9. Add a `run/release_notes.md` file for an executable or `release_notes.md` in root directory for framework/tech.
10. Update or add version.hpp from Trophy Brawlers.


### Update the premake script

This one is a little more manual, since each project requires different things, but TrophyBrawlers will provide a good example.

1. Initialize any variables in the first part.
2. --build-version updated to grab from file or CLI (ensure it has both parts)
3. Initialize the solution(workspace) and any settings common to ALL projects in the solution.
4. Setup each project with specific like kind, files, etc.

### Update post_build.sh / bat

1. In the sh where it checks executableName/buildConfig etc, `exit 1` should be `return 404` to not kill a main script.
