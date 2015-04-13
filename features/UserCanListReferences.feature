Feature: User can list references

  Scenario: User can see the newly created reference
    Given the user inputs a book with all the required fields filled correctly
    When the user tries to save the reference
    Then the reference can be seen in the listing