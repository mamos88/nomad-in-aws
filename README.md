# nomad-in-aws
Terraform code to create a Nomad/Consul 3 node cluster in AWS

This code can be used to build a Nomad/Consul 3 node cluster in AWS.  

Optional components 

- Terraform Cloud integration to manage state
    - Remove backend.tf if you dont need this feature and the state will be stored locally

- Azure Pipeline integration to automate Terraform apply and Terraform destory
    - No action required to disable

