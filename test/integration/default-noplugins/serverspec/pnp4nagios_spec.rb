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
describe command('curl -sSqL http://localhost/pnp4nagios/'), :if => os[:family] == 'ubuntu' && (os[:release] == '14.04' || os[:release] == '12.04') do
## may not be present if no data retrieved
#  its(:stdout) { should match /<title>Service overview for/ }
  its(:stdout) { should match /<meta http-equiv="refresh" content=".*"; URL="\/pnp4nagios\/graph/ }
  its(:stdout) { should match /pnp4nagios/ }
  its(:stdout) { should_not match /404 Not Found/ }
  its(:exit_status) { should eq 0 }
end

