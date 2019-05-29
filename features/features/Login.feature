Feature: Google Search
  The Google homepage allows user to perform a search.

  @smoke
  Scenario: Users can perform a search on Google
    Given I open the Google search page
    When I search for "<search>"
