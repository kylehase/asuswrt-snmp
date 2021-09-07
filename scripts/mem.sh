#!/bin/sh
# Returns memory used as % (FLOAT)

free | grep Mem | awk '{print $3/$2 * 100.0}'
