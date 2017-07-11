# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "pivio"
  end

  config.vm.network :forwarded_port, guest: 8080, host: 18080, id: 'pivio'
end
