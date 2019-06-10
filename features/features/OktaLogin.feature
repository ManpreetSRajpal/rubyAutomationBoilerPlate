Feature: Okta Login
  The Okta login page allows the users to log in

  @smoke
  Scenario: User logs in to Okta
    Given I open the Okta login page
    When I log in to Okta as a "admin" user
    Then I should see the Home text on the homepage