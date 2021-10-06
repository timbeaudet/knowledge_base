# Building Bullet

Grab 2.87 from github:
https://github.com/bulletphysics/bullet3

(Use the premake4 executable for the system; it is included in build3 directory already)
--double is definitely not an option we want (unless we convert to use double precision)

Rally of Rockets has the bullet includes in `build/external_libraries/includes` but had to modify
a file to get macOS to stop crashing due to SSE optimizations, these got disabled by modifying the
file based on Erwin's suggestion in a forum.

## Linux 
- Create the build:
```
	cd build3
	chmod +x ./premake_linux
	./premake4_linux --noopengl3 --no-demos --no-extras --no-clsocket --no-enet --no-test --no-gtest gmake

	MANUALLY EDIT CONTENTS OF `gmake/BulletCollision.make`, `gmake/BulletDynamics.make` and `gmake/LinearMath.make`
	to change `CXXFLAGS  += $(CFLAGS)` to `CXXFLAGS += $(CFLAGS) -fPIC`

	make -C gmake
	make config=debug64 -C gmake #(for debug)
```

- Copy `BulletCollision`, `BulletDynamics` and `LinearMath` from `bullet3/bin` into project external libraries.
- When Linking with Bullet the ordering of the link matters, Dynamics must be linked before Collision.

## Windows
- Create the build:
```
	cd build3
	premake4 --noopengl3 --no-demos --no-extras --no-clsocket --no-enet --no-test --no-gtest vs2010
```
- Open vs2010/0_Bullet3Solution.sln and build.
- Ensure MBCS is used, 140_xp, other options may need to be set.
- Copy `BulletCollision`, `BulletDynamics` and `LinearMath` from `bullet3/bin` into project external libraries.
- When Linking with Bullet the ordering of the link matters, Dynamics must be linked before Collision.

>NOTE: If vs2010 sln in vs2010 folder does not convert to updated VS, use premake5 and hope the warnings don't matter. 

## MacOS
- Create the build:
```
	cd build3
	premake4_osx  --noopengl3 --no-demos --no-extras --no-clsocket --no-enet --no-test --no-gtest xcode4
```
- Open xcode4/0_Bullet3???????? workspace
- For the projects `BulletCollision`, `BulletDynamics` and `LinearMath` do the following
	- Set the C++ dialect to C++11 (--std=c++11)
	- Set the C++ stdlib to (LLVM with C++11 support)
	- Set the architecture to native of the machine (or matching RoR project)
	- Build project, each separately.
	- Edit the scheme (of each project) to release (or debug as necessary)
	- Build again, each separately.
- Copy `BulletCollision`, `BulletDynamics` and `LinearMath` from `bullet/bin` into project external libraries.
