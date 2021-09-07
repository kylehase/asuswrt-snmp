#!/bin/sh
# Script to return WAN download traffic in Mbps (FLOAT)

maxint=4294967295 # internal bit counter rollover
scriptname=${0##*/} # name of this file
old="/tmp/$scriptname.data.old" # bits from last sample
new="/tmp/$scriptname.data.new" # bits from this sample
old_epoch_file="/tmp/$scriptname.epoch.old" # last sample timestamp

old_epoch=`cat $old_epoch_file`
new_epoch=`date "+%s"`
echo $new_epoch > $old_epoch_file

interval=`expr $new_epoch - $old_epoch` # seconds since last sample

if [ -f $new ]; then
    awk -v old=$old -v interval=$interval -v maxint=$maxint '{
        getline line < old
        bytes  = $1 - line # bytes since last sample
        if(bytes < 0) {bytes = bytes + maxint} # adjust for rollover
        mbps  = (8 * (bytes) / interval) / 1024 / 1024  # convert to mbits per second
        printf "%.2f\n", mbps
    }' $new
    mv $new $old
fi

cat /proc/net/dev | tail -1 | tr ':|' '  ' | awk '{print $2}' > $new # save bits from this sample
