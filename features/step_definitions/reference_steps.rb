When(/^the user tries to save the reference$/) do
  click_button('Create Book')
end

Then(/^the reference is saved$/) do
  assert page.has_content?('was successfully created.')
end

Then(/^the reference is not saved$/) do
  assert !page.has_content?('was successfully created')
end