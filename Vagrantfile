Vagrant.configure("2") do |config|

  config.vm.define "vm1" do |vm1|
    vm1.vm.box = "generic/ubuntu2004"
    vm1.vm.hostname = 'vm1'
    vm1.vm.network "private_network", ip: "10.128.0.3", hostname: true
    vm1.vm.network "forwarded_port", guest: 80, host: 8081
    vm1.vm.synced_folder "./", "/vagrant"
    vm1.vm.provider "vmware_desktop" do |v|
      v.gui = true
    end

    vm1.vm.provision "shell",
      inline: "apt-get update && apt-get upgrade -y && apt-get install ansible -y"

      vm1.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbook-vm1.yml"
    end
  end

  config.vm.define "vm2" do |vm2|

    vm2.vm.box = "generic/ubuntu2004"
    vm2.vm.hostname = 'vm2'

    vm2.vm.provider "vmware_desktop" do |v|
      v.gui = true
    end
    vm2.vm.network "private_network", ip: "10.128.0.4", hostname: true
    vm2.vm.network "forwarded_port", guest: 80, host: 8083
    vm2.vm.synced_folder "./", "/vagrant"
    vm2.vm.provision "shell",
      inline: "apt-get update && apt-get upgrade -y && apt-get install ansible -y"
      vm2.vm.provision "ansible_local" do |ansiblevm2|
        ansiblevm2.playbook = "playbook-vm2.yml"
    end
  end

end
