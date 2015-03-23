Given(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see "([^\"]*)"$/) do |content|
  expect(page).to have_content(content)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in(field, :with => value)
end

And(/^I click on "([^\"]*)"$/) do |button|
  click_on(button)
end

Given(/^I have filled in a name for Player 1$/) do
  visit '/'
  fill_in("player_1_name", :with => "Andy")
  click_on("submit")
end

Given(/^I have reset the game$/) do
  visit '/new_game'
  visit '/'
end
