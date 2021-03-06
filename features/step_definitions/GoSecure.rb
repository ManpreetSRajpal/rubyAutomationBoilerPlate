Given "I open the Go Secure login page" do
  @login_page = OktaLoginPage.new
  okta_login_url = @test_configuration.go_secure_login_url
  @home_page = HomePage.new
  @logged_out_page = PostLogoutPage.new
  @users_page = UsersPage.new
  @assessments_page = AssessmentsPage.new
  @reports_page = ReportsPage.new
  @login_page.goto_login_page okta_login_url
end

When("I log in to Go Secure as a {string} user") do |role|
  @login_page.login_as role
  @login_page.click_sign_in_btn
end
Then /^I should see the ThoughtWorks footer text on the homepage$/ do
  @home_page.wait_for_tw_footer_to_be_visible
end

When(/^I click on the Users menu option$/) do
  @home_page.click_on_users_btn
end
Then(/^I should see the Users page$/) do
  expect(@users_page.is_new_admin_user_btn_visible).to be true
end

When(/^I click on the Logout button$/) do
  @home_page.click_on_profile_icon
  @home_page.click_on_logout_btn
end
Then(/^I should be logged out of Go Secure$/) do
  expect(@logged_out_page.is_sign_out_message_visible).to be true
end

Then(/^I should see the Welcome text on the homepage$/) do
  expect(@home_page.is_welcome_text_visible).to be true
end

When(/^I click on the START button$/) do
  @home_page.click_start_assessments_btn
end

Then(/^I should see the SAVE\/SUBMIT buttons$/) do
  expect(@assessments_page.is_save_btn_visible).to be true
  expect(@assessments_page.is_submit_btn_visible).to be true
end

Then(/^I should be able to submit answers for all the questions$/) do
  # @assessments_page.answer_all_questions
  @assessments_page.answer_all_questions_independent_of_order
end

Then(/^I should be able to see the reports page$/) do
  expect(@reports_page.is_print_icon_visible).to be true
end

Given(/^I navigate to the home page$/) do
  @assessments_page.click_go_secure_logo
end

When(/^I click on the Previous tab$/) do
  @home_page.click_previous_tab
end

Then(/^I should be able to see the submitted assessments$/) do
  expect(@home_page.is_response_tile_visible).to be true
end

When(/^I click on the submitted assessment$/) do
  @home_page.click_submitted_response_btn
end

Then(/^I should not be able to see the Marked As Reviewed Button$/) do
  expect(@reports_page.is_mark_as_reviewed_btn_visible).to be false
end

Then(/^I should be able to see the Marked As Reviewed Button$/) do
  expect(@reports_page.is_mark_as_reviewed_btn_visible).to be true
end