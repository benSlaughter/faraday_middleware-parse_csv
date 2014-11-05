$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'codeclimate-test-reporter'
require 'coveralls'
require 'rspec'

CodeClimate::TestReporter.start
Coveralls.wear!

require 'faraday_middleware/parse_csv'

RSpec.configure do |config|
  config.color     = true
  config.formatter = :documentation
end
