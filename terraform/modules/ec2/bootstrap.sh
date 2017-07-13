#!/usr/bin/env bash
server_type=$1

echo "cd /tmp/Cervidae && \
sudo git pull && sudo cp -r puppet /etc/ && cd /etc/puppet && sudo /usr/local/bin/librarian-puppet install && sudo puppet apply /etc/puppet/manifests/site.pp" > /tmp/apply-puppet.sh
echo "Setting server role: $server_type"

echo "Installing required packages"
sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
sudo yum -y install git ruby-devel puppet facter

echo "Installing required RubyGems"
sudo gem install librarian-puppet

echo "Setting up Puppet"
sudo rm -rf /etc/puppet

echo "Cloning Git Repo"
cd /tmp
sudo git clone https://github.com/stevenayers/Cervidae
sudo cp -r Cervidae/puppet /etc/

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



