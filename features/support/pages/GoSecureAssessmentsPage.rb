class GoSecureAssessmemtsPage < BasePage

  SAVE_BTN_XPATH = {:xpath => "//button[@type='button'][contains(text(),'Save')]"}
  SUBMIT_BTN_XPATH = {:xpath => "//button[@type='button'][contains(text(),'Submit')]"}
  NEXT_BTN_XPATH = {:xpath => "//button[@type='button'][contains(text(),'Next')]"}
  CLICK_SCRIPT = "arguments[0].click();"
  #  ALL_ANSWERS format for one answer: {question_number: [question_text, answer_text, click_save (boolean), click_next (boolean)]}
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

  @log = setup_logger('GoSecureAssessmemtsPage.class')

  def is_save_btn_visible
    @log.debug("Checking if the SAVE button is visible")
    wait_for_element_to_be_visible(SAVE_BTN_XPATH)
  end

  def is_submit_btn_visible
    @log.debug("Checking if the SUBMIT button is visible")
    wait_for_element_to_be_visible(SUBMIT_BTN_XPATH)
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

  def answer_question(locator, question_number, click_save = false, click_next = false)
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
      puts "Question number: " + question_number.to_s
      question_title = answer_attributes[0]
      puts "Question: " + question_title
      answer_title = answer_attributes[1]
      puts "Answer: " + answer_title
      click_save_after_answering = answer_attributes[2]
      puts "click_save_after_answering: " + click_save_after_answering.to_s
      click_next_after_answering = answer_attributes[3]
      puts "click_next_after_answering: " + click_next_after_answering.to_s
      answer_option_xpath = generate_answer_xpath(question_title, answer_title)
      puts "Answer option XPath : " + answer_option_xpath.to_s
      answer_question(answer_option_xpath, question_number, click_save_after_answering, click_next_after_answering)
    end
    click_submit_btn
  end

end