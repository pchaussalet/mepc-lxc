# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.define :puppetmaster do |master_config|
    master_config.vm.box = "quetzal"
    master_config.vm.box_url = "http://ovh.to/41D6"
    master_config.ssh.private_key_path = "mepc.pem"
    master_config.vm.network :hostonly, "10.3.0.2"
    master_config.vm.host_name = 'puppetmaster'
    master_config.vm.customize ["modifyvm", :id, "--name", 'mepc_puppetmaster']
    master_config.vm.provision :puppet, 
                               :facter => {'fqdn' => 'puppet.mepc.lan'} do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file  = "puppetmaster.pp"
    end
  end

  config.vm.define :monitoring do |monitoring_config|
    monitoring_config.vm.box = "quetzal"
    monitoring_config.vm.box_url = "http://ovh.to/41D6"
    monitoring_config.ssh.private_key_path = "mepc.pem"
    monitoring_config.vm.network :hostonly, "10.3.0.3"
    monitoring_config.vm.host_name = 'monitoring'
    monitoring_config.vm.customize ["modifyvm", :id, "--name", 'mepc_monitoring']
    monitoring_config.vm.provision  :puppet, 
                                  :facter => {'fqdn' => 'monitoring.mepc.lan'},
                                  :module_path => 'puppet/modules' do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file  = "monitoring.pp"
    end
  end

  config.vm.define :lxc_host do |lxc_config|
    lxc_config.vm.box = "quetzal"
    lxc_config.vm.box_url = "http://ovh.to/41D6"
    lxc_config.ssh.private_key_path = "mepc.pem"
    lxc_config.vm.network :hostonly, "10.3.0.4"
    lxc_config.vm.host_name = 'lxc'
    lxc_config.vm.customize ["modifyvm", :id, "--memory", 4096]
    lxc_config.vm.customize ["modifyvm", :id, "--name", 'mepc_lxc-host']
    lxc_config.vm.provision  :puppet, 
                                  :facter => {'fqdn' => 'lxc.mepc.lan'},
                                  :module_path => 'puppet/modules' do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file  = "lxc_host.pp"
    end
  end

end
