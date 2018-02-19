lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name         = 'faraday_middleware-parse_csv'
  spec.summary      = 'Faraday middleware for parsing CSV'
  spec.description  = 'Faraday middleware for parsing CSV using tempfile to include encoding'
  spec.homepage     = 'http://benslaughter.github.io/faraday_middleware-parse_csv/'
  spec.version      = '1.0.0'
  spec.version      = "#{spec.version}-#{ENV['TRAVIS_BUILD_NUMBER']}" if ENV['TRAVIS']
  spec.date         = '2018-02-19'
  spec.license      = 'MIT'

  spec.author       = 'Ben Slaughter'
  spec.email        = 'b.p.slaughter@gmail.com'

  spec.files        = %w(README.md LICENSE)
  spec.files        += Dir.glob('lib/**/*.rb')
  spec.files        += Dir.glob('spec/**/*')
  spec.test_files   = Dir.glob('spec/**/*')
  spec.require_path = 'lib'

  spec.add_runtime_dependency 'faraday', '~> 0.9'
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.9'

  spec.add_development_dependency 'coveralls', '~> 0.8'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'yard', '~> 0.9'
end
