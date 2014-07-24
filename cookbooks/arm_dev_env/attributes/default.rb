# Username and password hash for the development user
# It is recommended you override these
default[:arm_dev_env][:user]                    = "dev_user"
# This is the hash for 'passw0rd'.  To generate a hash for your own password, run:
# openssl passwd -1 "mysupersecretpassword"
default[:arm_dev_env][:user_pass_hash]          = "$1$xK19/WTG$05eKRosM.0Pwly3mMuEBB/"
default[:arm_dev_env][:user_uid]                = 500
default[:arm_dev_env][:package_list]            = []
# 'emacs',
#                                                    'git',
#                                                    'ubuntu-desktop']
