#!/bin/bash
export YEAR=${YEAR:=2015}
echo "Downloading YEAR=$YEAR..."
for MONTH in `seq -w 1 12`; do
echo $YEAR$MONTH
PARAMS="UserTableName=On_Time_Performance&DBShortName=&RawDataTable=T_ONTIME&sqlstr=+SELECT+FL_DATE%2CUNIQUE_CARRIER%2CAIRLINE_ID%2CCARRIER%2CF$
RESPONSE=$(curl -X POST --data "$PARAMS" https://www.transtats.bts.gov/DownLoad_Table.asp?Table_ID=236&Has_Group=3&Is_Zipped=0)
echo "Received $RESPONSE"
ZIPFILE=$(echo $RESPONSE | tr '\"' '\n' | grep zip)
echo $ZIPFILE
curl -o $YEAR$MONTH.zip $ZIPFILE
done
