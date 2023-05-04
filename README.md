# HashiCorp Nomad/Consul Sandbox Creation Code
This repository was created to help individuals that want to quickly and easily provision a HashiCorp Nomad/Consul environment in AWS.  

# Pre-deployment Requirements
1. You have an AWS account created
2. You have HashiCorp Terraform, HashiCorp Packer, git and AWS CLI installed on your local machine
3. You have created an IAM user assigned the appropriate permissions and created an access key (This will be needed by Terraform and Packer)
4. You have an IDE installed such as Visual Studio Code

# Pre-deployment Installation
* Terraform installation can be found at: https://developer.hashicorp.com/terraform/downloads
* Packer installation can be found at: https://developer.hashicorp.com/packer/downloads
* AWS CLI installation can be found at: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
* Git installation can be found at: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

# Deployment Steps High Level Summary

## Configure AWS access key / secret key profile on local machine 
*(Requires AWS CLI client to be installed before step 1 - See Pre-deployment Installation)*
1. On your local machine run **aws configure --profile test-profile**
2. It will ask you for the access key, secret key, default region, etc.  You should have this information from step 3 in the Pre-deployment Requirements. 
3. Once this is completed the test-profile profile will be used

## Clone this repository
1. On your local machine run **git clone https://github.com/mamos88/nomad-in-aws.git**
2. This should clone the repository down to your local machine so you can update the required inputs

## Amazon Machine Image Creation (AMI) Using Packer
1. The packer folder contains two sub folders; server and client folders
2. It is recommended to build the server AMI first.  There are a few variables in the file that you should update and include:
   * ami_name
   * region
3. At run time, you need to pass in the profile (which is test-profile based on the instructions above) and server_source_ami variables.  The server_source_ami would be the latest Amazon Linux AMI id in the region you will be deploying the environment.
4. 