class GoSecureHomePage < BasePage

  USERS_MENU_BTN_XPATH = {:xpath => "//a[contains(text(),'Users')]"}
  TW_FOOTER_TEXT_XPATH = {:xpath => "//p[contains(text(),'© ThoughtWorks, Inc. All Rights Reserved.')]"}
  PROFILE_ICON_XPATH = {:xpath => "//ul[@id='utility_nav']"}
  LOGOUT_BTN_XPATH = {:xpath => "//a[contains(text(),'Logout')]"}
  WELCOME_TEXT_XPATH = {:xpath => "//*[contains(text(),'Welcome')]"}
  START_BTN_XPATH = {:xpath => "//button[@type='button'][contains(text(),'Start')]"}
  @log = setup_logger('GoSecureHomePage.class')

  def wait_for_tw_footer_to_be_visible
    @log.debug('Waiting for the TW footer text to be visible')
    wait_for_element_to_be_visible(TW_FOOTER_TEXT_XPATH)
  end

  def is_welcome_text_visible
    @log.debug('Checking if the welcome text is visible')
    wait_for_element_to_be_visible(WELCOME_TEXT_XPATH)
  end

  def click_on_users_btn
    @log.debug('Click on the Users btn')
    click(USERS_MENU_BTN_XPATH)
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

  def click_start_assessments_btn
    @log.debug("Clicking on the START btn")
    click_with_action(START_BTN_XPATH)
  end

end