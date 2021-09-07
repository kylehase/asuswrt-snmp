#!/bin/sh
# Returns idle CPU in % (FLOAT)

top -bn1 | head -3 | awk '/CPU/ {sub(/%/,"",$8); print $8}'
