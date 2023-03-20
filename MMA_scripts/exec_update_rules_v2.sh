#!/bin/bash

DB=umbsc_live_test
USER=ussddev
PASSWORD='ussd@123'
IP=10.34.234.132
BASE_PATH=/home/ussddev/MMA_scripts/generateRules/
TEMP_TRIGGER=$BASE_PATH/trigger.tx
BKP=bkp/bkp_$(date +%Y%m%d%H%M%S)/

DEPLOYMENT_TYPE[1]=salerArea
DEPLOYMENT_TYPE[2]=category
DEPLOYMENT_TYPE[3]=balance
DEPLOYMENT_TYPE[4]=countryCode
DEPLOYMENT_TYPE[5]=IMEI
DEPLOYMENT_TYPE[6]=profile
DEPLOYMENT_TYPE[7]=accountGroupID
DEPLOYMENT_TYPE[8]=serviceOfferings
DEPLOYMENT_TYPE[9]=vlr
DEPLOYMENT_TYPE[10]=offerID
DEPLOYMENT_TYPE[11]=zone
DEPLOYMENT_TYPE[12]=lteFlag
DEPLOYMENT_TYPE[13]=lang
DEPLOYMENT_TYPE11=mainRules

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

mysql -h$IP -u$USER -p$PASSWORD $DB -e "call proc_trigger_get('mainRules');" | grep -v "trigger_id" > $TEMP_TRIGGER
STATUS=$?
echo "STATUS:"$STATUS
TRIGGER_COUNT=`cat $TEMP_TRIGGER |  wc -l`
echo "TRIGGER_COUNT: $TRIGGER_COUNT"
if [[ $TRIGGER_COUNT > 0 ]]
then
	echo TRIGGER FOUND FOR mainRules
	cat $TEMP_TRIGGER | while read triggers
	do
		TRIGGER_ID=`echo  $triggers | awk -F ' ' '{print $1}'`
		for i in {1..13}
		do
			RULE_LIST=`mysql -h$IP -u$USER -p$PASSWORD $DB -e "select bucket_name, short_code, service_class, preference, criteria from tbl_service_class_mapping where criteria = '${DEPLOYMENT_TYPE[$i]}' order by preference;"|grep -v "^bucket_name"`
			mkdir -p $BASE_PATH/$BKP/
			cp $BASE_PATH/app_config/${DEPLOYMENT_TYPE[$i]}.txt $BASE_PATH/$BKP/
			> $BASE_PATH/app_config/${DEPLOYMENT_TYPE[$i]}.txt
			while read -r line1; do
				if [[ $line1 = "" ]]
				then
					continue;
				fi
				bucket_name=`echo -e "$line1" | awk -F "\t" '{print $1}'`
				short_code=`echo -e "$line1" | awk -F "\t" '{print $2}'`
				service_class=`echo -e "$line1" | awk -F "\t" '{print $3}'`
				preference=`echo -e "$line1" | awk -F "\t" '{print $4}'`
				echo "$bucket_name|$short_code|$service_class|$preference" >> $BASE_PATH/app_config/${DEPLOYMENT_TYPE[$i]}.txt
			done <<< "$RULE_LIST"
		done

		MAIN_RULE_LIST=`mysql -h$IP -u$USER -p$PASSWORD $DB -e "select main_rule, short_code, salesarea, category, balance, country, imei, profile, account_group, service_offering, vlr, offer_id, zone, lte_flag, lang from tbl_main_rules_mapping order by preference;"|grep -v "^main_rule"`
		mkdir -p $BASE_PATH/$BKP/
		cp $BASE_PATH/app_config/${DEPLOYMENT_TYPE11}.txt $BASE_PATH/$BKP/
		> $BASE_PATH/app_config/${DEPLOYMENT_TYPE11}.txt
		while read -r line1; do
			if [[ $line1 = "" ]]
			then
				continue;
			fi
    			echo "processing service:: $line1"
			MAIN_RULE=`echo -e "$line1" | awk -F " " '{print $1}'`
			SHORT_CODE=`echo -e "$line1" | awk -F "\t" '{print $2}'`
			A=`echo -e "$line1" | awk -F "\t" '{print $3}'`
			B=`echo -e "$line1" | awk -F "\t" '{print $4}'`
			C=`echo -e "$line1" | awk -F "\t" '{print $5}'`
			D=`echo -e "$line1" | awk -F "\t" '{print $6}'`
			E=`echo -e "$line1" | awk -F "\t" '{print $7}'`
			F=`echo -e "$line1" | awk -F "\t" '{print $8}'`
			G=`echo -e "$line1" | awk -F "\t" '{print $9}'`
			H=`echo -e "$line1" | awk -F "\t" '{print $10}'`
			I=`echo -e "$line1" | awk -F "\t" '{print $11}'`
			J=`echo -e "$line1" | awk -F "\t" '{print $12}'`
			K=`echo -e "$line1" | awk -F "\t" '{print $13}'`
			L=`echo -e "$line1" | awk -F "\t" '{print $14}'`
			M=`echo -e "$line1" | awk -F "\t" '{print $15}'`
			echo "$MAIN_RULE|$SHORT_CODE|$A|$B|$C|$D|$E|$F|$G|$H|$I|$J|$K|$L|$M" >> $BASE_PATH/app_config/${DEPLOYMENT_TYPE11}.txt
		done <<< "$MAIN_RULE_LIST"

		mysql -h$IP -u$USER -p$PASSWORD $DB -e "call proc_trigger_update($TRIGGER_ID,0);"
	done
	for j in {1..12}
	do
		for i in {1..12}
		do
			echo "copying file $BASE_PATH/app_config/${DEPLOYMENT_TYPE[$i]}.txt"
			scp $BASE_PATH/app_config/${DEPLOYMENT_TYPE[$i]}.txt $USER@${USSD[$j]}:/home/ussddev/binaries/UMBApiManager/conf/app_config/
		done
	done
	for j in {1..12}
	do
		echo "copying file mainRules.txt"
		scp $BASE_PATH/app_config/${DEPLOYMENT_TYPE11}.txt $USER@${USSD[$j]}:/home/ussddev/binaries/UMBApiManager/conf/app_config/
	done
fi

