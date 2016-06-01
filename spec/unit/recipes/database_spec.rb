require 'spec_helper'

describe 'lamp_jenkins::database' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  it 'installs mysql' do
    expect(chef_run).to install_package 'mysql-community-server'
  end

  it 'starts the mysql service' do
    expect(chef_run).to start_service 'mysql-default'
  end

end
