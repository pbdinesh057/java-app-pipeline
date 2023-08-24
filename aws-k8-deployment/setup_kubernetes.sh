#!/bin/bash

# Update package lists and install required packages
sudo apt update -y
sleep 30
sudo apt install unzip jq -y
sleep 20

# Download and install kops
sudo wget https://github.com/kubernetes/kops/releases/download/v1.25.3/kops-linux-amd64
sleep 10
sudo chmod 755 kops*
sudo mv kops* /usr/local/bin/kops

# Download and install kubectl
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sleep 10
sudo chmod 755 kubectl*
sudo mv kubectl* /usr/local/bin/kubectl

# Download and install AWS CLI v2
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sleep 10
sudo unzip awscliv2.zip
sleep 10
sudo ./aws/install

# Install bash-completion for kubectl
sudo apt-get install -y bash-completion
sudo echo "source <(kubectl completion bash)" >> ~/.bashrc
source ~/.bashrc

# Create Kubernetes cluster using kops
sudo kops create cluster --name=k8-dinesh.xyz --state=s3://k8-dinesh.xyz --zones=us-east-1b --node-count=1 --node-size=t2.medium --master-size=t2.medium --master-volume-size 20 --node-volume-size 10 --dns-zone=k8-dinesh.xyz --yes
