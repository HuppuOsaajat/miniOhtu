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

  Scenario: User cannot add a book with a negative year
    Given the user inputs a book with a negative year
    When the user tries to save the reference
    Then the reference is not saved

  Scenario: User cannot add a book with a crazy big year
    Given the user inputs a book with a crazy big year
    When the user tries to save the reference
    Then the reference is not saved

  Scenario: A type book has right required fields:
    Given the user is on the creation page
    When the user wants to add a book reference
    Then the creation page contains fields "Author", "Title", "Publisher" and "Year"

