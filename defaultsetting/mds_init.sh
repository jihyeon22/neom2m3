#!/bin/sh

if [ -f "/system/mds/mds_set_env.sh" ] ; then
	source /system/mds/mds_set_env.sh
fi

#####################################################
# mds dir make...
#####################################################
if [ ! -d "/data/mds/" ]; then
	mkdir -p /data/mds/
fi

if [ ! -d "/data/mds/log" ]; then
	mkdir -p /data/mds/log
fi

if [ ! -d "/data/mds/data" ]; then
	mkdir -p /data/mds/data
fi

#####################################################
# dropbear server..
#####################################################
/system/mds/usr/sbin/dropbear -p 1022 -r /system/mds/etc/dropbear/dropbear_rsa_host_key &

#####################################################
# necessary apps
#####################################################
#/system/mds/system/sbin/monchk2 &
monchk2 &
#/system/mds/system/sbin/emer2 &
emer2 &

/system/mds/system/devinit2 &






