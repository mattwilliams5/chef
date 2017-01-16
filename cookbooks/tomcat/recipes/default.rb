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
  command 'tar zxf /apache-tomcat-8.5.9.tar.gz --strip-components=1 -C /opt/tomcat'
end

directory '/opt/tomcat/apache-tomcat-8.5.9/' do
  action :delete
  recursive true
end

execute 'update permissions' do
  command 'chown -R tomcat.tomcat /opt/tomcat/* && chmod 0755 /opt/tomcat/*'
end

directory '/opt/tomcat/' do
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
  recursive true
end

template '/etc/systemd/system/tomcat.service' do
  source 'tomcat.service.erb'
  mode 0644
  owner 'root'
  group 'root'
end

service 'tomcat' do
  action [:start, :enable]
end
