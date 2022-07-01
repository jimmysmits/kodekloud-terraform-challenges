# Welcome to the Terraform Challenges series

In this challenge we will implement a simple EC2 instance with some preinstalled packages. Utilize `/root/terraform-challenges/project-citadel` directory to store your Terraform configuration files.

Inspect the requirements in detail by clicking on the icons of the interactive architecture diagram on the right and complete the tasks. Once done click on the Check button to validate your work.

Amazon Web Services (AWS) provider have been configured already to interact with the many resources supported by AWS.

## EC2: aws_instance

- AMI: ami-06178cf087598769c, use variable named `ami`
- Region: eu-west-2, use variable named `region`
- Instance Type: m5.large, use variable named instance_type
- Elastic IP address attached to the EC2 instance

## Key-pair: aws_key_pair

- Create a terraform key-pair `citadel-key` with key_name `citadel`.
- Upload the public key `ec2-connect-key.pub` to the resource. You may use the file function to read the the public key at `/root/terraform-challenges/project-citadel/.ssh`

## nginx

- Install nginx on citadel instance, make use of the `user_data` argument.
- Using the file function or by making use of the heredoc syntax, use the script called `install-nginx.sh` as the value for the `user_data` argument.

## EIP: aws_eip

Create a local-exec provisioner for the eip resource and use it to print the attribute called `public_dns` to a file `/root/citadel_public_dns.txt` on the iac-server
