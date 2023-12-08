Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"

  config.vm.provider "virtualbox" do |v|
    v.cpus = 2
    v.memory = 8192
  end

  config.vm.provision "shell",
    inline: "apt-get update && apt-get upgrade -y && apt-get install ansible -y"

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "plabook.yml"
  end

end
