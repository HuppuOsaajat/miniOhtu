Then (/^the reference can be seen in the listing$/) do
  assert page.has_content?('misc')
end

# And (/^the user tries to delete the reference$/) do
#
#   click_link('bibrefs/16')
# end

Then (/^the reference can not be seen in the listing$/) do
  assert !page.has_content?('misc')
end



Given(/^the user is on the listing page with one reference$/) do
  step 'the user is on the front page'
end

Then (/^all the references can be seen in the listing as BibTeX format$/) do
  reference = Bibref.new(reftype: :misc, shortname: 'foo')
  reference.save
  reference.set_field_value(:howpublished, 'wasn\'t')

  visit('/bibrefs/bibtex_list')
  assert page.has_content?('list')
  assert page.has_content?('howpublished')
end