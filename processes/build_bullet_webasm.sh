#!/bin/bash

# This build script is to build Bullet3 2.87 for WebASM through emscripten and copy the files into
# Rally of Rockets external libraries directory for linking.

buildArea=/home/timbeaudet/development/temporary/build_bullet/

mkdir -p ${buildArea}
pushd ${buildArea}

wget https://github.com/bulletphysics/bullet3/archive/refs/tags/2.87.tar.gz -O bullet_2.87.tar.gz
tar -xf bullet_2.87.tar.gz

cd bullet3-2.87/build3
chmod +x ./premake_linux

#If the test works:
# This script needs to edit premake4.lua to remove a bunch of if os/platform code...
# look into diff -c or sed '5,10d' file
#
#The following (lines 183 to 191):
#		if os.is("Linux") or os.is("macosx") then
#			if os.is64bit() then
#				platforms {"x64"}
#			else
#				platforms {"x32"}
#			end
#		else
#			platforms {"x32","x64"}
#		end
#is expected to be:
#		platforms {"x32","x64"}

head -n 182 premake4.lua > aaa_s
echo 'platforms {"x32","x64"}' > aaa_m
tail -n 267 premake4.lua > aaa_e
cat aaa_s aaa_m aaa_e > premake4.lua
rm aaa_s aaa_m aaa_e

./premake4_linux --noopengl3 --no-demos --no-extras --no-clsocket --no-enet --no-test --no-gtest gmake

#This is a hard coded path of emsdk location.
source ~/development/tools/linux/emsdk-portable/emsdk_env.sh

#It would be nice to use simd/sse but for many reasons that was complaining a fair bit.
#Use sed to remove the tag entirely. I had tried to add the -msimd128 that emcc was requesting but
#that wound up crashing LLVM or something under the hood. Didn't dig deeper, and turning it all off
#is working for now, lets hope performance is good enough, or that we have time to investigate later.
#
#This should only be effecting release builds.
cd gmake
#sed -i 's/-msse2/-msse2 -msimd128/g' *.make
sed -i 's/-msse2//g' *.make
cd ../

#if false 64bit; then
#libraryArea=../external_libraries/libraries/emmake/x64/
#platformPostfix=_x64
#releasePostfix=_release #might not need _?
#emmake make -C gmake -j 5 config=release64
#emmake make -C gmake -j 5 config=debug64
#else
libraryArea=../external_libraries/libraries/emmake/x32/
platformPostfix=
releasePostfix=
emmake make -C gmake -j 5 config=release32
emmake make -C gmake -j 5 config=debug32
#fi

popd

mkdir -p ${libraryArea}
cp ${buildArea}/bullet3-2.87/bin/libBulletCollision_gmake${platformPostfix}${releasePostfix}.a ${libraryArea}/libBulletCollision_release.a
cp ${buildArea}/bullet3-2.87/bin/libLinearMath_gmake${platformPostfix}${releasePostfix}.a ${libraryArea}/libLinearMath_release.a
cp ${buildArea}/bullet3-2.87/bin/libBulletDynamics_gmake${platformPostfix}${releasePostfix}.a ${libraryArea}/libBulletDynamics_release.a
cp ${buildArea}/bullet3-2.87/bin/libBulletCollision_gmake${platformPostfix}_debug.a ${libraryArea}/libBulletCollision_debug.a
cp ${buildArea}/bullet3-2.87/bin/libLinearMath_gmake${platformPostfix}_debug.a ${libraryArea}/libLinearMath_debug.a
cp ${buildArea}/bullet3-2.87/bin/libBulletDynamics_gmake${platformPostfix}_debug.a ${libraryArea}/libBulletDynamics_debug.a
