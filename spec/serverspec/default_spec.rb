require 'spec_helper'
require 'serverspec'

package = 'zookeeper'
service = 'zookeeper'
config  = '/etc/zookeeper/zoo.conf'
user    = 'zookeeper'
group   = 'zookeeper'
ports   = [ 2181 ]
log_dir = '/var/log/zookeeper'
db_dir  = '/var/lib/zookeeper'

case os[:family]
when 'freebsd'
  config = '/usr/local/etc/zookeeper/zoo.cfg'
  db_dir = '/var/db/zookeeper'
end

describe package(package) do
  it { should be_installed }
end 

describe file(config) do
  it { should be_file }
  its(:content) { should match /tickTime=3000/ }
  its(:content) { should match /initLimit=10/ }
  its(:content) { should match /syncLimit=5/ }
  its(:content) { should match Regexp.escape('dataDir=/var/db/zookeeper') }
  its(:content) { should match /clientPort=2181/ }
end

describe file(log_dir) do
  it { should exist }
  it { should be_mode 755 }
  it { should be_owned_by user }
  it { should be_grouped_into group }
end

describe file(db_dir) do
  it { should exist }
  it { should be_mode 755 }
  it { should be_owned_by user }
  it { should be_grouped_into group }
end

# case os[:family]
# when 'freebsd'
#   describe file('/etc/rc.conf.d/zookeeper') do
#     it { should be_file }
#   end
# end

describe service(service) do
  it { should be_running }
  it { should be_enabled }
end

ports.each do |p|
  describe port(p) do
    it { should be_listening }
  end
end
