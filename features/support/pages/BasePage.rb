require_relative '../../../utils/TestDriver'

class BasePage

  attr_accessor :obj_timeout

  def initialize
    @test_driver = TestDriver.get_instance
    @log = setup_logger('BasePage.class')
    @obj_timeout = @test_driver.object_timeout
  end

  def click(locator)
    how, what = locator.first
    @log.debug('Clicking on the element ' + {how => what}.to_s)
    @test_driver.driver.find_element(how, what).click
  end

  def click_with_action(locator)
    how, what = locator.first
    @log.debug('Clicking on the element ' + {how => what}.to_s + ' with Actions class')
    @test_driver.driver.action.click(@test_driver.driver.find_element(locator)).perform
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

  def wait_for_element_to_disappear(locator)
    how, what = locator.first
    wait = Selenium::WebDriver::Wait.new(timeout: @obj_timeout)
    wait.until { !@test_driver.driver.find_element(how, what).size == 0 }
  end

  def wait_for_element_to_be_visible(locator)
    how, what = locator.first
    wait = Selenium::WebDriver::Wait.new(timeout: @obj_timeout)
    wait.until { @test_driver.driver.find_elements(how, what).size > 0 }
  end

  def hover_on_element(locator) # does not work
    how, what = locator.first
    @test_driver.driver.action.move_to(driver.find_element(how, what)).perform
  end

end