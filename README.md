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




