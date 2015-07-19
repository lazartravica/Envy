# Envy

Envy is an easy to use multi-machine vagrant env setup with ansible provisioning.

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

For more information, you can look at the example nodes.yml provided, be sure to change it.

Groups options is the only optional option in defining a node.

Currently there are no default settings available, therefore you need to specify all option in order for the Vagrantfile to run successfully.

More options, and default fallbacks are coming soon.

## Adding your own Ansible provisioning scripts

Clone your repo containing the Ansible provisioning scripts into the `ansible` folder.

The `ansible/playbook.yml` will be executed when provisioning.

```
git clone [your-git-repo] ansible
```

## Running

Just `vagrant up` and hope for the best.
