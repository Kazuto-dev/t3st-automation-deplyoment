<<<<<<< HEAD
# Creating Bitbucket Pipelines
=======
#Creating Bitbucket PIPEPLINES
>>>>>>> b7b7465fc6dc56717982c46c70d6c89098a3f22a
1. go to bitbucket and create repository
2. go to sourcetree and clone that repository
3. go to amazon and create an s3 bucket
3.1 ACLs Enabled > uncheck "Block all public access" > enabled bucket versioning > Create Bucket
4. go to Properties and look for Static Web Hosting > Enabled it > Save Changes
5. go to IAM role in amazon and in the leftside panel go to users
5.1 Create Users
5.2 Name of user
5.3 Set permissions to "Attach policies directly"
5.4 Search for "AmazonS3FullAccess" then click Create Policy
5.5 Create Access key > use CLI for use case > describe the purpose and create access key
6. go to you bitbucket
6.1 go to repository settings on the left side panel
6.2 under pipelines go to "Repository Variables"
6.3 Add the Access Key and the Secret Access Key that you created earlier in IAM role in amazon
7. move to your cloned repo in local machine and create file named "bitbucket-pipelines.yml"
7.1 open text editor and paste this:
image: amazon/aws-cli:latest

pipelines:
  default:
    - step:
        name: Deploy to S3
        script:
          - aws s3 cp test.html s3://t3st-automation-1/

7.2 create another file named deploy.sh
7.3 open it in text editor and paste this:
#!/bin/bash

# Replace these with your actual values
S3_BUCKET_NAME="t3st-automation-1"
AWS_REGION="Asia Pacific (Singapore) ap-southeast-1"

# Sync local files to S3 bucket
aws s3 sync . s3://$S3_BUCKET_NAME --region $AWS_REGION

7.4 commit on sourcetree and upload it on the bitbucket
7.5 go to bitbucket and click on pipelines
7.6 check if the pipeline is running
8. go to amazon and check if the file is uploaded in the s3 bucket
9. go to objects and click actions
10. click "Make Public"
