Feature: Assessments

  Verifies that the Go Secure app allows the guest user to fill in the assessments and the head users (account/region/location head) to mark the assessments as reviewed

  @guest @account_head @region_head @location_head
  Scenario: The guest user logs in to Go Secure and fills in the assessment
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
    Then I should not be able to see the Marked As Reviewed Button

  @account_head @region_head @location_head
  Scenario: The account_head user logs in to the Go Secure and checks the filled assessment
    Given I open the Go Secure login page
    When I log in to Go Secure as a "account_head" user
    Then I should see the Welcome text on the homepage

    Given I navigate to the home page
    When I click on the Previous tab
    Then I should be able to see the submitted assessments

    Given I click on the Previous tab
    When I click on the submitted assessment
    Then I should be able to see the reports page
    Then I should be able to see the Marked As Reviewed Button
