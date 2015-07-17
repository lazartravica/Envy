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

## TODO: Adding your own Ansible provisioning scripts

Precise instructions will be available soon. The goal is to have your custom Ansible scripts run on `vagrant up`.

The correct approach is left to be determined, whether it be git submodules or advanced git exclusion strategies to allow for cloning your scripts in place.

## Running

Just `vagrant up` .
