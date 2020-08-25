# Setting up a Centos 7 box to act as kubectl command host:

This document will walk you through the steps required to attach a Centos7 box to your EKS cluster via 

## Requirements

* Your host server must be an EC2 instance with an instance role or have access to an IAM user with policy allowing required IAM EKS actions/resources.


## Setup


* Install and configure aws cli 
```
#!!! steps needed for install

aws configure

```

* Install the aws-iam-authenticator ( not 100% sure it is needed???? )

```
curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
sudo mv aws-iam-authenticator /usr/local/bin/
```


* Install the kubernetes client

```
cat <<EOF > ./kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

sudo mv ./kubernetes.repo /etc/yum.repos.d/

sudo yum install -y kubectl
```

* Configure kubectl for you eks cluster

```
aws eks --region us-east-1 update-kubeconfig --name odp-eks-jerbFJf4
```