And(/^the user navigates to the listing page$/) do
  visit('/books')
end

Then(/^the reference can be seen in the listing$/) do
  assert page.has_content?('Näin luot Cucumber-testejä')
end

And(/^the user tries to delete the reference$/) do
  click_link('Destroy')
end

Then(/^the reference can not be seen in the listing$/) do
  assert !page.has_content?('Näin luot Cucumber-testejä')
end