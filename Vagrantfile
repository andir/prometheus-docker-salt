# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"
  config.vm.synced_folder "./salt", "/srv/salt"
  config.vm.synced_folder "./pillar", "/srv/pillar"

  config.vm.provision :salt do |salt|
      salt.minion_id = "foo bar foo"
      salt.masterless = true
#      salt.minion_config = "salt/minion"
      salt.run_highstate = true

  end
end

