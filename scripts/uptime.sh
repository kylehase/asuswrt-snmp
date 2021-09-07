#!/bin/sh
# Returns uptime in days (INT)

uptime | awk -F'( |,|:)+' '{print $6}'
