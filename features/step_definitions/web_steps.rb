Given(/^the user is on the front page$/) do
  visit('/')
end

Given(/^the user is on the page of one reference/) do
  visit('/books/1')
end

When(/^the user clicks "([^"]*)"$/) do |link_name|
  click_link(link_name)
end

Then(/^the user is on the creation page$/) do
  assert_equal ('/article/new'|'/book/new'|'/inbook/new'|'/incollection/new'|'/inproceedings/new'|'/misc/new'|'/phdthesis/new'), current_path
end

