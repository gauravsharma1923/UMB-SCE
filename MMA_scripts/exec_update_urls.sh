#!/bin/bash

USER=ussddev
APIMGR_URLSFILE=/home/ussddev/binaries/UMBApiManager/conf/app_config/URLs.txt
USSD[1]=10.34.234.136
USSD[2]=10.34.234.137
USSD[3]=10.34.234.148
USSD[4]=10.34.234.149
USSD[5]=10.34.234.150
USSD[6]=10.34.234.151
USSD[7]=10.34.234.152
USSD[8]=10.34.234.153
USSD[9]=10.34.234.154
USSD[10]=10.34.234.155
USSD[11]=10.34.234.156
USSD[12]=10.34.234.157
USSD[13]=10.34.234.158
USSD[14]=10.34.234.159

Username=ussddev
Password='ussd@123'
IP=10.34.234.132
DB=umbsc_live_test

Date=`date +'%Y%m%d'`
Date1=`date +'%Y%m%d%H%M%S'`

DEPLOYMENT_TYPE=URLS

BASE_PATH=/home/ussddev/MMA_scripts/generateUrls/
TEMP_TRIGGER=$BASE_PATH/trigger.tx
TRIGGER_BACKUP=$BASE_PATH/trigger_backup.tx

NEW_PATH=$BASE_PATH/URLs.txt
OLD_PATH=/home/ussddev/MMA_scripts/URLs.txt
BACKUP_PATH="$BASE_PATH/test_bk/URLs_$Date1.txt"

cd $BASE_PATH
#while (( 1 )); do
	TriggerLog=/home/ussddev/MMA_scripts/generateUrls/logs/"$Date"-trigger.log
	TriggerStatusLog=/home/ussddev/MMA_scripts/generateUrls/logs/"$Date"-trigger-status.log
	ServiceLog=/home/ussddev/MMA_scripts/generateUrls/logs/"$Date"-service.log

	mysql -h$IP -u$Username -p$Password $DB -e "call proc_trigger_get('$DEPLOYMENT_TYPE');" | grep -v "trigger_id" > $TEMP_TRIGGER 

	STATUS=$?
	echo "STATUS:"$STATUS

	TRIGGER_COUNT=`cat $TEMP_TRIGGER |  wc -l`
	echo "TRIGGER_COUNT: $TRIGGER_COUNT"
	if [[ $TRIGGER_COUNT > 0 ]]
	then
	    cat $TEMP_TRIGGER | while read triggers; do
		echo "Processing ::"$triggers
		TRIGGER_ID=`echo  $triggers | awk -F ' ' '{print $1}'`
		P_SERVICE_ID=`echo  $triggers | awk -F ' ' '{print $2}'`
		P_SERVICE_CODE=`echo  $triggers | awk -F ' ' '{print $4}'`

		echo "GOT Trigger ID:: $TRIGGER_ID"
		echo "GOT Service ID:: $P_SERVICE_ID"
		echo "GOT Service Code:: $P_SERVICE_CODE"
		echo `date +'%Y/%m/%d %H:%M:%S'`",${TRIGGER_ID},${SERVICE_ID}" >> $TriggerLog 


		URL_LIST=`mysql -h$IP -u$Username -p$Password $DB -e "SELECT url_id, url, timeout FROM tbl_url_mapping;"|grep -v "^url_id"`
		echo `date +'%Y/%m/%d %H:%M:%S'`", " >> $ServiceLog
		> $NEW_PATH
		while read -r line1; do
			if [[ $line1 = "" ]]
			then
				continue;
			fi
    			echo "processing service:: $line1"
				
			MSISDN=`echo -e "$line1" | awk -F " " '{print $1}'`
			BASE_URL=`echo -e "$line1" | awk -F " " '{print $2}'`
			SERVICE_CODE=`echo -e "$line1" | awk -F " " '{print $3}'`
			
			echo "$MSISDN|$BASE_URL|$SERVICE_CODE" >> $NEW_PATH
			  			
		done <<< "$URL_LIST"


		mysql -h$IP -u$Username -p$Password $DB -e "call proc_trigger_update($TRIGGER_ID,0);"	
		STATUS=$?
		echo "Update Trigger Status:: $STATUS"
		echo `date +'%Y/%m/%d %H:%M:%S'`",${TRIGGER_ID},${STATUS}" >> $TriggerStatusLog
		echo -e "$TRIGGER_ID" >>$TRIGGER_BACKUP
	    done

	    cp $OLD_PATH $BACKUP_PATH
	    cp $NEW_PATH $OLD_PATH

            for i in {1..12}
            do
		ssh -q $USER@${USSD[$i]} "mv $APIMGR_URLSFILE ${APIMGR_URLSFILE}_bak"
                scp $OLD_PATH $USER@${USSD[$i]}:$APIMGR_URLSFILE
            done


	fi
#sleep 10s
#done


