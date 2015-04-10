Feature: User gets to apps web page

  Scenario: User tries to access the web page
    Given user has issued a request to the page
    When the page is served
    Then site contains string "Listing Books"