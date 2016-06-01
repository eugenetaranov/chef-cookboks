def random_password
  require 'securerandom'
  SecureRandom.base64
end

default['firewall']['allow_ssh'] = true
default['firewall']['firewalld']['permanent'] = true
default['lamp_jenkins']['open_ports'] = [80, 443]
default['lamp_jenkins']['webuser'] = 'apache'
default['lamp_jenkins']['webgroup'] = 'apache'
default['lamp_jenkins']['document_root'] = '/var/www/html'
default_unless['lamp_jenkins']['database']['root_password'] = random_password
default_unless['lamp_jenkins']['database']['admin_password'] = random_password
default['lamp_jenkins']['database']['host'] = '127.0.0.1'
default['lamp_jenkins']['database']['root_username'] = 'root'

default['lamp_jenkins']['ssl_cert']['source'] = 'self-signed'
default['lamp_jenkins']['ssl_key']['source'] = 'self-signed'
default['lamp_jenkins']['ssl_key']['key_path'] = '/etc/ssl/certs/web.key'
default['lamp_jenkins']['ssl_key']['cert_path'] = '/etc/ssl/certs/web.crt'
