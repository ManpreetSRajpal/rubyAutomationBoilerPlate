class GoSecureHomePage < BasePage

  USERS_MENU_BTN_XPATH = {:xpath => "//a[contains(text(),'Users')]"}
  TW_FOOTER_TEXT_XPATH = {:xpath => "//p[contains(text(),'© ThoughtWorks, Inc. All Rights Reserved.')]"}
  START_BTN_XPATH = {:xpath => "//button[@type='button'][contains(text(),'Start')]"}
  PREVIOUS_BTN_XPATH = {:xpath => "//button[contains(text(),'Previous')]"}
  RESPONDED_TILE_XPATH = {:xpath => "//*[contains(text(),'Responded by:')]"}
  @log = setup_logger('GoSecureHomePage.class')

  def wait_for_tw_footer_to_be_visible
    @log.debug('Waiting for the TW footer text to be visible')
    wait_for_element_to_be_visible(TW_FOOTER_TEXT_XPATH)
  end

  def click_on_users_btn
    @log.debug('Click on the Users btn')
    click(USERS_MENU_BTN_XPATH)
  end

  def click_start_assessments_btn
    @log.debug("Clicking on the START btn")
    click_with_action(START_BTN_XPATH)
  end

  def click_previous_tab
    @log.debug("Clicking on the PREVIOUS tab")
    click(PREVIOUS_BTN_XPATH)
  end

  def is_response_tile_visible
    @log.debug("Waiting for the response tile to be visible")
    wait_for_element_to_be_visible(RESPONDED_TILE_XPATH)
  end

end