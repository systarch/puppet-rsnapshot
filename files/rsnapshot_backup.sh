#!/bin/bash

## Enumerate all config files to iterate over
rm -f /tmp/.rsnapshot
/bin/ls -l /etc/rsnapshot/*.conf|/usr/bin/awk {'print $9'} > /tmp/.rsnapshot

## Run backups 1 config file at a time
while read config; do
  /usr/bin/rsnapshot -c $config $1
done </tmp/.rsnapshot

## Remove the list of config files
rm -f /tmp/.rsnapshot
