#!/usr/bin/env bash
server_type=$1

echo "Setting server role: $server_type"

echo "Installing required packages"
sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
sudo yum -y install git ruby-devel puppet facter

echo "Installing required RubyGems"
sudo gem install librarian-puppet

#echo "Installing Terraform"
#cd /tmp
#wget https://releases.hashicorp.com/terraform/0.7.3/terraform_0.7.3_linux_amd64.zip
#unzip terraform_0.7.3_linux_amd64.zip
#sudo mv -f terraform /usr/local/bin/

echo "Setting up Puppet"
sudo rm -rf /etc/puppet

echo "Cloning Git Repo"
sudo git clone https://github.com/Stevea37/Cervidae
sudo cp -r Cervidae/Puppet /etc/
sudo mv /etc/Puppet /etc/puppet

cat <<EOF >> /tmp/servertype.sh
#!/bin/bash

echo "server_type=$server_type"
EOF

sudo mkdir -p /etc/facter/facts.d/
sudo mv /tmp/servertype.sh /etc/facter/facts.d/
sudo chmod 755 /etc/facter/facts.d/servertype.sh

echo "Applying Puppet Manifest"
cd /etc/puppet
sudo /usr/local/bin/librarian-puppet install
sudo puppet apply /etc/puppet/manifests/site.pp