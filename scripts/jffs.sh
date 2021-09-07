#!/bin/sh
# Return use of /jffs/ partition in percent (INT)

df | awk '/jffs/ {sub(/%/,"",$5); print $5}'
