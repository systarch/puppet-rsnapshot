source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 3.3']
group :test do
  gem 'puppet', puppetversion,                require: false
  gem 'puppetlabs_spec_helper', '>= 0.1.0',   require: false
  gem 'puppet-lint', '>= 0.3.2',              require: false
  gem 'facter', '>= 1.7.0',                   require: false
  gem 'puppet-blacksmith', '>= 5.0.0',        require: false
end
