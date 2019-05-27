require 'selenium-webdriver'
require_relative '../features/support/TestConfiguration'

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
    case browser
    when 'firefox'
      @driver = Selenium::WebDriver.for :firefox
    when 'chrome'
      @driver = Selenium::WebDriver.for :chrome
    end
    @driver
  end

  def self.get_instance
    @test_driver = TestDriver.new
    @test_driver
  end

  def set_time_out(page_time_out)
    @wait_time_for_page_to_load = page_time_out
  end

  def click(locator)
    @driver.find_element(locator).click
  end

  def clear_cookies
    @driver.manage.delete_all_cookies
  end

  def list_cookies
    @driver.manage.all_cookies
  end

  def quit
    @driver.quit
  end

  def get(url)
    @driver.navigate.to(url)
  end

end