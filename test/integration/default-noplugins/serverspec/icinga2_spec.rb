#require 'spec_helper'
require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('icinga2') do
  it { should be_installed }
end

describe service('icinga2') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/run/icinga2/cmd/livestatus') do
  it { should be_socket }
end

describe file('/etc/icinga2/icinga2.conf') do
  it { should be_readable }
end

### FIXME! works in cli but not in serverspec?
#describe command('curl -v http://localhost/icingaweb2/authentication/login') do
#  its(:stdout) { should match /HTTP\/1.1 302 Found/ }
##  its(:stderr) { should match /No such file or directory/ }
#  its(:exit_status) { should eq 0 }
#end

