#require 'spec_helper'
require 'serverspec'

# Required by serverspec
set :backend, :exec

## Only if pnp4nagios
## pnp4nagios is not available on xenial
describe package('pnp4nagios-bin'), :if => os[:family] == 'ubuntu' && (os[:release] == '14.04' || os[:release] == '12.04') do
  it { should be_installed }
end
describe package('pnp4nagios-web'), :if => os[:family] == 'ubuntu' && (os[:release] == '14.04' || os[:release] == '12.04') do
  it { should be_installed }
end

