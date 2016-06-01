httpd_service 'default' do
  mpm 'prefork'
  listen_ports [80, 443]
  action [:create, :start]
end

httpd_module 'php' do
  instance 'default'
end

httpd_module 'ssl' do
  action :create
end

httpd_module 'proxy' do
  action :create
end

httpd_module 'proxy_http' do
  action :create
end

ssl_certificate 'web' do
  key_path node['lamp_jenkins']['ssl_key']['key_path']
  cert_path node['lamp_jenkins']['ssl_key']['cert_path']
end

httpd_config 'default' do
  instance 'default'
  source 'default.conf.erb'
  notifies :restart, 'httpd_service[default]'
end

selinux_policy_boolean 'httpd_can_network_connect' do
    value true
    notifies :start,'httpd_service[default]', :immediate
end

cookbook_file "#{node['lamp_jenkins']['document_root']}/phpinfo.php" do
  source 'phpinfo.php'
  mode '0644'
  owner node['lamp_jenkins']['webuser']
  group node['lamp_jenkins']['webgroup']
end
