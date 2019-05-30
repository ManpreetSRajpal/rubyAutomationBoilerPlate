Given /^I open the Google search page$/ do

  url = @test_configuration.login_url

  @login = LoginPage.new
  @login.goto_login_page url
end

When /^I search for "(.*?)"$/ do |search_query|
  @login.enter_input_in_search(search_query)
end
