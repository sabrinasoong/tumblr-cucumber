#Hooks

#Set up Browser
browser = Watir::Browser.new :firefox

Before do
  @browser = browser
  @browser.cookies.clear
end

After ('@posted') do |scenario|
  @browser.goto "https://www.tumblr.com/blog/mega-caffeinatedyouth"
  #@browser.alert.ok
  @browser.div(class: "post_control").click
  @browser.div(class: "delete").click
  sleep 2
  @browser.button(class: "chrome blue").click
end

at_exit do
  #After all features have executed
  #Teardown
  browser.close
end