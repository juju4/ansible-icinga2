#require 'spec_helper'
require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('rrdcached'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe service('rrdcached'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

