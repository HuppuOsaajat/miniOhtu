Feature: User can add a book reference

  Scenario: User can navigate to book reference creation page from the front page
    Given the user is on the front page
    When the user clicks "New Book"
    Then the user is on the creation page

  Scenario: User can successfully add a book with the required fields
    Given the user inputs a book with all the required fields filled correctly
    When the user tries to save the reference
    Then the reference is saved

  Scenario: User cannot add a book with a missing required field
    Given the user inputs a book with a missing required field
    When the user tries to save the reference
    Then the reference is not saved

