Feature: Okta Login
  The Okta login page allows the users to log in

  @okta
  Scenario: User logs in to Okta
    Given I open the Okta login page
    When I enter username "qa_guest@thoughtworks.com" and password "!NA8ZR$H13@r"
