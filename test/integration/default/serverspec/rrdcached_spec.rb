#require 'spec_helper'
require 'serverspec'

# Required by serverspec
set :backend, :exec

## Only if pnp4nagios
describe package('rrdcached'), :if => os[:family] == 'ubuntu' && (os[:release] == '14.04' || os[:release] == '12.04') do
  it { should be_installed }
end

describe service('rrdcached'), :if => os[:family] == 'ubuntu' && (os[:release] == '14.04' || os[:release] == '12.04') do
  it { should be_enabled }
  it { should be_running }
end

