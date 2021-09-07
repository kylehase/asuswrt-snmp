#!/bin/sh
# Returns SOC/CPU temp in degrees C (INT)

model=`echo $HOSTNAME | tr '-' ' ' | awk '{print $2}'` # Get the model number from hostname
case $model in
  AC68U) # Temp is recorded in degrees C
    cat /proc/dmu/temperature | grep -o -e "[0-9][0-9]"
    ;;
  AX86U) # Temp is recorded in millidegrees C. Convert and round to degrees
    cat /sys/class/thermal/thermal_zone0/temp | awk '{print int(($1+500)/1000)}'
    ;;
  *) # Assume other routers use this until we know otherwise                                         
    cat /sys/class/thermal/thermal_zone0/temp | awk '{print int(($1+500)/1000)}'
    ;;
esac
