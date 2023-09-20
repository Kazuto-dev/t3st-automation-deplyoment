#!/bin/bash

# Replace these with your actual values
S3_BUCKET_NAME="t3st-automation-1"
AWS_REGION="Asia Pacific (Singapore) ap-southeast-1"

# Sync local files to S3 bucket
aws s3 sync . s3://$S3_BUCKET_NAME --region $AWS_REGION
