Given (/^the user is on the listing page$/) do
  assert_equal ('/articles'|'/books'|'/inbooks'|'/incollections'|'/inproceedings'|'/miscs'|'/phdthesises'), current_path
end

And (/^the user navigates to the listing page$/) do
  visit('/books'|'/articles'|'/miscs'|'/phdthesises'|'/inbooks'|'/incollections'|'/inproceedings')
end

Then (/^all the references can be seen in the listing as BibTeX format$/) do
  assert page.has_content?('@book(T15, AUTHOR = "Mestari Testeri", TITLE = "Näin luot Cucumber-testejä", PUBLISHER = "Rapsutin Oy", YEAR = 2015,}')
end

Then (/^the reference can be seen in the listing$/) do
  assert page.has_content?('Näin luot Cucumber-testejä')
end

And (/^the user tries to delete the reference$/) do
  click_link('Destroy')
end

Then (/^the reference can not be seen in the listing$/) do
  assert !page.has_content?('Näin luot Cucumber-testejä')
end