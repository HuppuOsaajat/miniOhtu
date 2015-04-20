
Given(/^the user inputs a x -type with all the required fields filled correctly$/) do
  visit('/books/new')
  fill_in 'Author', :with => 'Mestari Testeri'
  fill_in 'Title', :with => 'Näin luot Cucumber-testejä'
  fill_in 'Publisher', :with => 'Rapsutin Oy'
  fill_in 'Year', :with => '2015'
end

Given(/^the user inputs a x -type with a missing required field$/) do
  visit('/books/new')
  fill_in 'Title', :with => 'Näin luot Cucumber-testejä'
  fill_in 'Publisher', :with => 'Rapsutin Oy'
  fill_in 'Year', :with => '2015'
end

Given(/^the user inputs a reference with a negative year$/) do
  visit('/books/new')
  fill_in 'Author', :with => 'Mestari Testeri'
  fill_in 'Title', :with => 'Näin luot Cucumber-testejä'
  fill_in 'Publisher', :with => 'Rapsutin Oy'
  fill_in 'Year', :with => '-2015'
end

Given(/^the user inputs a reference with a crazy big year$/) do
  visit('/books/new')
  fill_in 'Author', :with => 'Mestari Testeri'
  fill_in 'Title', :with => 'Näin luot Cucumber-testejä'
  fill_in 'Publisher', :with => 'Rapsutin Oy'
  fill_in 'Year', :with => '22015'
end

Given (/^the user inputs a misc with empty fields$/) do
  visit('/miscs/new')
end

Given(/^the user wants to add an article reference$/) do
  visit('/articles/new')
end

Given (/^the user wants to add an indproceedings reference$/) do
  visit('indproceedings/new')
end

Given (/^the user wants to add an inbook reference$/) do
  visit('inbook/new')
end

Given (/^the user wants to add an incollection reference$/) do
  visit('incollection/new')
end

Given (/^the user wants to add a phdthesis reference$/) do
  visit('phdthesis/new')
end

When (/^the user tries to save the reference$/) do
  click_button('Create a reference')
end

Then (/^the reference is saved$/) do
  assert page.has_content?('was successfully created.')
end

Then (/^the reference is not saved$/) do
  assert !page.has_content?('was successfully created')
end

Then (/^the creation page contains fields "Author", "Title", "Journal", "Year" and "Volume"$/) do
  assert page.has_content?('Author')
  assert page.has_content?('Title')
  assert page.has_content?('Journal')
  assert page.has_content?('Year')
  assert page.has_content?('Volume')
end

Then (/^the creation page contains fields "Author", "Title", "Booktitle" and "Year"$/) do
  assert page.has_content?('Author')
  assert page.has_content?('Title')
  assert page.has_content?('Booktitle')
  assert page.has_content?('Year')
end

Then (/^the creation page contains fields "Author", "Title", "Chapter", "Publisher" and "Year"$/) do
  assert page.has_content?('Author')
  assert page.has_content?('Title')
  assert page.has_content?('Chapter')
  assert page.has_content?('Publisher')
  assert page.has_content?('Year')
end

Then (/^the creation page contains fields "Author", "Title", "Booktitle", "Publisher", and "Year"$/) do
  assert page.has_content?('Author')
  assert page.has_content?('Title')
  assert page.has_content?('Booktitle')
  assert page.has_content?('Publisher')
  assert page.has_content?('Year')
end

Then (/^the creation page contains fields "Author", "Title", "School" and "Year"$/) do
  assert page.has_content?('Author')
  assert page.has_content?('Title')
  assert page.has_content?('School')
  assert page.has_content?('Year')
end

Then (/^the reference can be seen in the BibTeX format$/) do
  assert page.has_content?('@BOOK (T15, AUTHOR = "Mestari Testeri", TITLE = "Näin luot Cucumber-testejä", PUBLISHER = "Rapsutin Oy", YEAR = 2015,')
end