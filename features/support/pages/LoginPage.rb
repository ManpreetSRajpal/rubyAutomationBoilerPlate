class LoginPage < BasePage

  SEARCH_BOX = {name: 'q'}
  @log = setup_logger('LoginPage.class')

  def goto_login_page(url)
    get(url)
  end

  def enter_input_in_search(str)
    @log.debug('Search string ' + str)
    setText(SEARCH_BOX, str)
  end
end