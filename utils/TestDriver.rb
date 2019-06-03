require 'selenium-webdriver'
require_relative './TestConfiguration'

class TestDriver

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
    when 'chrome'
      browser_path = File.join(cwd, '/drivers/chromedriver')
      Selenium::WebDriver::Chrome::Service.driver_path = browser_path
      @driver = Selenium::WebDriver.for :chrome
    end
    @driver
  end

  def self.get_instance
    if @test_driver == nil
      @test_driver = TestDriver.new
    end
    @test_driver

  end

  def set_timeout(page_timeout)
    @wait_time_for_page_to_load = page_timeout
  end

  def click(locator)
    @driver.find_element(locator).click
  end

  def set_text(locator, input_text)
    @driver.find_element(locator).clear
    @driver.find_element(locator).send_keys(input_text)
  end

  def clear_cookies
    @driver.manage.delete_all_cookies
  end

  def list_cookies
    @driver.manage.all_cookies
  end

  def quit
    @driver.quit
    @driver = nil?
    @test_driver = nil?
  end

  def get(url)
    @driver.navigate.to(url)
  end

  def find_element(how, what)
    @driver.find_element(how, what)
  end

  def wait_for_element_to_disappear(how, what, timeout)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)
    wait.until { !@driver.find_element(how, what).size == 0 }
  end

  def wait_for_element_to_be_visible(how, what, timeout)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)
    wait.until { @driver.find_elements(how, what).size > 0 }
  end

  def takeScreenShot(path)
    @driver.save_screenshot(path)
  end

end