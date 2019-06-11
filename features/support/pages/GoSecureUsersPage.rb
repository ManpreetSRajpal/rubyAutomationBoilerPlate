class GoSecureUsersPage < BasePage

  NEW_ADMIN_USER_BTN_XPATH = {:xpath => "//a[contains(text(),'New Admin User')]"}
  @log = setup_logger('GoSecureUsersPage.class')

  def is_new_admin_user_btn_visible
    @log.debug("Checking if the NEW ADMIN USER is visible")
    wait_for_element_to_be_visible(NEW_ADMIN_USER_BTN_XPATH)
  end

end