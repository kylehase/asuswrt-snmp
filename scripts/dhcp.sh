#!/bin/sh
# Returns number of DHCP leases (INT)

cat /var/lib/misc/dnsmasq.leases| wc -l
