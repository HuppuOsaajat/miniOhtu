Feature: User can add a book reference

  Scenario: User can navigate to book reference creation page from the front page
    Given the user is on the front page
    When the user clicks "New Book"
    Then the user is on the creation page

  Scenario: User can add a reference successfully
   Given user tries to add a book reference
   When the book reference is saved
   Then notice contains string "Book was successfully created."

  Scenario: User fails to add a reference
    Given user tries to add a book reference
    When the book reference is not saved
    Then notice should not contain string "Book was successfully created."