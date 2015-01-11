Given(/^I have filled in "(.*?)" with "(.*?)" and "(.*?)" with "(.*?)"$/) do |field1, value1, field2, value2|
  fill_in(field1, :with => value1)
  fill_in(field2, :with => value2)
end

Given(/^I uncheck "(.*?)"$/) do |field|
  uncheck(field)
end

Given(/^I have registered two players for the game$/) do
  visit '/new_game'
  visit '/'
  fill_in("player_1_name", :with => "Andy")
  fill_in("player_2_name", :with => "Rachel")  
  uncheck("play_against_the_computer")
  click_on("submit")
end
