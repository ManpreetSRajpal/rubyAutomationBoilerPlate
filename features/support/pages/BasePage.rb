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

end