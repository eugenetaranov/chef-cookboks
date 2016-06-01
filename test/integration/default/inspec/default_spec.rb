describe package 'httpd' do
  it { should be_installed }
end

describe service 'httpd-default' do
  it { should be_enabled }
  it { should be_running }
end

describe command 'curl -kL 127.1/jenkins' do
  its('stdout') { should match /Jenkins/ }
end

describe package 'mysql-community-server' do
  it { should be_installed }
end

describe service 'mysql-default' do
  it { should be_enabled }
  it { should be_running }
end

describe package 'tomcat' do
  it { should be_installed }
end

describe service 'tomcat' do
  it { should be_enabled }
  it { should be_running }
end
