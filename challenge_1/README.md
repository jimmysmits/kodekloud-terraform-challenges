# Welcome to the Terraform Challenges series

In this challenge we will deploy several Kubernetes resources using terraform. Utilize `/root/terraform_challenge directory` to store your Terraform configuration files.

Inspect the requirements in detail by clicking on the icons of the interactive architecture diagram on the right and complete the tasks. Once done click on the Check button to validate your work.

Terraform version: 1.1.5 installed on control plane?

## Install Terraform

Install terraform binary version=`1.1.5` on `iac-server`
`sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl`
`curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -`
`sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"`
`sudo apt-get update && sudo apt-get install terraform=1.1.5`

## Kubernetes provider

Configure terraform and provider settings within provider.tf file with following specifications:

- Configure terraform to use `hashicorp/kubernetes` provider.
- Specify the provider's local name: `kubernetes`
- Provider version: `2.11.0`
- Configure kubernetes provider with path to your kubeconfig file: `/root/.kube/config`

## Kubernetes deployment: kubernetes_deplyment

Create a terraform resource `frontend` for kubernetes deployment with following specs:

- Deployment Name: `frontend`
- Deployment Labels = `name: frontend`
- Replicas: `4`
- Pod Labels = `name: webapp`
- Image: `kodekloud/webapp-color:v1`
- Container name: `simple-webapp`
- Container port: `8080`

## Kubernetes service: kubernetes_service

Create a terraform resource `webapp-service` for kubernetes service with following specs:

- Service name: `webapp-service`
- Service Type: `NodePort`
- Port: `8080`
- NodePort: `30080`
