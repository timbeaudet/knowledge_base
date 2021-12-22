#!/bin/bash

# This build script is to grab gRPC and build it for use in Rally of Rockets.
# This will require the following tools/dependencies:
#sudo apt install -y cmake build-essential autoconf libtool pkg-config

buildArea=/home/timbeaudet/development/temporary/build_grpc4/

#######################

mkdir -p ${buildArea}
pushd ${buildArea}

#Grab an updated version of CMake for gRPC to use since cmake --version is too old.
wget -q -O cmake-linux.sh https://github.com/Kitware/CMake/releases/download/v3.19.6/cmake-3.19.6-Linux-x86_64.sh
sh cmake-linux.sh -- --skip-license --prefix=${buildArea}
rm cmake-linux.sh

git clone --recurse-submodules -b v1.42.0 https://github.com/grpc/grpc

cd grpc
mkdir -p cmake/build
pushd cmake/build
cmake -DgRPC_INSTALL=ON \
	-DgRPC_BUILD_TESTS=OFF \
	-DCMAKE_INSTALL_PREFIX=${buildArea} \
	../..

	#	-DgRPC_SSL_PROVIDER=package \

make -j 5
make install
popd


#Ensure the example builds...
cd examples/cpp/helloworld
mkdir -p cmake/build
pushd cmake/build
cmake -DCMAKE_PREFIX_PATH=${buildArea} ../..
make -j 5
popd


#Finished playing in the buildArea, go back to where we came from.
popd


#########################


#Assumes that this was run from rally_of_rockets/build/
cp ${buildArea}/lib/*.a ../external_libraries/libraries/gmake/x64/
cp ${buildArea}/lib/libz.so ../
cp ${buildArea}/grpc/cmake/build/lib*.a ../external_libraries/libraries/gmake/x64/
#cp ${buildArea}/grpc/cmake/build/third_party/abseil-cpp/absl/    lib*.a ../external_libraries/libraries/gmake/x64/

cp -r ${buildArea}/include/* ../external_libraries/includes/

#Also copied protoc and grpc_cpp_plugin to dev/tools/linux for global PATH.
#	Actually copied ALL the libraries from all the different areas... :) see the premake file for complete list.
#	Though didn't need to put them in global, perhaps they should go in RoR ultimate deploy or other things.

#From the source/network/ultimate/ directory I ran this (for each file) to create the /protos/ into the magic generated
#code, then changed .cc to .cpp so the premake file will grab them up.
#
#protoc -I../protos/ --plugin=protoc-gen-grpc=/home/timbeaudet/development/tools/linux/grpc_cpp_plugin --grpc_out=./ ../protos/gameplay.proto 
