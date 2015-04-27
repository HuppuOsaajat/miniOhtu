

When(/^the user types an existing word on field$/) do
  pending

end

When(/^the user types an nonexistent word on field$/) do
  pending

end


Then(/references containing the word can be seen in the listing$/) do
  assert page.has_content?('article:')
end

Then(/the search page updates with no results$/) do
  assert !page.has_content?('article:')
end