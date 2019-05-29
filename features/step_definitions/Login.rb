Given /^I open the Google search page$/ do
  @login = LoginPage.new
  @login.open_page 'https://www.google.com/'
end

When /^I search for "(.*?)"$/ do |search_item|
  @login.enter_search(search_item)
end
