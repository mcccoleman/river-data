source 'https://rubygems.org'

gemspec
ruby '~> 3.2.2'

%w[rspec rspec-core rspec-expectations rspec-mocks rspec-support].each do |lib|
  gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'main'
end

gem 'activesupport'
gem 'chronic'
gem 'faraday'
gem 'json'
gem 'pry'
gem 'sinatra'
