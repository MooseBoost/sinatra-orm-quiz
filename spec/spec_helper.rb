require_relative '../config/environment'
Bundler.require(:test)

require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include Rack::Test::Methods
  config.include Capybara::DSL
  DatabaseCleaner.strategy = :transaction
  DatabaseCleaner.clean_with(:truncation)

  config.before do
    DatabaseCleaner.clean
  end

  config.after do
    DatabaseCleaner.clean
  end

  config.order = 'default'
end

def __
  raise "Replace the __ with code to make the test pass"
end