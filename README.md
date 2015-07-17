# Envy

Envy is an easy to use multi-machine vagrant env setup with ansible provisioning.

## Node configuration file
Each node is defined in the `nodes.yml` file in the following way:

```
- node:
  host: [hostname]
  ip: [private-ipv4-address]
  mem: [available-ram-memory]
```

Currently there are no default settings available, therefore you need to specify all option in order for the Vagrantfile to run successfully.

## Adding your own Ansible provisioning scripts

Create a playbook `ansible/custom-installation.yml` which will be at provisioning if present.

The correct approach for integrating Ansible repos is left to be determined, whether it be git submodules or advanced git exclusion strategies to allow for cloning your scripts in place.

## Running

Just `vagrant up` .
