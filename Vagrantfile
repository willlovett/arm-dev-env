# -*- mode: ruby -*-
# vi: set ft=ruby :

require "rubygems"
require "json"

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Read in default settings from settings file, and override them with
# any environment variables
settings = JSON.parse(open("default_settings.json").read())

for setting in settings.keys
  if ENV[setting]
    # If the env var parses as an int, convert it, otherwise leave it
    # alone
    begin
      settings[setting] = Integer(ENV[setting])
    rescue ArgumentError
      # This env var is not an int - pass it straight through
      settings[setting] = ENV[setting]
    end
  end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "trusty-server-cloudimg-amd64-vagrant-disk1"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.berkshelf.enabled = true


  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # WL: TODO - virtualbox guest additions is out of sync with my
  # virtualbox version, which means synced folders aren't working for
  # me right now.  Digest
  # https://github.com/mitchellh/vagrant/issues/3341 and work out a
  # fix
  # config.vm.synced_folder settings['VAGRANT_EXPORT_DIR'], "/export", owner: settings['VAGRANT_DEV_USER']

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = settings['VAGRANT_NUM_CPUS']
    vb.memory = settings['VAGRANT_MEMORY']
    vb.gui = settings['VAGRANT_DISABLE_GUI'].zero?
  end

  # Install everything the arm dev environment needs
  config.vm.provision "chef_solo" do |chef|
    chef.json = {
      'arm_dev_env' => {
        'user' => settings['VAGRANT_DEV_USER'],
        'user_pass_hash' => settings['VAGRANT_DEV_USER_PASSWORD_HASH'],
        'user_uid' => settings['VAGRANT_DEV_USER_UID']
      }
    }
    chef.add_recipe "arm_dev_env"
  end
end
