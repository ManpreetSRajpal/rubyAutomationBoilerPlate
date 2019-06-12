class GoSecureReportsPage < BasePage

  PRINT_BTN_XPATH = {:xpath => "//img[@class='report-print-icon']"}
  @log = setup_logger('GoSecureReportsPage.class')

  def is_print_icon_visible
    @log.debug('Checking if the print icon is visible')
    wait_for_element_to_be_visible(PRINT_BTN_XPATH)
  end

end