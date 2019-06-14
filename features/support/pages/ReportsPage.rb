class ReportsPage < BasePage

  PRINT_BTN_XPATH = {:xpath => "//img[@class='report-print-icon']"}
  MARK_AS_REVIEWED_BTN_XPATH = {:xpath => "//button[contains(text(),'MARK AS REVIEWED')]"}
  @log = setup_logger('GoSecureReportsPage.class')

  def is_print_icon_visible
    @log.debug('Checking if the print icon is visible')
    is_element_displayed(PRINT_BTN_XPATH)
  end

  def is_mark_as_reviewed_btn_visible
    @log.debug('Checking if the MARK AS REVIEWED button is visible')
    mark_as_reviewed_buttons = find_all_elements(MARK_AS_REVIEWED_BTN_XPATH)
    mark_as_reviewed_buttons.length > 0
  end

end