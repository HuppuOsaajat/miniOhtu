Feature: User can list references

  Scenario: User can see the newly created reference
    Given the user inputs a book with all the required fields filled correctly
    When the user tries to save the reference
    And the user navigates to the listing page
    Then the reference can be seen in the listing

  Scenario: User can delete a reference from the listing
    Given the user inputs a book with all the required fields filled correctly
    When the user tries to save the reference
    And the user navigates to the listing page
    And the reference can be seen in the listing
    And the user tries to delete the reference
    Then the reference can not be seen in the listing

  Scenario: User can see all the saved BibTeX references
    Given the user is on the listing page
    When the user clicks "Show as BibTeX"
    Then all the references can be seen in the listing as BibTeX format

