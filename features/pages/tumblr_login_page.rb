class TumblrLoginPage < GenericPage
  LOGIN = "http://tumblr.com/login"
  
  def visit
    @browser.goto LOGIN
  end
  
  def set_email(email)
    @browser.text_field(id: "signup_email").set email
  end  
  
  def set_password(password)
    @browser.text_field(id: "signup_password").set password
  end
  
  def submit
    @browser.button(id: "signup_forms_submit").click
  end
  
end

