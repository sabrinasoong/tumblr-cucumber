#Hooks

#Set up Browser
browser = Watir::Browser.new :firefox

Before do
  @browser = browser
  @browser.cookies.clear
  @app = App.new @browser
end

After ('@posted') do |scenario|
  @blog_name = CONFIG["login"][2]["blog"]
  @browser.goto "https://www.tumblr.com/blog/#{@blog_name}"
  #@browser.alert.ok
  @browser.div(class: "post_control").click
  @browser.div(class: "delete").click
  sleep 2
  @browser.button(class: "chrome blue").click
end

at_exit do
  #After all features have executed
  browser.close
end
