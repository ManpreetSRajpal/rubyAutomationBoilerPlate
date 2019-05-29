require_relative '../../../utils/TestDriver'

class BasePage

  def initialize
    @test_driver = TestDriver.get_instance
    puts @test_driver
    @log = setup_logger('BasePage.class')
  end

  def click(locator)
    @log.debug('clicking on ' + locator)
    @test_driver.click(locator)
  end

  def setText(locator, str)
    @log.debug('set text ' + str)
    @test_driver.set_text(locator, str)
  end

  def get(url)
    @log.debug('get url ' + url)
    @test_driver.get(url)
  end

end