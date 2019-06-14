class AssessmentsPage < BasePage

  SAVE_BTN_XPATH = {:xpath => "//button[@type='button'][contains(text(),'Save')]"}
  SUBMIT_BTN_XPATH = {:xpath => "//button[@type='button'][contains(text(),'Submit')]"}
  NEXT_BTN_XPATH = {:xpath => "//button[@type='button'][contains(text(),'Next')]"}
  CLICK_SCRIPT = "arguments[0].click();"
  QUESTIONS_TITLE_XPATH = {:xpath => "//div[@class='question']/*[@class='title']"}
  #  ALL_ANSWERS format for one answer: {question_number => [question_text, answer_text, click_save_after_answering (boolean), click_next_after_answering (boolean)]}
  ALL_ANSWERS = [{1 => ["What percentage of the team have undergone ThoughtWorks's AppSec101 classroom course, or, WebAppSec101 training on Curatr?", "100%", true, false]},
                 {2 => ["Has your team (or part of it) undergone any other trainings or certifications related to SECURITY?", "No", true, false]},
                 {3 => ["Check all the external materials that your team takes reference from during development", "OWASP Top 10 Security risks", true, true]},
                 {4 => ["Is anyone on the team proactively responsible for helping avoid security issues, or is appointed as a point of contact for security-related queries?", "We’ve never formally discussed it", true, false]},
                 {5 => ["Has your team’s software undergone an ‘external vulnerability assessment’ (a.k.a penetration test) by a qualified third party?", "No. There is no penetration testing performed at all.", true, false]},
                 {6 => ["Is there a process for triaging defects caught by security testing?", "We have never had security issues raised, so never discussed about a process", true, false]},
                 {7 => ["Do you follow any other security practices for continuous feedback?", "No", true, false]},
                 {8 => ["Do you have a process to analyse vulnerable libraries and dependencies used in your project?", "There is no process for this in place", true, false]},
                 {9 => ["Does your team follow any process to analyse security vulnerabilities in the infrastructure?", "We do not manage any infrastructure", true, false]},
                 {10 => ["Does the application have any kind of secrets or sensitive data like passwords, API tokens, keys, credentials etc.?", "Yes", true, false]},
                 {11 => ["Do you have any process to monitor and avoid potential secrets from getting accidentally checked into the source repository?", "Not at all", true, false]},
                 {12 => ["Do you have any secrets checked into VCS?", "Yes in plain text", true, false]},
                 {13 => ["On an average, the time taken to push a critical patch to production is", "Less than 1 day", true, false]},
                 {14 => ["On an average, the time needed to roll-back a build on production to an older release is", "Less than 1 day", true, false]},
                 {15 => ["Are the logging facilities and log information protected against tampering and unauthorised access?", "Yes, and all logs are protected with an authorisation mechanism", true, false]},
                 {16 => ["Time taken to identify and analyse security faults captured by logs/monitoring systems in production is:", "1 day to 1 week of occurrence of security faults", true, false]}]

  @log = setup_logger('AssessmemtsPage.class')

  def is_save_btn_visible
    @log.debug("Checking if the SAVE button is visible")
    is_element_displayed(SAVE_BTN_XPATH)
  end

  def is_submit_btn_visible
    @log.debug("Checking if the SUBMIT button is visible")
    is_element_displayed(SUBMIT_BTN_XPATH)
  end

  def click_save_btn
    @log.debug("Clicking the SAVE btn")
    execute_script(CLICK_SCRIPT, SAVE_BTN_XPATH)
  end

  def click_next_btn
    @log.debug("Clicking the NEXT btn")
    execute_script(CLICK_SCRIPT, NEXT_BTN_XPATH)
  end

  def click_submit_btn
    @log.debug("Clicking the SUBMIT btn")
    execute_script(CLICK_SCRIPT, SUBMIT_BTN_XPATH)
  end

  def answer_question(locator, question_number = 0, click_save = false, click_next = false)
    @log.debug("Answering the question " + question_number.to_s + " by clicking on the element " + locator.to_s)
    execute_script(CLICK_SCRIPT, locator)
    if click_save
      click_save_btn
    end
    if click_next
      click_next_btn
    end
  end

  def generate_answer_xpath(question_title, answer_text)
    {:xpath => "//*[contains(text(), \"" + question_title + "\")]//following-sibling::div//*[contains(text(),\"" + answer_text + "\")]"}
  end

  def answer_all_questions
    ALL_ANSWERS.each do |question_answer|
      question_number, answer_attributes = question_answer.first
      @log.debug("Question number: " + question_number.to_s)
      question_title = answer_attributes[0]
      @log.debug("Question: " + question_title)
      answer_title = answer_attributes[1]
      @log.debug("Answer: " + answer_title)
      click_save_after_answering = answer_attributes[2]
      @log.debug("click_save_after_answering: " + click_save_after_answering.to_s)
      click_next_after_answering = answer_attributes[3]
      @log.debug("click_next_after_answering: " + click_next_after_answering.to_s)
      answer_option_xpath = generate_answer_xpath(question_title, answer_title)
      @log.debug("Answer option XPath : " + answer_option_xpath.to_s)
      answer_question(answer_option_xpath, question_number, click_save_after_answering, click_next_after_answering)
    end
    click_submit_btn
  end

  def answer_all_questions_independent_of_order
    is_submit_btn_disabled = !is_element_enabled(SUBMIT_BTN_XPATH)
    while is_submit_btn_disabled
      all_visible_question_title_xpaths = find_all_elements(QUESTIONS_TITLE_XPATH)
      last_question_title_text = all_visible_question_title_xpaths[-1].text
      @log.debug("Question: " + last_question_title_text)
      last_question_answer_attributes = []
      ALL_ANSWERS.each do |question_answer|
        question_number, answer_attributes = question_answer.first
        question_text = answer_attributes[0]
        if question_text == last_question_title_text
          last_question_answer_attributes = answer_attributes
          break
        end
      end
      answer_text = last_question_answer_attributes[1]
      @log.debug("Answer: " + answer_text)
      save_after_answering = last_question_answer_attributes[2]
      @log.debug("save_after_answering: " + save_after_answering.to_s)
      next_after_answering = last_question_answer_attributes[3]
      @log.debug("next_after_answering: " + next_after_answering.to_s)
      answer_xpath = generate_answer_xpath(last_question_title_text, answer_text)
      @log.debug("Answer XPath: " + answer_xpath.to_s)
      answer_question(answer_xpath, 0, save_after_answering, next_after_answering)
      is_submit_btn_disabled = !is_element_enabled(SUBMIT_BTN_XPATH)
      @log.debug("is_submit_btn_disabled: " + is_submit_btn_disabled.to_s)
    end
    click_submit_btn
  end
end