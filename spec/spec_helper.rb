$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'coveralls'
require 'rspec'

Coveralls.wear!

require 'faraday_middleware/parse_csv'

RSpec.configure do |config|
  config.color     = true
  config.formatter = :documentation
end
