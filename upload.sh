#!/bin/bash

export BUCKET=${BUCKET:=jimbooth-datascience}  // Updated to my bucket for this project, need to change to your own

echo "Uploading to bucket $BUCKET..."

gsutil -m cp *.csv gs://$BUCKET/flights/raw
gsutil -m acl ch -R -g google.com:R gs://$BUCKET/flights/raw
