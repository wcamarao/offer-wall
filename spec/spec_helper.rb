ENV['RACK_ENV'] = 'test'

require_relative File.join('..', 'app/bootstrap')

RSpec.configure do |config|
  include Rack::Test::Methods

  config.color = true
  config.formatter = :documentation

  def app
    OfferWall::Bootstrap
  end
end
