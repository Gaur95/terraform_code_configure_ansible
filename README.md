# Terraform AWS EC2 Instances

This Terraform script sets up EC2 instances on AWS. It provisions one EC2 instance as a master node and two EC2 instances as worker nodes.

## Prerequisites

Before running this Terraform script, ensure you have the following:

- An AWS account
- Terraform installed on your local machine
- An SSH key pair created on your local machine

## Usage

## Clone this repository to your local machine:

```
git clone https://github.com/Gaur95/terraform_code_configure_ansible.git
cd terraform-aws-ec2
```

## Initialize Terraform:

```
terraform init
```
- Review and customize the terraform.tfvars file if necessary. This file contains variables such as AWS region, instance type, and SSH key name.

## Apply the Terraform configuration to create the infrastructure:

```
terraform apply
```
- After the provisioning is complete, you can access the instances via SSH using their public IP addresses.

## Configuration Details
### EC2 Instances
 - **Master Instance:**
   - Instance Type: t2.micro
   - AMI: Ubuntu Server 20.04 LTS (ami-007020fd9c84e18c7)
   - Hostname: master
   - Provisioning:
     - Installs Ansible
     - Sets hostname to "master"
  - **Worker Instance 1:**
    - Instance Type: t2.micro
    - AMI: Ubuntu Server 20.04 LTS (ami-007020fd9c84e18c7)
    - Hostname: worker1
    - No additional provisioning
  - **Worker Instance 2:**
    - Instance Type: t2.micro
    - AMI: Ubuntu Server 20.04 LTS (ami-007020fd9c84e18c7)
    - Hostname: worker2
    - No additional provisioning
  - **Key Pair**
    - Key Pair Name: myterrakey
    - Public Key: /home/akash/.ssh/id_rsa.pub
    - Security Group
      - Name: launch-wizard-1
      - Rules: Default rules allowing SSH access
## Clean Up
To tear down the infrastructure created by this Terraform script, run:
```
terraform destroy
```
