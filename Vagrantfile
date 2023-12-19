Vagrant.configure("2") do |config|

  config.vm.define "vm1" do |vm1|
    vm1.vm.box = "ubuntu/focal64"
    vm1.vm.hostname = 'vm1'
    vm1.vm.network "private_network", ip: "10.128.0.3", hostname: true


    vm1.vm.provider "virtualbox" do |v|
      v.cpus = 2
      v.memory = 8192
    end

    vm1.vm.provision "shell",
      inline: "apt-get update && apt-get upgrade -y && apt-get install ansible -y"

      vm1.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbook-vm1.yml"
    end
  end

  config.vm.define "vm2" do |vm2|

    vm2.vm.box = "ubuntu/focal64"

    vm2.vm.provider "virtualbox" do |v|
      v.cpus = 2
      v.memory = 8192
    end
    vm2.vm.network "private_network", ip: "10.128.0.4", hostname: true

    vm2.vm.provision "shell",
      inline: "apt-get update && apt-get upgrade -y && apt-get install ansible -y"
      vm2.vm.provision "ansible_local" do |ansiblevm2|
        ansiblevm2.playbook = "playbook-vm2.yml"
    end
  end

end
