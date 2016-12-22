#! /bin/sh

# VERDATE_161222

case "$1" in
  start)
    if [ -f "/system/mds/mds_init.sh" ] ; then
      /system/mds/mds_init.sh &
    fi

  ;;
  stop)
  ;;

  restart)
  ;;
  *)
  ;;
esac

exit 0

