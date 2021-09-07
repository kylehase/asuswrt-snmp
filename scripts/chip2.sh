#!/bin/sh
# Returns 5GHz radio temp in degrees C (INT)

model=`echo $HOSTNAME | tr '-' ' ' | awk '{print $2}'` # get the model number from hostname
case $model in
  AC68U) 
    wl -i eth2 phy_tempsense | awk '{print $1}'
    ;;
  AX86U) 
    wl -i eth7 phy_tempsense | awk '{print $1}'
    ;;
  *) # assume other routers use this until we know otherwise                                         
    wl -i eth7 phy_tempsense | awk '{print $1}'
    ;;
esac
