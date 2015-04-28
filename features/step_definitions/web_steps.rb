

Given(/^the user is on the front page$/) do
  visit('/')
end

Given(/^the user is on the page of one reference/) do
  visit('/books/1')
end

Given(/^the user is on the search page$/) do
  visit('bibrefs/search')
end

When(/^the user clicks "([^"]*)"$/) do |link_name|
  click_link(link_name)
end


Then(/^the user is on the creation page$/) do
  assert_equal '/bibrefs/new', current_path
end