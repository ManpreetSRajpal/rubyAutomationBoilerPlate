Given /^I open the Okta login page$/ do

  okta_login_url = @test_configuration.okta_login_url

  @login = OktaLoginPage.new
  @home_page = OktaHomePage.new
  @login.goto_login_page okta_login_url
end

When("I log in to Okta as a {string} user") do |role|
  @login.login_as role
  @login.click_sign_in_btn
end
Then /^I should see the Home text on the homepage$/ do
  @home_page.wait_for_home_text_to_be_visible
  @home_page.is_home_text_seen
end
