source 'https://rubygems.org'

gemspec

%w[rspec rspec-core rspec-expectations rspec-mocks rspec-support].each do |lib|
  gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'main'
end

gem 'faraday'
gem 'json'
gem 'pry'
