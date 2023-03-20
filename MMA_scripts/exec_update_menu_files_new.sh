#!/bin/bash

USER=ussddev
MMA_MENUFILESPATH=/home/ussddev/binaries/MMA/
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
DEPLOYMENT_TYPE=LIVE

BASE_PATH=/home/ussddev/MMA_scripts/generateMenu_v3/
TEMP_TRIGGER=$BASE_PATH/trigger.tx
TRIGGER_BACKUP=$BASE_PATH/trigger_backup.tx
NEW_MENU_PATH=$BASE_PATH/temp_menu/
ORIGINAL_MENU=/home/ussddev/MMA_scripts/menu_files/
BACKUP_MENU=$BASE_PATH/menu_files_bk
NEW_MENU_BACKUP=$BASE_PATH/temp_menu_bk/
VAR_LIST=$BASE_PATH/var_list.txt

#########################
UMBDB_IP=10.34.234.132
UMBDB_USERNAME=ussddev
UMBDB_PASSWORD='ussd@123'
UMBDB_DBNAME=umbdb
##########################
TMP_NODE_MAPPING_FILE=$BASE_PATH/mapping_tmp.tx
NODE_MAPPING_FILE=$BASE_PATH/mapping.tx


cd $BASE_PATH
#while (( 1 )); do
	Date=`date +'%Y%m%d'`
	Date1=`date +'%Y%m%d%H%M%S'`
	TriggerLog=$BASE_PATH/logs/"$Date"-trigger.log
	TriggerStatusLog=$BASE_PATH/logs/"$Date"-trigger-status.log
	ServiceLog=$BASE_PATH/logs/"$Date"-service.log
	mysql -h$IP -u$Username -p$Password $DB -e "call proc_trigger_get('$DEPLOYMENT_TYPE');" | grep -v "trigger_id" > $TEMP_TRIGGER 

	STATUS=$?
	echo "STATUS:"$STATUS

	TRIGGER_COUNT=`cat $TEMP_TRIGGER |  wc -l`
	echo "TRIGGER_COUNT: $TRIGGER_COUNT"
	if [[ $TRIGGER_COUNT > 0 ]]
	then
	    cp $ORIGINAL_MENU/* $NEW_MENU_PATH/
	    cat $TEMP_TRIGGER | while read triggers; do
		echo "Processing ::"$triggers
		TRIGGER_ID=`echo  $triggers | awk -F ' ' '{print $1}'`
		P_SERVICE_ID=`echo  $triggers | awk -F ' ' '{print $2}'`
		P_SERVICE_CODE=`echo  $triggers | awk -F ' ' '{print $4}'`

		echo "GOT Trigger ID:: $TRIGGER_ID"
		echo "GOT Service ID:: $P_SERVICE_ID"
		echo "GOT Service Code:: $P_SERVICE_CODE"
		echo `date +'%Y/%m/%d %H:%M:%S'`",${TRIGGER_ID},${SERVICE_ID}" >> $TriggerLog 

		MENU_FILE=$NEW_MENU_PATH/$P_SERVICE_CODE".txt"
		rm -f $MENU_FILE

		SERVICE_LIST=`mysql -h$IP -u$Username -p$Password $DB -e "call proc_menu_file_get_list($P_SERVICE_ID);"|grep -v "^service_id" | grep -v "^$"`
		#SERVICE_LIST="1	185"
		#echo $SERVICE_LIST > abc
		echo -n `date +'%Y/%m/%d %H:%M:%S'`", " >> $ServiceLog

		while read -r line1; do
			if [[ $line1 = "" ]]
			then
				continue;
			fi
    			echo "processing service:: $line1"
				
			SERVICE_ID=`echo -e "$line1" | awk -F " " '{print $1}'`
			SERVICE_CODE=`echo -e "$line1" | awk -F " " '{print $2}'`
			echo -n "$SERVICE_CODE|" >> $ServiceLog
			MENU_DATA=`mysql -N -h$IP -u$Username -p$Password $DB -e "call proc_menu_file_create_node_wise($SERVICE_ID);"`
			MENU_FILE=$NEW_MENU_PATH/$SERVICE_CODE".txt"
			>$MENU_FILE
			while read -r line2; do
				echo "$line2" | tr '\t' '|' | sed -e 's/\\\\/\\/g' >> $MENU_FILE		
			done <<< "$MENU_DATA"
			LINE_COUNT=`cat $MENU_FILE | wc -l`
			echo "echo FILE::$MENU_FILE count::$LINE_COUNT"
			if [[ $LINE_COUNT < 1 ]]
			then
				rm -f $MENU_FILE
			else
				#dollar conversion
				#sed -i -e 's/\$MY_NUMBER\$/\$1000\$/g' $MENU_FILE
				#sed -i -e 's/\$TRANSACTION_TYPE\$/\$1016\$/g' $MENU_FILE
				#sed -i -e 's/\$SELECT_BILL\$/\$1094\$/g' $MENU_FILE
				#sed -i -e 's/\$SHOW_CURRENT_BALANCE\$/\$1095\$/g' $MENU_FILE
				#sed -i -e 's/\$ACTIVATION_DATE\$/\$1096\$/g' $MENU_FILE
				#sed -i -e 's/\$SERVICE_ID\$/\$1159\$/g' $MENU_FILE
				#sed -i -e 's/\$FILLER1_RESPONSE\$/\$1183\$/g' $MENU_FILE
				#sed -i -e 's/\$FILLER2_RESPONSE\$/\$1184\$/g' $MENU_FILE
				#sed -i -e 's/\$TICKET_ID\$/\$1251\$/g' $MENU_FILE
				#sed -i -e 's/\$ACTIVITY_CODE\$/\$1252\$/g' $MENU_FILE
				#sed -i -e 's/\$FREE_TEXT\$/\$1253\$/g' $MENU_FILE
				#sed -i -e 's/\$CURRENT_MONTH\$/\$1260\$/g' $MENU_FILE
				#sed -i -e 's/\$CURRENT_MONTH_MINUS_1\$/\$1261\$/g' $MENU_FILE
				#sed -i -e 's/\$CURRENT_MONTH_MINUS_2\$/\$1262\$/g' $MENU_FILE
				#sed -i -e 's/\$CURRENT_MONTH_MINUS_3\$/\$1263\$/g' $MENU_FILE
				#sed -i -e 's/\$CHECK_IS_TICKET\$/\$1264\$/g' $MENU_FILE
				#sed -i -e 's/\$SELECT_TICKET\$/\$1265\$/g' $MENU_FILE
				#sed -i -e 's/\$ISSUE_DESCRIPTION\$/\$1266\$/g' $MENU_FILE
				#sed -i -e 's/\$SURVEY_TYPE\$/\$1300\$/g' $MENU_FILE
				#sed -i -e 's/\$SURVEY_RATING1\$/\$1301\$/g' $MENU_FILE
				#sed -i -e 's/\$SURVEY_RATING2\$/\$1302\$/g' $MENU_FILE
				#sed -i -e 's/\$SURVEY_RATING3\$/\$1303\$/g' $MENU_FILE
				#sed -i -e 's/\$FIRST_NAME\$/\$1007\$/g' $MENU_FILE
				#sed -i -e 's/\$EMAIL\$/\$1104\$/g' $MENU_FILE
				#sed -i -e 's/\$PROOF_IDENTITY_NUM\$/\$1010\$/g' $MENU_FILE	
				while read -r in
				do
					var=`echo -e "$in"|tr -s " "|awk -F " " '{print $1}'`
					val=`echo -e "$in"|tr -s " "|awk -F " " '{print $2}'`
					sed -i -e "s/\\\$$var\\\$/\\\$$val\\\$/g" $MENU_FILE
				done < $VAR_LIST
			fi

			CNT_CHECK=`cat $MENU_FILE | grep $SERVICE_CODE | wc -l`
			if [[ $CNT_CHECK = 0 ]]
			then
				echo "Blank file received. Removing it $MENU_FILE"
				rm -f $MENU_FILE
			fi
			  			
		done <<< "$SERVICE_LIST"
		sed -i -e '$ s/.$//' $ServiceLog	
		echo -e "\n" >> $ServiceLog

		#####Take dump of nodes from SCE	
		#mysql -h$IP -u$Username -p$Password $DB -e "CALL proc_get_service_node_menu_mapping($P_SERVICE_ID,0,NULL,0,'0',NULL);" > $TMP_NODE_MAPPING_FILE
		#cat $TMP_NODE_MAPPING_FILE | grep -v "^level" | sed -e 's/\t/~/g' | sed -e 's/"/\\"/g' | awk -F '~' '{print "INSERT IGNORE INTO tbl_menu_nodes_mapping(level,parent_menu_id,menu_id,menu,preference,parent_service_id,service_id,service_code,parent_node_id_raw,node_id_raw,parent_node_hash,node_hash,node_md5) VALUES(\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\",\""$6"\",\""$7"\",\""$8"\",\""$9"\",\""$10"\",\""$11"\",\""$12"\",\""$13"\");"}' > $NODE_MAPPING_FILE
		
		#####Paste dump of nodes from SCE to UMBDB	
		#mysql -h$UMBDB_IP -u$UMBDB_USERNAME -p$UMBDB_PASSWORD $UMBDB_DBNAME -e "DELETE FROM tbl_menu_nodes_mapping WHERE service_id = $P_SERVICE_ID OR parent_service_id =$P_SERVICE_ID;"	
		#mysql -h$UMBDB_IP -u$UMBDB_USERNAME -p$UMBDB_PASSWORD $UMBDB_DBNAME < $NODE_MAPPING_FILE	

		#cp $NODE_MAPPING_FILE $BASE_PATH/nodes_backup/$Date1-$P_SERVICE_ID-mapping.txt	

		mysql -h$IP -u$Username -p$Password $DB -e "call proc_trigger_update($TRIGGER_ID,0);"	
		STATUS=$?
		echo "Update Trigger Status:: $STATUS"
		echo `date +'%Y/%m/%d %H:%M:%S'`",${TRIGGER_ID},${STATUS}" >> $TriggerStatusLog
		echo -e "$TRIGGER_ID" >>$TRIGGER_BACKUP

		echo $P_SERVICE_CODE | grep "_"
		if [ $? -eq 0 ]
		then
			P_SERVICE_CODE_C="\<$P_SERVICE_CODE\>"
			cat ${BASE_PATH}multimodel.txt  | grep $P_SERVICE_CODE_C
			if [ $? -eq 1 ]
			then
				echo $P_SERVICE_CODE >> ${BASE_PATH}multimodel.txt 
			fi
		fi

	    done

	    mkdir $NEW_MENU_BACKUP/"$Date1"-menu
	    mkdir $BACKUP_MENU/"$Date1"-menu
	    mv  $ORIGINAL_MENU $BACKUP_MENU/"$Date1"-menu/
	    cp -r $NEW_MENU_PATH $ORIGINAL_MENU 
	    mv  $NEW_MENU_PATH/* $NEW_MENU_BACKUP/"$Date1"-menu/

            for i in {1..12}
            do
                #scp -r $ORIGINAL_MENU $USER@${USSD[$i]}:$MMA_MENUFILESPATH
		rsync -avzht $ORIGINAL_MENU $USER@${USSD[$i]}:${MMA_MENUFILESPATH}menu_files/
		scp ${BASE_PATH}multimodel.txt $USER@${USSD[$i]}:/home/ussddev/binaries/MMA/conf/
	        scp $ORIGINAL_MENU/../ack.txt $USER@${USSD[$i]}:$MMA_MENUFILESPATH
            done

	    EN=`tail -2 $ServiceLog`
	    EN=`echo $EN | cut -d',' -f2 | cut -b 1-`

	    echo Service codes $EN are to be changed for headers
	    for i in $EN
	    do
		echo Service code $i to be changed for header
		mysql -h$IP -u$Username -p$Password $DB -e "update tbl_header_scheduler set IsRunning = 0 where ServiceCode = '$i' or HeaderServiceCode = '$i';"
	    done

	fi
#sleep 10s
#done


