Vagrant.configure("2") do |config|
  config.vm.box = "windows-2016-amd64"
  config.vm.provider "virtualbox" do |vb|
    vb.linked_clone = true
    vb.memory = 4096
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
  end
  config.vm.provider "libvirt" do |vb|
    vb.memory = 4096
    vb.cpus = 2
  end

  config.vm.network "private_network", ip: "10.0.0.2"
  config.vm.provision "windows-update"
  config.vm.provision "shell", path: "ps.ps1", args: "setup.ps1"
  config.vm.provision "reload"
end
