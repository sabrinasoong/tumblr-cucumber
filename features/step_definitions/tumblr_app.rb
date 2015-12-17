class App
  def initialize(browser)
    @browser = browser
  end
  
  def login
    TumblrLoginPage.new @browser
  end
  
  def dashboard
    TumblrDashboardPage.new @browser
  end
end
