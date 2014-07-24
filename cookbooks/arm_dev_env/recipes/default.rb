#
# Cookbook Name:: arm_dev_env
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Set up users and passwords
include_recipe "arm_dev_env::users"

# Install a bunch of packages
include_recipe "arm_dev_env::packages"
