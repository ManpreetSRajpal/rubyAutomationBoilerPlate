class GoSecureHomePage < BasePage

  USERS_MENU_BTN_XPATH = {:xpath => "//a[contains(text(),'Users')]"}
  TW_FOOTER_TEXT_XPATH = {:xpath => "//p[contains(text(),'© ThoughtWorks, Inc. All Rights Reserved.')]"}
  TIMEOUT = 10
  @log = setup_logger('GoSecureHomePage.class')

  def wait_for_go_secure_logo_to_be_visible
    @log.debug('Waiting for the Go Secure logo to be visible')
    wait_for_element_to_be_visible(GO_SECURE_LOGO_XPATH, TIMEOUT)
  end

  def wait_for_tw_footer_to_be_visible
    @log.debug('Waiting for the TW footer text to be visible')
    wait_for_element_to_be_visible(TW_FOOTER_TEXT_XPATH, TIMEOUT)
  end

  def click_on_users_btn
    @log.debug('Click on the Users btn')
    click(USERS_MENU_BTN_XPATH)
  end

end