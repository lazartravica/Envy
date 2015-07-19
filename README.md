# Envy

Envy is an easy to use multi-machine Vagrant environment with support for custom Ansible provisioning.

All environment configuration should be done in the `nodes.yml` YAML configuration file.

## Node configuration file
Each node is defined in the `nodes.yml` file in the following way:

```
- node: [hostname]
  ip: [private-ipv4-address]
  mem: [available-ram-memory]
  groups:
    - [group-name]
    - ...
```

For more information, you can look at the example `nodes.yml` provided.

`groups` attribute is the only optional attribute in defining a node.

## Adding your own Ansible scripts

Clone your repo containing the Ansible scripts into the `ansible` folder.

The `ansible/playbook.yml` will be executed when provisioning.

```
git clone [your-git-repo] ansible
```

## Running

Just `vagrant up`.
