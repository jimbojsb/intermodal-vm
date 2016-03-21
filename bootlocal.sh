#!/bin/sh
mkdir -p /mnt/sdb1/sync
mkdir -p /sync
chmod 777 /sync
mount --bind /mnt/sdb1/sync /sync