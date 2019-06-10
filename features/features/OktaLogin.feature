Feature: Okta Login
  The Okta login page allows the users to log in

  @smoke
  Scenario: User logs in to Okta
    Given I open the Okta login page
    When I enter username "qa_guest@thoughtworks.com" and password "!NA8ZR$H13@r"
    Then I should see the Home text on the homepage