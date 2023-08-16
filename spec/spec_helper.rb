RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def app
  Sinatra::Application
end
