class GoSecureAssessmemtsPage < BasePage

  SAVE_BTN_XPATH = {:xpath => "//button[@type='button'][contains(text(),'Save')]"}
  SUBMIT_BTN_XPATH = {:xpath => "//button[@type='button'][contains(text(),'Submit')]"}
  NEXT_BTN_XPATH = {:xpath => "//button[@type='button'][contains(text(),'Next')]"}
  CLICK_SCRIPT = "arguments[0].click();"

  FIRST_ANSWER_XPATH = {:xpath => "//input[@type='radio']/following::span[text()='100%']/preceding-sibling::input[1]"}
  SECOND_ANSWER_XPATH = {:xpath => "//input[@type='radio']/following::span[text()='No']/preceding-sibling::input[1]"}
  THIRD_ANSWER_XPATH = {:xpath => "//input[@type='checkbox']/following::span[text()='OWASP Top 10 Security risks']/preceding-sibling::input[1]"}
  FORTH_ANSWER_XPATH = {:xpath => "//input[@type='radio']/following::span[text()=\"We’ve never formally discussed it\"]/preceding-sibling::input[1]"}
  @log = setup_logger('GoSecureAssessmemtsPage.class')

  def is_save_btn_visible
    @log.debug("Checking if the SAVE button is visible")
    wait_for_element_to_be_visible(SAVE_BTN_XPATH)
  end

  def is_submit_btn_visible
    @log.debug("Checking if the SUBMIT button is visible")
    wait_for_element_to_be_visible(SUBMIT_BTN_XPATH)
  end

  def answer_first_question
    @log.debug("Answering first question")
    execute_script(CLICK_SCRIPT, FIRST_ANSWER_XPATH)
    click(SAVE_BTN_XPATH)
  end

  def answer_second_question
    @log.debug("Answering second question")
    execute_script(CLICK_SCRIPT, SECOND_ANSWER_XPATH)
    click(SAVE_BTN_XPATH)
  end

  def answer_third_question
    @log.debug("Answering third question")
    execute_script(CLICK_SCRIPT, THIRD_ANSWER_XPATH)
    click(SAVE_BTN_XPATH)
  end

  def answer_forth_question
    @log.debug("Answering forth question")
    execute_script(CLICK_SCRIPT, FORTH_ANSWER_XPATH)
    click(SAVE_BTN_XPATH)
  end

  def click_next_btn
    @log.debug("Clicking the NEXT btn")
    execute_script(CLICK_SCRIPT, NEXT_BTN_XPATH)
  end

end