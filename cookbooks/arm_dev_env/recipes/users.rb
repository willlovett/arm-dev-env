#
# Cookbook Name:: arm_dev_env
# Recipe:: users
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Sets up users, passwords and the like

user node[:arm_dev_env][:user] do
  comment "Dev user, created by arm_dev_env cookbook"
  supports :manage_home => true
  uid node[:arm_dev_env][:user_uid]
  gid "admin"
  home "/home/#{node[:arm_dev_env][:user]}"
  shell "/bin/bash"
  password node[:arm_dev_env][:user_pass_hash]
  action :create
end

# Set the root and vagrant user passwords to whatever was specified
# for the development user.  This *slightly* improves security
# WL: TODO - remove the default vagrant authorized key (which is
# insecure) and replace it with a user-specified public key
user 'root' do
  password node[:arm_dev_env][:user_pass_hash]
  action :modify
end

user 'vagrant' do
  password node[:arm_dev_env][:user_pass_hash]
  action :modify
end
