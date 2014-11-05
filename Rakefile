require 'rubygems'
require 'rspec/core/rake_task'
require 'yard'

desc "Run all examples"
RSpec::Core::RakeTask.new(:spec) do |t|
  ENV['CODECLIMATE_REPO_TOKEN'] = '1ca8b98d010da369c37c1d0da4bc1644e9b9cf3522a9ac052690e6f573c9f7c2'
  t.rspec_opts = %w[--color]
end

YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb']
  #t.options = ['--any', '--extra', '--opts'] # optional
  #t.options = ['--list-undoc'] # optional
end

task :default => [:spec]