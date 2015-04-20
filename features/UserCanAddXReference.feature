Feature: User can add a x -type reference

  Scenario: User can navigate to x -type reference creation page from the front page
    Given the user is on the front page
    When the user clicks "New reference"
    Then the user is on the creation page

  Scenario: User can successfully add a x -type with the required fields
    Given the user inputs a x -type with all the required fields filled correctly
    When the user tries to save the reference
    Then the reference is saved

  Scenario: User cannot add a x -type with a missing required field
    Given the user inputs a x -type with a missing required field
    When the user tries to save the reference
    Then the reference is not saved

  Scenario: User cannot add a x -type with a negative year
    Given the user inputs a reference with a negative year
    When the user tries to save the reference
    Then the reference is not saved

  Scenario: User cannot add a x -type with a crazy big year
    Given the user inputs a reference with a crazy big year
    When the user tries to save the reference
    Then the reference is not saved

   Scenario: User can successfully add a misc reference with empty fields
    Given the user inputs a misc with empty fields
    Then the user tries to save the reference
    When the reference is saved

  Scenario: A type article has right required fields
    Given the user wants to add an article reference
    When the user is on the creation page
    Then the creation page contains fields "Author", "Title", "Journal", "Year" and "Volume"

  Scenario: A type inproceedings has right required fields
    Given the user wants to add an indproceedings reference
    When the user is on the creation page
    Then the creation page contains fields "Author", "Title", "Booktitle" and "Year"

  Scenario: A type inbook has right required fields
    Given the user wants to add an inbook reference
    When the user is on the creation page
    Then the creation page contains fields "Author", "Title", "Chapter", "Publisher" and "Year"

  Scenario: A type incollection has right required fields
    Given the user wants to add an incollection reference
    When the user is on the creation page
    Then the creation page contains fields "Author", "Title", "Booktitle", "Publisher", and "Year"

  Scenario: A type phdthesis has right required fiels
    Given the user wants to add a phdthesis reference
    When the user is on the creation page
    Then the creation page contains fields "Author", "Title", "School" and "Year"
