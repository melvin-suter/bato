#!/bin/bash

mkdir -p  /usr/local/bin

curl "https://api.github.com/repos/melvin-suter/bato/contents" 2>/dev/null | grep -i '"name"' | awk -F':' '{print $2}' | sed -E 's;[", ];;g' | grep -E '^bato-.*$' | while read file ; do
    curl https://raw.githubusercontent.com/melvin-suter/bato/master/$file > /usr/local/bin/$file
    chmod 555 /usr/local/bin/$file
    chown root:root /usr/local/bin/$file
done
