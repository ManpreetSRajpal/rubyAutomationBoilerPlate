class OktaLoginPage < BasePage

  USER_NAME_INPUT_BOX = {id: 'okta-signin-username'}
  PASSWORD_INPUT_BOX = {id: 'okta-signin-password'}
  SIGN_IN_BTN = {id: 'okta-signin-submit'}
  @log = setup_logger('OktaLoginPage.class')

  def goto_login_page(url)
    get(url)
  end

  def enter_username(str)
    @log.debug('Entering username ' + str)
    setText(USER_NAME_INPUT_BOX, str)
  end

  def enter_password(str)
    @log.debug('Entering password ' + str)
    setText(PASSWORD_INPUT_BOX, str)
  end

  def click_sign_in_btn()
    @log.debug('Clicking on the Sign In btn')
    click(SIGN_IN_BTN)
  end

end