# Given(/^I land on help popup$/) do
#   text("Help")
# end

# When(/^I click on Got it button$/) do
#   find_element(id:"button1").click
# end

# Then(/^I land on Area screen$/) do
#   text("Area")
# end

When(/^I click on Swap button$/) do
  find_element(id:"fab").click
end

Then(/^I see "([^"]*)" in From header$/) do |value|
  actual_value = find_element(id:"header_text_unit_from").text
  if actual_value != value
    fail("Expected value is #{value}, but actual value is #{actual_value}")
  end
end

And(/^I see "([^"]*)" in To header$/) do |value|
  actual_value = find_element(id:"header_text_unit_to").text
  if actual_value != value
    fail("Expected value is #{value}, but actual value is #{actual_value}")
  end
end

And(/^I click on Clear button$/) do
  # find_element(id:"menu_clear").click
  find_element(xpath:"//android.support.v7.widget.LinearLayoutCompat").find_element(id:"menu_clear").clear
end

When(/^I enter "([^"]*)" to From field$/) do |value|
  find_element(id:"header_value_from").send_keys(value)
end

Then(/^I get "([^"]*)" in To field$/) do |value|
  actual_value = find_element(id:"header_value_to").text
  if actual_value != value
    fail("Expected value is #{value}, but actual value is #{actual_value}")
  end
end

When(/^I click on From field$/) do
  find_element(id:"header_value_from").click
end

And(/^I press "([^"]*)" on soft keyboard$/) do |value|
  digits = value.split("")
  digits.each do |key|
    digit = Integer(key)
    press_keycode 7 + digit
  end
end

When(/^User select "([^"]*)" from left column$/) do |value|
  find_element(id:"radio_group_from").find_element(xpath:"//android.widget.RadioButton[@text='#{value}']").click
end

Given(/^I land on "([^"]*)" popup$/) do |value|
  actual_text = find_element(xpath:"//android.widget.LinearLayout").find_element(id:"alertTitle").text
  if actual_text != value
    fail("Expected text of popup Title must be #{value}. But actual is #{actual_text}")
  end
end

And(/^I click on "([^"]*)" button$/) do |value|
  actual_element = find_element(xpath:"//android.widget.LinearLayout").find_element(id:"button1")
  actual_text = actual_element.text
  if actual_text != value
    fail("Expected text of popup Title must be #{value}. But actual is #{actual_text}")
  end
  actual_element.click
end

And(/^I land on "([^"]*)" screen$/) do |value|
  actual_text = find_element(xpath:"//android.view.ViewGroup").find_element(xpath:"//android.widget.TextView").text
  if actual_text != value
    fail("Expected text of popup Title must be #{value}. But actual is #{actual_text}")
  end
end

And(/^User select "([^"]*)" from right column$/) do |value|
  find_element(id:"radio_group_to").find_element(xpath:"//android.widget.RadioButton[@text='#{value}']").click
end