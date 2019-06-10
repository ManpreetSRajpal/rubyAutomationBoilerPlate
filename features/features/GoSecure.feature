Feature: Go Secure
  The Go Secure login page allows the users to log in

  @smokey
  Scenario: User logs in to Go Secure
    Given I open the Go Secure login page
    When I log in to Go Secure as a "admin" user
    Then I should see the ThoughtWorks footer text on the homepage

    When I click on the Logout button
    Then I should be logged out of Go Secure