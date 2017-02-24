# ELK-toolbox
Stateless ELK Stack using Puppet &amp; Terraform in AWS


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
