#!/usr/bin/env bash


cd ~/Cervidae && \
echo Pulling changes && \
sudo git pull && \
echo Deleting old puppet && \
sudo rm -rf /etc/puppet && \
echo Moving new puppet && \
sudo cp -r puppet /etc/ && \
cd /etc/puppet && \
echo Installing librarian-puppet stuff && \
sudo /usr/local/bin/librarian-puppet install && \
echo Applying Manifest && \
sudo puppet apply /etc/puppet/manifests/site.pp