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

# Overrides the HOME env variable to vagrant user's home
export HOME='/home/vagrant/'

# Disables known_hosts file checking. That level of security is not needed in virtual environments.
echo 'ANSIBLE_HOST_KEY_CHECKING=False' > /etc/profile.d/ansible-host-key-checking.sh

# Runs the Ansible playbook if present
if [ -f /home/vagrant/ansible/playbook.yml ]; then
  echo 'Running Ansible playbook.'
  sudo -u vagrant ansible-playbook /home/vagrant/ansible/playbook.yml
fi
