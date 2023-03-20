#!/bin/bash

USER=ussddev
MMA_TESTMSISDNFILE=/home/ussddev/binaries/MMA/conf/test_msisdn.txt
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
#DB=umbsc_v2_demo
DB=umbsc_live_test

Date=`date +'%Y%m%d'`
Date1=`date +'%Y%m%d%H%M%S'`


DEPLOYMENT_TYPE=TEST

BASE_PATH=/home/ussddev/MMA_scripts/generateTestNumbers/
TEMP_TRIGGER=$BASE_PATH/trigger.tx
TRIGGER_BACKUP=$BASE_PATH/trigger_backup.tx

NEW_PATH=$BASE_PATH/test_msisdn.txt
OLD_PATH=/home/ussddev/MMA_scripts/test_msisdn.txt
BACKUP_PATH="$BASE_PATH/test_bk/test_msisdn_$Date1.txt"

cd $BASE_PATH
#while (( 1 )); do
	TriggerLog=/home/ussddev/generateTestNumbers/logs/"$Date"-trigger.log
	TriggerStatusLog=/home/ussddev/generateTestNumbers/logs/"$Date"-trigger-status.log
	ServiceLog=/home/ussddev/generateTestNumbers/logs/"$Date"-service.log

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


		MSISDN_LIST=`mysql -h$IP -u$Username -p$Password $DB -e "SELECT msisdn,service_code FROM tbl_msisdn_test LIMIT 100;"|grep -v "^msisdn" | grep -v "^$"`
		#MSISDN_LIST="1	185"
		#echo $MSISDN_LIST > abc
		echo `date +'%Y/%m/%d %H:%M:%S'`", " >> $ServiceLog
		> $NEW_PATH
		while read -r line1; do
			if [[ $line1 = "" ]]
			then
				continue;
			fi
    			echo "processing service:: $line1"
				
			MSISDN=`echo -e "$line1" | awk -F " " '{print $1}'`
			SERVICE_CODE=`echo -e "$line1" | awk -F " " '{print $2}'`
			
			echo "$MSISDN|$SERVICE_CODE" >> $NEW_PATH
			  			
		done <<< "$MSISDN_LIST"


		mysql -h$IP -u$Username -p$Password $DB -e "call proc_trigger_update($TRIGGER_ID,0);"	
		STATUS=$?
		echo "Update Trigger Status:: $STATUS"
		echo `date +'%Y/%m/%d %H:%M:%S'`",${TRIGGER_ID},${STATUS}" >> $TriggerStatusLog
		echo -e "$TRIGGER_ID" >>$TRIGGER_BACKUP
	    done

	    cp $OLD_PATH $BACKUP_PATH
	    cp $NEW_PATH $OLD_PATH

            for i in {1..14}
            do
                scp $OLD_PATH $USER@${USSD[$i]}:$MMA_TESTMSISDNFILE
            done

	fi
#sleep 10s
#done


