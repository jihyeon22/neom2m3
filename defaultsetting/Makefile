
SRCROOT	:= ..
DESTDIR	:= $(SRCROOT)/out

CC	:= $(CROSS_COMPILE)gcc
CFLAGS	:= ${CFLAGS}
LDFLAGS	:= ${LDFLAGS}

###############################################################################

ROOTFS_TYPE	:= jffs2
HOSTNAME	:= neom2m
TIMEZONE	:= KST-9
BOARD		:=

CFLAGS	+=
LDFLAGS	+=
OBJS	:=
APP	:=

#ifeq ($(BOARD),)
#DEVTABLES	:= device_table_def.txt device_table_dev.txt
#INSTALLFILES	+= etc/init.d/S10gpio
#endif

INSTALLREADME_DIR = $(DESTDIR)/../../../
INSTALLREADME	:= readme/readme.txt
INSTALLREADME	+= readme/files/rcS
INSTALLREADME	+= readme/files/mds_conf.sh
INSTALLREADME	+= readme/files/mds_init.sh



INSTALLFILES	:= etc/dropbear/dropbear_rsa_host_key
#INSTALLFILES	+= system/system.folder
#INSTALLFILES	+= log/log.folder
INSTALLFILES	+= *.sh

include $(SRCROOT)/common/targets.mk


###############################################################################

all:		$(TARGET)

install:	unused-files install-files install-app install-lib install-readme

clean:
	$(Q)rm -vrf $(TARGET)


###############################################################################

#etc/fstab:	etc/fstab.$(ROOTFS_TYPE)
#	$(Q)echo Create $@ ...
#	$(Q)cp -v $^ $@

#etc/hostname:	etc/hostname.in
#	$(Q)echo Create $@ ...
#	$(Q)sed "s,@hostname@,$(HOSTNAME),g" $^ > $@


include $(SRCROOT)/common/rules.mk

###############################################################################

