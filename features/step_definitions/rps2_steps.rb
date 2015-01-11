Given(/^I have filled in "(.*?)" with "(.*?)" and "(.*?)" with "(.*?)"$/) do |field1, value1, field2, value2|
  fill_in(field1, :with => value1)
  fill_in(field2, :with => value2)
end

Given(/^I uncheck "(.*?)"$/) do |field|
  uncheck(field)
end
