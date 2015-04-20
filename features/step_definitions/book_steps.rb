

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

Given(/^the user inputs a book with a negative year$/) do
  visit('/books/new')
  fill_in 'Author', :with => 'Mestari Testeri'
  fill_in 'Title', :with => 'Näin luot Cucumber-testejä'
  fill_in 'Publisher', :with => 'Rapsutin Oy'
  fill_in 'Year', :with => '-2015'
end

Given(/^the user inputs a book with a crazy big year$/) do
  visit('/books/new')
  fill_in 'Author', :with => 'Mestari Testeri'
  fill_in 'Title', :with => 'Näin luot Cucumber-testejä'
  fill_in 'Publisher', :with => 'Rapsutin Oy'
  fill_in 'Year', :with => '22015'
end

When(/^the user wants to add a book reference$/) do

end

Then(/^the creation page contains fields "Author", "Title", "Publisher" and "Year"$/) do

end