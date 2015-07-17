#!/usr/bin/env bash

# Bootstraps the management node.

# Note:
# In this version of this script, the only automated way to update Ansible
# package is to destroy the environment and recreate with `vagrant up`.

if which ansible>/dev/null; then
  echo 'Ansible package is present, skipping updates.'
else
  # Install ansible (http://docs.ansible.com/intro_installation.html)
  apt-get -y install software-properties-common
  apt-add-repository -y ppa:ansible/ansible
  apt-get update
  apt-get -y install ansible
fi

# Delete the old ansible scripts if present
rm -rf /home/vagrant/ansible

# Put the Ansible scripts and static files to their desired location
cp -ra /vagrant/ansible /home/vagrant/

# Install the predefined SSH-key pair
cp /vagrant/mgmt_files/id_rsa* /home/vagrant/.ssh

# Limits the permissions on the private key
chmod 0600 /home/vagrant/.ssh/id_rsa

# Fixes the ownership of all files, including the newly copied ones
chown -R vagrant:vagrant /home/vagrant/

# Make other nodes recognizable by name
cp /vagrant/common_files/hosts.system /etc/hosts

# Set up the Ansible hosts file
cp /vagrant/mgmt_files/hosts.ansible /etc/ansible/hosts

# Overrides the HOME env variable to vagrant
export HOME='/home/vagrant/'

# Runs the default Envy Ansible playbook for installing SSH keys on common nodes
sudo -u vagrant ansible-playbook /home/vagrant/ansible/installation.yml

# Runs the custom Ansible playbook if present
if [ -f /home/vagrant/ansible/custom-installation.yml ]; then
  echo 'Running custom installation playbook.'
  sudo -u vagrant ansible-playbook /home/vagrant/ansible/custom-installation.yml
fi
