#!/bin/sh

#######################################################################################
# CONFIG

TMP_FILE_NAME="/tmp/chk_data.txt"

VERINFO=VERDATE_161222
BUILD_DATE=`cat /system/mds/fsimg-date`
#######################################################################################

echo "--------------------------------------------------"
echo " file system version info "
echo "  - ${BUILD_DATE}"
echo "--------------------------------------------------"
read -p "Press any key to continue... " -n1 -s

echo "......"

echo "STEP 0 :: check -> [/etc/init.d/rcS] files.."

CHK_RCS=`cat /etc/init.d/rcS | grep "if \[ -f \"/etc/init.d/mds_conf.sh\" \] \; then"`
if [ -z "${CHK_RCS}" ] ; then
	echo " chk rcs fail.. case 1"
	exit 0
fi

CHK_RCS=`cat /etc/init.d/rcS | grep ". /etc/init.d/mds_conf.sh"`
if [ -z "${CHK_RCS}" ] ; then
	echo " chk rcs fail.. case 2"
	exit 0
fi
echo " --> OK"






#######################################################################################
rm -rf  ${TMP_FILE_NAME}
echo "/etc/init.d/mds_conf.sh" >> ${TMP_FILE_NAME}
echo "/etc/init.d/mds_init.sh" >> ${TMP_FILE_NAME}
echo "/etc/rc1.d/S99mds_init.sh" >> ${TMP_FILE_NAME}
echo "/etc/rc2.d/S99mds_init.sh" >> ${TMP_FILE_NAME}
echo "/etc/rc3.d/S99mds_init.sh" >> ${TMP_FILE_NAME}
echo "/etc/rc4.d/S99mds_init.sh" >> ${TMP_FILE_NAME}
echo "/etc/rc5.d/S99mds_init.sh" >> ${TMP_FILE_NAME}
echo "/system/mds/mds_init.sh" >> ${TMP_FILE_NAME}
echo "/system/mds/mds_set_env.sh" >> ${TMP_FILE_NAME}
#######################################################################################

file="${TMP_FILE_NAME}"

while IFS= read -r CHK_FILE_NAME
do
	step_cnt=$((step_cnt+1))
	echo "------------------------------------------------"
	echo "STEP ${step_cnt} :: [${CHK_FILE_NAME}] exist check.. "
	if [ -f ${CHK_FILE_NAME} ] ; then
		echo " -> OK : file exist"
	else
		echo " -> FAIL : file not exist "
		exit 0
	fi

	step_cnt=$((step_cnt+1))
	echo "------------------------------------------------"
	echo "STEP ${step_cnt} :: [${CHK_FILE_NAME}] version check.. ->  ${VERINFO}"

	VERSION_INFO=`cat ${CHK_FILE_NAME} | grep ${VERINFO}`

	if [ ! -z "${VERSION_INFO}" ]; then
		echo " -> OK : VERSION [${VERINFO}] OK"
	else
		echo " -> FAIL : VERSION INVAILD"
		exit 0
	fi


done <"$file"

echo "..."
echo "..."
echo "..."
echo "..."

echo " ALL OK!!!!!!!!!!!!!!!!!!!"

