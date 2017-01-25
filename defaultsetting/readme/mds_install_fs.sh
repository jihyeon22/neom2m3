#!/bin/sh

cp -rf /system/mds/install_files/readme/files/mds_conf.sh /etc/init.d/
cp -rf /system/mds/install_files/readme/files/mds_init.sh /etc/init.d/

cd /etc/rc1.d/ 
ln -s ../init.d/mds_init.sh S99mds_init.sh

cd /etc/rc2.d/ 
ln -s ../init.d/mds_init.sh S99mds_init.sh

cd /etc/rc3.d/ 
ln -s ../init.d/mds_init.sh S99mds_init.sh

cd /etc/rc4.d/ 
ln -s ../init.d/mds_init.sh S99mds_init.sh

cd /etc/rc5.d/ 
ln -s ../init.d/mds_init.sh S99mds_init.sh



