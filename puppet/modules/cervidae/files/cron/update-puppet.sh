#!/bin/bash

logger "Starting puppet run"

# Move to the right location
cd /etc/puppet

# Pull in the latest repo
git fetch && git pull

# Make sure the modules are up to date
librarian-puppet install

# Make sure the modules are up to date
librarian-puppet update

# Apply the puppet config
puppet apply /etc/puppet/manifests/site.pp


logger "Puppet run complete"
