class GoSecureLoggedOutPage < BasePage

  LOGOUT_MSG_XPATH = {:xpath => "//*[contains(text(),'You have been successfully logged out.')]"}
  @log = setup_logger('GoSecureLoggedOutPage.class')

  def is_sign_out_message_visible
    @log.debug("Checking if the successful logout message has appeared")
    is_element_displayed(LOGOUT_MSG_XPATH)
  end

end