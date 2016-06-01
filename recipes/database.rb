selinux_policy_fcontext '/var/www/mysql-default(/.*)?' do
  secontext 'mysqld_db_t'
end

mysql_client 'default' do
  action :create
end

mysql_service 'default' do
  initial_root_password node['lamp_jenkins']['database']['root_password']
  action [:create, :start]
end
