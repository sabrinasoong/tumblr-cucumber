Given(/^the title box and message box are empty$/) do
  expect(@browser.div(class: "editor").text).to match ""
end

When(/^I click the post button$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^nothing should happen$/) do
  pending # Write code here that turns the phrase above into concrete actions
end