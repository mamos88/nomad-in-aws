# HashiCorp Nomad/Consul Sandbox Creation Code
This repository was created to help individuals that want to quickly and easily provision a HashiCorp Nomad/Consul environment in AWS.  

# Pre-deployment Requirements
1. You have an AWS account created
2. You have HashiCorp Terraform, HashiCorp Packer and AWS CLI installed on your local machine
3. You have created an IAM user assigned the appropriate permissions and created an access key (This will be needed by Terraform and Packer)

# Pre-deployment Installation
* Terraform installation can be found at: https://developer.hashicorp.com/terraform/downloads
* Packer installation can be found at: https://developer.hashicorp.com/packer/downloads
* AWS CLI installation can be found at: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

# Deployment Steps High Level Summary

## Configure AWS access key / secret key profile on local machine 
*(Requires AWS CLI client to be installed before step 1 - See Pre-deployment Installation)*
1. On your local machine run **aws configure --profile test-profile**
2. It will ask you for the access key, secret key, default region, etc.
3. Once this is completed the test-profile profile will be used

## 

