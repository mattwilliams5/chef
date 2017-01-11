#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
package "mysql-server" do
end

package "mysql" do
end

execute "mysql_secure_installation" do
	command "mysql_secure_installation"
	action :run
end

service "mysqld" do
action [ :enable, :start ]
end
