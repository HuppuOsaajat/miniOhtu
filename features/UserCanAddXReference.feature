Feature: User can add a x -type reference

  Scenario: User can navigate reference creation page from the front page
    Given the user is on the front page
    When the user clicks "New Reference"
    Then the user is on the creation page

  Scenario: User can successfully add an article-type reference
    Given the user correctly fills out the form for an article
    When the user tries to save the reference
    Then the reference is saved

  Scenario: User cannot add a reference with a missing required field
    Given the user inputs a reference with a missing required field
    When the user tries to save the reference
    Then the reference is not saved

  Scenario: User cannot add a reference with a negative year
    Given the user inputs a reference with a negative year
    When the user tries to save the reference
    Then the reference is not saved

  Scenario: User cannot add a reference with a crazy big year
    Given the user inputs a reference with a crazy big year
    When the user tries to save the reference
    Then the reference is not saved

   Scenario: User can successfully add a misc reference with empty fields
    Given the user inputs a misc with empty fields
    When the user tries to save the reference
    Then the reference is saved

  Scenario: User can successfully add a misc reference with non-empty fields
    Given the user inputs a misc with non-empty fields
    When the user tries to save the reference
    Then the reference is saved




