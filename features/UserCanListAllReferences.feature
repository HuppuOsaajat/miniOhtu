Feature: User can list all references

  Scenario: App is listing a reference successfully
    Given user has added a new book reference with title "Frankenstein" and author "Mary Shelley"
    When user gets to the page where the books are listed
    Then site should contain strings "Frankenstein" and "Mary Shelley"


   Scenario: User gets a list of all references successfully
     Given user has added two books with titles "Pride and prejudice" and "Jane Eyre"
     When user gets to the page where the books are listed
     Then site should contain strings "Pride and prejudice" and "Jane Eyre"