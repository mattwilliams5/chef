#
# Cookbook:: django
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

execute 'update system' do
  command 'apt-get update -y'
end

package 'python-django'
