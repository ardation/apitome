require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

# require "simplecov"
# SimpleCov.start

ENV["RAILS_ENV"] ||= "test"
ENV["RAILS_ROOT"] = File.expand_path("../dummy", __FILE__)
require File.expand_path("../dummy/config/environment", __FILE__)

require "apitome"

require "rspec/rails"
require "capybara/rails"
require "capybara-screenshot/rspec"

require "fileutils"
require "ostruct"

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| require f }

Capybara.javascript_driver = :webkit

RSpec.configure do |config|
  config.order = "random"
  config.include Rack::Test::Methods
end
