# IaC

## AWS S3 Bucket Creation using CloudFormation

This project contains an AWS CloudFormation template (`template.yaml`) to create an S3 bucket and shell scripts to deploy and delete the stack. The Shell Scripts are contain in the Scripts repository
### Prerequisites

Ensure you have the following installed:
- AWS CLI
- AWS credentials configured (`aws configure`)
- Bash shell

### Files in this Repository
- `template.yaml`: CloudFormation template to create an S3 bucket.
### Files in the  scripts repository
- `deploy` : a script to deploy this above template.
- `delete` : a script to delete this create stack.

### Deploying the S3 Bucket

1. Ensure you have AWS credentials configured.
2. Run the deployment script:
   ```sh
   ./deploy
   ```
3. The script will create an S3 bucket using CloudFormation.

### Deleting the S3 Bucket

1. Run the delete script:
   ```sh
   ./delete
   ```
2. This will delete the CloudFormation stack and remove the S3 bucket.

### CloudFormation Template (`template.yaml`)

```yaml
AWSTemplateFormatVersion: '2010-09-09'
Resources:
  S3Bucket:
    Type: AWS::S3::Bucket
```
### deploy-IaC (`deploy.sh`)

```sh
##!/usr/bin/env bash
echo "== deploy s3 bucket with cloudformation"

STACK_NAME="cloudformation-test-one"

aws cloudformation deploy \
--template-file template.yaml \
--region us-east-1 \
--stack-name $STACK_NAME 

if [ $? -ne 0 ]; then
  echo "Error deploying CloudFormation stack."
  exit 1
fi

echo "CloudFormation stack deployed successfully."

```
### delete-IaC (`delete.sh`)

```sh
#!/usr/bin/env bash

echo "== delete s3 bucket with cloudformation"

STACK_NAME="cloudformation-test-one"

aws cloudformation delete-stack \
--stack-name $STACK_NAME \
--region us-east-1

if [ $? -ne 0 ]; then
  echo "Error deleting CloudFormation stack."
  exit 1
fi

echo "CloudFormation stack deleted successfully."
```

### END ---1

# Terraform S3 Bucket Project

In addition to the CloudFormation project, I also created a simple S3 bucket using **Terraform**.

## Steps

1. Installed **Terraform** on my WSL environment.  
2. Created a **Terraform** folder and added two files:  
   - `main.tf`  
   - `s3.tf`  
3. Initialized Terraform:  
   terraform init
4. Planned the deployment
  terraform plan
5. Applied the configuration to create the S3 bucket
  terraform apply
6. Destroyed the infrastructure when no longer needed
  terraform destroy

#####Terraform S3 Bucket with Versioning and ETag Tracking
Overview
This project demonstrates how to create an Amazon S3 bucket using Terraform, enable versioning, and track changes to objects using ETag (MD5 hash).

Project Structure
main.tf: Contains the Terraform configuration for creating the S3 bucket and uploading an object.
etag/: Folder used to track changes to the uploaded object.
myfile.txt: Example file uploaded to the S3 bucket.
Steps to Implement
1. Initialize Terraform and Define AWS Provider
Terraform requires the AWS provider to interact with AWS services. In main.tf, we specify the AWS provider and required version

2. Create an S3 Bucket
We create an S3 bucket resource

3. Enable Versioning on the S3 Bucket
To track changes to uploaded objects, enable versioning

4. Upload an Object with ETag Tracking
We upload myfile.txt to the S3 bucket and generate an ETag to track changes

5. Initialize and Apply Terraform
Run the following commands to initialize and apply your Terraform configuration

terraform init    # Initialize Terraform  
terraform apply   # Apply the configuration  

How ETag Helps in Change Tracking
The ETag is an MD5 hash of the uploaded file.
When the file content changes, Terraform detects the modification and updates the object.
Combined with versioning, S3 keeps track of all changes to the object over time.
Conclusion
This setup allows you to:
-Create an S3 bucket using Terraform.
-Enable versioning to track changes to stored objects.
-Use ETag (MD5 hash) to detect changes in uploaded files.


