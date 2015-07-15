# Define the virtual environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Define the nodes
  nodes = {
    server1: '192.0.2.1', 	# Bootstrap Consul server
    server2: '192.0.2.2',	# Consul server
    server3: '192.0.2.3',	# Consul server
    agent1: '192.0.2.50',	# Consul agent
  };

  # Create the necessary nodes
  nodes.each do |nodeName, nodeIp|
	  config.vm.define nodeName do |node|
	      node.vm.box = "ubuntu/trusty64"
	      node.vm.hostname = nodeName
	      node.vm.network :private_network, ip: nodeIp
	      node.vm.provider "virtualbox" do |vb|
		vb.memory = 256
	      end
	  end
  end
end
