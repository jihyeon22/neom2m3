#! /bin/sh

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

