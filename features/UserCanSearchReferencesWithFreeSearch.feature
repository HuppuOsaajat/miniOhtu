Feature: User can search references with free search

  Scenario: User successfully manages to get right references from search
    Given the user is on the search page
    When the user types an existing word on field
    And the user clicks "Search"
    Then references containing the word can be seen in the listing

  Scenario: User search references with no result
    Given the user is on the search page
    When the user types an nonexistent word on field
    And  the user clicks "Search"
    Then the search page updates with no results