#
# Cookbook Name:: arm_dev_env
# Recipe:: packages
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Installs a bunch of useful packages

node[:arm_dev_env][:package_list].each do |pkg|
  package pkg
end
