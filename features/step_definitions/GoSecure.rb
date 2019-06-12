Given /^I open the Go Secure login page$/ do

  okta_login_url = @test_configuration.go_secure_login_url

  @login = OktaLoginPage.new
  @home_page = GoSecureHomePage.new
  @logged_out_page = GoSecureLoggedOutPage.new
  @users_page = GoSecureUsersPage.new
  @assessments_page = GoSecureAssessmemtsPage.new
  @reports_page = GoSecureReportsPage.new
  @login.goto_login_page okta_login_url
end

When("I log in to Go Secure as a {string} user") do |role|
  @login.login_as role
  @login.click_sign_in_btn
end
Then /^I should see the ThoughtWorks footer text on the homepage$/ do
  @home_page.wait_for_tw_footer_to_be_visible
end

When(/^I click on the Users menu option$/) do
  @home_page.click_on_users_btn
end
Then(/^I should see the Users page$/) do
  @users_page.is_new_admin_user_btn_visible
end

When(/^I click on the Logout button$/) do
  @home_page.click_on_profile_icon
  @home_page.click_on_logout_btn
end
Then(/^I should be logged out of Go Secure$/) do
  @logged_out_page.is_sign_out_message_visible
end

Then(/^I should see the Welcome text on the homepage$/) do
  @home_page.is_welcome_text_visible
end

When(/^I click on the START button$/) do
  @home_page.click_start_assessments_btn
end

Then(/^I should see the SAVE\/SUBMIT buttons$/) do
  @assessments_page.is_save_btn_visible
  @assessments_page.is_submit_btn_visible
end

Then(/^I should be able to submit answers for all the questions$/) do
  @assessments_page.answer_all_questions
end

Then(/^I should be able to see the reports page$/) do
  @reports_page.is_print_icon_visible
end

Given(/^I navigate to the home page$/) do
  @assessments_page.click_go_secure_logo
end

When(/^I click on the Previous tab$/) do
  @home_page.click_previous_tab
end

Then(/^I should be able to see the submitted assessments$/) do
  @home_page.is_response_tile_visible
end