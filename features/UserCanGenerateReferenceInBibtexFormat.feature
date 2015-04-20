Feature: User can generate a reference in BibTeX format

  Scenario: User can successfully generate a BibTeX
    Given the user is on the page of one reference
    When the user clicks "Show as BibTeX"
    Then the reference can be seen in the BibTeX format
