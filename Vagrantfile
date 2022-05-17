Vagrant.configure("2") do |config|
    config.vm.provision "shell", inline: <<-SHELL
        echo "10.0.10.10  ansible-controller" >> /etc/hosts
        echo "10.0.10.11  alma-node" >> /etc/hosts
        echo "10.0.10.12  db-node" >> /etc/hosts
		echo "10.0.10.13 web-node" >> /etc/hosts
		echo "10.0.10.14 win-node" >> /etc/hosts
    SHELL
    
    config.vm.define "ansible-controller" do |controller|
      controller.vm.box = "ubuntu/jammy64"
      controller.vm.hostname = "ansible-controller"
      controller.vm.network "private_network", ip: "10.0.10.10"
      controller.vm.provider "virtualbox" do |vb|
          vb.memory = 4096
          vb.cpus = 2
          vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      end
      controller.vm.provision "shell", path: "scripts/controller-install-script.sh"
    end
  
    config.vm.define "alma-node" do |node|
      node.vm.box = "almalinux/8"
      node.vm.hostname = "alma-node"
      node.vm.network "private_network", ip: "10.0.10.11"
      node.vm.provider "virtualbox" do |vb|
          vb.memory = 2048
          vb.cpus = 2
          vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      end
      node.vm.provision "shell", path: "scripts/alma-node-install-script.sh"
    end
 
    config.vm.define "db-node" do |node|
      node.vm.box = "ubuntu/jammy64"
      node.vm.hostname = "db-node"
      node.vm.network "private_network", ip: "10.0.10.12"
      node.vm.provider "virtualbox" do |vb|
          vb.memory = 2048
          vb.cpus = 2
          vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      end
      node.vm.provision "shell", path: "scripts/ubuntu-node-install-script.sh"
    end
 
    config.vm.define "web-node" do |node|
      node.vm.box = "ubuntu/jammy64"
      node.vm.hostname = "web-node"
      node.vm.network "private_network", ip: "10.0.10.13"
	  node.vm.provider "virtualbox" do |vb|
          vb.memory = 2048
          vb.cpus = 2
          vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      end
      node.vm.provision "shell", path: "scripts/ubuntu-node-install-script.sh"
    end

    config.vm.define "win-node" do |node|
      node.vm.box = "gusztavvargadr/windows-server-2019-standard"
      node.vm.hostname = "web-node"
      node.vm.network "private_network", ip: "10.0.10.14"
	  node.vm.provider "virtualbox" do |vb|
          vb.memory = 4096
          vb.cpus = 2
          vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      end
    end

end
