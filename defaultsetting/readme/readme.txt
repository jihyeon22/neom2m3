
#####################################
 특이사항!!
#####################################
 -> 2016/12/21 이후 릴리즈 건에 대해서... 
  . 기존엔 /data/ 폴더 기준으로 동작하였으나 새로운 파일시스템은 /system/ 기준으로 동작

#####################################
  1. /etc/init.d/rcS 변경
#####################################
 -> device 의 /etc/init.d/rcS 의 내용을 file/rcS 와 같이 변경한다.

#####################################
  2. mds_conf.sh 설치
#####################################
 -> file/mds_conf.sh 을 device 에 /etc/init.d/mds_conf.sh 로 카피한다.

#####################################
  3. mds_init.sh 설치
#####################################
 -> file/mds_init.sh 을 device 에 /etc/init.d/mds_init.sh 로 카피한다.
 -> runlevel 에 S99 로 해당 파일을 링크한다.
    + rc1.d/S99mds_init -> ../init.d/mds_init.sh 
    + rc2.d/S99mds_init -> ../init.d/mds_init.sh
    + rc3.d/S99mds_init -> ../init.d/mds_init.sh
    + rc4.d/S99mds_init -> ../init.d/mds_init.sh
    + rc5.d/S99mds_init -> ../init.d/mds_init.sh
    
#####################################
  5. mds-rootfs-xxxx.tar.gz 설치
#####################################
 -> mds-rootfs-xxxx.tar.gz 해당 압축파일을 device 의 /system/ 밑에 압축을 푼다.
   + 압축을 풀면 /system/mds/ 밑에 각종 파일들이 풀린다.
   + mds 프로그램의 init script /system/mds/mds_init.sh

#####################################
  6. 실제 정상적인 install 이 되었는지 확인하는 방법
#####################################
 -> /system/mds/fsimg-date-xxxx 의 파일내용을 확인한다.
   + mds-rootfs-xxxx.tar.gz 의 xxxx 날짜 정보와 /system/mds/fsimg-date-xxxx 의 날짜 정보가 일치한다.

