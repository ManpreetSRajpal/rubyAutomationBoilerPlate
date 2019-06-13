require_relative '../../../utils/TestDriver'

class BasePage

  attr_accessor :obj_timeout

  GO_SECURE_LOGO_XPATH = {:xpath => "//img[@class='logo']"}
  PROFILE_ICON_XPATH = {:xpath => "//ul[@id='utility_nav']"}
  LOGOUT_BTN_XPATH = {:xpath => "//a[contains(text(),'Logout')]"}
  WELCOME_TEXT_XPATH = {:xpath => "//*[contains(text(),'Welcome')]"}

  def is_welcome_text_visible
    @log.debug('Checking if the welcome text is visible')
    is_element_displayed(WELCOME_TEXT_XPATH)
  end

  def hover_on_profile_icon
    @log.debug("Hovering on the Profile Icon")
    hover_on_element(PROFILE_ICON_XPATH)
  end

  def click_on_profile_icon
    @log.debug("Clicking on the Profile Icon")
    click(PROFILE_ICON_XPATH)
  end

  def click_on_logout_btn
    @log.debug("Clicking on the Logout btn")
    click_with_action(LOGOUT_BTN_XPATH)
  end

  def click_go_secure_logo
    @log.debug('Clicking on the Go Secure logo')
    click(GO_SECURE_LOGO_XPATH)
  end

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

  def execute_script(script, locator = nil)
    if locator
      how, what = locator.first
      @test_driver.driver.execute_script(script, @test_driver.driver.find_element(how, what))
    else
      @test_driver.driver.execute_script(script)
    end
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
    wait = Selenium::WebDriver::Wait.new(timeout: @obj_timeout)
    wait.until {@test_driver.driver.find_element(how, what).displayed?}
  end

  def is_element_enabled(locator)
    how, what = locator.first
    @log.debug('Checking if the element %s is enabled' % [locator.to_s])
    @test_driver.driver.find_element(how, what).enabled?
  end

  def find_element(locator)
    how, what = locator.first
    @test_driver.driver.find_element(how, what)
  end

  def wait_for_element_to_disappear(locator)
    how, what = locator.first
    wait = Selenium::WebDriver::Wait.new(timeout: @obj_timeout)
    wait.until {!@test_driver.driver.find_element(how, what).size == 0}
  end

  def wait_for_element_to_be_visible(locator)
    how, what = locator.first
    wait = Selenium::WebDriver::Wait.new(timeout: @obj_timeout)
    wait.until {@test_driver.driver.find_elements(how, what).size > 0}
  end

  def find_all_elements(locator)
    how, what = locator.first
    @test_driver.driver.find_elements(how, what)
  end

  def hover_on_element(locator) # TODO: does not work, fix this
    how, what = locator.first
    @test_driver.driver.action.move_to(driver.find_element(how, what)).perform
  end

end