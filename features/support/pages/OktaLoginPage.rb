require_relative '../../../utils/OktaCredentialsProvider'

class OktaLoginPage < BasePage

  USER_NAME_INPUT_BOX = {:id => 'okta-signin-username'}
  PASSWORD_INPUT_BOX = {:id => 'okta-signin-password'}
  SIGN_IN_BTN = {:id => 'okta-signin-submit'}
  TIMEOUT = 10
  @log = setup_logger('OktaLoginPage.class')

  def goto_login_page(url)
    get(url)
  end

  def login_as(role)
    @credentials = OktaCredentialsProvider.new
    username = @credentials.get_username(role)
    password = @credentials.get_password(role)
    @log.debug('Logging in to Okta as ' + role)
    @log.debug('Entering username ' + username)
    set_text(USER_NAME_INPUT_BOX, username)
    @log.debug('Entering password')
    set_text(PASSWORD_INPUT_BOX, password)
  end

  def click_sign_in_btn
    @log.debug('Clicking on the Sign In btn')
    click(SIGN_IN_BTN)
  end

  def is_sign_in_btn_visible
    @log.debug("Checking if the Sign-in button is visible")
    wait_for_element_to_be_visible(SIGN_IN_BTN, TIMEOUT)
  end

end