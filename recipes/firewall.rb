include_recipe 'firewall::default'

ports = node.default['lamp_jenkins']['open_ports']

firewall_rule "open ports #{ports}" do
  port ports
end

firewall 'default' do
  action :save
end
