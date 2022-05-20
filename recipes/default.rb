#
# Cookbook:: ihg-mycookbook
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
ipaddressnodes  = node.chef_environment
myipaddressnodes  = node['ipaddress']
template '/etc/motd' do
  source 'motd.erb'
  variables(myipaddressnode: myipaddressnodes)
  action :create
end
