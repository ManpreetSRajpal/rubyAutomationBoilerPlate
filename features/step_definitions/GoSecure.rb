Given /^I open the Go Secure login page$/ do

  okta_login_url = @test_configuration.go_secure_login_url

  @login = OktaLoginPage.new
  @home_page = GoSecureHomePage.new
  @login.goto_login_page okta_login_url
end

When("I log in to Go Secure as a {string} user") do |role|
  @login.login_as role
  @login.click_sign_in_btn
end
Then /^I should see the ThoughtWorks footer text on the homepage$/ do
  @home_page.wait_for_go_secure_logo_to_be_visible
  @home_page.is_go_secure_logo_seen
  @home_page.wait_for_tw_footer_to_be_visible
  @home_page.click_on_users_btn
end
