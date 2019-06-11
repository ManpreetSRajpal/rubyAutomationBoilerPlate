require 'selenium-webdriver'
require_relative './TestConfiguration'

class TestDriver

  attr_reader :driver
  attr_accessor :object_timeout

  def initialize
    @driver = create_driver
  end

  def create_driver
    @browser = TestConfiguration.browser
    get_driver(@browser)
  end

  def self.driver
    @driver
  end

  def get_driver(browser)
    cwd = File.dirname(__dir__)
    case browser
    when 'firefox'
      browser_path = File.join(cwd, '/drivers/geckodriver')
      Selenium::WebDriver::Firefox::Service.driver_path = browser_path
      @driver = Selenium::WebDriver.for :firefox
    else
      'chrome'
      browser_path = File.join(cwd, '/drivers/chromedriver')
      Selenium::WebDriver::Chrome::Service.driver_path = browser_path
      @driver = Selenium::WebDriver.for :chrome
    end
    @driver.manage.window.maximize
    @driver
  end

  def self.get_instance
    if @test_driver == nil
      @test_driver = TestDriver.new
    end
    @test_driver

  end

  def page_timeout(timeout)
    @driver.manage.timeouts.implicit_wait = timeout
  end

  def quit
    @driver.quit
    @driver = nil?
    @test_driver = nil?
  end

  def take_screenshot(path)
    @driver.save_screenshot(path)
  end

end