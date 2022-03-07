require 'capybara/cucumber'
require 'capybara'
require 'pry'
require 'pry-nav'
require 'report_builder'
require 'selenium-webdriver'
require_relative '../support/additional_env_configs.rb'

case ENV['BROWSER']
when 'firefox'
    @driver = :selenium
when 'chrome'
    @driver = :selenium_chrome
when 'headless'
    run_headless_config
else
    puts "Unknown driver"
end
default_configs_for_browser
