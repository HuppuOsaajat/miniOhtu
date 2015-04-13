Feature: User can add a book reference

  Scenario: User can navigate to book reference creation page from the front page
    Given the user is on the front page
    When the user clicks "New Book"
    Then the user is on the creation page

