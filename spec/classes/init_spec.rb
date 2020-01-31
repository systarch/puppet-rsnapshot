require 'spec_helper'

describe 'rsnapshot' do
  context 'with defaults for all parameters' do
    it { should contain_class('rsnapshot') }
    it { should contain_class('rsnapshot::mode::puppetmaster')}
    it { should_not contain_class('rsnapshot::mode::masterless')}
    it { should_not contain_class('rsnapshot::server')}
    it { should_not contain_class('rsnapshot::client')}
  end

  context 'with one server and zero clients given as parameters' do
    let(:facts) do
      {
          osfamily: "Debian",
      }
    end

    let(:params) do
      {
          fqdn: 'backupserver1',
          servers: {
              backupserver1: {

              }
          },
          clients: {}
      }
    end

    it { should contain_class('rsnapshot') }
    it { should contain_class('rsnapshot::mode::masterless')}
    it { should contain_class('rsnapshot::server')}
    it { should_not contain_class('rsnapshot::mode::puppetmaster')}
    it { should_not contain_class('rsnapshot::client')}
  end
end
