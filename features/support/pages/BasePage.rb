require_relative '../../../utils/TestDriver'

class BasePage

  def initialize
    @test_driver = TestDriver.get_instance
    @log = setup_logger('BasePage.class')
  end

  def click(locator)
    how, what = locator.first
    @log.debug('Clicking on the element ' + {how => what}.to_s)
    @test_driver.driver.find_element(how, what).click
  end

  def set_text(locator, str)
    how, what = locator.first
    @log.debug('Setting text %s at element %s' % [str, {how => what}.to_s])
    @test_driver.driver.find_element(how, what).send_keys(str)
  end

  def get(url)
    @test_driver.driver.get(url)
  end

  def is_element_displayed(locator)
    how, what = locator.first
    @log.debug('Checking if the element %s is displayed' % [locator.to_s])
    @test_driver.driver.find_element(how, what).displayed?
  end

  def find_element(locator)
    how, what = locator.first
    @test_driver.driver.find_element(how, what)
  end

  def wait_for_element_to_disappear(locator, timeout)
    how, what = locator.first
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)
    wait.until { !@test_driver.driver.find_element(how, what).size == 0 }
  end

  def wait_for_element_to_be_visible(locator, timeout)
    how, what = locator.first
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)
    wait.until { @test_driver.driver.find_elements(how, what).size > 0 }
  end

end