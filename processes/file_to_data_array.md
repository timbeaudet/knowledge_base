
# Convert File to Array of Bytes

Every now and again I want a resource put directly into code instead of shipping the asset file. This converts the file into an array of bytes that could then be loaded in memory.

`cat <input_file.png> | xxd -g1 | sed s/^.*\:\\s// | sed s/\\s\\s.*$// | sed s/\\s/,\ 0x/g | sed s/^/0x/ | sed s/$/,/ > <output.h>`

The above worked pretty well for a png, but failed during converting html file. The following should be useful with any input* (@tsjost)

`cat <input_file.png> | hexdump -e '16/1 "%02x " "\n"' | awk '{$1=$1};1' | sed s/\\s/,\ 0x/g | sed s/^/0x/ | sed s/$/,/ > <output.h>`

> This magic was initially provided by [tsjost](https://github.com/tsjost).
