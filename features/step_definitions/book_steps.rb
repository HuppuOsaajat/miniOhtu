

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

#When(/^(.*) is pressed$/) do |b|
#  click_link(b)
#end

When(/^the user tries to save the book by clicking(.*)$/) do |b|
  click_button("Create Book")
end

Then(/^the reference with title (.*) is saved $/) do |b|
  Book.where(title: b).count > 0
end

Then(/^the reference with title (.*) is not saved$/) do |b|
  Book.where(title: b).count == 0
end