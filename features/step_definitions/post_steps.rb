Given /^I'm logged into Tumblr$/  do
  @email = CONFIG["login"][0]["username"]
  @password = CONFIG["login"][1]["password"]
  @login = @app.login
  @post = @app.dashboard
  @login.visit
  @login.set_email(@email)
  @login.set_password(@password)
  @login.submit
end

Given /^I'm on my dashboard$/ do
  expect(@browser.url).to match /https:\/\/www.tumblr.com\/dashboard/
end

Given /^I click on a text post$/ do 
  @post.click_post_button
end

When(/^I enter "(.+)" into the title box$/) do |title|
  @post.set_title(title)
end

When(/^I click on the post button$/) do
  @post.submit_post(4)
end

Then(/^My dashboard should contain a text post with the title "(.+)"$/) do |title|
  expect(@browser.element(class: "post_title").text).to match title
end

When(/^I enter "(.+)" into the title box and select the message box$/) do |title|
  @post.set_title(title)
  @browser.send_keys :tab
end

When(/^I enter "(.+)" into the message box and post$/) do |message|
  @post.set_message(message)
  @post.submit_post(3)
end

Then(/^My dashboard should contain a text post with the message "(.+)"$/) do |message|
  expect(@browser.element(class: "post_body").p.text).to match message
end

Given(/^the title box and message box are empty and I click on the post button$/) do
  expect(@browser.div(class: "editor").text).to match ""
end

Then(/^nothing should happen$/) do
  expect(@post.element_exists?(class: "disabled")).to be true
end

