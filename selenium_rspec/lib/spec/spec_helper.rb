require 'selenium-webdriver'
require_relative '../generate_data'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end