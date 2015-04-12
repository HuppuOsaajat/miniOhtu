Given(/^the user is on the front page$/) do
  visit('/')
end

When(/^the user clicks "([^"]*)"$/) do |link_name|
  click_link(link_name)
end

Then(/^the user is on the creation page$/) do
  assert_equal '/books/new', current_path
end

