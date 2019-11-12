#!/bin/sh
# File: /usr/local/bin/sys-backup.sh
SRC=/
DST=/run/media/safebox/`hostname -s`
BLACKLIST=/usr/local/etc/backup-blacklist.conf

# Sanity check
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"; exit 1
fi

logger -s "Starting filesystem sync"
rsync -aAXS --delete-excluded --exclude-from=$BLACKLIST $SRC $DST
logger -s "Finished filesystem sync"
