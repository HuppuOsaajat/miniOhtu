

#Should be on the reference creation page before using this
def fill_form_with_information_of(reference)

  required_fields = reference.get_required_fields
  optional_fields = reference.get_optional_fields

  all_fields = required_fields + optional_fields

  all_fields.each do |field|
    fill_in field.name :with => field.content
  end

end

Given (/^the user is on the reference creation page$/) do
  visit('bibrefs/new')
end

Given (/^the user inputs a misc with empty fields$/) do
  step 'the user is on the reference creation page'
  input_reference = Bibref.new(shortname: 'test', reftype: :misc)

end

Given(/^the user wants to add an article reference$/) do

end

Given (/^the user wants to add an indproceedings reference$/) do

end

Given (/^the user wants to add an inbook reference$/) do

end

Given (/^the user wants to add an incollection reference$/) do

end

Given (/^the user wants to add a phdthesis reference$/) do
  visit('phdthesis/new')
end

When (/^the user tries to save the reference$/) do
  click_button('Update Bibref')
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