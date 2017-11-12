require 'rspec'
require 'cucumber'
require 'selenium/webdriver'
require 'capybara/dsl'

include Capybara::DSL

Capybara.register_driver :selenium do |app|
	Capybara::Selenium::Driver.new(app, :browser => :firefox)
end
	
Capybara.configure do |config|
	config.current_driver = :selenium
	config.default_max_wait_time = 12	
Capybara.page.driver.browser.manage.window.maximize

end

