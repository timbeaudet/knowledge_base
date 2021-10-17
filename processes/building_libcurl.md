# Building libCurl

Originally libcurl was built for TurtleBrains/projects back in 2019 but the process was not documented. I believe on macOS XCode had included the libcurl framework which provided everything needed, but Windows and Linux required building a library. On 2021-10-01 the game server running Rally of Rockets stopped communicating with WebServer as it was failing a root certificate that expired that day.

## Linux

Grab curl 7.67.0 with `wget https://github.com/curl/curl/releases/download/curl-7_67_0/curl-7.67.0.tar.gz`
Extract it with `tar -xzf curl-7.67.0.tar.gz`
`cd curl-7.67.0`
`./configure --with-openssl --with-libressl --prefix="/home/timbeaudet/development/temporary/curlbuild/"`
`make install` to put the libraries in the /temporary/curlbuild/ directory from the above command.
