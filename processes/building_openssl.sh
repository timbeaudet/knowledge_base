#!/bin/bash

# This build script is to grab openssl and build it for use in the UltimateGamesApi for Rally of Rockets.
# This will require the following tools/dependencies:
#   sorry, unknown list, already on my system... Good luck!

buildArea=/home/timbeaudet/development/temporary/build_openssl/
dependencyArea=`pwd`/../external_libraries/

#---------------------------------------------------------------------------------------------------------------------#

mkdir -p ${buildArea}
pushd ${buildArea}

wget https://www.openssl.org/source/openssl-1.1.1m.tar.gz
tar -xf ./openssl-1.1.1m.tar.gz
cd openssl-1.1.1m

./config -static --static
make

cp ./*.a ${dependencyArea}/libraries/gmake/x64/
#cp -r ./include/* ${dependencyArea}/includes/openssl/

popd
