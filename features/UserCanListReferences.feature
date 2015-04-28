Feature: User can list references

  Scenario: User can see the newly created reference
    Given the user has created a reference
    And the user is on the front page
    Then the reference can be seen in the listing

#  Scenario: User can delete a reference from the listing
#    Given the user has created a reference
#    And the user is on the front page
#    And the user tries to delete the reference
#    Then the reference can not be seen in the listing

  Scenario: User can see all the saved BibTeX references
    Given the user is on the listing page with one reference
    When the user clicks "List references as BibTeX"
    Then all the references can be seen in the listing as BibTeX format

