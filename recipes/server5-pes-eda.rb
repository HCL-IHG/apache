environment = node.chef_environment
environment = 'Production'
edakafkasvrs = node['edakafka'][environment]
template '/etc/logstash/conf.d/pes-eda.conf' do
  source 'server5-PES.conf.erb'
  owner 'root'
  group 'root'
  mode '0640'
#  notifies :restart, 'service[logstash]'
  variables(edakafkasvr: edakafkasvrs)
  not_if { node['Datacenter'] == 'SJCD1' }
end

template "#{node['logstash']['dir']}/elasticsearch-template5-pes-eda.json" do
  source 'server5-PES.template-json.erb'
#  owner 'logstash'
#  group 'logstash'
  mode '0644'
#  notifies :restart, 'service[logstash]'
  not_if { node['Datacenter'] == 'SJCD1' }
end
