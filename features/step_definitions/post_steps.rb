
Given /^I'm logged into Tumblr$/  do
  @browser.goto "http://tumblr.com/login"
  email = @browser.text_field(id: "signup_email").set "testingspartan@gmail.com"
  password = @browser.text_field(id: "signup_password").set "whatupimatester123456"
  @browser.button(id: "signup_forms_submit").click
end

Given /^I'm on my dashboard$/ do
  expect(@browser.url).to match /https:\/\/www.tumblr.com\/dashboard/
end

Given /^I click on a text post$/ do 
  post = @browser.element(class: "icon_post_text")
  post.click
end

When(/^I enter "(.+)" into the title box$/) do |title|
  @browser.div(class: "editor").send_keys title
end

When(/^I click on the post button$/) do
  #@browser.element(class: "create_post_button").click
  4.times do 
    @browser.send_keys :tab
  end
  @browser.send_keys :space
  while @browser.alert.exists? do
    @browser.send_keys :return
  end
  @browser.driver.manage.timeouts.implicit_wait = 10 
end

Then(/^My dashboard should contain a text post with the title "(.+)"$/) do |title|
  expect(@browser.element(class: "post_title").text).to match title
end

When(/^I enter "(.+)" into the title box and select the message box$/) do |title|
  @browser.div(class: "editor").send_keys title
end

When(/^I enter "(.+)" into the message box and post$/) do |message|
  @browser.send_keys :tab
  @browser.send_keys message
  3.times do 
    @browser.send_keys :tab
  end
  @browser.send_keys :space
  while @browser.alert.exists? do
    @browser.send_keys :return
  end
  #@browser.driver.manage.timeouts.implicit_wait = 10 
end

Then(/^My dashboard should contain a text post with the message "(.+)"$/) do |message|
  expect(@browser.element(class: "post_body").p.text).to match message
end

