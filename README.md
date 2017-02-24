# Cervidae
Stateless ELK Stack using Puppet &amp; Terraform in AWS

This project has the aim to provide the ELK stack out of the box, which will launch a generic installation, which can be easily modified to suit the needs of specific situations. Elasticsearch, Logstash and Kabana will all be installed in an AWS VPC, while your client machines can either be on-premise or in the cloud with support for Several different OS versions.

To save money on AWS, the stack will also be stateless, and can be torn down at any time without data loss.


## Platform Technologies
* EC2
* S3
* Terraform
* Puppet (Masterless)
* Centos 7

## Functional Technologies
* Elasticsearch
* Logstash
* Kabana
* Filebeat

## Objectives
* Build out ELK Server Stack and S3 Bucket with Terraform
* Configure Server Stack with Masterless Puppet
* Configure Clients with Masterless Puppet
* Backup Elasticsearch to S3
* Terminate Environment every evening with complete data persistence


## Clients
* Support for Centos 6+, Ubuntu 14.04+, Amazon AMI 2015+.
* X-Platform bootstrap script (store publically so can be curled) to install Puppet.
* Configure Puppet as Masterless
* Puppet to configure Filebeat and logrotate

## Server
* Support for Centos 7 only (No other OS support required, not to be installed within legacy environments, in AWS).
* X-Platform bootstrap script (store publically so can be curled) to install Puppet.
* Configure Puppet as Masterless
* Puppet installs Elasticsearch, Logstash and Kabana respectively.
* S3 Backups from Elasticsearch daily.
