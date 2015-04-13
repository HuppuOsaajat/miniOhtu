Given(/^the user inputs a book with all the required fields filled correctly$/) do
  visit('/books/new')
  fill_in 'Author', :with => 'Mestari Testeri'
  fill_in 'Title', :with => 'Näin luot Cucumber-testejä'
  fill_in 'Publisher', :with => 'Rapsutin Oy'
  fill_in 'Year', :with => '2015'
end

Given(/^the user inputs a book with a missing required field$/) do
  visit('/books/new')
  fill_in 'Title', :with => 'Näin luot Cucumber-testejä'
  fill_in 'Publisher', :with => 'Rapsutin Oy'
  fill_in 'Year', :with => '2015'
end