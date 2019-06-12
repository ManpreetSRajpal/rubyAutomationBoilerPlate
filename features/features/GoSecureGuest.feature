Feature: Go Secure Guest User
  The Go Secure login page allows the users to log in

  @guest
  Scenario: User logs in to Go Secure
    Given I open the Go Secure login page
    When I log in to Go Secure as a "guest" user
    Then I should see the Welcome text on the homepage

    When I click on the START button
    Then I should see the SAVE/SUBMIT buttons
    Then I should be able to submit answers for all the questions
    Then I should be able to see the reports page

    Given I navigate to the home page
    When I click on the Previous tab
    Then I should be able to see the submitted assessments

    Given I click on the Previous tab
    When I click on the submitted assessment
    Then I should be able to see the reports page
