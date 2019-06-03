class OktaHomePage < BasePage

  HOME_TEXT_XPATH = "//span[@class='home-link-text']"
  TIMEOUT = 10
  @log = setup_logger('OktaHomePage.class')

  def is_home_text_seen
    @log.debug('Checking if the Home text is seen')
    isElementDisplayed(:xpath, HOME_TEXT_XPATH)
  end

  def wait_for_home_text_to_be_visible
    @log.debug('Waiting for the loader to disappear')
    waitForElementToBeVisible(:xpath, HOME_TEXT_XPATH, TIMEOUT)
  end

end