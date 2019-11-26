#!/bin/bash

set -e

sudo umount mount || true
rm -Rf mount storage
