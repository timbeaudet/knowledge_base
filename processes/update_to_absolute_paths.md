
# Update Projects to use Absolute Paths for Engine Headers

This was initially done in late 2018 or early 2019 sometime when the change was made to go from .h to .hpp files. I believe all projects we care about have been converted but this was the method used to convert them quickly:

0. Potentially update initialize_external scripts for project to pull latest tb/ice/game_kit.
1. Open projects build/project.lua and add: `"../source/**.hpp", ` to find the new headers.
2. In build/project.lua add "../source/" to the include directories.
3. Open project/source in GitBash and run the following commands
  `find -type f | xargs sed -i 's/#include "\(..\/\)*\(turtle_brains\/.*\.h\)"/#include <\2pp>/'`
  `find -type f | xargs sed -i 's/#include "\(..\/\)*\(ice\/.*\.h\)"/#include <\2pp>/'`
  `find -type f | xargs sed -i 's/#include "\(..\/\)*\(game_kit\/.*\.h\)"/#include <\2pp>/'`
  Note: I noticed a failure that was solved by rerunning the script... idk what happened.
  Note: This will flip all newlines around, and git will freak out.
  Note: This will modify TurtleBrains, GameKit and ice source directories, due to newlines (just revert)
4. Fix the new-lines issue while committing the changes into the git repository, what about svn repos?
  `git diff -w | git apply --cached --ignore-whitespace`
  Show changes staged for commit with: `git diff --cached` then commit as normal.
  To remove all newline changes run `git checkout *`
5. Hope everything worked.
