ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'capybara/rspec'
require 'database_cleaner'
require 'fabrication'
require 'rack_session_access/capybara'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    Mongoid.raise_not_found_error = false
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation
  config.infer_base_class_for_anonymous_controllers = true
  config.order = "random"
end
