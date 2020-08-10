# -*- mode: ruby -*-

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provider :virtualbox do |v|
    v.memory = 512
    v.linked_clone = true
  end

  # Password manager
  config.vm.define "pass" do |pass|
    pass.vm.hostname = "pass-acm.test"
    pass.vm.network :private_network, ip: "192.168.60.2"
  end
end
