Given /^I open the Go Secure login page$/ do

  okta_login_url = @test_configuration.go_secure_login_url

  @login = OktaLoginPage.new
  @home_page = GoSecureHomePage.new
  @logged_out_page = GoSecureLoggedOutPage.new
  @login.goto_login_page okta_login_url
end

When("I log in to Go Secure as a {string} user") do |role|
  @login.login_as role
  @login.click_sign_in_btn
end
Then /^I should see the ThoughtWorks footer text on the homepage$/ do
  @home_page.wait_for_tw_footer_to_be_visible
  @home_page.click_on_users_btn
end

When(/^I click on the Logout button$/) do
  @home_page.click_on_profile_icon
  @home_page.click_on_logout_btn
end

Then(/^I should be logged out of Go Secure$/) do
  @logged_out_page.is_sign_out_message_visible
end