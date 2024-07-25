#!/bin/bash

mkdir -p  /opt/bato-scripts

curl "https://api.github.com/repos/melvin-suter/bato/contents" 2>/dev/null | grep -i '"name"' | awk -F':' '{print $2}' | sed -E 's;[", ];;g' | grep -E '^bato-.*$' | while read file ; do
    curl https://raw.githubusercontent.com/melvin-suter/bato/master/$file > /opt/bato-scripts/$file
    chmod 555 /opt/bato-scripts/$file
    chown root:root /opt/bato-scripts/$file
done

echo '#!/bin/bash
export PATH="$PATH:/opt/bato-scripts"' > /usr/local/bin/bato-go
chmod 555 /usr/local/bin/bato-go
chown root:root /usr/local/bin/bato-go
