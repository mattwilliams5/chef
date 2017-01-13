#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'java-1.7.0-openjdk-devel'

group 'tomcat'


user 'tomcat' do
  manage_home false
  shell  '/bin/nologin'
  group 'tomcat'
  home '/opt/tomcat'
end

directory '/opt/tomcat' do
  action :create
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
end

remote_file 'apache-tomcat-8.5.9.tar.gz' do
  source 'http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.9/bin/apache-tomcat-8.5.9.tar.gz'
end

execute 'untar appache' do
  command 'tar zxf /apache-tomcat-8.5.9.tar.gz -C /opt/tomcat'
end

execute 'update permissions' do
  command 'chown -R tomcat.tomcat /opt/tomcat/apache-tomcat-8.5.9/* && chmod 0755 /opt/tomcat/apache-tomcat-8.5.9/*'
end

directory '/opt/tomcat/apache-tomcat-8.5.9/' do
  owner 'tomcat'
  group 'tomcat'
  recursive true
  mode '0755'
end

file '/etc/systemd/system/tomcat.service' do
  action :create
end
