class GoSecureUsersPage < BasePage

  NEW_ADMIN_USER_BTN_XPATH = {:xpath => "//a[contains(text(),'New Admin User')]"}
  @log = setup_logger('GoSecureUsersPage.class')

  def is_new_admin_user_btn_visible
    @log.debug("Checking if the NEW ADMIN USER is visible")
    is_element_displayed(NEW_ADMIN_USER_BTN_XPATH)
  end

end