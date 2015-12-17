class TumblrDashboardPage < GenericPage
  DASH = "http://tumblr.com/dashboard"
  
  def visit
    @browser.goto DASH
  end
  
  def click_post_button
    post = @browser.element(class: "icon_post_text")
    post.click
  end
  
  def set_title(title)
    @browser.div(class: "editor").send_keys title  
  end
  
  def set_message(message)
    @browser.send_keys message
  end
  
  def submit_post(num)
    num.times do 
      @browser.send_keys :tab
    end
    @browser.send_keys :space
    while @browser.alert.exists? do
      @browser.send_keys :return
    end
    @browser.driver.manage.timeouts.implicit_wait = 5   
  end
  
end


