#!/bin/bash

set -e
# cleanup
sudo umount mount || true
rm -Rf mount storage

# CONFIG_UNICODE needs to be enabeld in the kernel
cat "/boot/config-$(uname -r)" | grep CONFIG_UNICODE=

# Create a filesystem in a file and mount it
dd if=/dev/zero of=storage bs=1M count=100
mkfs.ext4 -E encoding=utf8 storage  # <- pass encoding to enable unicode support
mkdir mount
sudo mount -o loop storage mount
sudo chown -R lazka mount
rm -Rf mount/lost+found

# Create a directory structure and enable unicode matching for /new
cd mount

mkdir -p normal/FOO/BAR

mkdir new
chattr +F new # <- enable recursivly for this dir, has to be empty
mkdir -p new/FOO/BAR
