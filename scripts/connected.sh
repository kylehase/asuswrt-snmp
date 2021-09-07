#!/bin/sh
# Returns number of connected clients (INT)

arp -a | awk '$4!="<incomplete>"' | wc -l
