

#Should be on the reference creation page before using this
def fill_form_with_information_of(reference)
  create_bibref_with(reference.reftype, reference.shortname)

  required_fields = reference.get_required_fields
  optional_fields = reference.get_optional_fields

  all_fields = required_fields + optional_fields

  all_fields.each do |field|
    fill_in field.name, :with => field.content
  end

end

def create_bibref_with(reftype, shortname)
  fill_in 'Shortname', :with => shortname
  select reftype, :from => 'Reference type'
  click_button('Create reference')
end


Given (/^the user is on the reference creation page$/) do
  visit('bibrefs/new')
end

misc_test = Bibref.new(shortname: 'test', reftype: :misc)
misc_test.save

Given (/^the user inputs a misc with empty fields$/) do

  step 'the user is on the reference creation page'
  fill_form_with_information_of(misc_test)
end

Given(/^the user inputs a misc with non\-empty fields$/) do
  misc_test.set_field_value(:title, 'Testaus')

  step 'the user is on the reference creation page'
  fill_form_with_information_of(misc_test)
end


article = Bibref.new(shortname: 'test_article', reftype: :article)
article.save
article.set_field_value(:author, 'testeri')
article.set_field_value(:journal, 'Testing Weekly')
article.set_field_value(:title, 'Cucumber-rails is kinda cool')
article.set_field_value(:year, 2014)
article.set_field_value(:volume, 6)

Given(/^the user correctly fills out the form for an article$/) do
  step 'the user is on the reference creation page'
  fill_form_with_information_of(article)
end

Given(/^the user inputs a reference with a missing required field$/) do
  step 'the user is on the reference creation page'
  article.set_field_value(:title, '')
  fill_form_with_information_of(article)
end

Given(/^the user inputs a reference with a negative year$/) do
  step 'the user is on the reference creation page'
  article.set_field_value(:year, '-1994')
  fill_form_with_information_of(article)
end

Given(/^the user inputs a reference with a crazy big year$/) do
  step 'the user is on the reference creation page'
  article.set_field_value(:year, '11994')
  fill_form_with_information_of(article)
end


When (/^the user tries to save the reference$/) do
  click_button('Update reference')
end

Then (/^the reference is saved$/) do
  assert page.has_content?('was successfully')
end

Then (/^the reference is not saved$/) do
  assert !page.has_content?('was successfully')
end

Then (/^the reference can be seen in the BibTeX format$/) do
  assert page.has_content?('@BOOK (T15, AUTHOR = "Mestari Testeri", TITLE = "Näin luot Cucumber-testejä", PUBLISHER = "Rapsutin Oy", YEAR = 2015,')
end

