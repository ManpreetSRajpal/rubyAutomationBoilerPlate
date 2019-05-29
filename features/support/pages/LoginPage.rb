class LoginPage < BasePage

  SEARCH_BOX = {name: 'q1'}
  @log = setup_logger('LoginPage.class')


  def open_page(url)
    get(url)
  end

  def enter_search(str)
    @log.debug('Search string ' + str)
    setText(SEARCH_BOX, str)
  end
end