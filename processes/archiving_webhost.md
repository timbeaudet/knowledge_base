
Due to WordPress mishaps, Friends Don't Let Friends Use WordPress..., we needed to archive 

In this whole file I will be pretending `tyre_bytes/` is the directory we wish to archive and check... it contains `tyre_bytes/public` and `tyre_bytes/secrets` each containing much more...

```
  tar -vczf tyre_bytes_archive.tar.gz ./tyre_bytes/
```

To downlo

Extracting the files when needed
```
cd local/place_to_put/
mkdir tyre_bytes
cd tyre_bytes
tar zxfv tyre_bytes_archive.tar.gz

// May need to use this if we have issues with absolute paths...
tar --strip-components=2 zxfv tyre_bytes_archive.tar.gz
```

## Ensure Archived Files are GOOD

To Double check all the files were as they should be... From within the original directory being archived run the following to create something..

```
cd web_host/tyre_bytes/
find -type f | xargs md5sum > ../tyre_bytes.md5

# If you have spaces in filenames... because wordpress...
find -type f | xargs -I{} md5sum "{}" > ../timbeaudet.md5
```

Then after downloading and extracting the files, also download that .md5 file directly inside the tyre_bytes on the local copy..

```
cd local/tyre_bytes
rsync -avhiP timbeaudet.com:tyre_bytes.md5 ./
md5sum -c tyre_bytes.md5
md5sum -c tyre_bytes.md5 --quiet
```

If the `--quiet` doesn't have any output we are good to go, probably.


Finally we ran upon a situation that required manually generating `tyre_bytes.md5` on the local copy because 'wordpress' wanted to have issues, and planned to use `diff` to compare the two md5 files. That requires a diff the sorts the files like so:

```
diff <(sort local_tyre_bytes.md5) <(sort webhost_tyre_bytes.md5)
```


