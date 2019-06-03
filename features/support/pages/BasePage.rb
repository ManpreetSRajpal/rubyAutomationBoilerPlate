require_relative '../../../utils/TestDriver'

class BasePage

  def initialize
    @test_driver = TestDriver.get_instance
    @log = setup_logger('BasePage.class')
  end

  def click(locator)
    @log.debug('Clicking on the element ' + locator.to_s)
    @test_driver.click(locator)
  end

  def setText(locator, str)
    @log.debug('Setting text %s at element %s' % [str, locator.to_s])
    @test_driver.set_text(locator, str)
  end

  def get(url)
    @test_driver.get(url)
  end

  def isElementDisplayed(how, locator)
    @log.debug('Checking if the element %s is displayed' % [locator.to_s])
    @test_driver.find_element(how, locator).displayed? == true
  end

  def waitForElementToDisappear(how, locator, timeout)
    @log.debug('Waiting for the element %s to disappear' % [locator])
    @test_driver.wait_for_element_to_disappear(how, locator, timeout)
  end

  def waitForElementToBeVisible(how, locator, timeout)
    @log.debug('Waiting for the element %s to be visible' % [locator])
    @test_driver.wait_for_element_to_be_visible(how, locator, timeout)
  end

end