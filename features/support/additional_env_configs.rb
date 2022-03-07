def run_headless_config
  Capybara.register_driver :selenium_chrome_headless do |app|
    chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |capabilities|
      capabilities.add_argument '--headless'
      capabilities.add_argument '--disable-gpu'
      capabilities.add_argument '--no-sandbox'
      capabilities.add_argument '--disable-site-isolation-trials'
      capabilities.add_argument '--window-size=1440,900'
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
  @driver = :selenium_chrome_headless
end

def default_configs_for_browser
  Capybara.configure do |config|
    config.default_driver = @driver
    config.app_host = 'https://aliexpress.com'
    config.ignore_hidden_elements = false
    config.default_max_wait_time = 20
    Capybara.page.driver.browser.manage.window.maximize
  end
end