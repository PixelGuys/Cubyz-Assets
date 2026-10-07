#!/usr/bin/bash

rm -r output

for item in `find music | grep ".*\.ogg\|.*\.mp3\|.*\.qoa\|.*\.wav\|.*\.flac"`
do
	mkdir -p output/${item%/*}
	ffmpeg -i $item -b:a 128k output/${item%.*}.ogg -v error
done

for item in `find music -name "*.zig.zon"`
do
	mkdir -p output/${item%/*}
	cp $item output/$item
done

cp -r fonts output/fonts
