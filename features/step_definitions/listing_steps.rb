Then(/^the reference can be seen in the listing$/) do
  visit('/books')
  assert page.has_content?('Näin luot Cucumber-testejä')
end