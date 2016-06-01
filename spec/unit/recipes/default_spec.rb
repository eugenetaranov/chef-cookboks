require 'spec_helper'

describe 'lamp_jenkins::default' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

end
