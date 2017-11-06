#!/bin/sh

mkdir -p datasheets
cd datasheets
grep '`http.*\.pdf`' ../README.md|sed -e 's/^[^`]*`//' -e 's/\.pdf`.*$/.pdf/' | while read url; do
	echo "downloading $url"
	wget -c "$url"
done

